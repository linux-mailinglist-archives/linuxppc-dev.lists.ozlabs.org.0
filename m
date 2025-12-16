Return-Path: <linuxppc-dev+bounces-14815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A129BCC3CE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:03:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0YN2mySz2yF1;
	Wed, 17 Dec 2025 02:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897400;
	cv=none; b=TlmBC7OXk4Ms2Y1CoM1sOYoYCb1QTNhK4x0l9HQBEkwT+0F6C9jR8DSfgXcYCGy/QWjmtu8bIqvLruSecv+4TGAOgMKYnWhekcB023nUxW0QVUO9VTDn90QZqWc0PtJJcwTkKEMw/PunNbYS/ZC19PCFpg/bHkksAs1oXhyEvFqz952WFIzd3ZyCcwqPPYPi6oRyRWzS8eeHHHJ7c6FbcTH9VSci8uia6wUIJkHkmut671Tx2To13q4Ik7GzfESFV3OSGD4+A96M7/CkRaaiK/0VlBMHmnJHreTa6Rz2nADhaiRjqjVwCV0+wsEliCDfMvgWO9fZ7sxpp0okrcAn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897400; c=relaxed/relaxed;
	bh=kuNifGSMD72Ttw5Ijvaq3NUjbNScy/0M/D3so4Hyz68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiENu1GWxWYM/U7V0r3MNsY6sY4J8xV0hG7JFNlCPdWLtfz4o7GAnUzw40hAN03zXQqqkSEVgTPzid3l4bA13mW6F5puJ4ySVnNbab5oT9R9/O5/+lymh/YbV7dyzfkRVqKIw3kUqYomrfJaoMdBMBbp8NlP/62fLgCBU/EQYRHBDMcbgz4ohzI+zyyS4zbdYVfeuzieC+qdXQASWgI0XBrmo+DaGVOYh5E9WMnkfeotkAHn4+GCxZ2OW5XXbs+3Yblwp1AFkQRKxiIeM7WzRUIKLoAtUeUxv0dD59QDIIMKE8IK2gop2yIsdcvNlXtaP0DDYdVXBDCVmDpB47LnOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0UCagI2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0UCagI2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0YJ2bx0z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:03:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCU1jx025358;
	Tue, 16 Dec 2025 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=kuNifGSMD72Ttw5Ijvaq3NUjbNScy/
	0M/D3so4Hyz68=; b=N0UCagI2x7Y3iSGe239x9hvKOVekUmMyQiT+NEAZZ3vCQE
	W7g0Pv+hsvyyQLstlnQlEVo4NPIETP4qcn2FNFpGZ2apmL5Ug/GBqpiBfcddBkqA
	vXLJSdI8oyqMDoFT5Tycn7Iy/Gku55dq9FcDkwyrVDPUsNcxFM/l7fwHAaPtuG+w
	uXaOsCrdF9Jt2lMqqMWQP1sOFGPzGJkFGw16IOn5WrImHobr12aUTrAvmJ9kDEiD
	t/edH07I68nWw19D1H4GwV8pr6NIDSSjYjDliq4LgRRei3XSk2ll9lJmUG6c+4xL
	jZ1EAr0Mx6j+jXJB4FRGPkDyfg6/kFvXXUWwAKxA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7puf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:02:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGEnXNN016274;
	Tue, 16 Dec 2025 15:02:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7pu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:02:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGD14Bk012835;
	Tue, 16 Dec 2025 15:02:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juy4u20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:02:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGF2SEw42336694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:02:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97EB720040;
	Tue, 16 Dec 2025 15:02:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 742A220043;
	Tue, 16 Dec 2025 15:02:22 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:02:22 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:32:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
        mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
Message-ID: <huolgwt5nuhkuygwtqiax5qaqxwu2dgrm4h5qtx3dmtngipar5@2e33txywvcg4>
References: <20251214130245.43664-8-mkchauras@linux.ibm.com>
 <202512161441.xlMhHxvl-lkp@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512161441.xlMhHxvl-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=6941748a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=zFoyLS1p-Ef02BwNzEcA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: XzjsKkPnpiPGkXBuwc04_NuB_Yh_YdZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX7k3B6o/PlJzL
 qTcwdlfvjOy3nYBUT6z/zyTDuOlYuGanRjYURp9H6JKvK6Y5DN9DgdKpN/ljgiD2SyNal+H9PfB
 Aiz7+8ql/apbP1QuuktvYuTveTL0cRQzj7AlifBLdtxl4fo9OPWr8ZjrCruLLgkfkdc2UVmfMuS
 IYMo+IENLZHdREsg45+AxxmaoBZgPNxCDfijpYekxhEOXFaLq1JZCjkkMQNqBcswyFKgK00xYnM
 EV9EUyAHFp/DiYxE+vceu9zuoeF7g3yQ9Fd7c02TQ1HF77aBKdH++0iU1GV80vWMtsSDfn/T1LH
 /XV6RKmLMfuND8Jh1z+lPEGxOG4q+0l8TntCWs2BGbqwhxaXyINSiGfdx+TSljeWKGhJ02NeTRZ
 xXodl6EHzDAyDohIXnLCNQx15iHmUw==
