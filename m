Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4D39C306
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 23:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxc3L17c7z3bsv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 07:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nLB6LdSg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nLB6LdSg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxc2q5hvXz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 07:53:23 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154LY7uD030421; Fri, 4 Jun 2021 17:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3ylY8P2/3DTxRHozCmcFghyxxXy3o1A1gbdKhJJWS3A=;
 b=nLB6LdSgETsUdRdUG9TnN4rHoxBJ1ULcClsAFxOzWK3yQfcEwciEzWCc0BZmSilY/dT0
 GDYS+DadEe8kZBPROmNyWlzlCGnu689y1uQ3C954lFAeO4MUK964L0p0Q6f3F2LgQnGy
 BzbHu4X5hjUjowVGTr590mDoqQOvIkMbM0ljjJoxRmGwTpMlTL6Yl0xg2TwRsyNsSjXY
 QrcNoxzdwl+N9WXy9GG5qPNwahDXzfRa30hdfZbXGhx7EPLDbnkPciUJciPe7Ji9kVb7
 lMPKjVi/hbo1fe5HJ4t/Qe+zY/hnXnO49JrtLtfejEQ8rOC4UfUO0R1HkGqz4mGrCJVJ bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38yu8ssmb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 17:53:12 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 154LZqOH038516;
 Fri, 4 Jun 2021 17:53:11 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38yu8ssmb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 17:53:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 154LlI42005781;
 Fri, 4 Jun 2021 21:53:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 38ud8afxna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 21:53:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 154LrA6I22151456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 21:53:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E074B205F;
 Fri,  4 Jun 2021 21:53:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB34AB2065;
 Fri,  4 Jun 2021 21:53:08 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 21:53:08 +0000 (GMT)
Message-ID: <93586baca94d10ec5658d547b109aaa6a55ff635.camel@linux.ibm.com>
Subject: Re: [PATCH v4 09/16] powerpc/pseries/vas: Add HCALL wrappers for
 VAS handling
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com
Date: Fri, 04 Jun 2021 14:53:06 -0700
In-Reply-To: <87o8clg83d.fsf@mpe.ellerman.id.au>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <f52961e6941803366ecf6239ddb9532680516b78.camel@linux.ibm.com>
 <87o8clg83d.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BpMnBlDZpF-dmGmJA1l5Nm7OH_JwixAR
X-Proofpoint-GUID: IScL52jMTxVr1CAZqr6naDQN2p-Z7QDD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_12:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106040148
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

