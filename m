Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316C75FE22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:45:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZEhMjk6H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8ncW14dLz3bn0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:45:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZEhMjk6H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8nGv3HX0z3clc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:29:59 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OHGeCM009368;
	Mon, 24 Jul 2023 17:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=sH8XVM0G3hMSqr/LiWTFztzsvKol+Jn3yplQbRHngGw=;
 b=ZEhMjk6HCYAdXCP7cE0+9qbJhGF8RYDDUHYLPF3P74qgHvzgbZm9AFyLa4yYtZxHdbs+
 OtmL34boZ8I8XtWXsyq2nVn5blELZbRlSuwxwXoXMpF2Vo2u2+rdzADIy7yFi/l+7BiT
 3nmLAvNGs8Yr/3/OEcbm8oeRXq36N5xQ63PAnBEpwwkxOPhg6K8JcV3CGD179Y4c7yxq
 x6M/ayoWCoPshXLy4y5lvjt46pAPFc+vRYmgFOh9G44mCIcWihMNsPHpTzvcQJg8fRgo
 jx2rCtYEEKPiiMdWNy7pZjc8dmTotHCziUwo/1fxr6FiSDz7nFYJS5rhKN0q89Lewq2e rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1vev2u66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 17:29:43 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OHH1kC013377;
	Mon, 24 Jul 2023 17:29:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1vev2u50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 17:29:42 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OGHOOp002639;
	Mon, 24 Jul 2023 17:29:41 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjmxbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 17:29:41 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OHTeLA1376776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 17:29:40 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86DF55805A;
	Mon, 24 Jul 2023 17:29:40 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CE9658051;
	Mon, 24 Jul 2023 17:29:37 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.177.66.22])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 17:29:36 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <5ee3550d-5bbe-4223-722b-9a388f86fc21@redhat.com>
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
 <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
 <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
 <29eb32f0-fb0b-c8f9-ba23-8295147808ea@redhat.com>
 <3f22b23a-701a-548b-9d84-8ecad695c313@linux.ibm.com>
 <5ee3550d-5bbe-4223-722b-9a388f86fc21@redhat.com>
Date: Mon, 24 Jul 2023 22:59:34 +0530
Message-ID: <87h6pt2p6p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1PYaEmD_D1QWxJkn0YoRf90FoD82ETrI
X-Proofpoint-ORIG-GUID: mNfzqTrUthbqlWrR2jgwk9hcATyw0H5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_13,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240152
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 24.07.23 18:02, Aneesh Kumar K V wrote:
>> On 7/24/23 9:11 PM, David Hildenbrand wrote:
>>> On 24.07.23 17:16, Aneesh Kumar K V wrote:
>>>
>>>>>
>>>>> /*
>>>>>  =C2=A0=C2=A0* In "forced" memmap_on_memory mode, we always align the=
 vmemmap size up to cover
>>>>>  =C2=A0=C2=A0* full pageblocks. That way, we can add memory even if t=
he vmemmap size is not properly
>>>>>  =C2=A0=C2=A0* aligned, however, we might waste memory.
>>>>>  =C2=A0=C2=A0*/
>>>>
>>>> I am finding that confusing. We do want things to be pageblock_nr_page=
s aligned both ways.
>>>> With MEMMAP_ON_MEMORY_FORCE, we do that by allocating more space for m=
emmap and
>>>> in the default case we do that by making sure only memory blocks of sp=
ecific size supporting
>>>> that alignment can use MEMMAP_ON_MEMORY feature.
>>>
>>> See the usage inm hp_supports_memmap_on_memory(), I guess that makes se=
nse then.
>>>
>>> But if you have any ideas on how to clarify that (terminology), I'm all=
 ears!
