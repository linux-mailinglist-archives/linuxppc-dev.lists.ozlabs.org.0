Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412761992B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:53:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s4Q26LMKzDr1V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=aQVEWiyu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4Lg6wp6zDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:50:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s4LZ3yKVz9tyZr;
 Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aQVEWiyu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Cf4WW0wpLDfA; Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s4LZ28L2z9tyZp;
 Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585648198; bh=srXrYqzCH1hg+g0wk4ykKq94x2QKEpPXQgB3s6+yOa0=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=aQVEWiyuhGXssJQHYsDKM9lJ0zwWFlpR1SfeFies4tbleoUBJ0aaIx3OLZOCURDgm
 cjvcWpeFWNM0XTKg5T6t8GqKHugZs9Ho3NWXDyHrHu322TjowMK/3zb6Dj92t55nY6
 oYONjLE8jpJCRglIEf8V8NlGsPcvimvJ2w6bE6Hw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 692CE8B78B;
 Tue, 31 Mar 2020 11:49:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EQVaQ7Bcutlk; Tue, 31 Mar 2020 11:49:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BC348B752;
 Tue, 31 Mar 2020 11:49:54 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michal Simek <michal.simek@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
 <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
Message-ID: <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
Date: Tue, 31 Mar 2020 11:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/03/2020 à 09:19, Christophe Leroy a écrit :
> 
> 
> Le 31/03/2020 à 08:59, Michal Simek a écrit :
>> On 31. 03. 20 8:56, Christophe Leroy wrote:
>>>
>>>
>>> Le 31/03/2020 à 07:30, Michael Ellerman a écrit :
>>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>>> Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
>>>>>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>>>>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek
>>>>>>>>>> <michal.simek@xilinx.com> wrote:
>>>>>> ...
>>>>>>
>>>>>>>>>> It does raise a follow-up question about ppc40x though: is it
>>>>>>>>>> time to
>>>>>>>>>> retire all of it?
>>>>>>>>>
>>>>>>>>> Who knows?
>>>>>>>>>
>>>>>>>>> I have in possession nice WD My Book Live, based on this
>>>>>>>>> architecture, and I
>>>>>>>>> won't it gone from modern kernel support. OTOH I understand that
>>>>>>>>> amount of real
>>>>>>>>> users not too big.
>>>>>>>>
>>>>>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>>>>>
>>>>>>> According to https://openwrt.org/toh/wd/mybooklive, that one is
>>>>>>> based on
>>>>>>> APM82181/ppc464, so it is about several generations newer than 
>>>>>>> what I
>>>>>>> asked about (ppc40x).
>>>>>>>
>>>>>>>>> Ah, and I have Amiga board, but that one is being used only for
>>>>>>>>> testing, so,
>>>>>>>>> I don't care much.
>>>>>>>
>>>>>>> I think there are a couple of ppc440 based Amiga boards, but again,
>>>>>>> not 405
>>>>>>> to my knowledge.
>>>>>>
>>>>>> Ah, you are right. No objections from ppc40x removal!
>>>>>
>>>>> Removing 40x would help cleaning things a bit. For instance 40x is the
>>>>> last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x
>>>>> we can get rid of PTE_ATOMIC_UPDATES completely.
>>>>>
>>>>> If no one objects, I can prepare a series to drop support for 40x
>>>>> completely.
>>>>>
>>>>> Michael, any thought ?
>>>>
>>>> I have no attachment to 40x, and I'd certainly be happy to have less
>>>> code in the tree, we struggle to keep even the modern platforms well
>>>> maintained.
>>>>
>>>> At the same time I don't want to render anyone's hardware obsolete
>>>> unnecessarily. But if there's really no one using 40x then we should
>>>> remove it, it could well be broken already.
>>>>
>>>> So I guess post a series to do the removal and we'll see if anyone
>>>> speaks up.
>>>>
>>>
>>> Ok, series sent out, see
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757
>>
>> ok. I see you have done it completely independently of my patchset.
>> Would be better if you can base it on the top of my 2 patches because
>> they are in conflict now and I need to also remove virtex 44x platform
>> also with alsa driver.
>>
> 
> I can't see your first patch, only the second one shows up in the 
> series, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757
> 


Ok, I found your first patch on another patchwork, it doesn't touch any 
file in arch/powerpc/

I sent a v2 series with your powerpc patch as patch 2/11

See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167766

Christophe
