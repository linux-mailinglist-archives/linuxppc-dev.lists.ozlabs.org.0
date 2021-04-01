Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966435171F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 19:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB8tb18zBz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 04:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213; helo=5.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo51.mail-out.ovh.net (5.mo51.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB8tG3tbNz301L
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 04:14:13 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id E19CB27AA73;
 Thu,  1 Apr 2021 19:14:08 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 19:14:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067bb0b033-6518-4458-97db-73fea6a4176d,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
To: Greg Kurz <groug@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210401100415.28eb9967@bahia.lan>
 <9b678c0d-2c39-62b8-8ff8-392b38ada6b3@kaod.org>
 <20210401144501.2ee70421@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7f199e12-3807-6f5b-1dc6-cd4df18dc1d5@kaod.org>
Date: Thu, 1 Apr 2021 19:14:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401144501.2ee70421@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8962913f-08b6-4d7b-8173-b78af808048b
X-Ovh-Tracer-Id: 18401708079372995549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/1/21 2:45 PM, Greg Kurz wrote:
> On Thu, 1 Apr 2021 11:18:10 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Hello,
>>
>> On 4/1/21 10:04 AM, Greg Kurz wrote:
>>> On Wed, 31 Mar 2021 16:45:05 +0200
>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>>>
>>>> Hello,
>>>>
>>>> ipistorm [*] can be used to benchmark the raw interrupt rate of an
>>>> interrupt controller by measuring the number of IPIs a system can
>>>> sustain. When applied to the XIVE interrupt controller of POWER9 and
>>>> POWER10 systems, a significant drop of the interrupt rate can be
>>>> observed when crossing the second node boundary.
>>>>
>>>> This is due to the fact that a single IPI interrupt is used for all
>>>> CPUs of the system. The structure is shared and the cache line updates
>>>> impact greatly the traffic between nodes and the overall IPI
>>>> performance.
>>>>
>>>> As a workaround, the impact can be reduced by deactivating the IRQ
>>>> lockup detector ("noirqdebug") which does a lot of accounting in the
>>>> Linux IRQ descriptor structure and is responsible for most of the
>>>> performance penalty.
>>>>
>>>> As a fix, this proposal allocates an IPI interrupt per node, to be
>>>> shared by all CPUs of that node. It solves the scaling issue, the IRQ
>>>> lockup detector still has an impact but the XIVE interrupt rate scales
>>>> linearly. It also improves the "noirqdebug" case as showed in the
>>>> tables below. 
>>>>
>>>
>>> As explained by David and others, NUMA nodes happen to match sockets
>>> with current POWER CPUs but these are really different concepts. NUMA
>>> is about CPU memory accesses latency, 
>>
>> This is exactly our problem. we have cache issues because hw threads 
>> on different chips are trying to access the same structure in memory.
>> It happens on virtual platforms and baremetal platforms. This is not
>> restricted to pseries.
>>
> 
> Ok, I get it... the XIVE HW accesses structures in RAM, just like HW threads
> do, so the closer, the better. 

No. That's another problem related to the XIVE internal tables which
should be allocated on the chip where it is "mostly" used. 

The problem is much simpler. As the commit log says : 

 This is due to the fact that a single IPI interrupt is used for all
 CPUs of the system. The structure is shared and the cache line updates
 impact greatly the traffic between nodes and the overall IPI
 performance.

So, we have multiple threads competing for the same IRQ descriptor and 
overloading the PowerBUS with cache update synchronization. 


> This definitely looks NUMA related indeed. So
> yes, the idea of having the XIVE HW to only access local in-RAM data when
> handling IPIs between vCPUs in the same NUMA node makes sense.

yes. That's the goal.
 
> What is less clear is the exact role of ibm,chip-id actually. This is
> currently used on PowerNV only to pick up a default target on the same
> "chip" as the source if possible. What is the detailed motivation behind
> this ?

The "ibm,chip-id" issue is extra noise and not a requirement for this 
patchset.

>>> while in the case of XIVE you
>>> really need to identify a XIVE chip localized in a given socket.
>>>
>>> PAPR doesn't know about sockets, only cores. In other words, a PAPR
>>> compliant guest sees all vCPUs like they all sit in a single socket.
>>
>> There are also NUMA nodes on PAPR.
>>
> 
> Yes but nothing prevents a NUMA node to span over multiple sockets
> or having several NUMA nodes within the same socket, even if this
> isn't the case in practice with current POWER hardware.

yes. A NUMA node could even be a PCI adapter attached to storage. 
I don't know what to say. We are missing a concept maybe.

>>> Same for the XIVE. Trying to introduce a concept of socket, either
>>> by hijacking OPAL's ibm,chip-id or NUMA node ids, is a kind of
>>> spec violation in this context. If the user cares for locality of
>>> the vCPUs and XIVE on the same socket, then it should bind vCPU
>>> threads to host CPUs from the same socket in the first place.
>>
>> Yes. that's a must have of course. You need to reflect the real HW
>> topology in the guest or LPAR if you are after performance, or 
>> restrict the virtual machine to be on a single socket/chip/node.  
>>
>> And this is not only a XIVE problem. XICS has the same problem with
>> a shared single IPI interrupt descriptor but XICS doesn't scale well 
>> by design, so it doesn't show.
>>
>>
>>> Isn't this enough to solve the performance issues this series
>>> want to fix, without the need for virtual socket ids ?
>> what are virtual socket ids ? A new concept ? 
>>
> 
> For now, we have virtual CPUs identified by a virtual CPU id.
> It thus seems natural to speak of a virtual socket id, but
> anyway, the wording isn't really important here and you
> don't answer the question ;-)

if, on the hypervisor, you restrict the virtual machine vCPUs to be 
on a single POWER processor/chip, there is no problem. But large 
KVM guests or PowerVM LPARs do exist on 16s systems.

C.
 