>>>
>>=20
>>=20
>> I updated the commit message
>>=20
>> mm/hotplug: Support memmap_on_memory when memmap is not aligned to pageb=
locks
>>=20
>> Currently, memmap_on_memory feature is only supported with memory block
>> sizes that result in vmemmap pages covering full page blocks. This is
>> because memory onlining/offlining code requires applicable ranges to be
>> pageblock-aligned, for example, to set the migratetypes properly.
>>=20
>> This patch helps to lift that restriction by reserving more pages than
>> required for vmemmap space. This helps to align the start addr to be
>> page block aligned with different memory block sizes. This implies the
>> kernel will be reserving some pages for every memoryblock. This also
>> allows the memmap on memory feature to be widely useful with different
>> memory block size values.
>>=20
>> For ex: with 64K page size and 256MiB memory block size, we require 4
>> pages to map vmemmap pages, To align things correctly we end up adding a
>> reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.
>>=20
>>=20
>
> Much better.
>
>> Also while implementing your  suggestion to use memory_block_memmap_on_m=
emory_size()
>> I am finding it not really useful because in mhp_supports_memmap_on_memo=
ry() we are checking
>> if remaining_size is pageblock_nr_pages aligned (dax_kmem may want to us=
e that helper
>> later).
>
> Let's focus on this patchset here first.
>
> Factoring out how manye memmap pages we actually need vs. how many pages=
=20
> we need when aligning up sound very reasonable to me.
>
>
> Can you elaborate what the problem is?
>
>> Also I still think altmap.reserve is easier because of the start_pfn cal=
culation.
>> (more on this below)
>
> Can you elaborate? Do you mean the try_remove_memory() change?
>
>>=20
>>=20
>>> [...]
>>>
>>>>>> +=C2=A0=C2=A0=C2=A0 return arch_supports_memmap_on_memory(size);
>>>>>>  =C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0 =C2=A0 /*
>>>>>> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct=
 resource *res, mhp_t mhp_flags)
>>>>>>  =C2=A0=C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mhp_params params =3D {=
 .pgprot =3D pgprot_mhp(PAGE_KERNEL) };
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum memblock_flags memblock_f=
lags =3D MEMBLOCK_NONE;
>>>>>> -=C2=A0=C2=A0=C2=A0 struct vmem_altmap mhp_altmap =3D {};
>>>>>> +=C2=A0=C2=A0=C2=A0 struct vmem_altmap mhp_altmap =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base_pfn =3D=C2=A0 PHYS=
_PFN(res->start),
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .end_pfn=C2=A0 =3D=C2=A0=
 PHYS_PFN(res->end),
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .reserve=C2=A0 =3D memor=
y_block_align_base(resource_size(res)),
>>>>>
>>>>> Can you remind me why we have to set reserve here at all?
>>>>>
>>>>> IOW, can't we simply set
>>>>>
>>>>> .free =3D memory_block_memmap_on_memory_size();
>>>>>
>>>>> end then pass
>>>>>
>>>>> mhp_altmap.alloc + mhp_altmap.free
>>>>>
>>>>> to create_memory_block_devices() instead?
>>>>>
>>>>
>>>> But with the dax usage of altmap, altmap->reserve is what we use to re=
serve things to get
>>>> the required alignment. One difference is where we allocate the struct=
 page at. For this specific
>>>> case it should not matter.
>>>>
>>>> static unsigned long __meminit vmem_altmap_next_pfn(struct vmem_altmap=
 *altmap)
>>>> {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0return altmap->base_pfn + altmap->reserve + a=
ltmap->alloc
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + altmap->align;
>>>> }
>>>>
>>>> And other is where we online a memory block
>>>>
>>>> We find the start pfn using mem->altmap->alloc + mem->altmap->reserve;
>>>>
>>>> Considering altmap->reserve is what dax pfn_dev use, is there a reason=
 you want to use altmap->free for this?
>>>
>>> "Reserve" is all about "reserving that much memory for driver usage".
>>>
>>> We don't care about that. We simply want vmemmap allocations coming fro=
m the pageblock(s) we set aside. Where exactly, we don't care.
>>>
>>>> I find it confusing to update free when we haven't allocated any altma=
p blocks yet.
>>>
>>> "
>>> @reserve: pages mapped, but reserved for driver use (relative to @base)"
>>> @free: free pages set aside in the mapping for memmap storage
>>> @alloc: track pages consumed, private to vmemmap_populate()
>>> "
>>>
>>> To me, that implies that we can ignore "reserve". We set @free to the a=
ligned value and let the vmemmap get allocated from anything in there.
>>>
>>> free + alloc should always sum up to our set-aside pageblock(s), no?
>>>
>>>
>>=20
>> The difference is
>>=20
>>   mhp_altmap.free =3D PHYS_PFN(size) - reserved blocks;
>>=20
>> ie, with 256MiB memory block size with 64K pages, we need 4 memmap pages=
 and we reserve 28 pages for aligment.
>>=20
>> mhp_altmap.free =3D PHYS_PFN(size) - 28.
>>=20
>> So that 4 pages from which we are allocating the memmap pages are still =
counted in free page.
>>=20
>> We could all make it work by doing
>>=20
>> mhp_altmap.free =3D PHYS_PFN(size) -  (memory_block_memmap_on_memory_siz=
e() - memory_block_memmap_size())
>>=20
>> But is that any better than what we have now? I understand the term "res=
erved for driver use" is confusing for this use case.
>> But it is really reserving things for required alignment.
>
>
> Let's take a step back.
>
> altmap->alloc tells us how much was already allocated.
>
> altmap->free tells us how much memory we can allocate at max (confusing,=
=20
> but see vmem_altmap_nr_free()).
>
> altmap->free should actually have been called differently.
>
>
> I think it's currently even *wrong* to set free =3D PHYS_PFN(size). We=20
> don't want to allocate beyond the first pageblock(s) we selected.
>

You are correct. The calculation of altmap.free was wrong.
It was wrong upstream and also had wrong computation in the ppc64
upstream code.

modified   arch/powerpc/mm/init_64.c
@@ -326,8 +326,7 @@ void __ref __vmemmap_free(unsigned long start, unsigned=
 long end,
 	start =3D ALIGN_DOWN(start, page_size);
 	if (altmap) {
 		alt_start =3D altmap->base_pfn;
-		alt_end =3D altmap->base_pfn + altmap->reserve +
-			  altmap->free + altmap->alloc + altmap->align;
+		alt_end =3D altmap->base_pfn + altmap->reserve + altmap->free ;
 	}
=20
 	pr_debug("vmemmap_free %lx...%lx\n", start, end);


Fixing all that up the patch is now updated as below

1 file changed, 109 insertions(+), 15 deletions(-)
mm/memory_hotplug.c | 124 +++++++++++++++++++++++++++++++++++++++++++++----=
---

modified   mm/memory_hotplug.c
@@ -41,17 +41,91 @@
 #include "internal.h"
 #include "shuffle.h"
=20
+enum {
+	MEMMAP_ON_MEMORY_DISABLE =3D 0,
+	MEMMAP_ON_MEMORY_ENABLE,
+	MEMMAP_ON_MEMORY_FORCE,
+};
+
+static int memmap_mode __read_mostly =3D MEMMAP_ON_MEMORY_DISABLE;
+
+static inline unsigned long memory_block_memmap_size(void)
+{
+    return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
+}
+
+static inline unsigned long memory_block_memmap_on_memory_size(void)
+{
+    unsigned long size =3D memory_block_memmap_size();
+
+    /*
+     * In "forced" memmap_on_memory mode, we add extra pages to align the
+     * vmemmap size up to cover full pageblocks. That way, we can add memo=
ry
+     * even if the vmemmap size is not properly aligned, however, we might=
 waste
+     * memory.
+     */
+    if (memmap_mode =3D=3D MEMMAP_ON_MEMORY_FORCE)
+	    return ALIGN(size, PFN_PHYS(pageblock_nr_pages));
+    return size;
+}
+
 #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
