Return-Path: <linuxppc-dev+bounces-8376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC656AADAB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 11:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsqCP2j8Xz2yYJ;
	Wed,  7 May 2025 19:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746608833;
	cv=none; b=EaDYM+HmcsuYmVV9aHApSbQSon5aym7S0W9Xuyc5L8qYgus5S5J291gSd+yGn8xtNlauyCkfAo3EJv9OpoAfRBZGegICedNOwqVm5eOqXPkUgxY0ekkHPGlg1wQXkamw+nx+OavguR2b6pXl96WYsR2iHvMaEU5JbFmPAZa1wJwk5K76U5ETnhfRZ4spUgAk07YYKp8bBEW791KCWbv/2zMI6WdoqbM1MRUag2qOLHPcgkJT2MKSyz3Tw512pRJ4SpZod8TI72o9amee0TgG/RPL/o76MpoJQB03qzINOpASy11X5QJA23xMzzPoUNvXqzguNACsDFhEH9O0/niBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746608833; c=relaxed/relaxed;
	bh=442hf5vvMJSMXBZM9IiZGR8cFsE3ASO8U40Qz5XH6ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lz5nvMqIW22oi7jwGHs6gFoJw3wFpzuQATXZYsj0iPkIza4V/Jv6Tbt6C5Ero7Pu31rzWVsJQkbVGw4iNnhBIglj9c1vMJtKe5dcGLLKygYavYE0AA/DMfaEaGGJzW4og6wblmuvzHbYtOCAomX6jhjayWCqXTnffuRFOa5M1/5NA1mARWNoKsjSLxjlDKYjSXWrc73Hloc5r2aFagaU8FI8eL5838yCywzy5vyqdxHgNmei91VTSEOdW6HLpXXEoXXrd7KQ/Nb4MdBwo9gbxv01XITDNt48d6J7KgvVhCQ1kF02KOXFc6qoBo91RXmZOE5Z3PXJa8tdibxTjW6uSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NQzmGYo0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NQzmGYo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsqCK2YjFz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 19:07:08 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546Ld1hT008085;
	Wed, 7 May 2025 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=442hf5
	vvMJSMXBZM9IiZGR8cFsE3ASO8U40Qz5XH6ew=; b=NQzmGYo0tjaJduw1qRuYhJ
	v8lOnkUxHuHyCgW4PftVQNGN/kp2D7nRNCv/EWgMrP/aFG9diBPF8I8A0uoZguRe
	56PyUCFzamPcD12Lac6fhl7ecMe3R/vNFdn728ZnIRU0cofyEhnR2Y7g4gDmbFyz
	88+YuYu8DrCwoqY61Ckpksw/hUrbLsc0zfNEIxknisUhOhXzVmDgKcpIkmrpWeeL
	SjjduTYh5Gx8Jc2qM492UBLQBJ7vw4mZZuj3aOS7715hqp8krWKTJ3UPqAqIjtBv
	HUrv6/KCldzKz6Ri5ylOlBtTefI43uQ+f4BIVDE2AVWMlX9FckgyQXS6midqZcLA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fth8agsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:07:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54794cVT002729;
	Wed, 7 May 2025 09:07:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnywr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:07:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 547971tG59441608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 09:07:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BA2120070;
	Wed,  7 May 2025 09:07:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39BC62006C;
	Wed,  7 May 2025 09:07:00 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.109.198.27])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  7 May 2025 09:06:59 +0000 (GMT)
Date: Wed, 7 May 2025 14:36:57 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        donettom@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
Message-ID: <20250507142219.b3c31d78-21-amachhiw@linux.ibm.com>
Mail-Followup-To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, donettom@linux.ibm.com
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
 <Z9r--U_INHB4RjXI@kitsune.suse.cz>
 <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
 <Z-QU2vtWYrZgo0iT@kitsune.suse.cz>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-QU2vtWYrZgo0iT@kitsune.suse.cz>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mK-0FTRUlyUl1FdsWn9xVCG30KEJXOMK
