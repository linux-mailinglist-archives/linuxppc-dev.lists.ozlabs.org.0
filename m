Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47979377C08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdr6P2fXFz2yy9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CCyemtN9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CCyemtN9; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdr5w05DVz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 16:01:21 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id i5so7775076pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 23:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tXVn144jSK+ewNBXIfRc1vswjU0ygw+IvP0ezkJ5gPE=;
 b=CCyemtN9DSPP5OKs4PRCf9dceKAvEMIJxRoVZ1mQcymbYR38qWNgbqH4S0utc3mO5v
 q1hcAVduynTqmCdaj1LX9+txhHG9VAfd/Wu6EBClS5+wqo9IDdaiJmE20vJN3M4XBB0E
 NRX6muynj+Ur4i6PVvwnaDj5+xBp7lfVlcTY/3TjkKn2Kv/ts7jXrkutt7bwaK8FsFEc
 wXGhOCwospqBkWgriicuOEPzu6uIIK0PtZ/mN9bnN092w/shxwE9ZUrqAuOkDbJCpZWA
 gzO5bWUwpxUejukkpNyuh3encgzHk9casegePzmZjsLhy8I28DVNJTw1CPeTalcKDh9G
 TZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tXVn144jSK+ewNBXIfRc1vswjU0ygw+IvP0ezkJ5gPE=;
 b=QDfjD6+sAqU67uxuz9Jpg7I6tyk+Jg9Wg3BAQL0rbAhn52M17Dc8hNPwr/Cjc+amUo
 2lL//cacFV4R5wn1FoKtdRRJ8ctAAbEqe/tdJyfc2pQKZE89gVxzIA1cO5f50+/uFvkG
 n8dGBka9qU6yR5bZN069ILV2bxbyDvGGJBQe/0iqh76U1rbx72vONMe1m7z8+rh31g9z
 A5WNPYOprOTvOepyTxmGflkMARI/QPNw9Hs92WEoHmhryKY7aI8fvGLx7adlKE7X98Sv
 51pu705n9G1dTYK4Fyfei+l9QqSNo3l59ZNCKtJjeyiodkv/rzKOCavS96dSQKZKzWnm
 zo5w==
X-Gm-Message-State: AOAM531uFk8n6ZhN1XMtQxukLXwqmUg8SaKfpHJ4Dh/8lyOTrtKIsJ4H
 GHWVTg3avHvZYFDm2c8Ua/I=
X-Google-Smtp-Source: ABdhPJwBfVh9w60qYmp539k/2WBl/l0dUIHocwsEPbgXEkj1DTGGQDBObJ5YUWYGIAHpOq6n0EosvQ==
X-Received: by 2002:a05:6a00:16c2:b029:228:964e:8b36 with SMTP id
 l2-20020a056a0016c2b0290228964e8b36mr23839229pfc.11.1620626477727; 
 Sun, 09 May 2021 23:01:17 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id e6sm10110148pfd.219.2021.05.09.23.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 23:01:17 -0700 (PDT)
Date: Mon, 10 May 2021 16:01:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 08/16] powerpc/pseries/VAS: Implement
 allocate/modify/deallocate HCALLS
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <e4c29e44cabee9197caa379e1260d2d7e33b20c7.camel@linux.ibm.com>
In-Reply-To: <e4c29e44cabee9197caa379e1260d2d7e33b20c7.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620626049.bn914ucmrk.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Haren Myneni's message of April 18, 2021 7:07 am:
>=20
> This patch adds the following HCALLs which are used to allocate,
> modify and deallocate VAS windows.

I don't like to be nitpicky about the language, but this is adding the=20
hcall wrappers. Implementing the hcall would be adding it to KVM.=20
Otherwise looks okay I think.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> H_ALLOCATE_VAS_WINDOW: Allocate VAS window
> H_DEALLOCATE_VAS_WINDOW: Close VAS window
> H_MODIFY_VAS_WINDOW: Setup window before using
>=20
> Also adds phyp call (H_QUERY_VAS_CAPABILITIES) to get all VAS
> capabilities that phyp provides.

"PAPR hcall to get VAS capabilities provided by the hypervisor"

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 217 +++++++++++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/vas.c
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
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
> +#include <asm/plpar_wrappers.h>
> +#include <asm/vas.h>
> +#include "vas.h"
> +
> +#define	VAS_INVALID_WIN_ADDRESS	0xFFFFFFFFFFFFFFFFul
> +#define	VAS_DEFAULT_DOMAIN_ID	0xFFFFFFFFFFFFFFFFul
> +/* Authority Mask Register (AMR) value is not supported in */
> +/* linux implementation. So pass '0' to modify window HCALL */
> +#define	VAS_AMR_VALUE	0
> +/* phyp allows one credit per window right now */
> +#define DEF_WIN_CREDS		1
> +
> +static int64_t hcall_return_busy_check(int64_t rc)
> +{
> +	/* Check if we are stalled for some time */
> +	if (H_IS_LONG_BUSY(rc)) {
> +		msleep(get_longbusy_msecs(rc));
> +		rc =3D H_BUSY;
> +	} else if (rc =3D=3D H_BUSY) {
> +		cond_resched();
> +	}
> +
> +	return rc;
> +}
> +
> +/*
> + * Allocate VAS window HCALL
> + */
> +static int plpar_vas_allocate_window(struct vas_window *win, u64 *domain=
,
> +				     u8 wintype, u16 credits)
> +{
> +	long retbuf[PLPAR_HCALL9_BUFSIZE] =3D {0};
> +	int64_t rc;
> +
> +	do {
> +		rc =3D plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, wintype,
> +				  credits, domain[0], domain[1], domain[2],
> +				  domain[3], domain[4], domain[5]);
> +
> +		rc =3D hcall_return_busy_check(rc);
> +	} while (rc =3D=3D H_BUSY);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		win->winid =3D retbuf[0];
> +		win->lpar.win_addr =3D retbuf[1];
> +		win->lpar.complete_irq =3D retbuf[2];
> +		win->lpar.fault_irq =3D retbuf[3];
> +		if (win->lpar.win_addr =3D=3D VAS_INVALID_WIN_ADDRESS) {
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
> +		rc =3D plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW, winid);
> +
> +		rc =3D hcall_return_busy_check(rc);
> +	} while (rc =3D=3D H_BUSY);
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
> +	u32 lpid =3D mfspr(SPRN_PID);
> +
> +	/*
> +	 * AMR value is not supported in Linux implementation
> +	 * phyp ignores it if 0 is passed.
> +	 */
> +	do {
> +		rc =3D plpar_hcall_norets(H_MODIFY_VAS_WINDOW, win->winid,
> +					lpid, 0, VAS_MOD_WIN_FLAGS,
> +					VAS_AMR_VALUE);
> +
> +		rc =3D hcall_return_busy_check(rc);
> +	} while (rc =3D=3D H_BUSY);
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
> +	rc =3D plpar_hcall_norets(hcall, query_type, result);
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
> --=20
> 2.18.2
>=20
>=20
>=20