X-Proofpoint-ORIG-GUID: AEB0--RHBwCearep11S1YvnOsEouLtEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 02:29:29PM +0800, kernel test robot wrote:
> Hi Mukesh,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on powerpc/fixes linus/master v6.19-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251214-210813
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20251214130245.43664-8-mkchauras%40linux.ibm.com
> patch subject: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
> config: powerpc-randconfig-r072-20251215 (https://download.01.org/0day-ci/archive/20251216/202512161441.xlMhHxvl-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 8.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512161441.xlMhHxvl-lkp@intel.com/
> 
> smatch warnings:
> arch/powerpc/include/asm/entry-common.h:433 arch_enter_from_user_mode() warn: inconsistent indenting
> 
> vim +433 arch/powerpc/include/asm/entry-common.h
> 
> 2b0f05f77f11f8 Mukesh Kumar Chaurasiya 2025-12-14  396  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  397  static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  398  {
> 37ad0d88d9bff7 Mukesh Kumar Chaurasiya 2025-12-14  399  	kuap_lock();
> 37ad0d88d9bff7 Mukesh Kumar Chaurasiya 2025-12-14  400  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  401  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  402  		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  403  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  404  	BUG_ON(regs_is_unrecoverable(regs));
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  405  	BUG_ON(!user_mode(regs));
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  406  	BUG_ON(regs_irqs_disabled(regs));
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  407  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  408  #ifdef CONFIG_PPC_PKEY
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  409  	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  410  		unsigned long amr, iamr;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  411  		bool flush_needed = false;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  412  		/*
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  413  		 * When entering from userspace we mostly have the AMR/IAMR
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  414  		 * different from kernel default values. Hence don't compare.
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  415  		 */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  416  		amr = mfspr(SPRN_AMR);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  417  		iamr = mfspr(SPRN_IAMR);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  418  		regs->amr  = amr;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  419  		regs->iamr = iamr;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  420  		if (mmu_has_feature(MMU_FTR_KUAP)) {
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  421  			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  422  			flush_needed = true;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  423  		}
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  424  		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  425  			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  426  			flush_needed = true;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  427  		}
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  428  		if (flush_needed)
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  429  			isync();
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  430  	} else
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  431  #endif
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  432  		kuap_assert_locked();
Will fix this in next iteration.
Regards,
Mukesh
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14 @433  	booke_restore_dbcr0();
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  434  	account_cpu_user_entry();
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  435  	account_stolen_time();
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  436  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  437  	/*
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  438  	 * This is not required for the syscall exit path, but makes the
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  439  	 * stack frame look nicer. If this was initialised in the first stack
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  440  	 * frame, or if the unwinder was taught the first stack frame always
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  441  	 * returns to user with IRQS_ENABLED, this store could be avoided!
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  442  	 */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  443  	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  444  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  445  	/*
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  446  	 * If system call is called with TM active, set _TIF_RESTOREALL to
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  447  	 * prevent RFSCV being used to return to userspace, because POWER9
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  448  	 * TM implementation has problems with this instruction returning to
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  449  	 * transactional state. Final register values are not relevant because
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  450  	 * the transaction will be aborted upon return anyway. Or in the case
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  451  	 * of unsupported_scv SIGILL fault, the return state does not much
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  452  	 * matter because it's an edge case.
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  453  	 */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  454  	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  455  	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  456  		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  457  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  458  	/*
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  459  	 * If the system call was made with a transaction active, doom it and
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  460  	 * return without performing the system call. Unless it was an
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  461  	 * unsupported scv vector, in which case it's treated like an illegal
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  462  	 * instruction.
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  463  	 */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  464  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  465  	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  466  	    !trap_is_unsupported_scv(regs)) {
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  467  		/* Enable TM in the kernel, and disable EE (for scv) */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  468  		hard_irq_disable();
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  469  		mtmsr(mfmsr() | MSR_TM);
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  470  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  471  		/* tabort, this dooms the transaction, nothing else */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  472  		asm volatile(".long 0x7c00071d | ((%0) << 16)"
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  473  			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  474  
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  475  		/*
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  476  		 * Userspace will never see the return value. Execution will
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  477  		 * resume after the tbegin. of the aborted transaction with the
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  478  		 * checkpointed register state. A context switch could occur
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  479  		 * or signal delivered to the process before resuming the
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  480  		 * doomed transaction context, but that should all be handled
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  481  		 * as expected.
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  482  		 */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  483  		return;
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  484  	}
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  485  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  486  }
> 1a5661537226c3 Mukesh Kumar Chaurasiya 2025-12-14  487  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

