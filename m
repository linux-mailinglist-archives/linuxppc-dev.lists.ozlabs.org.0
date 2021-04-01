Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70535125E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 11:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9yjD202dz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 20:35:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 598 seconds by postgrey-1.36 at boromir;
 Thu, 01 Apr 2021 20:35:26 AEDT
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9yht3Rn5z2yQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:35:26 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3AE50279714;
 Thu,  1 Apr 2021 11:18:11 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 11:18:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022e545dd0-e048-4b7d-82dd-1f40d1280cf2,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
To: Greg Kurz <groug@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210401100415.28eb9967@bahia.lan>
Message-ID: <9b678c0d-2c39-62b8-8ff8-392b38ada6b3@kaod.org>
Date: Thu, 1 Apr 2021 11:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401100415.28eb9967@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3f520a99-07d1-41d3-945a-f44c64281ba7
X-Ovh-Tracer-Id: 10363627169305955293
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhuffvfhfkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegiefgfedtffehuddtgfejffeutddtueejueeiheffudetfeeuudethefhkefhvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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

Hello,

On 4/1/21 10:04 AM, Greg Kurz wrote:
> On Wed, 31 Mar 2021 16:45:05 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>>
>> Hello,
>>
>> ipistorm [*] can be used to benchmark the raw interrupt rate of an
>> interrupt controller by measuring the number of IPIs a system can
>> sustain. When applied to the XIVE interrupt controller of POWER9 and
>> POWER10 systems, a significant drop of the interrupt rate can be
>> observed when crossing the second node boundary.
>>
>> This is due to the fact that a single IPI interrupt is used for all
>> CPUs of the system. The structure is shared and the cache line updates
>> impact greatly the traffic between nodes and the overall IPI
>> performance.
>>
>> As a workaround, the impact can be reduced by deactivating the IRQ
>> lockup detector ("noirqdebug") which does a lot of accounting in the
>> Linux IRQ descriptor structure and is responsible for most of the
>> performance penalty.
>>
>> As a fix, this proposal allocates an IPI interrupt per node, to be
>> shared by all CPUs of that node. It solves the scaling issue, the IRQ
>> lockup detector still has an impact but the XIVE interrupt rate scales
>> linearly. It also improves the "noirqdebug" case as showed in the
>> tables below. 
>>
> 
> As explained by David and others, NUMA nodes happen to match sockets
> with current POWER CPUs but these are really different concepts. NUMA
> is about CPU memory accesses latency, 

This is exactly our problem. we have cache issues because hw threads 
on different chips are trying to access the same structure in memory.
It happens on virtual platforms and baremetal platforms. This is not
restricted to pseries.

> while in the case of XIVE you
> really need to identify a XIVE chip localized in a given socket.
> 
> PAPR doesn't know about sockets, only cores. In other words, a PAPR
> compliant guest sees all vCPUs like they all sit in a single socket.

There are also NUMA nodes on PAPR.

> Same for the XIVE. Trying to introduce a concept of socket, either
> by hijacking OPAL's ibm,chip-id or NUMA node ids, is a kind of
> spec violation in this context. If the user cares for locality of
> the vCPUs and XIVE on the same socket, then it should bind vCPU
> threads to host CPUs from the same socket in the first place.

Yes. that's a must have of course. You need to reflect the real HW
topology in the guest or LPAR if you are after performance, or 
restrict the virtual machine to be on a single socket/chip/node.  

And this is not only a XIVE problem. XICS has the same problem with
a shared single IPI interrupt descriptor but XICS doesn't scale well 
by design, so it doesn't show.


> Isn't this enough to solve the performance issues this series
> want to fix, without the need for virtual socket ids ?
what are virtual socket ids ? A new concept ? 

Thanks,

C.

