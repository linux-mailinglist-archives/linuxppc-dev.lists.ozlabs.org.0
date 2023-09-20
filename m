Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4A7A8670
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 16:24:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNy/LsCd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrLPw5cLxz3c5c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 00:24:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNy/LsCd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrLP13hdQz2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 00:23:33 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RrLNy3qZVz4xNq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 00:23:30 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RrLNy3n0fz4xMC; Thu, 21 Sep 2023 00:23:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNy/LsCd;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RrLNy0NHzz4xM7;
	Thu, 21 Sep 2023 00:23:29 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KE8Rjv023043;
	Wed, 20 Sep 2023 14:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=4aE2SLoygx07GBR/lTFAmg/RClnb4J5raV/Poy84coA=;
 b=sNy/LsCdgqIP20mXyYhqbntTLJ/xUtLYR85Jeq3qgGO/1NHatzw0C7nMNOGavGJ3X66c
 cy+d8sJ2h9BvawSL2xTZ+WJCUaeAVt5YAw3ndBROiGeZUSDFXlNvtP3ozV8fNQYstIs2
 XZLyfLUhMsaLgNsjJycuUxobeBNnl6hilVmQexxy+bR8KEdZ8SKal5RdSsCRYTlWGR6v
 bX7MaEuxUvckxVnWkGlMRKUknBKTcfpcBl2O5HWOOyWFRWL3RXsdXYevEBJSPuNzPjVb
 NH0fAcY13dB3EjzuxYT+t5WHiGkCsANkux9bz0wirXlIZfgo9G8kL0ku5b6ZZaMG+09K sw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t7ydwnk9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 14:23:26 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38KDUmlC010122;
	Wed, 20 Sep 2023 14:23:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5rwke7pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 14:23:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38KENNes14352992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 14:23:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1653520040;
	Wed, 20 Sep 2023 14:23:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BD3E20043;
	Wed, 20 Sep 2023 14:23:21 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.39.62])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 20 Sep 2023 14:23:20 +0000 (GMT)
Date: Wed, 20 Sep 2023 19:53:16 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <qja6dkvqkcgxjxmgjo4cu6rpa7zvcgnvwa3gxux3f3sjpenejx@7dfbbykea3fw>
References: <20230920105706.853626-1-adityag@linux.ibm.com>
 <87y1h1vy53.fsf@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1h1vy53.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b_Wr2NPN1duhzdEuPpriAVKNfwwApVmZ
X-Proofpoint-ORIG-GUID: b_Wr2NPN1duhzdEuPpriAVKNfwwApVmZ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_05,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309200115
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 20, 2023 at 05:45:36PM +0530, Aneesh Kumar K.V wrote:
> Aditya Gupta <adityag@linux.ibm.com> writes:
> 
> > Since below commit, address mapping for vmemmap has changed for Radix
> > MMU, where address mapping is stored in kernel page table itself,
> > instead of earlier used 'vmemmap_list'.
> >
> >     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
> >     a different vmemmap handling function")
> >
> > Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
> > address translation for vmemmap addresses, as it depended on vmemmap_list,
> > which can now be empty.
> >
> > While fixing the address translation in makedumpfile, it was identified
> > that currently makedumpfile cannot distinguish between Hash MMU and
> > Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
> > And hence fails to assign offsets and shifts correctly (such as in L4 to
> > PGDIR offset calculation in makedumpfile).
> >
> > For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.
> >
> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> > `cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
> > offsets correctly, without needing a VMLINUX.
> >
> > Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
> > Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> > Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> >
> > ---
> > Corresponding makedumpfile patches to fix address translation, in Radix
> > MMU case:
> >
> > Link: https://lore.kernel.org/kexec/B5F0F00E-F2B1-47D7-A143-5683D10DC29A@linux.ibm.com/T/#t
> > ---
> > ---
> >  arch/powerpc/kexec/core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> > index de64c7962991..369b8334a4f0 100644
> > --- a/arch/powerpc/kexec/core.c
> > +++ b/arch/powerpc/kexec/core.c
> > @@ -63,6 +63,8 @@ void arch_crash_save_vmcoreinfo(void)
> >  #ifndef CONFIG_NUMA
> >  	VMCOREINFO_SYMBOL(contig_page_data);
> >  #endif
> > +	VMCOREINFO_SYMBOL(cur_cpu_spec);
> > +	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
> >  #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
> >  	VMCOREINFO_SYMBOL(vmemmap_list);
> >  	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
> >
> 
> That implies we now have to be careful when updating MMU_FTR_* #defines.
> It is not bad considering other hacks we do in crash to identify kernel
> changes tied to version number. But i am wondering if there another way
> to identify radix vs hash?
> 

I could not find another way to get any other flag for RADIX vs HASH in
makedumpfile. And currently I don't know of any other way.

Both makedumpfile and crash look for '0x40' flag set in
'cur_cpu_spec.mmu_features', so only requirement for 'MMU_FTR_TYPE_RADIX' is to
be '0x40', or we will need to change the value accordingly in the tools.

Thanks,
- Aditya Gupta

