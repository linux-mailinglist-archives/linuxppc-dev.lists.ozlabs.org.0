Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0858D2B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:06:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467pGk0LJvzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 22:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467pDN4TgwzDqmf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 22:04:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 467pDM3mp9z9sN1; Wed, 14 Aug 2019 22:04:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467pDL4Wbvz9sDB;
 Wed, 14 Aug 2019 22:04:50 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 5/7] powerpc/mm: Write to PTCR only if ultravisor
 disabled
In-Reply-To: <20190808040555.2371-6-cclaudio@linux.ibm.com>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-6-cclaudio@linux.ibm.com>
Date: Wed, 14 Aug 2019 22:04:49 +1000
Message-ID: <87wofg6jha.fsf@concordia.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> In ultravisor enabled systems, PTCR becomes ultravisor privileged only
> for writing and an attempt to write to it will cause a Hypervisor
> Emulation Assitance interrupt.
>
> This patch adds the try_set_ptcr(val) macro as an accessor to
> mtspr(SPRN_PTCR, val), which will be executed only if ultravisor
> disabled.
>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/reg.h           | 13 +++++++++++++
>  arch/powerpc/mm/book3s64/hash_utils.c    |  4 ++--
>  arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  6 +++---
>  4 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 10caa145f98b..14139b1ebdb8 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -15,6 +15,7 @@
>  #include <asm/cputable.h>
>  #include <asm/asm-const.h>
>  #include <asm/feature-fixups.h>
> +#include <asm/firmware.h>

reg.h is already too big and unwieldy.

Can you put this in ultravisor.h and include that in the appropriate places.

> @@ -1452,6 +1453,18 @@ static inline void update_power8_hid0(unsigned long hid0)
>  	 */
>  	asm volatile("sync; mtspr %0,%1; isync":: "i"(SPRN_HID0), "r"(hid0));
>  }
> +
> +/*
> + * In ultravisor enabled systems, PTCR becomes ultravisor privileged only for
> + * writing and an attempt to write to it will cause a Hypervisor Emulation
> + * Assistance interrupt.
> + */
> +#define try_set_ptcr(val)						\
> +	do {								\
> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))	\
> +			mtspr(SPRN_PTCR, val);				\
> +	} while (0)

This should be a static inline please, not a macro.

Sorry, I don't like the name, we're not trying to set it, we know when
to set it and when not to.

It is awkward to come up with a good name because we don't have a term
for "hypervisor that's not running under an ultravisor".

Maybe set_ptcr_when_no_uv()

Which is kinda messy, someone feel free to come up with something
better.

I also see some more accesses to the PTCR in
arch/powerpc/platforms/powernv/idle.c which you haven't patched?

cheers
