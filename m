Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36103351106
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 10:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9xWj21thz3bwm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 19:42:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9xWL4Llwz2yxd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 19:42:04 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0BE5196774D9;
 Thu,  1 Apr 2021 10:42:01 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 10:42:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003960d28ec-608b-48c4-919b-15cd09a32f1b,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
Subject: Re: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
To: <linuxppc-dev@lists.ozlabs.org>
References: <20210331144514.892250-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <19d76b80-fa73-2bfc-b48b-818f26c0951a@kaod.org>
Date: Thu, 1 Apr 2021 10:42:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0dce5dbb-38f8-481a-a376-37c69c01e992
X-Ovh-Tracer-Id: 9752826468486777824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <dgibson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,


On 3/31/21 4:45 PM, Cédric Le Goater wrote:
> 
> Hello,
> 
> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
> 
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
> 
> As a workaround, the impact can be reduced by deactivating the IRQ
> lockup detector ("noirqdebug") which does a lot of accounting in the
> Linux IRQ descriptor structure and is responsible for most of the
> performance penalty.
> 
> As a fix, this proposal allocates an IPI interrupt per node, to be
> shared by all CPUs of that node. It solves the scaling issue, the IRQ
> lockup detector still has an impact but the XIVE interrupt rate scales
> linearly. It also improves the "noirqdebug" case as showed in the
> tables below. Hello,

From the comments, I received on different email threads. It seems 
I am doing some wrong assumption on the code and concepts. We canpostpone this patchset. It's an optimization and there are some 
more cleanups that can be done before. 

Thanks for the time and the shared expertise,

C.

> 
>  * P9 DD2.2 - 2s * 64 threads
> 
>                                                "noirqdebug"
>                         Mint/s                    Mint/s   
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys     
>  --------------------------------------------------------------
>  1      0-15     4.984023   4.875405       4.996536   5.048892
>         0-31    10.879164  10.544040      10.757632  11.037859
>         0-47    15.345301  14.688764      14.926520  15.310053
>         0-63    17.064907  17.066812      17.613416  17.874511
>  2      0-79    11.768764  21.650749      22.689120  22.566508
>         0-95    10.616812  26.878789      28.434703  28.320324
>         0-111   10.151693  31.397803      31.771773  32.388122
>         0-127    9.948502  33.139336      34.875716  35.224548
> 
> 
>  * P10 DD1 - 4s (not homogeneous) 352 threads
> 
>                                                "noirqdebug"
>                         Mint/s                    Mint/s   
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys     
>  --------------------------------------------------------------
>  1      0-15     2.409402   2.364108       2.383303   2.395091
>         0-31     6.028325   6.046075       6.089999   6.073750
>         0-47     8.655178   8.644531       8.712830   8.724702
>         0-63    11.629652  11.735953      12.088203  12.055979
>         0-79    14.392321  14.729959      14.986701  14.973073
>         0-95    12.604158  13.004034      17.528748  17.568095
>  2      0-111    9.767753  13.719831      19.968606  20.024218
>         0-127    6.744566  16.418854      22.898066  22.995110
>         0-143    6.005699  19.174421      25.425622  25.417541
>         0-159    5.649719  21.938836      27.952662  28.059603
>         0-175    5.441410  24.109484      31.133915  31.127996
>  3      0-191    5.318341  24.405322      33.999221  33.775354
>         0-207    5.191382  26.449769      36.050161  35.867307
>         0-223    5.102790  29.356943      39.544135  39.508169
>         0-239    5.035295  31.933051      42.135075  42.071975
>         0-255    4.969209  34.477367      44.655395  44.757074
>  4      0-271    4.907652  35.887016      47.080545  47.318537
>         0-287    4.839581  38.076137      50.464307  50.636219
>         0-303    4.786031  40.881319      53.478684  53.310759
>         0-319    4.743750  43.448424      56.388102  55.973969
>         0-335    4.709936  45.623532      59.400930  58.926857
>         0-351    4.681413  45.646151      62.035804  61.830057
> 
> [*] https://github.com/antonblanchard/ipistorm
> 
> Thanks,
> 
> C.
> 
> Changes in v3:
> 
>   - improved commit log for the misuse of "ibm,chip-id"
>   - better error handling of xive_request_ipi()
>   - use of a fwnode_handle to name the new domain 
>   - increased IPI name length
>   - use of early_cpu_to_node() for hotplugged CPUs
>   - filter CPU-less nodes
> 
> Changes in v2:
> 
>   - extra simplification on xmon
>   - fixes on issues reported by the kernel test robot
> 
> Cédric Le Goater (9):
>   powerpc/xive: Use cpu_to_node() instead of "ibm,chip-id" property
>   powerpc/xive: Introduce an IPI interrupt domain
>   powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
>   powerpc/xive: Simplify xive_core_debug_show()
>   powerpc/xive: Drop check on irq_data in xive_core_debug_show()
>   powerpc/xive: Simplify the dump of XIVE interrupts under xmon
>   powerpc/xive: Fix xmon command "dxi"
>   powerpc/xive: Map one IPI interrupt per node
>   powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
> 
>  arch/powerpc/include/asm/xive.h          |   1 +
>  arch/powerpc/sysdev/xive/xive-internal.h |   2 -
>  arch/powerpc/sysdev/xive/common.c        | 211 +++++++++++++++--------
>  arch/powerpc/xmon/xmon.c                 |  28 +--
>  4 files changed, 139 insertions(+), 103 deletions(-)
> 