On Fri, 2021-06-04 at 21:52 +1000, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > This patch adds the following HCALL wrapper functions to allocate,
> 
> Normal spelling is "hcall".
> 
> > modify and deallocate VAS windows, and retrieve VAS capabilities.
> > 
> > H_ALLOCATE_VAS_WINDOW: Allocate VAS window
> > H_DEALLOCATE_VAS_WINDOW: Close VAS window
> > H_MODIFY_VAS_WINDOW: Setup window before using
> > H_QUERY_VAS_CAPABILITIES: Get VAS capabilities
> 
> Please tell us which version of PAPR, and in which section etc.,
> these
> are described in.
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 217
> > +++++++++++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> >  create mode 100644 arch/powerpc/platforms/pseries/vas.c
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > new file mode 100644
> > index 000000000000..06960151477c
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright 2020-21 IBM Corp.
> > + */
> > +
> > +#define pr_fmt(fmt) "vas: " fmt
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/export.h>
> > +#include <linux/types.h>
> > +#include <linux/delay.h>
> > +#include <linux/slab.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/sched/mm.h>
> > +#include <linux/mmu_context.h>
> > +#include <asm/hvcall.h>
> > +#include <asm/hvconsole.h>
> > +#include <asm/machdep.h>
> 
> Do we need all those headers?
> 
> > +#include <asm/plpar_wrappers.h>
> > +#include <asm/vas.h>
> > +#include "vas.h"
> > +
> > +#define	VAS_INVALID_WIN_ADDRESS	0xFFFFFFFFFFFFFFFFul
> > +#define	VAS_DEFAULT_DOMAIN_ID	0xFFFFFFFFFFFFFFFFul
> 
> Some blank lines for formatting please.
> 
> > +/* Authority Mask Register (AMR) value is not supported in */
> > +/* linux implementation. So pass '0' to modify window HCALL */
> 
> Please fix the comment formatting.
> 
> > +#define	VAS_AMR_VALUE	0
> 
> This is only used in one place. It'd be simpler to just pass 0 and
> move
> the comment there.
> 
> > +/* phyp allows one credit per window right now */
> > +#define DEF_WIN_CREDS		1
> > +
> > +static int64_t hcall_return_busy_check(int64_t rc)
> > +{
> 
> Please use normal kernel types, ie. s64, or just long.
> 
> Same comment throughout.
> 
> > +	/* Check if we are stalled for some time */
> > +	if (H_IS_LONG_BUSY(rc)) {
> > +		msleep(get_longbusy_msecs(rc));
> > +		rc = H_BUSY;
> > +	} else if (rc == H_BUSY) {
> > +		cond_resched();
> > +	}
> > +
> > +	return rc;
> > +}
> > +
> > +/*
> > + * Allocate VAS window HCALL
> > + */
> > +static int plpar_vas_allocate_window(struct vas_window *win, u64
> > *domain,
> > +				     u8 wintype, u16 credits)
> 
> You don't have to use the "plpar" prefix for these sort of wrappers.
> 
> Just naming them after the hcall would probably be clearer, so:
> 
>  h_allocate_vas_window(... )
> 
> > +{
> > +	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
> > +	int64_t rc;
> > +
> > +	do {
> > +		rc = plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf,
> > wintype,
> > +				  credits, domain[0], domain[1],
> > domain[2],
> > +				  domain[3], domain[4], domain[5]);
> > +
> > +		rc = hcall_return_busy_check(rc);
> > +	} while (rc == H_BUSY);
> > +
> > +	switch (rc) {
> > +	case H_SUCCESS:
> > +		win->winid = retbuf[0];
> > +		win->lpar.win_addr = retbuf[1];
> > +		win->lpar.complete_irq = retbuf[2];
> > +		win->lpar.fault_irq = retbuf[3];
> 
> You shouldn't mutate win until you know there is no error.
> 
> > +		if (win->lpar.win_addr == VAS_INVALID_WIN_ADDRESS) {
> > +			pr_err("HCALL(%x): COPY/PASTE is not
> > supported\n",
> > +				H_ALLOCATE_VAS_WINDOW);
> > +			return -ENOTSUPP;
> > +		}
> > +		return 0;
> > +	case H_PARAMETER:
> > +		pr_err("HCALL(%x): Invalid window type (%u)\n",
> > +			H_ALLOCATE_VAS_WINDOW, wintype);
> > +		return -EINVAL;
> > +	case H_P2:
> > +		pr_err("HCALL(%x): Credits(%u) exceed maximum window
> > credits\n",
> > +			H_ALLOCATE_VAS_WINDOW, credits);
> > +		return -EINVAL;
> > +	case H_COP_HW:
> > +		pr_err("HCALL(%x): User-mode COPY/PASTE is not
> > supported\n",
> > +			H_ALLOCATE_VAS_WINDOW);
> > +		return -ENOTSUPP;
> > +	case H_RESOURCE:
> > +		pr_err("HCALL(%x): LPAR credit limit exceeds window
> > limit\n",
> > +			H_ALLOCATE_VAS_WINDOW);
> > +		return -EPERM;
> > +	case H_CONSTRAINED:
> > +		pr_err("HCALL(%x): Credits (%u) are not available\n",
> > +			H_ALLOCATE_VAS_WINDOW, credits);
> > +		return -EPERM;
> > +	default:
> > +		pr_err("HCALL(%x): Unexpected error %lld\n",
> > +			H_ALLOCATE_VAS_WINDOW, rc);
> > +		return -EIO;
> > +	}
> 
> Do we really need all these error prints? It's very verbose, and
> presumably in normal operation none of these are meant to happen
> anyway.
> 
> Can't we just have a single case that prints the error value?

Right, generally we should not see these errors. But few of them are
failures based on argument(s) passing to hcall. like passing invalid
window type or credits are not availavble. 

So can I add error messages for these specific ones and common error
message for other failures with the error code?

case H_PARAMETER:
   	pr_err("HCALL(%x): Invalid window type (%u)\n",
		H_ALLOCATE_VAS_WINDOW, wintype);
case H_CONSTRAINED:
   	pr_err("HCALL(%x): Credits (%u) are not available\n",
		H_ALLOCATE_VAS_WINDOW, credits);
