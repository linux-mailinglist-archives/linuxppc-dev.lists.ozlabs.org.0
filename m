Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AF6811B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 22:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45myN443kTzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 06:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.61.94; helo=7.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1147 seconds by postgrey-1.36 at bilbo;
 Mon, 15 Jul 2019 06:04:08 AEST
Received: from 7.mo179.mail-out.ovh.net (7.mo179.mail-out.ovh.net
 [46.105.61.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45myKh12ngzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 06:04:07 +1000 (AEST)
Received: from player789.ha.ovh.net (unknown [10.108.54.156])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B0096137FBE
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 21:44:51 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 134047DEBC01;
 Sun, 14 Jul 2019 19:44:40 +0000 (UTC)
Subject: Re: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190712082036.40440-1-aik@ozlabs.ru>
 <abbee9db2fa0abdaa2e01bb92bab920773a2ad8d.camel@kernel.crashing.org>
 <3a34190f-560e-0b42-af38-0e39cef0beea@ozlabs.ru>
 <d735f761b3d1cc1cd6df5fd566c75cae661fe4e7.camel@kernel.crashing.org>
 <9b1fbde4-0884-223e-446c-373f73c366e0@ozlabs.ru>
 <67befaf7d091ff684534e027bd303d80c752466d.camel@kernel.crashing.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1ab709c5-b6b6-c153-a8e9-5340cb77443a@kaod.org>
Date: Sun, 14 Jul 2019 21:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <67befaf7d091ff684534e027bd303d80c752466d.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9670072825762843508
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrheehgddugeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/07/2019 03:31, Benjamin Herrenschmidt wrote:
> On Sat, 2019-07-13 at 18:53 +1000, Alexey Kardashevskiy wrote:
>>
>> On 13/07/2019 09:47, Benjamin Herrenschmidt wrote:
>>> On Fri, 2019-07-12 at 19:37 +1000, Alexey Kardashevskiy wrote:
>>>>
>>>
>>>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/irq.c#n614
>>>>
>>>> If so, then in order to do EOI, I'll need the desc which is gone,
>>>> or
>>>> I am missing the point?
>>>
>>> All you need is drop the local CPU priority.
>>
>> I know that, the question was how. I cannot use irq_chip in
>> arch/powerpc/kernel/irq.c and I do not want to add
>> ppc_md.enable_irqs().
> 
> Well, best is probably to do just that though, but call it something
> like ppc_md.orphan_irq() or something like that instead. Another option
> as you mention is to try to scrub queues, but that's trickier to do due
> to the lockless nature of the queue handling.

When the IRQ is shutdown, couldn't we cleanup the CPU EQ by filtering 
all the dangling entries, and replacing them with zeroes ? That would
be alternative 1, but I don't think we need to scan all cpus. The last
target should be enough.

C.   

