Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A948222C502
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 14:20:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCpF46ysjzF0dd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 22:20:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCp9W1VpTzDrq1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 22:17:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OC2WeH168229; Fri, 24 Jul 2020 08:17:11 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fsbm2ep9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 08:17:10 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OCGSHP013376;
 Fri, 24 Jul 2020 12:17:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 32brq84121-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 12:17:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06OCH60f31523072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 12:17:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42213AE057;
 Fri, 24 Jul 2020 12:17:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26B90AE051;
 Fri, 24 Jul 2020 12:17:05 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.85.193])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jul 2020 12:17:04 +0000 (GMT)
Date: Fri, 24 Jul 2020 17:47:02 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
Message-ID: <20200724121702.GE1082478@in.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
 <20200721032959.GN7902@in.ibm.com>
 <87ft9lrr55.fsf@mpe.ellerman.id.au>
 <20200722060506.GO7902@in.ibm.com>
 <87mu3pp1u9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu3pp1u9.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_03:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007240089
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 09:52:14PM +1000, Michael Ellerman wrote:
> Bharata B Rao <bharata@linux.ibm.com> writes:
> > On Tue, Jul 21, 2020 at 10:25:58PM +1000, Michael Ellerman wrote:
> >> Bharata B Rao <bharata@linux.ibm.com> writes:
> >> > On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
> >> >> Nathan Lynch <nathanl@linux.ibm.com> writes:
> >> >> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >> >> >> This is the next version of the fixes for memory unplug on radix.
> >> >> >> The issues and the fix are described in the actual patches.
> >> >> >
> >> >> > I guess this isn't actually causing problems at runtime right now, but I
> >> >> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
> >> >> > arch_remove_memory(), which ought to be mmu-agnostic:
> >> >> >
> >> >> > int __ref arch_add_memory(int nid, u64 start, u64 size,
> >> >> > 			  struct mhp_params *params)
> >> >> > {
> >> >> > 	unsigned long start_pfn = start >> PAGE_SHIFT;
> >> >> > 	unsigned long nr_pages = size >> PAGE_SHIFT;
> >> >> > 	int rc;
> >> >> >
> >> >> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
> >> >> >
> >> >> > 	start = (unsigned long)__va(start);
> >> >> > 	rc = create_section_mapping(start, start + size, nid,
> >> >> > 				    params->pgprot);
> >> >> > ...
> >> >> 
> >> >> Hmm well spotted.
> >> >> 
> >> >> That does return early if the ops are not setup:
> >> >> 
> >> >> int resize_hpt_for_hotplug(unsigned long new_mem_size)
> >> >> {
> >> >> 	unsigned target_hpt_shift;
> >> >> 
> >> >> 	if (!mmu_hash_ops.resize_hpt)
> >> >> 		return 0;
> >> >> 
> >> >> 
> >> >> And:
> >> >> 
> >> >> void __init hpte_init_pseries(void)
> >> >> {
> >> >> 	...
> >> >> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
> >> >> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
> >> >> 
> >> >> And that comes in via ibm,hypertas-functions:
> >> >> 
> >> >> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
> >> >> 
> >> >> 
> >> >> But firmware is not necessarily going to add/remove that call based on
> >> >> whether we're using hash/radix.
> >> >
> >> > Correct but hpte_init_pseries() will not be called for radix guests.
> >> 
> >> Yeah, duh. You'd think the function name would have been a sufficient
> >> clue for me :)
> >> 
> >> >> So I think a follow-up patch is needed to make this more robust.
> >> >> 
> >> >> Aneesh/Bharata what platform did you test this series on? I'm curious
> >> >> how this didn't break.
> >> >
> >> > I have tested memory hotplug/unplug for radix guest on zz platform and
> >> > sanity-tested this for hash guest on P8.
> >> >
> >> > As noted above, mmu_hash_ops.resize_hpt will not be set for radix
> >> > guest and hence we won't see any breakage.
> >> 
> >> OK.
> >> 
> >> That's probably fine as it is then. Or maybe just a comment in
> >> resize_hpt_for_hotplug() pointing out that resize_hpt will be NULL if
> >> we're using radix.
> >
> > Or we could move these calls to hpt-only routines like below?
> 
> That looks like it would be equivalent, and would nicely isolate those
> calls in hash specific code. So yeah I think that's worth sending as a
> proper patch, even better if you can test it.

Sure I will send it as a proper patch. I did test minimal hotplug/unplug
for hash guest with that patch, will do more extensive test and resend.

> 
> > David - Do you remember if there was any particular reason to have
> > these two hpt-resize calls within powerpc-generic memory hotplug code?
> 
> I think the HPT resizing was developed before or concurrently with the
> radix support, so I would guess it was just not something we thought
> about at the time.

Right.

Regards,
Bharata.
