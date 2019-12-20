Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5491282CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 20:38:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ffFB1xskzDqLH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 06:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.76.148; helo=9.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8404 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Dec 2019 06:37:00 AEDT
Received: from 9.mo179.mail-out.ovh.net (9.mo179.mail-out.ovh.net
 [46.105.76.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ffC05KcyzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 06:36:56 +1100 (AEDT)
Received: from player792.ha.ovh.net (unknown [10.108.57.183])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 102D71537FC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:59:51 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 6B9ACD84FD77;
 Fri, 20 Dec 2019 15:59:36 +0000 (UTC)
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20190327123615.rwhk6h3ayfurvapf@linutronix.de>
 <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com> <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir> <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
 <871rt0mql5.fsf@mpe.ellerman.id.au>
 <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
 <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <66fbe0a7-0ab9-b3a3-ce06-55bf8a267d57@kaod.org>
Date: Fri, 20 Dec 2019 16:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17291289295786707942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Frederic Weisbecker <fweisbec@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Frederic Weisbecker <frederic@kernel.org>,
 David? Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/20/19 12:32 PM, Jason A. Donenfeld wrote:
> On Thu, Dec 19, 2019 at 2:08 PM Cédric Le Goater <clg@kaod.org> wrote:>
>> There is a patch for msgsndp in my tree you could try :
>>
>>   https://github.com/legoater/qemu/tree/powernv-5.0
>>
>> Currently being reviewed. I have to address some remarks from David before
>> it can be merged.
> 
> Thanks. I've cherry-picked
> https://github.com/legoater/qemu/commit/910c9ea5ecc and can confirm
> that I no longer receive the crashes. QEMU 5.1 or 5.0.1 release, I
> guess?

QEMU 5.1 I would say. That's enough time to address the comments.

Michael's patch to drop self IPIs is also interesting for Linux. I wonder
how we can reach that point. 

Thanks,

C. 

