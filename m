Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C66F2D99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 12:41:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781h74B0zzF4Df
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 22:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781dD1PwwzF3q4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 22:38:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="dNREzT+F"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4781dC4Ld3z9sP3;
 Thu,  7 Nov 2019 22:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573126735;
 bh=Ce4h7Skp0AKAmSXK7Bwtr8tSThv3Okkua5yeyDjpdoU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dNREzT+FHBPaBK2jHSsPEKo3TWr8eE+W5Eg4OQVz9QUUkfR+FLlRLbxnT9Y9PpTLf
 ERI+sDuWnaBit7Iezg6a7hjeTMRFKL5QoRDdXwj4SIpBpew1+7KSvrii0pFJSm7ac6
 MgiEePA8glN41p1itrO2YAtB2kGhd7tD042MjQHjDAy7erzUHATVJrDzGGhJPX7fYa
 reH0doaUdv3CVeqjMtH+R0gFOcfRO1NFYIAbKDfPTG8M8Hug+9YzZYvSgYv3jQTtVK
 LomTbnIL1qhh9kAMUyDCLizZkw/iXxkl/06brdq85LaIytupgl6sOqk+lOQgBnExxW
 LQ3aQacPgZSxw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 9/9] powerpc/pseries: Enable support for ibm,
 drc-info property
In-Reply-To: <1572967453-9586-10-git-send-email-tyreld@linux.ibm.com>
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
 <1572967453-9586-10-git-send-email-tyreld@linux.ibm.com>
Date: Thu, 07 Nov 2019 22:38:53 +1100
Message-ID: <875zjv6hma.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:

> Advertise client support for the PAPR architected ibm,drc-info device
> tree property during CAS handshake.
>
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Can you mark this as:

  Fixes: c7a3275e0f9e ("powerpc/pseries: Revert support for ibm,drc-info devtree property")


I'm not sure we're going to backport all those fixes into stable
kernels, but at least then we have the link between this commit
c7a3275e0f9e recorded.

cheers

> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index a4e7762..2ca9966 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1053,7 +1053,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
>  		.reserved2 = 0,
>  		.reserved3 = 0,
>  		.subprocessors = 1,
> -		.byte22 = OV5_FEAT(OV5_DRMEM_V2),
> +		.byte22 = OV5_FEAT(OV5_DRMEM_V2) | OV5_FEAT(OV5_DRC_INFO),
>  		.intarch = 0,
>  		.mmu = 0,
>  		.hash_ext = 0,
> -- 
> 2.7.4
