Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2952AE27A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 23:06:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CW24v4BlJzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 09:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CW22y61yMzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 09:04:39 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F0CC76B9553E;
 Tue, 10 Nov 2020 23:04:32 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 10 Nov
 2020 23:04:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003bc792778-fc7e-40f1-8439-94edc17bb2ab,
 BF55E036A69FA8A58606F388C5C835316A6FE4B9) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: XIVE: Fix possible oops when
 accessing ESB page
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <20201105134713.656160-1-clg@kaod.org>
 <878sbftbnt.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1270ada4-e2a9-6a1a-52a9-b5c3479c05ea@kaod.org>
Date: Tue, 10 Nov 2020 23:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <878sbftbnt.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 49ff0c72-0c37-4ed2-93ee-8126ad6004f8
X-Ovh-Tracer-Id: 1040331516666481516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddujedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: kvm@vger.kernel.org, Gustavo Romero <gromero@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/6/20 4:19 AM, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
>> When accessing the ESB page of a source interrupt, the fault handler
>> will retrieve the page address from the XIVE interrupt 'xive_irq_data'
>> structure. If the associated KVM XIVE interrupt is not valid, that is
>> not allocated at the HW level for some reason, the fault handler will
>> dereference a NULL pointer leading to the oops below :
>>
>>     WARNING: CPU: 40 PID: 59101 at arch/powerpc/kvm/book3s_xive_native.c:259 xive_native_esb_fault+0xe4/0x240 [kvm]
>>     CPU: 40 PID: 59101 Comm: qemu-system-ppc Kdump: loaded Tainted: G        W        --------- -  - 4.18.0-240.el8.ppc64le #1
>>     NIP:  c00800000e949fac LR: c00000000044b164 CTR: c00800000e949ec8
>>     REGS: c000001f69617840 TRAP: 0700   Tainted: G        W        --------- -  -  (4.18.0-240.el8.ppc64le)
>>     MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44044282  XER: 00000000
>>     CFAR: c00000000044b160 IRQMASK: 0
>>     GPR00: c00000000044b164 c000001f69617ac0 c00800000e96e000 c000001f69617c10
>>     GPR04: 05faa2b21e000080 0000000000000000 0000000000000005 ffffffffffffffff
>>     GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000001
>>     GPR12: c00800000e949ec8 c000001ffffd3400 0000000000000000 0000000000000000
>>     GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>     GPR20: 0000000000000000 0000000000000000 c000001f5c065160 c000000001c76f90
>>     GPR24: c000001f06f20000 c000001f5c065100 0000000000000008 c000001f0eb98c78
>>     GPR28: c000001dcab40000 c000001dcab403d8 c000001f69617c10 0000000000000011
>>     NIP [c00800000e949fac] xive_native_esb_fault+0xe4/0x240 [kvm]
>>     LR [c00000000044b164] __do_fault+0x64/0x220
>>     Call Trace:
>>     [c000001f69617ac0] [0000000137a5dc20] 0x137a5dc20 (unreliable)
>>     [c000001f69617b50] [c00000000044b164] __do_fault+0x64/0x220
>>     [c000001f69617b90] [c000000000453838] do_fault+0x218/0x930
>>     [c000001f69617bf0] [c000000000456f50] __handle_mm_fault+0x350/0xdf0
>>     [c000001f69617cd0] [c000000000457b1c] handle_mm_fault+0x12c/0x310
>>     [c000001f69617d10] [c00000000007ef44] __do_page_fault+0x264/0xbb0
>>     [c000001f69617df0] [c00000000007f8c8] do_page_fault+0x38/0xd0
>>     [c000001f69617e30] [c00000000000a714] handle_page_fault+0x18/0x38
>>     Instruction dump:
>>     40c2fff0 7c2004ac 2fa90000 409e0118 73e90001 41820080 e8bd0008 7c2004ac
>>     7ca90074 39400000 915c0000 7929d182 <0b090000> 2fa50000 419e0080 e89e0018
>>     ---[ end trace 66c6ff034c53f64f ]---
>>     xive-kvm: xive_native_esb_fault: accessing invalid ESB page for source 8 !
>>
>> Fix that by checking the validity of the KVM XIVE interrupt structure.
>>
>> Reported-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Fixes ?

Ah yes :/  

Cc: stable@vger.kernel.org # v5.2+
Fixes: 6520ca64cde7 ("KVM: PPC: Book3S HV: XIVE: Add a mapping for the source ESB pages")

Since my provider changed its imap servers, my email filters are really screwed 
up and I miss emails. 

Sorry about that,

C.