case H_P2:
	pr_err("HCALL(%x): Credits(%u) exceed maximum window
credits\n", H_ALLOCATE_VAS_WINDOW, credits);
default:
	pr_err("HCALL(%x): failure with error code %d\n", 	
		H_ALLOCATE_VAS_WINDOW, rc);


> 
> Same comment for the other hcalls.
> 
> > +}
> > +
> > +/*
> > + * Deallocate VAS window HCALL.
> > + */
> > +static int plpar_vas_deallocate_window(u64 winid)
> > +{
> > +	int64_t rc;
> > +
> > +	do {
> > +		rc = plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW,
> > winid);
> > +
> > +		rc = hcall_return_busy_check(rc);
> > +	} while (rc == H_BUSY);
> > +
> > +	switch (rc) {
> > +	case H_SUCCESS:
> > +		return 0;
> > +	case H_PARAMETER:
> > +		pr_err("HCALL(%x): Invalid window ID %llu\n",
> > +			H_DEALLOCATE_VAS_WINDOW, winid);
> > +		return -EINVAL;
> > +	case H_STATE:
> > +		pr_err("HCALL(%x): Window(%llu): Invalid page table
> > entries\n",
> > +			H_DEALLOCATE_VAS_WINDOW, winid);
> > +		return -EPERM;
> > +	default:
> > +		pr_err("HCALL(%x): Unexpected error %lld for
> > window(%llu)\n",
> > +			H_DEALLOCATE_VAS_WINDOW, rc, winid);
> > +		return -EIO;
> > +	}
> > +}
> > +
> > +/*
> > + * Modify VAS window.
> > + * After the window is opened with allocate window HCALL,
> > configure it
> > + * with flags and LPAR PID before using.
> > + */
> > +static int plpar_vas_modify_window(struct vas_window *win)
> > +{
> > +	int64_t rc;
> > +	u32 lpid = mfspr(SPRN_PID);
> 
> The lpid would be SPRN_LPID ?
> But you can't read it from a guest. Is the variable just misnamed?

yes, not using in pseries code now, but thought LPID is available in
SPRN_PID - PIDR is SPR48 and access to that in LPAR. Not true?

"processId : The LPAR process ID to bind to the specified window. This
parameter is ignored if the “closeWindow” flag is set.
threadId : The LPAR thread ID to bind to the specified window. This
parameter is ignored if the “closeWindow”
flag is set."

since TIDR is deprecated on p10, we are not passing threadID
> 
> > +
> > +	/*
> > +	 * AMR value is not supported in Linux implementation
> > +	 * phyp ignores it if 0 is passed.
> > +	 */
> 
> Heh, this comment is already here.
> 
> Do you mean the Linux VAS implementation doesn't support AMR? Because
> Linux definitely does use AMR.

Linux VAS implementation does not support AMR. The application /
library has to pass this value with TX_WIN_OPEN ioctl. We do not have
any use case right now. I will change the above comment to make it
clear.

phyp added this interface for future reference and AIX may be using it.

Thanks
Haren
> 
> > +	do {
> > +		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW, win-
> > >winid,
> > +					lpid, 0, VAS_MOD_WIN_FLAGS,
> > +					VAS_AMR_VALUE);
> > +
> > +		rc = hcall_return_busy_check(rc);
> > +	} while (rc == H_BUSY);
> > +
> > +	switch (rc) {
> > +	case H_SUCCESS:
> > +		return 0;
> > +	case H_PARAMETER:
> > +		pr_err("HCALL(%x): Invalid window ID %u\n",
> > +			H_MODIFY_VAS_WINDOW, win->winid);
> > +		return -EINVAL;
> > +	case H_P2:
> > +		pr_err("HCALL(%x): Window(%d): Invalid LPAR Process ID
> > %u\n",
> > +			H_MODIFY_VAS_WINDOW, lpid, win->winid);
> > +		return -EINVAL;
> > +	case H_P3:
> > +		/* LPAR thread ID is deprecated on P10 */
> > +		pr_err("HCALL(%x): Invalid LPAR Thread ID for
> > window(%u)\n",
> > +			H_MODIFY_VAS_WINDOW, win->winid);
> > +		return -EINVAL;
> > +	case H_STATE:
> > +		pr_err("HCALL(%x): Jobs in progress, Can't modify
> > window(%u)\n",
> > +			H_MODIFY_VAS_WINDOW, win->winid);
> > +		return -EBUSY;
> > +	default:
> > +		pr_err("HCALL(%x): Unexpected error %lld for
> > window(%u)\n",
> > +			H_MODIFY_VAS_WINDOW, rc, win->winid);
> > +		return -EIO;
> > +	}
> > +}
> > +
> > +/*
> > + * This HCALL is used to determine the capabilities that pHyp
> > provides.
> > + * @hcall: H_QUERY_VAS_CAPABILITIES or H_QUERY_NX_CAPABILITIES
> > + * @query_type: If 0 is passed, phyp returns the overall
> > capabilities
> > + *		which provides all feature(s) that are available. Then
> > + *		query phyp to get the corresponding capabilities for
> > + *		the specific feature.
> > + *		Example: H_QUERY_VAS_CAPABILITIES provides VAS GZIP QoS
> > + *			and VAS GZIP Default capabilities.
> > + *			H_QUERY_NX_CAPABILITIES provides NX GZIP
> > + *			capabilities.
> > + * @result: Return buffer to save capabilities.
> > + */
> > +int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
> > +					u64 result)
> > +{
> > +	int64_t rc;
> > +
> > +	rc = plpar_hcall_norets(hcall, query_type, result);
> > +
> > +	switch (rc) {
> > +	case H_SUCCESS:
> > +		return 0;
> > +	case H_PARAMETER:
> > +		pr_err("HCALL(%llx): Invalid query type %u\n", hcall,
> > +			query_type);
> > +		return -EINVAL;
> > +	case H_PRIVILEGE:
> > +		pr_err("HCALL(%llx): Invalid result buffer 0x%llx\n",
> > +			hcall, result);
> > +		return -EACCES;
> > +	default:
> > +		pr_err("HCALL(%llx): Unexpected error %lld\n", hcall,
> > rc);
> > +		return -EIO;
> > +	}
> > +}
> 
> cheers

