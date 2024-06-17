Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1217090AE39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 14:51:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VsGMHQcZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2qX36Gdxz3fxX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 22:51:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VsGMHQcZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2qWL2DdFz3fwR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 22:51:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718628667;
	bh=ksNm0n7vWVSacMAhdyZonglFoGiO3VwbDK5VPpn10LU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VsGMHQcZmFQlJ8S0Q10/1sZLNumhCV+J+AhUyQfqoEsPdprNmQWnItth2Nda+WiiR
	 i1OFKN+sqJhTDq9tXep04oZ+fJFDTOO/tsLa3oMW5kRIipl8NWP7oI3Qv0+cZqYufQ
	 W/apLvq0CNqHdEQ00JQJseK8X7YbRd4qv14AkwulTm7cJpxYeapgwubEectMGrTXdN
	 HoVpNlksrxkeKiICLhyQbUDfZ/bu41bmKNiggrFr00WQc+RpG768315C6I9/jo4BXa
	 I3AsBbEsWfZhEkzZtLMfYl7LImgSHt1f6yvKWnBjx2vIB3lYm4jmMdUre4OK/u1c4g
	 3uJA/PjCa6s0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W2qWD3sKmz4w2K;
	Mon, 17 Jun 2024 22:51:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org, Nathan Lynch
 <nathanl@linux.ibm.com>
Subject: Re: [PATCH] Documentation: Remove the unused "topology_updates"
 from kernel-parameters.txt
In-Reply-To: <20240617060848.38937-1-thuth@redhat.com>
References: <20240617060848.38937-1-thuth@redhat.com>
Date: Mon, 17 Jun 2024 22:51:03 +1000
Message-ID: <87frtb68co.fsf@mail.lhotse>
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Huth <thuth@redhat.com> writes:
> The "topology_updates" switch has been removed four years ago in commit
> c30f931e891e ("powerpc/numa: remove ability to enable topology updates"),
> so let's remove this from the documentation, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 ------
>  1 file changed, 6 deletions(-)

Oops, thanks for cleaning it up.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f58001338860..b75852f1a789 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6600,12 +6600,6 @@
>  			e.g. base its process migration decisions on it.
>  			Default is on.
>  
> -	topology_updates= [KNL, PPC, NUMA]
> -			Format: {off}
> -			Specify if the kernel should ignore (off)
> -			topology updates sent by the hypervisor to this
> -			LPAR.
> -
>  	torture.disable_onoff_at_boot= [KNL]
>  			Prevent the CPU-hotplug component of torturing
>  			until after init has spawned.
> -- 
> 2.45.2
