Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0815D083
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 04:28:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jf3f1QnrzDqDJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 14:28:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jf1Y1wBfzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:26:40 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E3Llie158648; Thu, 13 Feb 2020 22:26:36 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1tn6y6k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 22:26:36 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01E3MFPe159701;
 Thu, 13 Feb 2020 22:26:35 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1tn6y6jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 22:26:35 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01E3NYPa021929;
 Fri, 14 Feb 2020 03:26:34 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2y5bbyu8ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 03:26:34 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01E3QYl346006578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 03:26:34 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71CD124052;
 Fri, 14 Feb 2020 03:26:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32344124058;
 Fri, 14 Feb 2020 03:26:27 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.90.43])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 03:26:26 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH v2 1/4] mm/memremap_pages: Introduce
 memremap_compat_align()
In-Reply-To: <CAPcyv4i8xNEsdX=8c2+ehf24U2AFcc-sKmAPS9UoVvm8z0aRng@mail.gmail.com>
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490379.3343782.10305190793306743949.stgit@dwillia2-desk3.amr.corp.intel.com>
 <x498sl677cf.fsf@segfault.boston.devel.redhat.com>
 <CAPcyv4i8xNEsdX=8c2+ehf24U2AFcc-sKmAPS9UoVvm8z0aRng@mail.gmail.com>
Date: Fri, 14 Feb 2020 08:56:22 +0530
Message-ID: <878sl5x31d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_10:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140025
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Thu, Feb 13, 2020 at 8:58 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>> > The "sub-section memory hotplug" facility allows memremap_pages() users
>> > like libnvdimm to compensate for hardware platforms like x86 that have a
>> > section size larger than their hardware memory mapping granularity.  The
>> > compensation that sub-section support affords is being tolerant of
>> > physical memory resources shifting by units smaller (64MiB on x86) than
>> > the memory-hotplug section size (128 MiB). Where the platform
>> > physical-memory mapping granularity is limited by the number and
>> > capability of address-decode-registers in the memory controller.
>> >
>> > While the sub-section support allows memremap_pages() to operate on
>> > sub-section (2MiB) granularity, the Power architecture may still
>> > require 16MiB alignment on "!radix_enabled()" platforms.
>> >
>> > In order for libnvdimm to be able to detect and manage this per-arch
>> > limitation, introduce memremap_compat_align() as a common minimum
>> > alignment across all driver-facing memory-mapping interfaces, and let
>> > Power override it to 16MiB in the "!radix_enabled()" case.
>> >
>> > The assumption / requirement for 16MiB to be a viable
>> > memremap_compat_align() value is that Power does not have platforms
>> > where its equivalent of address-decode-registers never hardware remaps a
>> > persistent memory resource on smaller than 16MiB boundaries. Note that I
>> > tried my best to not add a new Kconfig symbol, but header include
>> > entanglements defeated the #ifndef memremap_compat_align design pattern
>> > and the need to export it defeats the __weak design pattern for arch
>> > overrides.
>> >
>> > Based on an initial patch by Aneesh.
>>
>> I have just a couple of questions.
>>
>> First, can you please add a comment above the generic implementation of
>> memremap_compat_align describing its purpose, and why a platform might
>> want to override it?
>
> Sure, how about:
>
> /*
>  * The memremap() and memremap_pages() interfaces are alternately used
>  * to map persistent memory namespaces. These interfaces place different
>  * constraints on the alignment and size of the mapping (namespace).
>  * memremap() can map individual PAGE_SIZE pages. memremap_pages() can
>  * only map subsections (2MB), and at least one architecture (PowerPC)
>  * the minimum mapping granularity of memremap_pages() is 16MB.
>  *
>  * The role of memremap_compat_align() is to communicate the minimum
>  * arch supported alignment of a namespace such that it can freely
>  * switch modes without violating the arch constraint. Namely, do not
>  * allow a namespace to be PAGE_SIZE aligned since that namespace may be
>  * reconfigured into a mode that requires SUBSECTION_SIZE alignment.
>  */
>
>> Second, I will take it at face value that the power architecture
>> requires a 16MB alignment, but it's not clear to me why mmu_linear_psize
>> was chosen to represent that.  What's the relationship, there, and can
>> we please have a comment explaining it?
>
> Aneesh, can you help here?

With hash translation, we map the direct-map range with just one page
size. Based on different restrictions as described in htab_init_page_sizes
we can end up choosing 16M, 64K or even 4K. We use the variable
mmu_linear_psize to indicate which page size we used for direct-map
range. 

ie we should do. 

 +unsigned long arch_namespace_align_size(void)
 +{
 +	unsigned long sub_section_size = (1UL << SUBSECTION_SHIFT);
 +
 +	if (radix_enabled())
 +		return sub_section_size;
 +	return max(sub_section_size, (1UL << mmu_psize_defs[mmu_linear_psize].shift));
 +
 +}
 +EXPORT_SYMBOL_GPL(arch_namespace_align_size);

as done here

https://lore.kernel.org/linux-nvdimm/20200120140749.69549-4-aneesh.kumar@linux.ibm.com/

Dan can you update the powerpc definition?

-aneesh
