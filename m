Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B12352A41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 13:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBdFJ1YXTz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 22:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBdDy1NtVz2xb4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 22:32:00 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C3522278FC5;
 Fri,  2 Apr 2021 13:31:54 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 13:31:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038ca0fdff-ea7b-488d-a96f-32c8a1c68be7,
 CED0CE0CC895D647B8CFE0BE9502FE01F599FB05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 8/9] powerpc/xive: Map one IPI interrupt per node
To: Nicholas Piggin <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210331144514.892250-9-clg@kaod.org>
 <1617279896.hl1bn8g3eg.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ae512e1b-91ee-1cc8-c6a8-36e014ed8788@kaod.org>
Date: Fri, 2 Apr 2021 13:31:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1617279896.hl1bn8g3eg.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6df7724c-b78e-4087-bd0b-74af30e5ef5c
X-Ovh-Tracer-Id: 47850749344910304
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/1/21 2:50 PM, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of April 1, 2021 12:45 am:
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
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Very nice result but the default-on irqdebug code is quite a slowdown
> even with your improvements.
> 
> Is the main cacheline bouncing in the fast path coming from 
> desc->irq_count++ of the percpu handler? Can we do something quick and 
> dirty like the attached patch?
> 
> All this stuff seems totally racy with percpu handler but maybe that
> doesn't matter too much (and anyway it would be a much bigger change)

I gave the patch below a try and we are reaching the same results, 
even better. The simplest solution is always the best. Nick, you 
should send that single patch.

Thanks,

C. 
 

> Thanks,
> Nick
> 
> ---
>  kernel/irq/spurious.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
> index f865e5f4d382..6b17b737ee6c 100644
> --- a/kernel/irq/spurious.c
> +++ b/kernel/irq/spurious.c
> @@ -378,7 +378,8 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t action_ret)
>  			 * then we merily delay the spurious detection
>  			 * by one hard interrupt. Not a real problem.
>  			 */
> -			desc->threads_handled_last &= ~SPURIOUS_DEFERRED;
> +			if (desc->threads_handled_last & SPURIOUS_DEFERRED)
> +				desc->threads_handled_last &= ~SPURIOUS_DEFERRED;
>  		}
>  	}
>  
> @@ -403,6 +404,10 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t action_ret)
>  			desc->irqs_unhandled -= ok;
>  	}
>  
> +	if (likely(!desc->irqs_unhandled))
> +		return;
> +
> +	/* Now getting into unhandled irq detection */
>  	desc->irq_count++;
>  	if (likely(desc->irq_count < 100000))
>  		return;
> 

