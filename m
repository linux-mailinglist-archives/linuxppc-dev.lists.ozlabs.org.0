Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8395B1F8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNgRq1qp4z3c4x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:47:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C7f8UMyM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C7f8UMyM;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNgR703N1z303T
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:47:12 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id e68so4934970pfe.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=9xki9m++Duk4Gulz67WjHVUUPD0rzTzOg7vphwhMkD8=;
        b=C7f8UMyM3uTZrjVlPf0aqv0TO+GID+ONoZ3HAbZuFhrEai+64ku+B9TgoSs2eh97xz
         v2wtwV4Gz8B+nZy9bHlPKu/hjsTT+waemxNE+oY8AIl9n5l7LirFGpENZ2iD5VD9iRDJ
         MWO4fR29/5EAf5h81GbBhspIplwMpIZ8ExbcqmQzYlRaKUrBk4g6p3XLqoG3V1p8TIXs
         YhuWSfQIRCfqe2Ftt8cmljxej9F6OHPuYh70EWiODGWLAjS1ytj6sRxkp8OZFnXEjMmS
         G6ojdkIPe/MEiD6za1cKWka/zjk6xwyS+2BUzUmaodCWrehb2YHdTeRtTOGS31LQx8QB
         FKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=9xki9m++Duk4Gulz67WjHVUUPD0rzTzOg7vphwhMkD8=;
        b=NNB+zwwlg7MU5MwunKvmtvY8vLr16Lny4Hgt7boeY7miYnR31SllreR+6ufIphJExU
         tjSa1kRxDOiKMbTSOoXsQKeX4j2aZoFZUemGGA3MEd5F/kUE6FbOVvSopIcRfpURC0cr
         +z/iFmsM3XSeRCNdH0x9z5JLN5tdH8R1g0WBb62zf1u+APvteJIo84MVCCCKv9r9Km+z
         xvymDiUyOf1vKF4Z0DMVUaxqe7VCAi3VJ/DowbXSmfRcp0rDi1JiezzkRsPC8FTVzful
         zk66g9DX7KlDbpl64YbdpnIMKuF37kQyC2msYmqE4JwN6wXolNp0oYX/ug3ytGkhgJrU
         bttw==
X-Gm-Message-State: ACgBeo0PL+K/IRiV8oQA3LJ+LuBVEDZy3vrQ+plKnhnJoFOVWyqiQ4QV
	vCLQzakMIBD3YJOEMLzuGCfcwMBjyq/+Hw==
X-Google-Smtp-Source: AA6agR7ji54rwhLCIYltWaKcbQmV0a3y5l3CJoRUA3akbZd3iU2K4WnuhKPIREDrSa3OYNAnWoKfgQ==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id j15-20020a056a00174f00b0053768458b1amr9622443pfc.68.1662644830039;
        Thu, 08 Sep 2022 06:47:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709027e0e00b0017542c2ddabsm14573753plm.288.2022.09.08.06.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:47:08 -0700 (PDT)
Message-ID: <aa8d59de-7ff4-153d-082f-f5eb400cd6b6@roeck-us.net>
Date: Thu, 8 Sep 2022 06:47:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Oliver O'Halloran <oohall@gmail.com>
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
 <20210717162359.GA3130272@roeck-us.net>
 <CAOSf1CGxp2xuEgR=Fb2AL+Ra5owqdN5=MtK6o_MCYqp=+P9arw@mail.gmail.com>
 <f60e0a73-f608-b25c-358e-f4dcb09d8923@csgroup.eu>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <f60e0a73-f608-b25c-358e-f4dcb09d8923@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/7/22 23:23, Christophe Leroy wrote:
> Hi All,
> 
> Le 18/07/2021 à 18:09, Oliver O'Halloran a écrit :
>> On Sun, Jul 18, 2021 at 2:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Sat, Jul 17, 2021 at 05:57:50PM +0200, Christophe Leroy wrote:
>>>> Guenter Roeck <linux@roeck-us.net> a écrit :
>>>>
>>>>> This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
>>>>> discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
>>>>> static").
>>>>>
>>>>> Running the upstream kernel on Qemu's brand new "pegasos2" emulation
>>>>> results in a variety of backtraces such as
>>>>>
>>>>> Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
>>>>> ------------[ cut here ]------------
>>>>> Bug: Write fault blocked by KUAP!
>>>>> WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230
>>>>> do_page_fault+0x4f4/0x920
>>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
>>>>> NIP:  c0021824 LR: c0021824 CTR: 00000000
>>>>> REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
>>>>> MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
>>>>>
>>>>> GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58
>>>>> 00000000
>>>>> GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000
>>>>> 00000004
>>>>> GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001
>>>>> 40b14000
>>>>> GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000
>>>>> c1085e60
>>>>> NIP [c0021824] do_page_fault+0x4f4/0x920
>>>>> LR [c0021824] do_page_fault+0x4f4/0x920
>>>>> Call Trace:
>>>>> [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
>>>>> [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
>>>>>
>>>>> and the system fails to boot. Bisect points to commit 407d418f2fd4
>>>>> ("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
>>>>> commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
>>>>> the problem.
>>>>
>>>> Isn't there more than that in the backtrace ? If there is a fault blocked by
>>>> Kuap, it means there is a fault. It should be visible in the traces.
>>>>
>>>> Should we fix the problem instead of reverting the commit that made the
>>>> problem visible ?
>>>>
>>>
>>> I do not think the patch reverted here made the problem visible. I am
>>> quite sure that it introduced it. AFAIS the problem is that the new code
>>> initializes and remaps PCI much later, after it is being used.
>>
>> Right. The bug is that on 32bit platforms the PHB setup also maps one
>> of the PHB's IO space as "ISA IO space" as a side effect. There's a
>> handful of platforms (pegasos2 is one) which use an i8259 interrupt
>> controller and configuring that requires access to IO / ISA space. The
>> KUAP faults we're setting are because isa_io_base is still set to zero
>> so outb() and friends are accessing the zero page.
>>
>> I don't think there's any real reason why we need to have PCI fully
>> set up to handle that situation. A few platforms already have early
>> fixup code which parses the DT directly rather than using the fields
>> of pci_controller (which are parsed from the DT anyway) and I'm pretty
>> sure we can do something similar.
>>
>>> Also, the
>>> patch introducing the problem was never tested on real hardware (it even
>>> says so in the patch comments). That by itself seems to be quite
>>> problematic for such an invasive patch, and makes me wonder if some of
>>> the other PHB discovery related patches introduced similar problems.
>>
>> The legacy platforms are maintained on a best-effort basis. Ellerman's
>> CI farm covers most of the powerpc CPU types, but there's no real way
>> to test the bulk of the platforms in the tree since most of the
>> hardware is currently in landfill.
>>
>>> Anyway, I do not use or have that hardware. I was just playing with the
>>> latest version of qemu and ended up tracking down why its brand new
>>> pegasos2 emulation no longer boots with the latest Linux kernel.
>>> I personally don't care too much if ppc/chrp support is broken in the
>>> upstream kernel or not. Please take this patch as problem report,
>>> and feel free to do with it whatever you like, including ignoring it.
>>
>> Problem reports are fine and appreciated. I'd be less cranky if you
>> included the kernel config you used in the initial report since I
>> wasted an hour of my saturday trying to replicate it with various
>> kernel configs that had SMP enabled since that's what the
>> chrp_defconfig uses.
>>
> 
> 
> What is the status now ? I see this revert patch is still hanging around in patchwork, is there still a problem ?
> 

Presumably, but my understanding was "we are not going to fix this",
so I stopped testing with the pegasos2 emulation a long time ago.

Guenter