-static bool memmap_on_memory __ro_after_init;
-module_param(memmap_on_memory, bool, 0444);
-MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hot=
plug");
+static int set_memmap_mode(const char *val, const struct kernel_param *kp)
+{
+	int ret, mode;
+	bool enabled;
+
+	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
+		mode =3D  MEMMAP_ON_MEMORY_FORCE;
+		goto matched;
+	}
+
+	ret =3D kstrtobool(val, &enabled);
+	if (ret < 0)
+		return ret;
+	if (enabled)
+		mode =3D  MEMMAP_ON_MEMORY_ENABLE;
+	else
+		mode =3D  MEMMAP_ON_MEMORY_DISABLE;
+
+matched:
+	*((int *)kp->arg) =3D  mode;
+	if (mode =3D=3D MEMMAP_ON_MEMORY_FORCE) {
+		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
+			memory_block_memmap_on_memory_size() - memory_block_memmap_size());
+	}
+	return 0;
+}
+
+static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
+{
+	if (*((int *)kp->arg) =3D=3D MEMMAP_ON_MEMORY_FORCE)
+		return sprintf(buffer,  "force\n");
+	if (*((int *)kp->arg) =3D=3D MEMMAP_ON_MEMORY_ENABLE)
+		return sprintf(buffer,  "y\n");
+
+	return sprintf(buffer,  "n\n");
+}
+
+static const struct kernel_param_ops memmap_mode_ops =3D {
+	.set =3D set_memmap_mode,
+	.get =3D get_memmap_mode,
+};
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hot=
plug\n"
+	"With value \"force\" it could result in memory wastage due to memmap siz=
e limitations \n"
+	"For example, if the memmap for a memory block requires 1 MiB, but the pa=
geblock \n"
+	"size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that ther=
e are \n"
+	"still cases where the feature cannot be enforced: for example, if the me=
mmap is \n"
+	"smaller than a single page, or if the architecture does not support the =
forced \n"
+	"mode in all configurations. (y/n/force)");
=20
 static inline bool mhp_memmap_on_memory(void)
 {
-	return memmap_on_memory;
+	return memmap_mode !=3D MEMMAP_ON_MEMORY_DISABLE;
 }
 #else
 static inline bool mhp_memmap_on_memory(void)
