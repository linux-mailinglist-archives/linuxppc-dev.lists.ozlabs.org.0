Return-Path: <linuxppc-dev+bounces-3175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 409519C88D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 12:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpyVx6yZgz2ytN;
	Thu, 14 Nov 2024 22:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731583513;
	cv=none; b=HfiGsKp1oPf6BNPfO+ZTWHUpHryAF+iyPAtoFsbbPiLyhyHVj0JIwuBWsU4mikiYYNvItWvTH2pDIUeYFYnp4MU85sM3rgHhRpTbzyBmJ2E3KGmWomopJ01lSyjMpGvMyer6hvP9mLVlTiAVEiis78ZWF7WKl4Z/qNCKtf873XwyAEETMBgAdt/qPt6TgHZO00wlEsGEAjBic74jBXB4NhRKKHswxDmpPc3SG4f1gRI2PmXmLq2EfTGjBxWcCPrQEunhygw50FW7s2HyS+oI6priUqc9VU2+zsPM0PXvKcW/Ff+39Rcrv2nAxmKCPeZwFDjONfc10C5jopFmx0GsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731583513; c=relaxed/relaxed;
	bh=D6CI2JJxrt75m45cwXmLOXKbpv11yL317iRzR+Z7ZaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUpE1fYHE7zdZD/86630RjUuSr+Mf3xP1mnpj5nVZnztrK+jN8h7gRJb4WnErLyuOV50HW9ZTiqOcVYR5rutoDMWQt/ekXYdT+YxbMuxwL7F4njhFQk/a0Z03uVrJYNcS82tSi6+tmlaBzJjJuQzQYk/ySlL8T0XdmV05Q8XvpTDvzlpQEAjy818kJyBU+6SJMDC4IfkZZmyEY6Ai8AQB4q/9xBqUZk5Tno6Sx909Gi2oioOayNuLu0wOHaUPOlqOIe5xaZASEGYH3iofwJ+qLVKkHRCjPui89yz4cpFtgQetzkyFUpo1tuePlpQdBFqeCgZI84oMTSq6jkRbtU8hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BUCFFoug; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BUCFFoug;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpyVv2c8hz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 22:25:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12D84A418E8;
	Thu, 14 Nov 2024 11:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75964C4CECD;
	Thu, 14 Nov 2024 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731583506;
	bh=EF+ANVAHa4r5Nmh3iDwTFEvrbHbm9uJkURJzb5PQ07Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUCFFougLX8RbrTxIm6Bfjnw0gNrSwIFdRPtO9YL4iNHh653Wy7AKDGdBz3u10u9z
	 GnsIO+c2pciC4V0zv2fqNeEIdDeFPYyKVf1Z6LJgAC+TR9DcLtD53mg7SAdcKWGgpK
	 pr8l+3BZqEjpFXBiuhahGX2yW+qtQM037nSi1jPd7/agv+CcrO3Ahy3CZ37v7tCDfQ
	 c1ycrTisQSuKMfY6b51OT0ODlbOGBGPOpiKpXYX7qVdvHqZUpGG3jldk7NcmHlqfW3
	 qr8GBESlZMQR9HVxarfZ+GsjaCfBCLyOMBCHGw66kN3d6JNFsN9R0OXI1PqoM6mOC4
	 I1PjZJkfaD/MA==
Date: Thu, 14 Nov 2024 12:25:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hongbo Li <lihongbo22@huawei.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next v2] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
Message-ID: <ZzXeD2I-ybbhE-iT@localhost.localdomain>
References: <20240904022633.2079803-1-lihongbo22@huawei.com>
 <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
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
In-Reply-To: <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Le Thu, Nov 14, 2024 at 08:38:59AM +0100, Christophe Leroy a écrit :
> Hi,
> 
> Le 04/09/2024 à 04:26, Hongbo Li a écrit :
> > Replace kthread_create/kthread_bind/wake_up_process() with
> > kthread_run_on_cpu() to simplify the code.
> > 
> > Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> 
> A similar change is proposed as part of a larger series, see patch 7 in that
> series
> https://lore.kernel.org/lkml/20241112142248.20503-1-frederic@kernel.org/
> 
> I prefer to leave this patch aside and not interfere with Frederic's work.

Speaking of, feel free to take it, the conversions to kthread_run_on_cpu()
are standalone patches.

Thanks.

> 
> Christophe

