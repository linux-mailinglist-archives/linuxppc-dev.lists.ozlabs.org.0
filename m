Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E417DCF2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 11:08:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bYpL0NNRzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 21:08:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bYmm5X1CzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 21:07:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029A4tZg057859
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:07:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym6tmhrsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 06:07:09 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 029A58nW059313
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:07:09 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym6tmhrs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 06:07:09 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 029A1nqF031405;
 Mon, 9 Mar 2020 10:07:08 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2ym386drw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 10:07:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029A76wI43843998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 10:07:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC35628059;
 Mon,  9 Mar 2020 10:07:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB71628058;
 Mon,  9 Mar 2020 10:07:04 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 10:07:04 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/8] powerpc: Add asm header 'papr_scm.h' describing the
 papr-scm interface
In-Reply-To: <20200220095805.197229-2-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
 <20200220095805.197229-2-vaibhav@linux.ibm.com>
Date: Mon, 09 Mar 2020 15:37:02 +0530
Message-ID: <87ftehzvsp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090072
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Add a new powerpc specific asm header named 'papr-scm.h' that descibes
> the interface between PHYP and guest kernel running as an LPAR.
>
> The HCALLs specific to managing SCM are descibed in Ref[1]. The asm
> header introduced by this patch however describes the data structures
> exchanged between PHYP and kernel during those HCALLs.
>
> Future patches will use these structures to provide support for
> retriving nvdimm health and performance stats in papr_scm kernel
> module.
>
> [1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
> PAPR hcalls")
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/papr_scm.h | 68 +++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/papr_scm.h
>
> diff --git a/arch/powerpc/include/asm/papr_scm.h b/arch/powerpc/include/asm/papr_scm.h
> new file mode 100644
> index 000000000000..d893621063f3
> --- /dev/null
> +++ b/arch/powerpc/include/asm/papr_scm.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Structures and defines needed to manage nvdimms for spapr guests.
> + */
> +#ifndef _ASM_POWERPC_PAPR_SCM_H_
> +#define _ASM_POWERPC_PAPR_SCM_H_
> +
> +#include <linux/types.h>
> +#include <asm/bitsperlong.h>
> +#include <linux/stringify.h>
> +
> +/* DIMM health bitmap bitmap indicators */
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_SCM_DIMM_UNARMED			PPC_BIT(0)
> +/* SCM device failed to persist memory contents */
> +#define PAPR_SCM_DIMM_SHUTDOWN_DIRTY		PPC_BIT(1)
> +/* SCM device contents are persisted from previous IPL */
> +#define PAPR_SCM_DIMM_SHUTDOWN_CLEAN		PPC_BIT(2)
> +/* SCM device contents are not persisted from previous IPL */
> +#define PAPR_SCM_DIMM_EMPTY			PPC_BIT(3)
> +/* SCM device memory life remaining is critically low */
> +#define PAPR_SCM_DIMM_HEALTH_CRITICAL		PPC_BIT(4)
> +/* SCM device will be garded off next IPL due to failure */
> +#define PAPR_SCM_DIMM_HEALTH_FATAL		PPC_BIT(5)
> +/* SCM contents cannot persist due to current platform health status */
> +#define PAPR_SCM_DIMM_HEALTH_UNHEALTHY		PPC_BIT(6)
> +/* SCM device is unable to persist memory contents in certain conditions */
> +#define PAPR_SCM_DIMM_HEALTH_NON_CRITICAL	PPC_BIT(7)

That is not really a bad health condition. That is an indication of
vpmem where we won't persist memory contents on CEC reboot.



> +/* SCM device is encrypted */
> +#define PAPR_SCM_DIMM_ENCRYPTED			PPC_BIT(8)
> +/* SCM device has been scrubbed and locked */
> +#define PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED	PPC_BIT(9)
> +
> +/* Bits status indicators for health bitmap indicating unarmed dimm */
> +#define PAPR_SCM_DIMM_UNARMED_MASK (PAPR_SCM_DIMM_UNARMED |	\
> +					PAPR_SCM_DIMM_HEALTH_UNHEALTHY | \
> +					PAPR_SCM_DIMM_HEALTH_NON_CRITICAL)

Based on the above, I guess you should remove PAPR_SCM_DIMM_HEALTH_NON_CRITICAL
from the above?

> +
> +/* Bits status indicators for health bitmap indicating unflushed dimm */
> +#define PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK (PAPR_SCM_DIMM_SHUTDOWN_DIRTY)
> +
> +/* Bits status indicators for health bitmap indicating unrestored dimm */
> +#define PAPR_SCM_DIMM_BAD_RESTORE_MASK  (PAPR_SCM_DIMM_EMPTY)
> +
> +/* Bit status indicators for smart event notification */
> +#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
> +					   PAPR_SCM_DIMM_HEALTH_FATAL | \
> +					   PAPR_SCM_DIMM_HEALTH_UNHEALTHY | \
> +					   PAPR_SCM_DIMM_HEALTH_NON_CRITICAL)
> +

-aneesh
