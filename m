Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399D33F3FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 16:30:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0vHT1HLCz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:30:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0vH73Tq9z303m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 02:30:09 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CD44A91428C7;
 Wed, 17 Mar 2021 16:30:03 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 16:30:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00518e2cfca-70f3-4d62-bc92-1a4ab2683fa9,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: Advice needed on SMP regression after cpu_core_mask change
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>
References: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4569097d-ce89-5a13-33a9-2a4ca10be7bd@kaod.org>
Date: Wed, 17 Mar 2021 16:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f3f5cdda-7a53-4f80-8174-cf109dc2a8e9
X-Ovh-Tracer-Id: 2340464433274915689
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Greg Kurz <groug@kaod.org>, aneesh.kumar@in.ibm.com,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/21 2:00 PM, Daniel Henrique Barboza wrote:
> Hello,
> 
> Patch 4bce545903fa ("powerpc/topology: Update topology_core_cpumask") introduced
> a regression in both upstream and RHEL downstream kernels [1]. The assumption made
> in the commit:
> 
> "Further analysis shows that cpu_core_mask and cpu_cpu_mask for any CPU would be
> equal on Power"
> 
> Doesn't seem to be true. After this commit, QEMU is now unable to set single NUMA
> node SMP topologies such as:
> 
> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> 
> lscpu will give the following output in this case:
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  4
> Socket(s):           1
> NUMA node(s):        1
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-7
> 
> 
> This is happening because the macro cpu_cpu_mask(cpu) expands to
> cpumask_of_node(cpu_to_node(cpu)), which in turn expands to node_to_cpumask_map[node].
> node_to_cpumask_map is a NUMA array that maps CPUs to NUMA nodes (Aneesh is on CC to
> correct me if I'm wrong). We're now associating sockets to NUMA nodes directly.
> 
> If I add a second NUMA node then I can get the intended smp topology:
> 
> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  2
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-3
> NUMA node1 CPU(s):   4-7
> 
> 
> However, if I try a single socket with multiple NUMA nodes topology, which is the case
> of Power10, e.g.:
> 
> 
> -smp 8,maxcpus=8,cores=4,threads=2,sockets=1
> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
> 
> 
> This is the result:
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  2
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-3
> NUMA node1 CPU(s):   4-7
> 
> 
> This confirms my suspicions that, at this moment, we're making sockets == NUMA nodes.

Yes. I don't think we can do better on PAPR and the above examples 
seem to confirm that the "sockets" definition is simply ignored.
 
> Cedric, the reason I'm CCing you is because this is related to ibm,chip-id. The commit
> after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc/smp: Stop updating
> cpu_core_mask"), is erasing the code that calculated cpu_core_mask. cpu_core_mask, despite
> its shortcomings that caused its removal, was giving a precise SMP topology. And it was
> using physical_package_id/'ibm,chip-id' for that.

ibm,chip-id is a no-no on pSeries. I guess this is inherent to PAPR which
is hiding a lot of the underlying HW and topology. May be we are trying 
to reconcile two orthogonal views of machine virtualization ...

> Checking in QEMU I can say that the ibm,chip-id calculation is the only place in the code
> that cares about cores per socket information. The kernel is now ignoring that, starting
> on 4bce545903fa, and now QEMU is unable to provide this info to the guest.
> 
> If we're not going to use ibm,chip-id any longer, which seems sensible given that PAPR does
> not declare it, we need another way of letting the guest know how much cores per socket
> we want.
The RTAS call "ibm,get-system-parameter" with token "Processor Module 
Information" returns that kind of information :

  2 byte binary number (N) of module types followed by N module specifiers of the form:
  2 byte binary number (M) of sockets of this module type
  2 byte binary number (L) of chips per this module type
  2 byte binary number (K) of cores per chip in this module type.

See the values in these sysfs files :

  cat /sys/devices/hv_24x7/interface/{sockets,chipspersocket,coresperchip} 

But I am afraid these are host level information and not guest/LPAR.

I didn't find any LPAR level properties or hcalls in the PAPR document. 
They need to be specified.

or

We can add extra properties like ibm,chip-id but making sure it's only 
used under the KVM hypervisor. My understanding is that's something we 
are trying to avoid. 

C.
