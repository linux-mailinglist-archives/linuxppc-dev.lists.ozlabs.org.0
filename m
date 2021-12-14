Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC784474CB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 21:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD9DH55Fmz3brX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:37:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD9Cp3S4Mz2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 07:37:09 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 81EA321E5C;
 Tue, 14 Dec 2021 20:30:14 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 21:30:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005923756eb-fc34-4846-a5c4-8a8ce2fecfe3,
 8EFD5A58B5F84DDBEE409E983A0304C96EE54735) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <102e59ba-fcf0-dd85-9338-75b7ce5fbd83@kaod.org>
Date: Tue, 14 Dec 2021 21:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Moore
 <paul@paul-moore.com>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
 <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
 <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 659388e9-f9c1-4eda-a9e4-44d041de7a6b
X-Ovh-Tracer-Id: 18362864531949849449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledtgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeejuedutdetteeljeekudeiffehgeekhffffeejffegheefheefieduudeuheevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: Richard Guy Briggs <rgb@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/14/21 20:32, Christophe Leroy wrote:
> 
> 
> Le 14/12/2021 à 19:23, Paul Moore a écrit :
>> On Tue, Dec 14, 2021 at 12:59 PM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Hello Paul,
>>>
>>> I've been trying to setup your test suite on my powerpc board but it's
>>> based on Perl and on a lot of optional Perl packages. I was able to add
>>> them one by one until some of them require some .so libraries
>>> (Pathtools-Cwd), and it seems nothing is made to allow cross building
>>> those libraries.
>>>
>>> Do you have another test suite based on C and not perl ?
>>>
>>> If not, what can I do, do you know how I can cross compile those Perl
>>> packages for PPC32 ?
>>
>> Is there no Linux distribution that supports PPC32?  I would think
>> that would be the easiest path forward, but you're the PPC32 expert -
>> not me - so I'll assume you already tried that or it didn't work for
>> other reasons.
> 
> There hasn't been Linux distribution supporting PPC32 for a few years
> now. And regardless, the boards I'm running Linux on are home made
> embedded boards, with limited amount of memory and flashdisk space and
> no video chip, so they are hardly supported by any distributions, even
> older ones.

We still have debian. you will find images under :

   https://cdimage.debian.org/cdimage/ports/snapshots/2021-04-17/

and from there, you can update to unstable, which runs fine under
a mac99 QEMU machine.

Cheers,

C.
