Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FA216608
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 07:55:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1BVt1GQXzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:55:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1BTH270kzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 15:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZU1MiFyw; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4B1BTH0YP4z9sRW; Tue,  7 Jul 2020 15:54:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1BTG6KPlz9sRK;
 Tue,  7 Jul 2020 15:54:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594101250;
 bh=dFrZ+0efWYOYHgXiMK1uk2eQYcabkTFSFgIIyIQw8Cg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZU1MiFywrRDiER1DUFYS1QBvdn0qEDg8F9y9yhYvzQ1JMApO3IHE9TrKlACTZyNs1
 HpH9gR6reQu4MnGI4ropbeJ+iEBNc+7nFqUbt8blrFOUdPjOPn/x8G1I1F1yd1yzkj
 /C8oCKyBYgZVNQWrpLJ+sVFYmvueyroa7RcaKZNplXHAFwjsrBGg5ogMKDR2SIrKWI
 O0DPiuM5sDflxRBtuA51Fat4hiFfNHPXShw4GKCIa98Av6FMtpeFO1uBxOpaa+zgWM
 HefE//3D0vqdohrB5Cbp+6M0AHmHRu8xcUFr7qfCSkHbNa70Qo+WaiRsPh8VsoSRqy
 FKLhc/snKUqyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: detect secure and trusted boot state of
 the system.
In-Reply-To: <1593882535-21368-1-git-send-email-nayna@linux.ibm.com>
References: <1593882535-21368-1-git-send-email-nayna@linux.ibm.com>
Date: Tue, 07 Jul 2020 15:56:23 +1000
Message-ID: <87imez50mw.fsf@mpe.ellerman.id.au>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:
> The device-tree property to check secure and trusted boot state is
> different for guests(pseries) compared to baremetal(powernv).
>
> This patch updates the existing is_ppc_secureboot_enabled() and
> is_ppc_trustedboot_enabled() function to add support for pseries.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/kernel/secure_boot.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> index 4b982324d368..43fc6607c7a5 100644
> --- a/arch/powerpc/kernel/secure_boot.c
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -6,6 +6,7 @@
>  #include <linux/types.h>
>  #include <linux/of.h>
>  #include <asm/secure_boot.h>
> +#include <asm/machdep.h>
>  
>  static struct device_node *get_ppc_fw_sb_node(void)
>  {
> @@ -23,11 +24,20 @@ bool is_ppc_secureboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	const u32 *secureboot;
>  
> -	node = get_ppc_fw_sb_node();
> -	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
> +	if (machine_is(powernv)) {
> +		node = get_ppc_fw_sb_node();
> +		enabled =
> +		    of_property_read_bool(node, "os-secureboot-enforcing");
> +		of_node_put(node);
> +	}

We generally try to avoid adding new machine_is() checks if we can.

In a case like this I think you can just check for both properties
regardless of what platform you're on.
  
> -	of_node_put(node);
> +	if (machine_is(pseries)) {
> +		secureboot = of_get_property(of_root, "ibm,secure-boot", NULL);
> +		if (secureboot)
> +			enabled = (*secureboot > 1) ? true : false;
> +	}

Please don't use of_get_property() in new code. Use one of the properly
typed accessors that handles endian conversion for you.

cheers
