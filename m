Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96169223272
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:40:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JM467BzzDqkh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7J6b6zgPzDrK5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:29:11 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H41tMv063706; Fri, 17 Jul 2020 00:29:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32auquns3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:29:04 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06H42W2f065651;
 Fri, 17 Jul 2020 00:29:04 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32auquns30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:29:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H4PZed026546;
 Fri, 17 Jul 2020 04:29:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgx35g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:29:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H4SxbV66912320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 04:28:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A22A811C050;
 Fri, 17 Jul 2020 04:28:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9C511C04C;
 Fri, 17 Jul 2020 04:28:57 +0000 (GMT)
Received: from in.ibm.com (unknown [9.77.195.220])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 17 Jul 2020 04:28:57 +0000 (GMT)
Date: Fri, 17 Jul 2020 09:58:54 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
Message-ID: <20200717042854.GL7902@in.ibm.com>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
 <20200716172713.GA4565@lca.pw>
 <1594950229.jn9ipe6td1.astroid@bobo.none>
 <1594953143.b8px5ir35m.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594953143.b8px5ir35m.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=6 priorityscore=1501 mlxscore=0
 mlxlogscore=933 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170025
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
Reply-To: bharata@linux.ibm.com
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Qian Cai <cai@lca.pw>, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 12:44:00PM +1000, Nicholas Piggin wrote:
> Excerpts from Nicholas Piggin's message of July 17, 2020 12:08 pm:
> > Excerpts from Qian Cai's message of July 17, 2020 3:27 am:
> >> On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
> >>> Hypervisor may choose not to enable Guest Translation Shootdown Enable
> >>> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
> >>> permitted to use instructions like tblie and tlbsync directly, but is
> >>> expected to make hypervisor calls to get the TLB flushed.
> >>> 
> >>> This series enables the TLB flush routines in the radix code to
> >>> off-load TLB flushing to hypervisor via the newly proposed hcall
> >>> H_RPT_INVALIDATE. 
> >>> 
> >>> To easily check the availability of GTSE, it is made an MMU feature.
> >>> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
> >>> handle GTSE as an optionally available feature and to not assume GTSE
> >>> when radix support is available.
> >>> 
> >>> The actual hcall implementation for KVM isn't included in this
> >>> patchset and will be posted separately.
> >>> 
> >>> Changes in v3
> >>> =============
> >>> - Fixed a bug in the hcall wrapper code where we were missing setting
> >>>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
> >>>   a full flush for the nested case.
> >>> - s/psize_to_h_rpti/psize_to_rpti_pgsize
> >>> 
> >>> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@linux.ibm.com/T/#t
> >>> 
> >>> Bharata B Rao (2):
> >>>   powerpc/mm: Enable radix GTSE only if supported.
> >>>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
> >>>     enabled
> >>> 
> >>> Nicholas Piggin (1):
> >>>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
> >>>     !GTSE
> >> 
> >> Reverting the whole series fixed random memory corruptions during boot on
> >> POWER9 PowerNV systems below.
> > 
> > If I s/mmu_has_feature(MMU_FTR_GTSE)/(1)/g in radix_tlb.c, then the .o
> > disasm is the same as reverting my patch.
> > 
> > Feature bits not being set right? PowerNV should be pretty simple, seems
> > to do the same as FTR_TYPE_RADIX.
> 
> Might need this fix
> 
> ---
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 9cc49f265c86..54c9bcea9d4e 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -163,7 +163,7 @@ static struct ibm_pa_feature {
>  	{ .pabyte = 0,  .pabit = 6, .cpu_features  = CPU_FTR_NOEXECUTE },
>  	{ .pabyte = 1,  .pabit = 2, .mmu_features  = MMU_FTR_CI_LARGE_PAGE },
>  #ifdef CONFIG_PPC_RADIX_MMU
> -	{ .pabyte = 40, .pabit = 0, .mmu_features  = MMU_FTR_TYPE_RADIX },
> +	{ .pabyte = 40, .pabit = 0, .mmu_features  = (MMU_FTR_TYPE_RADIX | MMU_FTR_GTSE) },
>  #endif
>  	{ .pabyte = 1,  .pabit = 1, .invert = 1, .cpu_features = CPU_FTR_NODSISRALIGN },
>  	{ .pabyte = 5,  .pabit = 0, .cpu_features  = CPU_FTR_REAL_LE,

Michael - Let me know if this should be folded into 1/3 and the complete
series resent.

Regards,
Bharata.