X-Proofpoint-ORIG-GUID: mK-0FTRUlyUl1FdsWn9xVCG30KEJXOMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA4NCBTYWx0ZWRfXxROxl0TnKYeZ 8OEG3f9WYx5tfwFU90oSK13lISLROJ6CJ5AQzl1PeNtixy/jWpGpBazdblF77sKbU3uP70CXxZz zcXs/nstoGRs1Zac5Rm1FobSiOai1srVRbsvwivuOGqvVX1Ii54TNhUF5VOXCOx5MaQ/veav/Cl
 ka5ITc0EwElTSZ4MxN+4H+hjI8oOFOq7e4cXvSmTnPbMv8zHZ95zBh9dsGqnkSBG7iO0O+QYKIZ aCn5XIAgwwa+XciAshnEgsBf09jRU32PjWlxI0T1zCCE9UAb0xNeDFIkm/3wRjQfIS2EiTIS8HY nuVaH8144/X+o0/X9Y8Ma9j0ttNkTWslM18xmCF7jzJnrJj61lFUJXjmthBL4stajU8sH/N62fc
 IqJz1mnBQR1G4QrTJqy8bLreg+u2SgEt0zPIqqFvsfcVmk9AU2CD8hsXwJjXFm48fCB8Zpr9
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=681b22ba cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=KSb9T-wMAAAA:8 a=69wJf7TsAAAA:8 a=VnNF1IyMAAAA:8 a=I-X_i0tmNJeRevB0B9AA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=8xHQM_3tBfQA:10 a=KF4VuIdXkMyp4E_ug72i:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 mlxscore=100
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxlogscore=-999 clxscore=1015 spamscore=100
 lowpriorityscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Michal,

I can recreate this issue on sles16 distro kernel but I don't observe this issue
with upstream Linux 6.15-rc5 on the **same** sles16 guest.

