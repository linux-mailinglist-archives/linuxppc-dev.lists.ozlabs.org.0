Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB392760D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:31:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lgRaACEF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFGGb0trwz3fpK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lgRaACEF;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFGFw1818z3fSl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:30:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720096244;
	bh=hV8Q5ucKShGyatQdfOoPFgps6/gf+P033enmjkUarIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lgRaACEFtOZsGM62UnjfaXb5LPf5GTyQi5X+DTgBKeXaSbfw7KT1oOWftPEb+mDxS
	 OfGBTeXn6iyBfx2WiGBAztlTz+TK1F+laUdSdX33+d/NJEXAEJ7MnBB5DalSu25qLM
	 jdb0EtkWdQIr8vUVE8JxP0SUXFAyy5vAp1zIAKZsGeN18DeKL7IUHF5jkZrE1ZPLHE
	 tdZ+zSCdmjMnjnyWkxQy59mE2JcPZmG/DA9TH8iZf04AyjNavrOR17WwMFG75XHnhn
	 pb0lK3Oc0sF+H8qvUMSNAvP1mwZX0EJ39Vx0oO9442lsKRRpywe/Fac84ZxtrrvhCV
	 f/LhRD89n+c4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFGFv739vz4wbp;
	Thu,  4 Jul 2024 22:30:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] macintosh/mac_hid: add MODULE_DESCRIPTION()
In-Reply-To: <20240509-mac_hid-md-v1-1-4091f1e4e4e0@quicinc.com>
References: <20240509-mac_hid-md-v1-1-4091f1e4e4e0@quicinc.com>
Date: Thu, 04 Jul 2024 22:30:43 +1000
Message-ID: <871q49jq4s.fsf@mail.lhotse>
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
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> Fix the make W=1 warning:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/macintosh/mac_hid.o
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/macintosh/mac_hid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
> index 1ae3539beff5..eb7a173da071 100644
> --- a/drivers/macintosh/mac_hid.c
> +++ b/drivers/macintosh/mac_hid.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  
> +MODULE_DESCRIPTION("Macintosh mouse button 2+3 emulation");

I dropped the "Macintosh" from this, because AIUI the driver is not
actually mac specific, despite where it lives in the tree.

cheers
