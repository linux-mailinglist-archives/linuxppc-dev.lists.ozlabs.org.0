Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022BD22789F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 08:09:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9p901cvSzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9p331KL9zDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 16:04:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L63O8o125205; Tue, 21 Jul 2020 02:04:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dmfk0r2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 02:04:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L60CTV020456;
 Tue, 21 Jul 2020 06:04:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 32brq963a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 06:04:41 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L64e7F52494594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 06:04:41 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD0DA124054;
 Tue, 21 Jul 2020 06:04:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4209A124052;
 Tue, 21 Jul 2020 06:04:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.6])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 06:04:38 +0000 (GMT)
Subject: Re: [v3 15/15] tools/perf: Add perf tools support for extended regs
 in power10
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-16-git-send-email-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <0ea080de-8847-c4dd-dcb8-dd9d85529630@linux.ibm.com>
Date: Tue, 21 Jul 2020 11:34:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594996707-3727-16-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210043
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/17/20 8:08 PM, Athira Rajeev wrote:
> Added support for supported regs which are new in power10
> ( MMCR3, SIER2, SIER3 ) to sample_reg_mask in the tool side
> to use with `-I?` option. Also added PVR check to send extended
> mask for power10 at kernel while capturing extended regs in
> each sample.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/arch/powerpc/include/uapi/asm/perf_regs.h | 6 ++++++
>  tools/perf/arch/powerpc/include/perf_regs.h     | 3 +++
>  tools/perf/arch/powerpc/util/perf_regs.c        | 6 ++++++
>  3 files changed, 15 insertions(+)
> 


Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> index 225c64c..bdf5f10 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -52,6 +52,9 @@ enum perf_event_powerpc_regs {
>  	PERF_REG_POWERPC_MMCR0,
>  	PERF_REG_POWERPC_MMCR1,
>  	PERF_REG_POWERPC_MMCR2,
> +	PERF_REG_POWERPC_MMCR3,
> +	PERF_REG_POWERPC_SIER2,
> +	PERF_REG_POWERPC_SIER3,
>  	/* Max regs without the extended regs */
>  	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>  };
> @@ -60,6 +63,9 @@ enum perf_event_powerpc_regs {
>  
>  /* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
>  #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
> +#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
>  
>  #define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
> +#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index 46ed00d..63f3ac9 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -68,6 +68,9 @@
>  	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
>  	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
>  	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
> +	[PERF_REG_POWERPC_MMCR3] = "mmcr3",
> +	[PERF_REG_POWERPC_SIER2] = "sier2",
> +	[PERF_REG_POWERPC_SIER3] = "sier3",
>  };
>  
>  static inline const char *perf_reg_name(int id)
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
> index d64ba0c..2b6d470 100644
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  
>  #define PVR_POWER9		0x004E
> +#define PVR_POWER10		0x0080
>  
>  const struct sample_reg sample_reg_masks[] = {
>  	SMPL_REG(r0, PERF_REG_POWERPC_R0),
> @@ -64,6 +65,9 @@
>  	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
>  	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
>  	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
> +	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
> +	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
> +	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
>  	SMPL_REG_END
>  };
>  
> @@ -194,6 +198,8 @@ uint64_t arch__intr_reg_mask(void)
>  	version = (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
>  	if (version == PVR_POWER9)
>  		extended_mask = PERF_REG_PMU_MASK_300;
> +	else if (version == PVR_POWER10)
> +		extended_mask = PERF_REG_PMU_MASK_31;
>  	else
>  		return mask;
>  
> 
