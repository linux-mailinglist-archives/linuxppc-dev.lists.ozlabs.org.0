Return-Path: <linuxppc-dev+bounces-12549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A926B97B8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 00:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWZYb4k9Wz3cYJ;
	Wed, 24 Sep 2025 08:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758666915;
	cv=none; b=iy3rZKlMPzv0gYKlo7l1wgM+1Tg7Sv5rACshEbvn5B3nTMZ5EMXxjVO4VtqtLib7Lw1y1ABdWJXPs/BU/X9UZ4iImOGSPF0RKk3Rnwy3FbD6z/NJ99EiIfrw3lMqkMW5fxgbJsELrn3m/ZjTnXV0jFb2fx2mqh8PnUU3YKWUNhTNnujpcqvB66YbQCIvF0qkMJ9XZv4uEgj7PK4XtWuqUUn5kd1ktDlOrm+E0UyKdKoShm/VBPd0FC+z+QSCzIdHDacwWJ7f9iUrwIaW8gz2iLhNBnNDp9RCJZSn7HLtE9N/znQq9csEx5jxroFTEEp5iJDaPbfEKk87fTAq02YsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758666915; c=relaxed/relaxed;
	bh=K+REPAt7YGROMU060Sut8pDiJmmKCZ4JFkal1RQOmGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUhBAO1HKBWadZUzzEeZwdgLCbTnOVdF3FaUPwVj8ypmqFIjQH3xeQiXJ3HS7QtxxFIWZulEkeGLC3bbHmxbTLV3sL7A2yKHOuM1LJklj1uziPIqc9e7VUFrZGCgZCFf/vHpvMrbTqCMoj2ABxSA6/0Xl85d3FBfsuvYKH+0YOOLWmuRe3fgJDVdU4ws+CjrIdSXENQDBy1cgk6SbhSq+JiXBafsSFOajGbqpH1wuodZMWYeGkqnDLgu9QypMXvH32worblaZ2xY2w6xXqqxxyDAYu/4y0pTloILCNQhafbWFNL5AP62eWBKv9vNq+rsRS6c0XOQwctuT1wtYXfROQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfvKLIEC; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfvKLIEC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWZYZ1tNkz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 08:35:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34F4144593;
	Tue, 23 Sep 2025 22:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E0DC4CEF5;
	Tue, 23 Sep 2025 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758666911;
	bh=K+REPAt7YGROMU060Sut8pDiJmmKCZ4JFkal1RQOmGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfvKLIECePVJSfIsLMzuzmM3Lfkth90P9jpbucNQ1bDMKtxnUUxV5JFtKuhdhpmWb
	 Cw3GZEX3eQpIT/PWZ/yXnZMG824R5TCQPjlm98ugF9huAG8DeaThH3gkBcbwr/TZuE
	 vm/De9fznWxi8yL9W3hbwpzVsdSjYKdJINx4sFLGsP2083YAha5J9C5fBwD4MqMtXT
	 ir+xFYNttlpYqZZmrRAZCSLQPAaJ5po2rCCjv7hee+rH9n2nEI6G7JOlhDYZQf0/X1
	 1DkImokD6CqYRTWU50ZSiWc781Xdx+oofE6BqZqS50/4CeH67G98lYY+2B9ZA6UvmX
	 2kJmK3McZDdRg==
Date: Tue, 23 Sep 2025 16:35:07 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <aNMgm33W7gh75h3t@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
 <aM9LH6WSeOPGeleY@kbusch-mbp>
 <20250923170936.GA2614310@nvidia.com>
 <aNLnXwAJveHIqfz0@kbusch-mbp>
 <20250923222216.GC2617119@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923222216.GC2617119@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 07:22:16PM -0300, Jason Gunthorpe wrote:
> Very rare is a different perspective, I mis-thought it was happening
> reproducible all the time..

Yes, sorry for the false alarm. I think we got unlucky and hit it on one
of the first boots from testing linux-next, so knee-jerk reaction was to
suspect the new code that showed up in the stack.

