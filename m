Return-Path: <linuxppc-dev+bounces-11440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A15DB3AAA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 21:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCWFW6YCXz2xd4;
	Fri, 29 Aug 2025 05:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756408239;
	cv=none; b=NxKFk5jg8pnpf86yneA9TYyGe2lkEK6e7O+o39slVegGpzQ0JvDLqN6JxuIPr79P1bQ12cij5kCHCuZ0RWXZhbpiCjZ6+cYR1bXxEOpOxKkf76PbIdvZtKwW5jT1LGTXo7GVe5Wen3Kzoy8vOp8uzHKVxURqwOHH9gvIhJ17EAQoIqaYPIDTWdQpT234QMf/y52eHwXE1yJrgFJe7Eja29zgmsstLWT0WaUjO82bdKkvnhcb1aGK6zA+JuZnLtKWD8Q6vQJEY6ITAWienpBHMLiuvQlri1a99GOHWm8h++h3zaWsGbIlfYj/9+dbMiXx5eSTqVNxJNJ3/9UsLcyoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756408239; c=relaxed/relaxed;
	bh=vCM7BtjhSSdjPD2pC7Een8DTkoaQQR4fjFPHIwA5Djs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAreqCOvkyCyrEpnY7WCIjrJ6poJOeBm3CSVcNZh9IT6C2UTVp836VDlRnF+af1TjeIjvBM8zEGYBNqK+pkSv7XprMDHXFtz6unYBUDp1T5q3ZzOb3UHjr68htvnMvpR6QhBd0THZ1Q3X3lq/BGoi53WEsx3r5r+A8tLKVEeUx4bHmqqvAiqLcQCRroPJCAve0C4a6V8EDq1n/GvtcOT9vajGggvxB0W4ZqZWITebEmrdmwuViuHWykxzGYU6yY4Myw7pzrWWqe8FQJDNIAUbf8NtzcGSGV8r3gduhJ+e7jYpuKoD86w4mMs94ZDG8hIhe0VbJ5oSxceQVrT6xgjWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiAyKBDP; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiAyKBDP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCWFW23m3z2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 05:10:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE2F160139;
	Thu, 28 Aug 2025 19:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBADC4CEEB;
	Thu, 28 Aug 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756408236;
	bh=nTTeahhIb0FZNTHkQNMJBnWQfHnp2aJ+r4oH3UJmf9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiAyKBDPTCAig6cfYhRFzVMlXt8gF/BgqIWlzfngucl4yl5Wcl8PEMxeGxZyn4feY
	 9QNbLauol7wPo69EnbsJUOvYSMo6YfZ3+owIkOs7tkWX5BPwXZEGC9l2iz9VL73nWJ
	 LMeYGO+x9LIMWkAgoCM0LVxjf0/nrBlT574LedC07bLp9s3BQzVau6M5uUSf07U/m8
	 vqELaFQz9N5nFU8S5MsiAq/DKmR1fhhzHyINYKZV0xBuVLm5Y0saWfzSXpuLfpmwbf
	 9eS/h5nEcBCqmS1GS4AcOq4YDto3/XpsP6UcVeqRbKR8yG+flv5A1aPbY1iMmgWmoI
	 HI/G0rHOVaaNA==
Date: Thu, 28 Aug 2025 13:10:32 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <aLCpqI-VQ7KeB6DL@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
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
In-Reply-To: <20250828184115.GE7333@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 03:41:15PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 28, 2025 at 11:15:20AM -0600, Keith Busch wrote:
> > 
> > I don't think that was ever the case. Metadata is allocated
> > independently of the data payload, usually by the kernel in
> > bio_integrity_prep() just before dispatching the request. The bio may
> > have a p2p data payload, but the integrity metadata is just a kmalloc
> > buf in that path.
> 
> Then you should do two dma mapping operations today, that is how the
> API was built. You shouldn't mix P2P and non P2P within a single
> operation right now..

Data and metadata are mapped as separate operations. They're just
different parts of one blk-mq request.

