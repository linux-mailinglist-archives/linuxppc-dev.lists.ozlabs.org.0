Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62629680407
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 04:05:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4tNL1VjLz3cQl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 14:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fsKvMIpg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4tMR449xz300C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 14:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fsKvMIpg;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
	id 4P4tMP02Bdz4xFv; Mon, 30 Jan 2023 14:04:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P4tMN4301z4x2c;
	Mon, 30 Jan 2023 14:04:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675047888;
	bh=lARKuTJUC9Sr0dph0r/AXxvSF0MTlU33+JxLRc1sARY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fsKvMIpghJY0lEaHId+6YatZCsboRniPeGcdfRK2KZjWQ2IBJfa8U3tKE5zYM6MSH
	 lJ/gI63AMqAqBVT/e2H7uTQGiwPiGMsFhPe2l4GUoxuWNDuluOrmgkHmVE1ULiYiRp
	 WUFuEWg6pjwTvz928sSg2eTDy2Nh67UudLZdrSNGDUHhleEYxw4zEsYXMaR3zNhPVM
	 6GzIXfra7CRQAJpjICdUH0VE1VAIJ0/EuyG3E8zEcj0T38QqM6L7Zf6U9zKZt8jsKe
	 VGa8DfG6bbq1qvYdRSBWA+REyLPTtUiA+5Yos35WDPiQYoyMl9CMRjw3sZN+sdBozm
	 RoDKl4XoPCDAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/kexec_file: account hot-pluggable memory while
 estimating FDT size
In-Reply-To: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
References: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
Date: Mon, 30 Jan 2023 14:04:45 +1100
Message-ID: <87v8kosoxe.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On Systems where online memory is lesser compared to max memory, the
> kexec_file_load system call may fail to load the kdump kernel with the
> below errors:
>
>     "Failed to update fdt with linux,drconf-usable-memory property"
>     "Error setting up usable-memory property for kdump kernel"
>
> This happens because the size estimation for usable memory properties
> for the kdump kernel's FDT is based on the online memory whereas the
> usable memory properties include max memory. In short, the hot-pluggable
> memory is not accounted for while estimating the size of the usable
> memory properties.
>
> The issue is addressed by calculating usable memory property size using
> max hotplug address instead of the last online memory address.
>
> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kexec/file_load_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Can you please rebase it on top of the fix I posted.

http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230130014707.541110-1-mpe@ellerman.id.au/

cheers