@@ -1266,7 +1340,7 @@ static bool mhp_supports_memmap_on_memory(unsigned lo=
ng size)
 {
 	unsigned long nr_vmemmap_pages =3D size >> PAGE_SHIFT;
 	unsigned long vmemmap_size =3D nr_vmemmap_pages * sizeof(struct page);
-	unsigned long remaining_size =3D size - vmemmap_size;
+	unsigned long memmap_on_memory_size =3D memory_block_memmap_on_memory_siz=
e();
=20
 	/*
 	 * Besides having arch support and the feature enabled at runtime, we
@@ -1294,10 +1368,28 @@ static bool mhp_supports_memmap_on_memory(unsigned =
long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return mhp_memmap_on_memory() &&
-	       size =3D=3D memory_block_size_bytes() &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
-	       arch_supports_memmap_on_memory(size);
+	if (!mhp_memmap_on_memory() || size !=3D memory_block_size_bytes())
+		return false;
+
+	/*
+	 * Make sure the vmemmap allocation is fully contained
+	 * so that we always allocate vmemmap memory from altmap area.
+	 */
+	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
+		return false;
+
+	/*
+	 * start pfn should be pageblock_nr_pages aligned for correctly
+	 * setting migrate types
+	 */
+	if (!IS_ALIGNED(memmap_on_memory_size, PFN_PHYS(pageblock_nr_pages)))
+		return false;
+
+	if (memmap_on_memory_size =3D=3D memory_block_size_bytes())
+		/* No effective hotplugged memory doesn't make sense. */
+		return false;
+
+	return arch_supports_memmap_on_memory(size);
 }
=20
 /*
@@ -1310,7 +1402,10 @@ int __ref add_memory_resource(int nid, struct resour=
ce *res, mhp_t mhp_flags)
 {
 	struct mhp_params params =3D { .pgprot =3D pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags =3D MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap =3D {};
+	struct vmem_altmap mhp_altmap =3D {
+		.base_pfn =3D  PHYS_PFN(res->start),
+		.end_pfn  =3D  PHYS_PFN(res->end),
+	};
 	struct memory_group *group =3D NULL;
 	u64 start, size;
 	bool new_node =3D false;
@@ -1355,8 +1450,7 @@ int __ref add_memory_resource(int nid, struct resourc=
e *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
-			mhp_altmap.free =3D PHYS_PFN(size);
-			mhp_altmap.base_pfn =3D PHYS_PFN(start);
+			mhp_altmap.free =3D PHYS_PFN(memory_block_memmap_on_memory_size());
 			params.altmap =3D &mhp_altmap;
 		}
 		/* fallback to not using altmap  */
@@ -1368,8 +1462,7 @@ int __ref add_memory_resource(int nid, struct resourc=
e *res, mhp_t mhp_flags)
 		goto error;
=20
 	/* create memory block devices after memory was added */
-	ret =3D create_memory_block_devices(start, size, mhp_altmap.alloc,
-					  group);
+	ret =3D create_memory_block_devices(start, size, mhp_altmap.free, group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
 		goto error;
@@ -2090,7 +2183,8 @@ static int __ref try_remove_memory(u64 start, u64 siz=
e)
 			 * right thing if we used vmem_altmap when hot-adding
 			 * the range.
 			 */
-			mhp_altmap.alloc =3D nr_vmemmap_pages;
+			mhp_altmap.base_pfn =3D PHYS_PFN(start);
+			mhp_altmap.free =3D nr_vmemmap_pages;
 			altmap =3D &mhp_altmap;
 		}
 	}


