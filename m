Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73A2276C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 05:32:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9kfm6xNxzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9kcj2WrhzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 13:30:12 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L31GZh052509; Mon, 20 Jul 2020 23:30:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32d981r983-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 23:30:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L3Ls10020785;
 Tue, 21 Jul 2020 03:30:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh3bk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 03:30:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L3U2Dd49807532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 03:30:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D63F552054;
 Tue, 21 Jul 2020 03:30:02 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.95.253])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id EF2D25204F;
 Tue, 21 Jul 2020 03:30:01 +0000 (GMT)
Date: Tue, 21 Jul 2020 08:59:59 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
Message-ID: <20200721032959.GN7902@in.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuy1sksv.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_09:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210016
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >> This is the next version of the fixes for memory unplug on radix.
> >> The issues and the fix are described in the actual patches.
> >
> > I guess this isn't actually causing problems at runtime right now, but I
> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
> > arch_remove_memory(), which ought to be mmu-agnostic:
> >
> > int __ref arch_add_memory(int nid, u64 start, u64 size,
> > 			  struct mhp_params *params)
> > {
> > 	unsigned long start_pfn = start >> PAGE_SHIFT;
> > 	unsigned long nr_pages = size >> PAGE_SHIFT;
> > 	int rc;
> >
> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
> >
> > 	start = (unsigned long)__va(start);
> > 	rc = create_section_mapping(start, start + size, nid,
> > 				    params->pgprot);
> > ...
> 
> Hmm well spotted.
> 
> That does return early if the ops are not setup:
> 
> int resize_hpt_for_hotplug(unsigned long new_mem_size)
> {
> 	unsigned target_hpt_shift;
> 
> 	if (!mmu_hash_ops.resize_hpt)
> 		return 0;
> 
> 
> And:
> 
> void __init hpte_init_pseries(void)
> {
> 	...
> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
> 
> And that comes in via ibm,hypertas-functions:
> 
> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
> 
> 
> But firmware is not necessarily going to add/remove that call based on
> whether we're using hash/radix.

Correct but hpte_init_pseries() will not be called for radix guests.

> 
> So I think a follow-up patch is needed to make this more robust.
> 
> Aneesh/Bharata what platform did you test this series on? I'm curious
> how this didn't break.

I have tested memory hotplug/unplug for radix guest on zz platform and
sanity-tested this for hash guest on P8.

As noted above, mmu_hash_ops.resize_hpt will not be set for radix
guest and hence we won't see any breakage.

However a separate patch to fix this will be good.

Regards,
Bharata.
