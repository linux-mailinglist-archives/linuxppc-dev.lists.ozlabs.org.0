Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237FC194FD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 04:53:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pSdY1tk3zDr58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 14:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pSZ35gqtzDr4L
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 14:50:51 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02R3X8aB165082
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:50:47 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywek0g301-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:50:47 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.ibm.com>;
 Fri, 27 Mar 2020 03:50:38 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Mar 2020 03:50:36 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02R3ohM433357970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 03:50:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD45752051;
 Fri, 27 Mar 2020 03:50:42 +0000 (GMT)
Received: from in.ibm.com (unknown [9.79.178.41])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0C74E5204F;
 Fri, 27 Mar 2020 03:50:41 +0000 (GMT)
Date: Fri, 27 Mar 2020 09:20:39 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 04/12] powerpc/pseries/ras: avoid calling rtas_token
 in NMI paths
References: <20200325103410.157573-1-npiggin@gmail.com>
 <20200325103410.157573-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325103410.157573-5-npiggin@gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 20032703-0020-0000-0000-000003BC2953
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032703-0021-0000-0000-00002214BA51
Message-Id: <20200327035039.s6k6fghjszmrmmtg@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_14:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=1 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270030
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
Reply-To: mahesh@linux.ibm.com
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-25 20:34:02 Wed, Nicholas Piggin wrote:
> In the interest of reducing code and possible failures in the
> machine check and system reset paths, grab the "ibm,nmi-interlock"
> token at init time.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.
> ---
>  arch/powerpc/include/asm/firmware.h    |  1 +
>  arch/powerpc/platforms/pseries/ras.c   |  2 +-
>  arch/powerpc/platforms/pseries/setup.c | 13 ++++++++++---
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
> index ca33f4ef6cb4..6003c2e533a0 100644
> --- a/arch/powerpc/include/asm/firmware.h
> +++ b/arch/powerpc/include/asm/firmware.h
> @@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
> 
>  /* This is true if we are using the firmware NMI handler (typically LPAR) */
>  extern int fwnmi_active;
> +extern int ibm_nmi_interlock_token;
> 
>  extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 1d7f973c647b..c74d5e740922 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
>   */
>  static void fwnmi_release_errinfo(void)
>  {
> -	int ret = rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
> +	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
>  	if (ret != 0)
>  		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
>  }
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 17d17f064a2d..c31acd7ce0c0 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -83,6 +83,7 @@ unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
>  EXPORT_SYMBOL(CMO_PageSize);
> 
>  int fwnmi_active;  /* TRUE if an FWNMI handler is present */
> +int ibm_nmi_interlock_token;
> 
>  static void pSeries_show_cpuinfo(struct seq_file *m)
>  {
> @@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
>  	struct slb_entry *slb_ptr;
>  	size_t size;
>  #endif
> +	int ibm_nmi_register_token;
> 
> -	int ibm_nmi_register = rtas_token("ibm,nmi-register");
> -	if (ibm_nmi_register == RTAS_UNKNOWN_SERVICE)
> +	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
> +	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
> +		return;
> +
> +	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
> +	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
>  		return;
> 
>  	/* If the kernel's not linked at zero we point the firmware at low
> @@ -123,7 +129,8 @@ static void __init fwnmi_init(void)
>  	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
>  	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
> 
> -	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
> +	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
> +				system_reset_addr,
>  				machine_check_addr))
>  		fwnmi_active = 1;
> 
> -- 
> 2.23.0
> 

-- 
Mahesh J Salgaonkar

