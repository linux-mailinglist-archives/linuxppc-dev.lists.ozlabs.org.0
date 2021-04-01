Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D473512B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 11:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9z285zX0z3bpm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 20:50:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo52.mail-out.ovh.net (6.mo52.mail-out.ovh.net
 [188.165.49.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9z1m6KMjz2ywy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:50:03 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6E6832565EB;
 Thu,  1 Apr 2021 11:10:47 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 11:10:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045a867cc4-7128-479e-b466-c7b2488ee653,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 1/9] powerpc/xive: Use cpu_to_node() instead of
 "ibm,chip-id" property
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210331144514.892250-2-clg@kaod.org> <YGU0u4v2GVWBCrWw@yekko.fritz.box>
Message-ID: <b9937a0d-659e-e56e-3d32-efce602a34e3@kaod.org>
Date: Thu, 1 Apr 2021 11:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGU0u4v2GVWBCrWw@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe6e4761-8f2d-4aa2-ac5c-5fae7eac3a85
X-Ovh-Tracer-Id: 10238652280641915869
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeuleelvdehudeifedvheejleetkeekkefhgfeifefgvdefgefgffevleejfedunecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/1/21 4:49 AM, David Gibson wrote:
> On Wed, Mar 31, 2021 at 04:45:06PM +0200, Cédric Le Goater wrote:
>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>> target for a source located on the same chip when possible. The XIVE
>> driver queries the chip id value from the "ibm,chip-id" DT property
>> but this property is not available on all platforms. It was first
>> introduced on the PowerNV platform and later, under QEMU for pseries.
>> However, the property does not exist under PowerVM since it is not
>> specified in PAPR.
>>
>> cpu_to_node() is a better alternative. On the PowerNV platform, the
>> node id is computed from the "ibm,associativity" property of the CPU.
>> Its value is built in the OPAL firmware from the physical chip id and
>> is equivalent to "ibm,chip-id".
> 
> Hrm... I mean, for powernv this is certainly correct, but seems to be
> relying on pretty specific specifics of the OPAL / chip behaviour,
> namely that the NUMA id == chip ID.

Yes. It seems so.  

>> On pSeries, the hcall H_HOME_NODE_ASSOCIATIVITY returns the node id.
> 
> AFAICT, the chip_id field is never actually used in the PAPR version
> of XIVE.  The only access to the field outside native.c is in
> xive_pick_irq_target(), and it only looks at chip_id if src_chip is
> valid.  

Yes.

> But src_chip is initialized to XIVE_INVALID_CHIP_ID in papr.c

Yes. The H_INT hcalls do no return any information on the source 
location.

> So it would make more sense to me to also initialize chip_id to
> XIVE_INVALID_CHIP_ID for PAPR to make it clearer that it's not
> relevant.

yes. That would clarify that chip_id is only relevant on PowerVM/KVM. 

We can drop this patch, it's not a requirement for patches 2-9, simply 
a cleanup. I will move the chip_id assignment to a platform handler 
in a other patch.

>> Also to be noted that under QEMU/KVM "ibm,chip-id" is badly calculated
>> with unusual SMT configuration. This leads to a bogus chip id value
>> being returned by of_get_ibm_chip_id().
> 
> I *still* don't clearly understand what you think is bogus about the
> chip id value that qemu generates.  It's clearly not a problem for
> XIVE, since PAPR XIVE never uses it.

I am getting confused by socket/node/chip concepts under PPC. 

However, when looking at PHB and MSI, there is definitely a "node" 
concept being used in the core IRQ layer for allocation and affinity. 
We will need to clarify that when we introduce MSI domains.  

Thanks,

C.  
