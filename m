Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC339B875
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 13:53:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxLl26sJkz3c3N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 21:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RatLCGqF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RatLCGqF; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxLjg64fvz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 21:52:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FxLjg0f95z9s1l;
 Fri,  4 Jun 2021 21:52:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622807559;
 bh=o7Wmigk0b0Zqlc14GHkQl8FssagUOl5ZR0X9dJjCPOQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RatLCGqF19P+Zl+4HHcRjj0nzl6glQqzhVazxGDXj22XEIP1M5jTLqFRN4Pmo0KzS
 pcxv43G4WL3BPEcwnT5BIjQGRtkn/7MtFexT0MpGRIJDcHPysmqWMebbwdKVXdibjT
 DNBF762sRTx4ywF6VlevbViDqsMm1uaivg9TOTS/jQUGmbYhZWlBqUhgZCIlP86NDW
 UTv2Auil1B9HQysnM0dzvRiVBjjXmxoZYLtk7dalACAY1/InrqqP3jHG3bCTEWuR0i
 FhHceyAIjpGosf0X6rhn4l0hWzeTtY2cjvkPcCgEo+c+8+q3+h+gBrb5Thv7XRgEIq
 JIVyeByXQF8KA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com
Subject: Re: [PATCH v4 09/16] powerpc/pseries/vas: Add HCALL wrappers for
 VAS handling
In-Reply-To: <f52961e6941803366ecf6239ddb9532680516b78.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <f52961e6941803366ecf6239ddb9532680516b78.camel@linux.ibm.com>
Date: Fri, 04 Jun 2021 21:52:38 +1000
Message-ID: <87o8clg83d.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> This patch adds the following HCALL wrapper functions to allocate,

Normal spelling is "hcall".

> modify and deallocate VAS windows, and retrieve VAS capabilities.
>
> H_ALLOCATE_VAS_WINDOW: Allocate VAS window
> H_DEALLOCATE_VAS_WINDOW: Close VAS window
> H_MODIFY_VAS_WINDOW: Setup window before using
> H_QUERY_VAS_CAPABILITIES: Get VAS capabilities

Please tell us which version of PAPR, and in which section etc., these
are described in.

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 217 +++++++++++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/vas.c
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> new file mode 100644
> index 000000000000..06960151477c
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2020-21 IBM Corp.
> + */
> +
> +#define pr_fmt(fmt) "vas: " fmt
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/irqdomain.h>
> +#include <linux/interrupt.h>
> +#include <linux/sched/mm.h>
> +#include <linux/mmu_context.h>
> +#include <asm/hvcall.h>
> +#include <asm/hvconsole.h>
> +#include <asm/machdep.h>

Do we need all those headers?

> +#include <asm/plpar_wrappers.h>
> +#include <asm/vas.h>
> +#include "vas.h"
> +
> +#define	VAS_INVALID_WIN_ADDRESS	0xFFFFFFFFFFFFFFFFul
> +#define	VAS_DEFAULT_DOMAIN_ID	0xFFFFFFFFFFFFFFFFul

Some blank lines for formatting please.

> +/* Authority Mask Register (AMR) value is not supported in */
> +/* linux implementation. So pass '0' to modify window HCALL */

Please fix the comment formatting.

> +#define	VAS_AMR_VALUE	0

This is only used in one place. It'd be simpler to just pass 0 and move
the comment there.

> +/* phyp allows one credit per window right now */
> +#define DEF_WIN_CREDS		1
> +
> +static int64_t hcall_return_busy_check(int64_t rc)
> +{

Please use normal kernel types, ie. s64, or just long.

Same comment throughout.

> +	/* Check if we are stalled for some time */
> +	if (H_IS_LONG_BUSY(rc)) {
> +		msleep(get_longbusy_msecs(rc));
> +		rc = H_BUSY;
> +	} else if (rc == H_BUSY) {
> +		cond_resched();
> +	}
> +
> +	return rc;
> +}
> +
> +/*
> + * Allocate VAS window HCALL
> + */
> +static int plpar_vas_allocate_window(struct vas_window *win, u64 *domain,
> +				     u8 wintype, u16 credits)

You don't have to use the "plpar" prefix for these sort of wrappers.

Just naming them after the hcall would probably be clearer, so:

 h_allocate_vas_window(... )

> +{
> +	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
> +	int64_t rc;
> +
> +	do {
> +		rc = plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, wintype,
> +				  credits, domain[0], domain[1], domain[2],
> +				  domain[3], domain[4], domain[5]);
> +
> +		rc = hcall_return_busy_check(rc);
> +	} while (rc == H_BUSY);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		win->winid = retbuf[0];
> +		win->lpar.win_addr = retbuf[1];
> +		win->lpar.complete_irq = retbuf[2];
> +		win->lpar.fault_irq = retbuf[3];

You shouldn't mutate win until you know there is no error.

