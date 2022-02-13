Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 073094B3E66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 00:27:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxk674SnVz3cRf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 10:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=ash@heyquark.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 162 seconds by postgrey-1.36 at boromir;
 Mon, 14 Feb 2022 10:27:04 AEDT
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxk5h6m0zz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 10:27:03 +1100 (AEDT)
Received: (Authenticated sender: ash@heyquark.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A7ADFF802;
 Sun, 13 Feb 2022 23:26:51 +0000 (UTC)
Message-ID: <992dccb9-590a-c7b7-146f-d134fb399f7e@heyquark.com>
Date: Mon, 14 Feb 2022 10:26:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] Upstreaming Linux for Nintendo Wii U
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>
References: <0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com>
 <87ee49sktb.fsf@mpe.ellerman.id.au>
 <41c696de-0e04-61e1-610c-73e9440c5c19@csgroup.eu>
From: Ash Logan <ash@heyquark.com>
In-Reply-To: <41c696de-0e04-61e1-610c-73e9440c5c19@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linkmauve@linkmauve.fr" <linkmauve@linkmauve.fr>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 12/2/22 00:11, Christophe Leroy wrote:
> Hi Ash,
> 
> Le 11/02/2022 à 12:29, Michael Ellerman a écrit :
>> Ash Logan <ash@heyquark.com> writes:
>>> - Like the Wii before it, the Wii U has a small amount of RAM at address
>>> zero, a gap, then a large amount of RAM at a higher address. Instead of
>>> the "map everything and reserve the gap" approach of the Wii, we loop
>>> over each memblock and map only true RAM[9]. This seems to work, but as
>>> far as I can tell is unique amongst powerpc32 platforms, so it's worth
>>> pointing out. (Note: I've been told this doesn't work anymore after some
>>> KUAP changes[10], so this point might be moot; haven't investigated)
>>
>> We'd need more detail on that I guess. Currently all the 32-bit
>> platforms use the flat memory model, which assumes RAM is a single
>> contiguous block. Though that doesn't mean it all has to be used or
>> mapped, like the Wii does. To properly support your layout you should be
>> using sparsemem, but it's possible that's more trouble than it's worth,
>> I'm not sure. How far apart are the low and high blocks of RAM, and what
>> are their sizes?
> 
> Can you provide details on what's happening with KUAP changes ?
> 
> You are pointing to series https://lkml.org/lkml/2021/6/3/204
> 
> Does it work when CONFIG_PPC_KUAP is not selected or doesn't it work
> either ?
> 
> Are you able to bisect which commit of that series is the culprit ?

Emmanuel told me about this during their work on 5.13 which I wasn't 
involved in, and now can't remember any of the details, so I guess I 
don't actually have any more information.
I'm working on getting a baseline setup for 5.15 (just udbg and the 
like), so if there is an issue I should soon find out about it and will 
get back to you.

> Thanks
> Christophe

Thanks,
Ash
