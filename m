Return-Path: <linuxppc-dev+bounces-4111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 158CD9F0B94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 12:46:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8nc453Qfz3bTM;
	Fri, 13 Dec 2024 22:46:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734090388;
	cv=none; b=Fns2SOgRAqg+Mbm259bOYQ4ktiWy78Lq1VwTPRmYpDMiPZ5y46FSxhB0L1mJjxAmjQag7Ab2w8QSUDm9MnsfS/wyH5O//m6xPupWIQunWk9ZaovJcXY2pBn6Yy5yNPVnUunnhoCVZOSc/2VE15RaYvgly0IQRKsMOtObfKVdPU6AFOL9lZv0t4dP44WPVCxUKkw7w8APetWAP89CH0Xnuvs+D1/f3qoKtqQeNDHZJBLV9FucscaBvaftztt98UjR2YnJrAw1sgoJ43k98izk6Mzu8sRRQcsDL7CLZlWujY8hgO0ylK8a+xobD93zilKQhEE8ugJEypYCleE97IXI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734090388; c=relaxed/relaxed;
	bh=GGQe7PrBLWKhr5aELxTpsrHE0Ho/kHt9ZqSvq1qJm/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnS/E/J0jTW3ERxdtsnDNFo3nDZnV5ykE2BV9lza0JxxaKvDRyUW/1l7FDZgZvScMYbA2beSicMBtWjn/B9p4148gN/0iQZ/qmDFdebM3gxKL+zalzTXzGFnBVMVkZ7VFjD5jNK5j9vQMcFL6g4qdSPr4iUfjFYfD1/4umBj64l+6SE+Csjm+ouMXGEX6UpdkTVdVlytqt5M5kowtBkBK6cgCmh9RWwW5lKiPA1zCUUX7WAa7kDe8zJsRosiesYFhUPcB+jW2hvDk3DhN0vH88N/YU7o2V7rXTTk5sq74W+zc8nv0IaLdzDjicA9p1OeLcyawa4A1ztRePk49HomoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ga6vJJy9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ga6vJJy9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8nc34WVWz3bTH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 22:46:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DE4BA42B35;
	Fri, 13 Dec 2024 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D7FC4CED0;
	Fri, 13 Dec 2024 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734090385;
	bh=1LJTjOx7kJx7q2mytF+grEPfxYG6mPmq7VZvVuE7Nzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ga6vJJy9Plt8rk1ZLRU0bSPuEEIFFP2NqMZ14P/0k78uOtrRzmJT9MR3QaA9haWSo
	 gUUXUPwAVnTYsPGiYkA8V6YjKyalKDhOIvkczNBD7KGwWGv5g/x5BbfXbRRSQszI1F
	 geoEG7xNXHypBybJOy49Thqk+6h/zux7VvR6IQLOuw+v1AE04G3zspHzqdrs2SDTka
	 PQ27MD+bupU6M46eKS7qz5ZPI5RCCBdsyqdUqTdUZnpogDyaVmIE+2nAo8J6drEgWr
	 DmbcHUFGaBT9QaDX65+w0C6gw0Cd7jFb1R9C6I83DglShv8SVKS5sf6gh1rm0gSE0Y
	 y9+1nfDq9wnNg==
Date: Fri, 13 Dec 2024 12:46:22 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Message-ID: <Z1wejvFpGLFMhLJ9@localhost.localdomain>
References: <20241211154035.75565-1-frederic@kernel.org>
 <20241211154035.75565-7-frederic@kernel.org>
 <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Le Fri, Dec 13, 2024 at 07:27:03AM +0000, LEROY Christophe a écrit :
> 
> 
> Le 11/12/2024 à 16:40, Frederic Weisbecker a écrit :
> > Use the proper API instead of open coding it.
> > 
> > However it looks like kthreads here could be replaced by the use of a
> > per-cpu workqueue instead.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks! Feel free to apply this patch to your tree as it's a pretty
standalone change.