> +		if (win->lpar.win_addr == VAS_INVALID_WIN_ADDRESS) {
> +			pr_err("HCALL(%x): COPY/PASTE is not supported\n",
> +				H_ALLOCATE_VAS_WINDOW);
> +			return -ENOTSUPP;
> +		}
> +		return 0;
> +	case H_PARAMETER:
> +		pr_err("HCALL(%x): Invalid window type (%u)\n",
> +			H_ALLOCATE_VAS_WINDOW, wintype);
> +		return -EINVAL;
> +	case H_P2:
> +		pr_err("HCALL(%x): Credits(%u) exceed maximum window credits\n",
> +			H_ALLOCATE_VAS_WINDOW, credits);
> +		return -EINVAL;
> +	case H_COP_HW:
> +		pr_err("HCALL(%x): User-mode COPY/PASTE is not supported\n",
> +			H_ALLOCATE_VAS_WINDOW);
> +		return -ENOTSUPP;
> +	case H_RESOURCE:
> +		pr_err("HCALL(%x): LPAR credit limit exceeds window limit\n",
> +			H_ALLOCATE_VAS_WINDOW);
> +		return -EPERM;
> +	case H_CONSTRAINED:
> +		pr_err("HCALL(%x): Credits (%u) are not available\n",
> +			H_ALLOCATE_VAS_WINDOW, credits);
> +		return -EPERM;
> +	default:
> +		pr_err("HCALL(%x): Unexpected error %lld\n",
> +			H_ALLOCATE_VAS_WINDOW, rc);
> +		return -EIO;
> +	}

Do we really need all these error prints? It's very verbose, and
presumably in normal operation none of these are meant to happen anyway.

Can't we just have a single case that prints the error value?

Same comment for the other hcalls.

> +}
> +
> +/*
> + * Deallocate VAS window HCALL.
> + */
> +static int plpar_vas_deallocate_window(u64 winid)
> +{
> +	int64_t rc;
> +
> +	do {
> +		rc = plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW, winid);
> +
> +		rc = hcall_return_busy_check(rc);
> +	} while (rc == H_BUSY);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		return 0;
> +	case H_PARAMETER:
> +		pr_err("HCALL(%x): Invalid window ID %llu\n",
> +			H_DEALLOCATE_VAS_WINDOW, winid);
> +		return -EINVAL;
> +	case H_STATE:
> +		pr_err("HCALL(%x): Window(%llu): Invalid page table entries\n",
> +			H_DEALLOCATE_VAS_WINDOW, winid);
> +		return -EPERM;
> +	default:
> +		pr_err("HCALL(%x): Unexpected error %lld for window(%llu)\n",
> +			H_DEALLOCATE_VAS_WINDOW, rc, winid);
> +		return -EIO;
> +	}
> +}
> +
> +/*
> + * Modify VAS window.
> + * After the window is opened with allocate window HCALL, configure it
> + * with flags and LPAR PID before using.
> + */
> +static int plpar_vas_modify_window(struct vas_window *win)
> +{
> +	int64_t rc;
> +	u32 lpid = mfspr(SPRN_PID);

The lpid would be SPRN_LPID ?
But you can't read it from a guest. Is the variable just misnamed?

> +
> +	/*
> +	 * AMR value is not supported in Linux implementation
> +	 * phyp ignores it if 0 is passed.
> +	 */

Heh, this comment is already here.

Do you mean the Linux VAS implementation doesn't support AMR? Because
Linux definitely does use AMR.

> +	do {
> +		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW, win->winid,
> +					lpid, 0, VAS_MOD_WIN_FLAGS,
> +					VAS_AMR_VALUE);
> +
> +		rc = hcall_return_busy_check(rc);
> +	} while (rc == H_BUSY);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		return 0;
> +	case H_PARAMETER:
> +		pr_err("HCALL(%x): Invalid window ID %u\n",
> +			H_MODIFY_VAS_WINDOW, win->winid);
> +		return -EINVAL;
> +	case H_P2:
> +		pr_err("HCALL(%x): Window(%d): Invalid LPAR Process ID %u\n",
> +			H_MODIFY_VAS_WINDOW, lpid, win->winid);
> +		return -EINVAL;
> +	case H_P3:
> +		/* LPAR thread ID is deprecated on P10 */
> +		pr_err("HCALL(%x): Invalid LPAR Thread ID for window(%u)\n",
> +			H_MODIFY_VAS_WINDOW, win->winid);
> +		return -EINVAL;
> +	case H_STATE:
> +		pr_err("HCALL(%x): Jobs in progress, Can't modify window(%u)\n",
> +			H_MODIFY_VAS_WINDOW, win->winid);
> +		return -EBUSY;
> +	default:
> +		pr_err("HCALL(%x): Unexpected error %lld for window(%u)\n",
> +			H_MODIFY_VAS_WINDOW, rc, win->winid);
> +		return -EIO;
> +	}
> +}
> +
> +/*
> + * This HCALL is used to determine the capabilities that pHyp provides.
> + * @hcall: H_QUERY_VAS_CAPABILITIES or H_QUERY_NX_CAPABILITIES
> + * @query_type: If 0 is passed, phyp returns the overall capabilities
> + *		which provides all feature(s) that are available. Then
> + *		query phyp to get the corresponding capabilities for
> + *		the specific feature.
> + *		Example: H_QUERY_VAS_CAPABILITIES provides VAS GZIP QoS
> + *			and VAS GZIP Default capabilities.
> + *			H_QUERY_NX_CAPABILITIES provides NX GZIP
> + *			capabilities.
> + * @result: Return buffer to save capabilities.
> + */
> +int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
> +					u64 result)
> +{
> +	int64_t rc;
> +
> +	rc = plpar_hcall_norets(hcall, query_type, result);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		return 0;
> +	case H_PARAMETER:
> +		pr_err("HCALL(%llx): Invalid query type %u\n", hcall,
> +			query_type);
> +		return -EINVAL;
> +	case H_PRIVILEGE:
> +		pr_err("HCALL(%llx): Invalid result buffer 0x%llx\n",
> +			hcall, result);
> +		return -EACCES;
> +	default:
> +		pr_err("HCALL(%llx): Unexpected error %lld\n", hcall, rc);
> +		return -EIO;
> +	}
> +}


cheers
