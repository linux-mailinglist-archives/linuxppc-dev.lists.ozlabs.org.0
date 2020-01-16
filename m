Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6B13D74B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 11:00:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z07H1SdrzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.29; helo=11.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4201 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Jan 2020 20:58:56 AEDT
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z05X4f1YzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:58:52 +1100 (AEDT)
Received: from player730.ha.ovh.net (unknown [10.109.143.232])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 1A54D1A9CD8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 09:42:48 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 0EA68E21175A;
 Thu, 16 Jan 2020 08:42:43 +0000 (UTC)
Subject: Re: [PATCH] powerpc/xive: discard ESB load value when interrupt is
 invalid
To: Michael Ellerman <mpe@ellerman.id.au>, Greg Kurz <groug@kaod.org>
References: <20200113130118.27969-1-clg@kaod.org>
 <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
 <87r202alge.fsf@mpe.ellerman.id.au>
 <5918d64a-8cac-c475-1bda-c0b37d49b47c@kaod.org>
 <20200114085707.56cb6ab2@bahia.lan> <87zheo7x2z.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <479557ba-8f5e-651c-36fc-03dd36e1bd3a@kaod.org>
Date: Thu, 16 Jan 2020 09:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87zheo7x2z.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2452209999002241979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdeggdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeftddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> You might want to use 'git tag --contains':
>>
>> [greg@bahia kernel-linus]$ git tag --contains da15c03b047d
>> for-linus
>> kvm-5.4-2
>> next-20191118
>> next-20191126
>> tags/kvm-5.4-1
>> tags/kvm-5.4-2
>> v5.4
>> v5.4-rc1
> 
> Or:
> 
>   $ git describe --match "v[0-9]*" --contains da15c03b047d
>   v5.4-rc1~99^2~134^2~17

Nice. I am adding this command to my git aliases. 

Thanks,

C. 