Note: the commit 6aa989ab2bd0 ("powerpc/pseries/iommu: memory notifier
incorrectly adds TCEs for pmemory") was included since Linux 6.15-rc1.

I think there's something more to this crash.

Thanks,
Amit

On 2025/03/26 03:53 PM, Michal Suchánek wrote:
> Hello,
> 
> On Wed, Mar 26, 2025 at 09:46:11AM -0500, Gaurav Batra wrote:
> > Hello Michal,
> > 
> > In the patch to fix the pmemory bug, I made some changes to the code that
> > determines Max memory an LPAR can have (excluding pmemory). This information
> > is needed while creating Dynamic DMA Window (DDW). These changes are in the
> > main line code path of DDW creation. This might have irritated QEMU somehow,
> > no idea yet on how.
> 
> Yes, it's defeinitely something with the DDW code. Using the
> disable_ddw=1 kernel parameter avoids the qemu crash.
> 
> The kernels in
> https://download.opensuse.org/repositories/Kernel:/SLE15-SP7/pool/ppc64le/
> 
> have the patch applied.
> 
> Booting the kernel inside qemu VM with a PCI device (such as the USB
> hub) and then rebooting the VM crashes qemu.
> 
> Thanks
> 
> Michal
> 
> > 
> > Thanks,
> > 
> > Gaurav
> > 
> > On 3/19/25 12:29 PM, Michal Suchánek wrote:
> > > Hello,
> > > 
> > > looks like this upsets some assumption qemu has about these windows.
> > > 
> > > https://lists.nongnu.org/archive/html/qemu-devel/2025-03/msg05137.html
> > > 
> > > When Linux kernel that has this patch applied is running inside a qemu
> > > VM with a PCI device and the VM is rebooted qemu crashes shortly after
> > > the next Linux kernel starts.
> > > 
> > > This is quite curious since qemu does AFAIK not support pmemory at all.
> > > 
> > > Any idea what went wrong there?
> > > 
> > > Thanks
> > > 
> > > Michal
> > > 
> > > On Thu, Jan 30, 2025 at 12:38:54PM -0600, Gaurav Batra wrote:
> > > > iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
> > > > notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
> > > > (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
> > > > for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
> > > > dynamically mapped when the device driver instructs to do so.
> > > > 
> > > > The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
> > > > after LPAR boot. The command to do so is -
> > > > 
> > > > daxctl reconfigure-device --mode=system-ram dax0.0 --force
> > > > 
> > > > This will dynamically add pmemory range to LPAR RAM eventually invoking
> > > > iommu_mem_notifier(). The address range of pmemory is way beyond the Max
> > > > RAM that the LPAR can have. Which means, this range is beyond the DDW
> > > > created for the device, at device initialization time.
> > > > 
> > > > As a result when TCEs are pre-mapped for the pmemory range, by
> > > > iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
> > > > command, daxctl, to add pmemory as RAM.
> > > > 
> > > > The solution is to not pre-map TCEs for pmemory.
> > > > 
> > > > Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> > > > ---
> > > >   arch/powerpc/include/asm/mmzone.h      |  1 +
> > > >   arch/powerpc/mm/numa.c                 |  2 +-
> > > >   arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
> > > >   3 files changed, 18 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
> > > > index d99863cd6cde..049152f8d597 100644
> > > > --- a/arch/powerpc/include/asm/mmzone.h
> > > > +++ b/arch/powerpc/include/asm/mmzone.h
> > > > @@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
> > > >   #ifdef CONFIG_MEMORY_HOTPLUG
> > > >   extern unsigned long max_pfn;
> > > >   u64 memory_hotplug_max(void);
> > > > +u64 hot_add_drconf_memory_max(void);
> > > >   #else
> > > >   #define memory_hotplug_max() memblock_end_of_DRAM()
> > > >   #endif
> > > > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > > > index 3c1da08304d0..603a0f652ba6 100644
> > > > --- a/arch/powerpc/mm/numa.c
> > > > +++ b/arch/powerpc/mm/numa.c
> > > > @@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
> > > >   	return nid;
> > > >   }
> > > > -static u64 hot_add_drconf_memory_max(void)
> > > > +u64 hot_add_drconf_memory_max(void)
> > > >   {
> > > >   	struct device_node *memory = NULL;
> > > >   	struct device_node *dn = NULL;
> > > > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > > > index 29f1a0cc59cd..abd9529a8f41 100644
> > > > --- a/arch/powerpc/platforms/pseries/iommu.c
> > > > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > > > @@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
> > > >   static phys_addr_t ddw_memory_hotplug_max(void)
> > > >   {
> > > > -	resource_size_t max_addr = memory_hotplug_max();
> > > > -	struct device_node *memory;
> > > > +	resource_size_t max_addr;
> > > > -	for_each_node_by_type(memory, "memory") {
> > > > -		struct resource res;
> > > > -
> > > > -		if (of_address_to_resource(memory, 0, &res))
> > > > -			continue;
> > > > -
> > > > -		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
> > > > -	}
> > > > +#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
> > > > +	max_addr = hot_add_drconf_memory_max();
> > > > +#else
> > > > +	max_addr = memblock_end_of_DRAM();
> > > > +#endif
> > > >   	return max_addr;
> > > >   }
> > > > @@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> > > >   	if (direct_mapping) {
> > > >   		/* DDW maps the whole partition, so enable direct DMA mapping */
> > > > -		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> > > > +		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
> > > >   					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> > > >   		if (ret) {
> > > >   			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
> > > > @@ -2346,11 +2342,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
> > > >   	struct memory_notify *arg = data;
> > > >   	int ret = 0;
> > > > +	/* This notifier can get called when onlining persistent memory as well.
> > > > +	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
> > > > +	 * always be above ddw_memory_hotplug_max()
> > > > +	 */
> > > > +
> > > >   	switch (action) {
> > > >   	case MEM_GOING_ONLINE:
> > > >   		spin_lock(&dma_win_list_lock);
> > > >   		list_for_each_entry(window, &dma_win_list, list) {
> > > > -			if (window->direct) {
> > > > +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> > > > +				ddw_memory_hotplug_max()) {
> > > >   				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
> > > >   						arg->nr_pages, window->prop);
> > > >   			}
> > > > @@ -2362,7 +2364,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
> > > >   	case MEM_OFFLINE:
> > > >   		spin_lock(&dma_win_list_lock);
> > > >   		list_for_each_entry(window, &dma_win_list, list) {
> > > > -			if (window->direct) {
> > > > +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> > > > +				ddw_memory_hotplug_max()) {
> > > >   				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
> > > >   						arg->nr_pages, window->prop);
> > > >   			}
> > > > 
> > > > base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
> > > > -- 
> > > > 2.39.3 (Apple Git-146)
> > > > 
> > > > 
> 

