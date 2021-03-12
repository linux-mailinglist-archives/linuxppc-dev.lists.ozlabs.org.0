Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B233338993
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 11:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxhHj14bRz3dRk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 21:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.45.220; helo=5.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 166810 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 21:04:06 AEDT
Received: from 5.mo52.mail-out.ovh.net (5.mo52.mail-out.ovh.net
 [188.165.45.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxhHB21V0z3d3y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 21:04:05 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id C224D24BF63;
 Fri, 12 Mar 2021 10:53:59 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 10:53:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006feddd577-92b5-4852-9f7d-abacc7bd9cf4,
 795EE61F3CDF5270877287A62BE336BF03444C93) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
To: David Gibson <dgibson@redhat.com>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org> <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
 <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
 <20210312125527.61bc269c@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4effbb5e-6f08-03bf-cea0-60c986175668@kaod.org>
Date: Fri, 12 Mar 2021 10:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210312125527.61bc269c@yekko.fritz.box>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 847daada-19e1-4769-8e73-38e32e2d5bc4
X-Ovh-Tracer-Id: 4194821581489671017
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeehvefffefhtdduieejheejleefieeuieeuvedvgfeiteeuvdetheduffehgeevnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/12/21 2:55 AM, David Gibson wrote:
> On Tue, 9 Mar 2021 18:26:35 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 3/9/21 12:33 PM, Cédric Le Goater wrote:  
>>>> On 3/8/21 6:13 PM, Greg Kurz wrote:  
>>>>> On Wed, 3 Mar 2021 18:48:50 +0100
>>>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>>>  
>>>>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>>>>>> target for a source located on the same chip when possible. This field
>>>>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
>>>>>> on pSeries under KVM when NUMA nodes are defined but it is undefined  
>>>>>
>>>>> This sentence seems to have a syntax problem... like it is missing an
>>>>> 'and' before 'on pSeries'.  
>>>>
>>>> ah yes, or simply a comma.
>>>>  
>>>>>> under PowerVM. The XIVE source structure has a similar field
>>>>>> 'src_chip' which is only assigned on the PowerNV platform.
>>>>>>
>>>>>> cpu_to_node() returns a compatible value on all platforms, 0 being the
>>>>>> default node. It will also give us the opportunity to set the affinity
>>>>>> of a source on pSeries when we can localize them.
>>>>>>  
>>>>>
>>>>> IIUC this relies on the fact that the NUMA node id is == to chip id
>>>>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
>>>>> with this change.  
>>>>
>>>> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
>>>> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
>>>> in Cc:)  
>>  [...]  
>>>>
>>>> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
>>>> the node id. This value is built from the chip id in OPAL, so the
>>>> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
>>>> property are unlikely to be different.
>>>>
>>>> cpu_to_node(cpu) is used in many places to allocate the structures
>>>> locally to the owning node. XIVE is not an exception (see below in the
>>>> same patch), it is better to be consistent and get the same information
>>>> (node id) using the same routine.
>>>>
>>>>
>>>> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
>>>> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
>>>> unifies the controllers of the system to only expose one the OS. This
>>>> is problematic and should be changed but it's another topic.
>>>>
>>>>  
>>>>> On the other hand, you have the pSeries case under PowerVM that
>>>>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT.  
>>>>
>>>> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meaning
>>>> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
>>>> chip id.
>>>>
>>>> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
>>>> always correct btw)  
>>>
>>>
>>> If you have a way to reliably reproduce this, let me know and I'll fix it
>>> up in QEMU.  
>>
>> with :
>>
>>    -smp 4,cores=1,maxcpus=8 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>
>> # dmesg | grep numa
>> [    0.013106] numa: Node 0 CPUs: 0-1
>> [    0.013136] numa: Node 1 CPUs: 2-3
>>
>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
>> 		ibm,chip-id = <0x01>;
>> 		ibm,chip-id = <0x02>;
>> 		ibm,chip-id = <0x00>;
>> 		ibm,chip-id = <0x03>;
>>
>> with :
>>
>>   -smp 4,cores=4,maxcpus=8,threads=1 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>
>> # dmesg | grep numa
>> [    0.013106] numa: Node 0 CPUs: 0-1
>> [    0.013136] numa: Node 1 CPUs: 2-3
>>
>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
>> 		ibm,chip-id = <0x00>;
>> 		ibm,chip-id = <0x00>;
>> 		ibm,chip-id = <0x00>;
>> 		ibm,chip-id = <0x00>;
>>
>> I think we should simply remove "ibm,chip-id" since it's not used and
>> not in the PAPR spec.
> 
> As I mentioned to Daniel on our call this morning, oddly it *does*
> appear to be used in the RHEL kernel, even though that's 4.18 based.
> This patch seems to have caused a minor regression; not in the
> identification of NUMA nodes, but in the number of sockets shown be
> lscpu, etc.  See https://bugzilla.redhat.com/show_bug.cgi?id=1934421
> for more information.

Yes. The property "ibm,chip-id" is wrongly calculated in QEMU. If we 
remove it, we get with 4.18.0-295.el8.ppc64le or 5.12.0-rc2 :

   [root@localhost ~]# lscpu 
   Architecture:        ppc64le
   Byte Order:          Little Endian
   CPU(s):              128
   On-line CPU(s) list: 0-127
   Thread(s) per core:  4
   Core(s) per socket:  16
   Socket(s):           2
   NUMA node(s):        2
   Model:               2.2 (pvr 004e 1202)
   Model name:          POWER9 (architected), altivec supported
   Hypervisor vendor:   KVM
   Virtualization type: para
   L1d cache:           32K
   L1i cache:           32K
   NUMA node0 CPU(s):   0-63
   NUMA node1 CPU(s):   64-127

   [root@localhost ~]# grep . /sys/devices/system/cpu/*/topology/physical_package_id
   /sys/devices/system/cpu/cpu0/topology/physical_package_id:-1
   /sys/devices/system/cpu/cpu100/topology/physical_package_id:-1
   /sys/devices/system/cpu/cpu101/topology/physical_package_id:-1
   /sys/devices/system/cpu/cpu102/topology/physical_package_id:-1
   /sys/devices/system/cpu/cpu103/topology/physical_package_id:-1
   ....

"ibm,chip-id" is still being used on some occasion on pSeries machines.
This is wrong :/ The problem is :

  #define topology_physical_package_id(cpu)      (cpu_to_chip_id(cpu))

We should be using cpu_to_node(). 

C.

> 
> Since the value was used by some PAPR kernels - even if they shouldn't
> have - I think we should only remove this for newer machine types.  We
> also need to check what we're not supplying that the guest kernel is
> showing a different number of sockets than specified on the qemu
> command line.
> 
>>
>> Thanks,
>>
>> C.
>>
>>  
>>
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>  [...]  
>>
> 
> 

