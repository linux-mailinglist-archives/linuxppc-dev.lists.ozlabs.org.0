Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD057A9288
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 10:17:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLiGP+4O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrpDD3HdZz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 18:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLiGP+4O;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrpCK3gw7z303l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 18:16:45 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RrpCK1tlbz4x5l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 18:16:45 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RrpCK1qs5z4xF5; Thu, 21 Sep 2023 18:16:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLiGP+4O;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RrpCJ3jtnz4x5l
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Sep 2023 18:16:43 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38L78wIc019203
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Sep 2023 08:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=oDE3tqGIVOSx19EoB+tXEd08snP7npnBv9g5EahKK6A=;
 b=kLiGP+4OucMZCsvZK9Mw/EFPIeachZdpcKrzJOcuWrwMCiXt/wTbYlITLjiFcSpLTQPW
 IupAuZazeZcTZBaNEe3GlRYBN6il6nWENk34oqGTcagEC5eOKcJe4/MAn11evPaW/uu4
 IWzZAXzIo+nAmex2diuYrzmKMqYJrkVVmuv4cYzkth/nk6oXTVvnOCQMVzd41Mf8MeVd
 +47LMlwfL9Uk3nmChg1Xx249YFfkKRBzMPft/d+B9KLxzWk7Y0CgCFni7XzskG1kvd9A
 dzuB+vS9TUimHG3F0MYy5HhYPGgs68tAtuhdf02UADRKrLKNE9hAafFIVcCLj/65q9vW IQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t82yhr821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Sep 2023 08:16:40 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38L86loA018180
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Sep 2023 08:16:39 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5ppt6wtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Sep 2023 08:16:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38L8GcEJ852682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Sep 2023 08:16:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42C0358055;
	Thu, 21 Sep 2023 08:16:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C5755804B;
	Thu, 21 Sep 2023 08:16:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 Sep 2023 08:16:35 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Aditya Gupta <adityag@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <qja6dkvqkcgxjxmgjo4cu6rpa7zvcgnvwa3gxux3f3sjpenejx@7dfbbykea3fw>
References: <20230920105706.853626-1-adityag@linux.ibm.com>
 <87y1h1vy53.fsf@linux.ibm.com>
 <qja6dkvqkcgxjxmgjo4cu6rpa7zvcgnvwa3gxux3f3sjpenejx@7dfbbykea3fw>
Date: Thu, 21 Sep 2023 13:46:34 +0530
Message-ID: <87pm2chrfh.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O7BzJBmh32RnYWBlpF9f0AYV3bmfqjjk
X-Proofpoint-GUID: O7BzJBmh32RnYWBlpF9f0AYV3bmfqjjk
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309210069
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, linuxppc-dev@ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aditya Gupta <adityag@linux.ibm.com> writes:

> On Wed, Sep 20, 2023 at 05:45:36PM +0530, Aneesh Kumar K.V wrote:
>> Aditya Gupta <adityag@linux.ibm.com> writes:
>> 
>> > Since below commit, address mapping for vmemmap has changed for Radix
>> > MMU, where address mapping is stored in kernel page table itself,
>> > instead of earlier used 'vmemmap_list'.
>> >
>> >     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
>> >     a different vmemmap handling function")
>> >
>> > Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
>> > address translation for vmemmap addresses, as it depended on vmemmap_list,
>> > which can now be empty.
>> >
>> > While fixing the address translation in makedumpfile, it was identified
>> > that currently makedumpfile cannot distinguish between Hash MMU and
>> > Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
>> > And hence fails to assign offsets and shifts correctly (such as in L4 to
>> > PGDIR offset calculation in makedumpfile).
>> >
>> > For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.
>> >
>> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>> > `cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
>> > offsets correctly, without needing a VMLINUX.
>> >
>> > Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
>> > Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>> > Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>> >
>> > ---
>> > Corresponding makedumpfile patches to fix address translation, in Radix
>> > MMU case:
>> >
>> > Link: https://lore.kernel.org/kexec/B5F0F00E-F2B1-47D7-A143-5683D10DC29A@linux.ibm.com/T/#t
>> > ---
>> > ---
>> >  arch/powerpc/kexec/core.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>> > index de64c7962991..369b8334a4f0 100644
>> > --- a/arch/powerpc/kexec/core.c
>> > +++ b/arch/powerpc/kexec/core.c
>> > @@ -63,6 +63,8 @@ void arch_crash_save_vmcoreinfo(void)
>> >  #ifndef CONFIG_NUMA
>> >  	VMCOREINFO_SYMBOL(contig_page_data);
>> >  #endif
>> > +	VMCOREINFO_SYMBOL(cur_cpu_spec);
>> > +	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
>> >  #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
>> >  	VMCOREINFO_SYMBOL(vmemmap_list);
>> >  	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
>> >
>> 
>> That implies we now have to be careful when updating MMU_FTR_* #defines.
>> It is not bad considering other hacks we do in crash to identify kernel
>> changes tied to version number. But i am wondering if there another way
>> to identify radix vs hash?
>> 
>
> I could not find another way to get any other flag for RADIX vs HASH in
> makedumpfile. And currently I don't know of any other way.
>
> Both makedumpfile and crash look for '0x40' flag set in
> 'cur_cpu_spec.mmu_features', so only requirement for 'MMU_FTR_TYPE_RADIX' is to
> be '0x40', or we will need to change the value accordingly in the tools.
>

Instead of exporting cur_cpu_spec.mmu_feature, you could do
coreinfo_mmu_features that does

if (radix_enabled())
   coreinfo_mmu_feature = VMCORE_INFO_RADIX_TRANSLATION;

-aneesh