> 
>>  * P9 DD2.2 - 2s * 64 threads
>>
>>                                                "noirqdebug"
>>                         Mint/s                    Mint/s   
>>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys     
>>  --------------------------------------------------------------
>>  1      0-15     4.984023   4.875405       4.996536   5.048892
>>         0-31    10.879164  10.544040      10.757632  11.037859
>>         0-47    15.345301  14.688764      14.926520  15.310053
>>         0-63    17.064907  17.066812      17.613416  17.874511
>>  2      0-79    11.768764  21.650749      22.689120  22.566508
>>         0-95    10.616812  26.878789      28.434703  28.320324
>>         0-111   10.151693  31.397803      31.771773  32.388122
>>         0-127    9.948502  33.139336      34.875716  35.224548
>>
>>
>>  * P10 DD1 - 4s (not homogeneous) 352 threads
>>
>>                                                "noirqdebug"
>>                         Mint/s                    Mint/s   
>>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys     
>>  --------------------------------------------------------------
>>  1      0-15     2.409402   2.364108       2.383303   2.395091
>>         0-31     6.028325   6.046075       6.089999   6.073750
>>         0-47     8.655178   8.644531       8.712830   8.724702
>>         0-63    11.629652  11.735953      12.088203  12.055979
>>         0-79    14.392321  14.729959      14.986701  14.973073
>>         0-95    12.604158  13.004034      17.528748  17.568095
>>  2      0-111    9.767753  13.719831      19.968606  20.024218
>>         0-127    6.744566  16.418854      22.898066  22.995110
>>         0-143    6.005699  19.174421      25.425622  25.417541
>>         0-159    5.649719  21.938836      27.952662  28.059603
>>         0-175    5.441410  24.109484      31.133915  31.127996
>>  3      0-191    5.318341  24.405322      33.999221  33.775354
>>         0-207    5.191382  26.449769      36.050161  35.867307
>>         0-223    5.102790  29.356943      39.544135  39.508169
>>         0-239    5.035295  31.933051      42.135075  42.071975
>>         0-255    4.969209  34.477367      44.655395  44.757074
>>  4      0-271    4.907652  35.887016      47.080545  47.318537
>>         0-287    4.839581  38.076137      50.464307  50.636219
>>         0-303    4.786031  40.881319      53.478684  53.310759
>>         0-319    4.743750  43.448424      56.388102  55.973969
>>         0-335    4.709936  45.623532      59.400930  58.926857
>>         0-351    4.681413  45.646151      62.035804  61.830057
>>
>> [*] https://github.com/antonblanchard/ipistorm
>>
>> Thanks,
>>
>> C.
>>
>> Changes in v3:
>>
>>   - improved commit log for the misuse of "ibm,chip-id"
>>   - better error handling of xive_request_ipi()
>>   - use of a fwnode_handle to name the new domain 
>>   - increased IPI name length
>>   - use of early_cpu_to_node() for hotplugged CPUs
>>   - filter CPU-less nodes
>>
>> Changes in v2:
>>
>>   - extra simplification on xmon
>>   - fixes on issues reported by the kernel test robot
>>
>> Cédric Le Goater (9):
>>   powerpc/xive: Use cpu_to_node() instead of "ibm,chip-id" property
>>   powerpc/xive: Introduce an IPI interrupt domain
>>   powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
>>   powerpc/xive: Simplify xive_core_debug_show()
>>   powerpc/xive: Drop check on irq_data in xive_core_debug_show()
>>   powerpc/xive: Simplify the dump of XIVE interrupts under xmon
>>   powerpc/xive: Fix xmon command "dxi"
>>   powerpc/xive: Map one IPI interrupt per node
>>   powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
>>
>>  arch/powerpc/include/asm/xive.h          |   1 +
>>  arch/powerpc/sysdev/xive/xive-internal.h |   2 -
>>  arch/powerpc/sysdev/xive/common.c        | 211 +++++++++++++++--------
>>  arch/powerpc/xmon/xmon.c                 |  28 +--
>>  4 files changed, 139 insertions(+), 103 deletions(-)
>>
> 

