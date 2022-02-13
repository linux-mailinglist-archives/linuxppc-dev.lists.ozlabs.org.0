Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6874B3C4C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 17:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxYG84WvDz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 03:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jXBUjVcv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=ikegami.t@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jXBUjVcv; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxYFQ6lNHz2xrv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 03:48:08 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 10so8766038plj.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 08:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=ihN1UNZ613L2jIwrYDDQpEWfnAwYdywLbimFoSIcdfU=;
 b=jXBUjVcvwl8GBWZwKCoI33vruY6XrWaewJ5ir7OE1BUPiPLXLSXajUMnYrAdxMg/68
 Ima/rjVmzayqkcDBxGa/FcY2Rbxhfm0vTz3kXXqDEPx0yz3l9vJ/t8JIYSV+jRFGP8BF
 zWkUxMS97GjaRAzODNC2he6XwODva96FqQtp8Akv73U4m9PEJAwzONMeihmcMvhMFjqd
 ttXQIN6Wpzvxi9N3S1VpUXY+bjrwSGvWV3bM7+CWjOOrPZ/yGmKlkNSJ63sQKzRUz0qQ
 m+46J/yv7t0FEv+12BXAb0AVFcKy7RrsCEiX2+zADaYLpbCtnVS0rN5JLdy4SkabDBMX
 3b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=ihN1UNZ613L2jIwrYDDQpEWfnAwYdywLbimFoSIcdfU=;
 b=Y2tVmGHXCNT5nWE8N/mOABvVhVZ+Ax5WRzXohAjrPuQbHKvBLApAYDvU5N/Hxn44Yk
 1XjjZEOLP240H4x+FMLiE7cYD24wY+k8xcEUZvL/J0m+dg1FnF1MFnciddFjJqrtymvB
 1hNRhux9PQgJ+OEb2f4GiR2n0E+s3ssra58/iiCcTFXpvdv7nI+KKqPvwfWinfalIXrn
 9sM4Y9j65ehPEw0/TLM8ESblLvrYBto9tS7a56utQuAkyjgDcq8ihCksAFmgMyxFtCOP
 v/L/m4dRd1wPL827XYX9AZKrp868LfM1qAVKcIBNAapAr0+9uviFf/kZ4yJVdXrwJN1S
 B2Qw==
X-Gm-Message-State: AOAM531s+j7McOjGGkwvrNhAS5dXlNWP9JbPmmFtoTBxJrI2FDfrmRYz
 Hl/7pzUbfcFviljIuR6GoE4=
X-Google-Smtp-Source: ABdhPJzbN7Gl0l7x28iX/iC8NY94CXnQ2WTRROEz9mfxooAq5eZgCCuFZp0ZhQVF93cK1Bc8SQwOMg==
X-Received: by 2002:a17:90b:38cc:: with SMTP id
 nn12mr10315577pjb.228.1644770884227; 
 Sun, 13 Feb 2022 08:48:04 -0800 (PST)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116])
 by smtp.gmail.com with ESMTPSA id 13sm32846826pfm.161.2022.02.13.08.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 08:48:03 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------GtUZkn42cTAeAlz6LID7Qxpr"
Message-ID: <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
Date: Mon, 14 Feb 2022 01:47:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, cyrille.pitchen@wedev4u.fr,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------GtUZkn42cTAeAlz6LID7Qxpr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ahmad-san,

Thanks for your confirmations. Sorry for late to reply.

Could you please try the patch attached to disable the chip_good() 
change as before?
I think this should work for S29GL964N since the chip_ready() is used 
and works as mentioned.

On 2022/02/07 23:28, Ahmad Fatoum wrote:
> Hello Tokunori-san,
>
> On 29.01.22 19:01, Tokunori Ikegami wrote:
>> Hi Ahmad-san,
>>
>> Thanks for your investigation.
>>
>>> The issue is still there with #define FORCE_WORD_WRITE 1:
>>>
>>>     jffs2: Write clean marker to block at 0x000a0000 failed: -5
>>>     MTD do_write_oneword_once(): software timeout
>> Which kernel version has been tested about this?
> I last tested with v5.10.30, but I had briefly tried v5.16-rc as well
> when first debugging this issue.
>
> I have rebased onto v5.17-rc2 now and will use that for further tests.
> The same issue with word write forcing is reproducible there as well.
Noted about these.
>
>> Since the buffered writes disabled by 7e4404113686 for S29GL256N and tested on kernel 5.10.16.
>> So I would like to confirm if the issue depended on the CPU or kernel version, etc.
>> Note: The chips S29GL064N and S29GL256N seem different the flash Mb size basically.
> I see. To be extra sure, I have replaced 0x2201 with 0x0c01 to hit
> the same code paths, but no improvement.
I see and check the data sheet as described.
>
>>> Doesn't seem to be a buffered write issue here though as the writes
>>> did work fine before dfeae1073583. Any other ideas?
>> At first I thought the issue is possible to be resolved by using the word write instead of the buffered writes.
>> Now I am thinking to disable the changes dfeae1073583 partially with any condition if possible.
> What seems to work for me is checking if chip_good or chip_ready
> and map_word is equal to 0xFF. I can't justify why this is ok though.
> (Worst case bus is floating at this point of time and Hi-Z is read
> as 0xff on CPU data lines...)

Sorry I am not sure about this.
I thought the chip_ready() itself is correct as implemented as the data 
sheet in the past.
But it did not work correctly so changed to use chip_good() instead as 
it is also correct.

>
>> By the way could you please let me know the chip information for more detail? (For example model number, cycle and device ID, etc.)
> I can't read it off the chip, but vendor uses S29GL064N90FFI02 or S29GL964N11FFI02.
> Kernel reports it with:
> ff800000.flash: Found 1 x16 devices at 0x0 in 8-bit bank. Manufacturer ID 0x000001 Chip ID 0x000c01
The change attached checks the device ID 0x0c01 and use chip_ready() 
instead on chip_good().
>
> I am not sure what you mean with cycle. If you tell me what
> command to run, I can paste the output.
Sorry my understanding was not correct about the data sheet description 
device ID and cycle.

Regards,
Ikegami

>
> Thanks,
> Ahmad
>
>
>
>> Regards,
>> Ikegami
>>
>>
>> On 2021/12/14 16:23, Thorsten Leemhuis wrote:
>>
>>>>> [TLDR: adding this regression to regzbot; most of this mail is compiled
>>>>> from a few templates paragraphs some of you might have seen already.]
>>>>>
>>>>> Hi, this is your Linux kernel regression tracker speaking.
>>>>>
>>>>> Top-posting for once, to make this easy accessible to everyone.
>>>>>
>>>>> Thanks for the report.
>>>>>
>>>>> Adding the regression mailing list to the list of recipients, as it
>>>>> should be in the loop for all regressions, as explained here:
>>>>> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
>>>>>
>>>>> To be sure this issue doesn't fall through the cracks unnoticed, I'm
>>>>> adding it to regzbot, my Linux kernel regression tracking bot:
>>>>>
>>>>> #regzbot ^introduced dfeae1073583
>>>>> #regzbot title mtd: cfi_cmdset_0002: flash write accesses on the
>>>>> hardware fail on a PowerPC MPC8313 to a 8-bit-parallel S29GL064N flash
>>>>> #regzbot ignore-activity
>>>>>
>>>>> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
>>>>> to the report (the parent of this mail), then regzbot will automatically
>>>>> mark the regression as resolved once the fix lands in the appropriate
>>>>> tree. For more details about regzbot see footer.
>>>>>
>>>>> Sending this to everyone that got the initial report, to make all aware
>>>>> of the tracking. I also hope that messages like this motivate people to
>>>>> directly get at least the regression mailing list and ideally even
>>>>> regzbot involved when dealing with regressions, as messages like this
>>>>> wouldn't be needed then.
>>>>>
>>>>> Don't worry, I'll send further messages wrt to this regression just to
>>>>> the lists (with a tag in the subject so people can filter them away), as
>>>>> long as they are intended just for regzbot. With a bit of luck no such
>>>>> messages will be needed anyway.
>>>>>
>>>>> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
>>>>>
>>>>> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
>>>>> on my table. I can only look briefly into most of them. Unfortunately
>>>>> therefore I sometimes will get things wrong or miss something important.
>>>>> I hope that's not the case here; if you think it is, don't hesitate to
>>>>> tell me about it in a public reply. That's in everyone's interest, as
>>>>> what I wrote above might be misleading to everyone reading this; any
>>>>> suggestion I gave thus might sent someone reading this down the wrong
>>>>> rabbit hole, which none of us wants.
>>>>>
>>>>> BTW, I have no personal interest in this issue, which is tracked using
>>>>> regzbot, my Linux kernel regression tracking bot
>>>>> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
>>>>> this mail to get things rolling again and hence don't need to be CC on
>>>>> all further activities wrt to this regression.
>>>>>
>>>>> On 13.12.21 14:24, Ahmad Fatoum wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I've been investigating a breakage on a PowerPC MPC8313: The SoC is connected
>>>>>> via the "Enhanced Local Bus Controller" to a 8-bit-parallel S29GL064N flash,
>>>>>> which is represented as a memory-mapped cfi-flash.
>>>>>>
>>>>>> The regression began in v4.17-rc1 with
>>>>>>
>>>>>>      dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>>>>>
>>>>>> and causes all flash write accesses on the hardware to fail. Example output
>>>>>> after v5.1-rc2[1]:
>>>>>>
>>>>>>      root@host:~# mount -t jffs2 /dev/mtdblock0 /mnt
>>>>>>      MTD do_write_buffer_wait(): software timeout, address:0x000c000b.
>>>>>>      jffs2: Write clean marker to block at 0x000c0000 failed: -5
>>>>>>
>>>>>> This issue still persists with v5.16-rc. Reverting aforementioned patch fixes
>>>>>> it, but I am still looking for a change that keeps both Tokunori's and my
>>>>>> hardware happy.
>>>>>>
>>>>>> What Tokunori's patch did is that it strengthened the success condition
>>>>>> for flash writes:
>>>>>>
>>>>>>     - Prior to the patch, DQ polling was done until bits
>>>>>>       stopped toggling. This was taken as an indicator that the write succeeded
>>>>>>       and was reported up the stack. i.e. success condition is chip_ready()
>>>>>>
>>>>>>     - After the patch, polling continues until the just written data is
>>>>>>       actually read back, i.e. success condition is chip_good()
>>>>>>
>>>>>> This new condition never holds for me, when DQ stabilizes, it reads 0xFF,
>>>>>> never the just written data. The data is still written and can be read back
>>>>>> on subsequent reads, just not at that point of time in the poll loop.
>>>>>>
>>>>>> We haven't had write issues for the years predating that patch. As the
>>>>>> regression has been mainline for a while, I am wondering what about my setup
>>>>>> that makes it pop up here, but not elsewhere?
>>>>>>
>>>>>> I consulted the data sheet[2] and found Figure 27, which describes DQ polling
>>>>>> during embedded algorithms. DQ switches from status output to "True" (I assume
>>>>>> True == all bits set == 0xFF) until CS# is reasserted.
>>>>>>
>>>>>> I compared with another chip's datasheet, and it (Figure 8.4) doesn't describe
>>>>>> such an intermittent "True" state. In any case, the driver polls a few hundred
>>>>>> times, however, before giving up, so there should be enough CS# toggles.
>>>>>>
>>>>>>
>>>>>> Locally, I'll revert this patch for now. I think accepting 0xFF as a success
>>>>>> condition may be appropriate, but I don't yet have the rationale to back it up.
>>>>>>
>>>>>> I am investigating this some more, probably with a logic trace, but I wanted
>>>>>> to report this in case someone has pointers and in case other people run into
>>>>>> the same issue.
>>>>>>
>>>>>>
>>>>>> Cheers,
>>>>>> Ahmad
>>>>>>
>>>>>> [1] Prior to d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>>>>>>        first included with v5.1-rc2, failing writes just hung indefinitely in kernel space.
>>>>>>        That's fixed, but the writes still fail.
>>>>>>
>>>>>> [2]: 001-98525 Rev. *B, https://www.infineon.com/dgdl/Infineon-S29GL064N_S29GL032N_64_Mbit_32_Mbit_3_V_Page_Mode_MirrorBit_Flash-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ed556fd548b
>>>>>>
>>>>>> [3]: https://www.mouser.com/datasheet/2/268/SST39VF1601C-SST39VF1602C-16-Mbit-x16-Multi-Purpos-709008.pdf
>>>>>>         Note that "true data" means valid data here, not all bits one.
>>>>>>
>
--------------GtUZkn42cTAeAlz6LID7Qxpr
Content-Type: text/plain; charset=UTF-8;
 name="0001-mtd-cfi_cmdset_0002-Use-chip_ready-for-write-on-S29G.patch"
Content-Disposition: attachment;
 filename*0="0001-mtd-cfi_cmdset_0002-Use-chip_ready-for-write-on-S29G.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1OWIxZTk0NjkzMTIwMmQ3MDU4ZWVjMTJjMmJjZGE3ZmM2NWFjYmJhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21h
aWwuY29tPgpEYXRlOiBNb24sIDE0IEZlYiAyMDIyIDAxOjA4OjAyICswOTAwClN1YmplY3Q6
IFtQQVRDSF0gbXRkOiBjZmlfY21kc2V0XzAwMDI6IFVzZSBjaGlwX3JlYWR5KCkgZm9yIHdy
aXRlIG9uIFMyOUdMMDY0TgoKVGhlIHJlZ3Jlc3Npb24gaXNzdWUgaGFzIGJlZW4gY2F1c2Vk
IG9uIFMyOUdMMDY0TiBhbmQgcmVwb3J0ZWQgaXQuCkFsc28gdGhlIGNoYW5nZSBtZW50aW9u
ZWQgaXMgdG8gdXNlIGNoaXBfZ29vZCgpIGZvciBidWZmZXJlZCB3cml0ZS4KU28gZGlzYWJs
ZSB0aGUgY2hhbmdlIG9uIFMyOUdMMDY0TiBhbmQgdXNlIGNoaXBfcmVhZHkoKSBhcyBiZWZv
cmUuCgpGaXhlczogZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdl
IHdyaXRlIGJ1ZmZlciB0byBjaGVjayBjb3JyZWN0IHZhbHVlIikKU2lnbmVkLW9mZi1ieTog
VG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaS50QGdtYWlsLmNvbT4KQ2M6IGxpbnV4LW10ZEBs
aXN0cy5pbmZyYWRlYWQub3JnCi0tLQogZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8w
MDAyLmMgfCAxMDUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDU5IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMKaW5kZXggYTc2MTEzNGZkM2JlLi5hMGRmYzhhY2U4OTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCisrKyBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCkBAIC00OCw2ICs0OCw3IEBACiAj
ZGVmaW5lIFNTVDQ5TEYwNDBCCQkweDAwNTAKICNkZWZpbmUgU1NUNDlMRjAwOEEJCTB4MDA1
YQogI2RlZmluZSBBVDQ5QlY2NDE2CQkweDAwZDYKKyNkZWZpbmUgUzI5R0wwNjROX01OMTIJ
CTB4MGMwMQogCiAvKgogICogU3RhdHVzIFJlZ2lzdGVyIGJpdCBkZXNjcmlwdGlvbi4gVXNl
ZCBieSBmbGFzaCBkZXZpY2VzIHRoYXQgZG9uJ3QKQEAgLTEwOSw2ICsxMTAsOCBAQCBzdGF0
aWMgc3RydWN0IG10ZF9jaGlwX2RyaXZlciBjZmlfYW1kc3RkX2NoaXBkcnYgPSB7CiAJLm1v
ZHVsZQkJPSBUSElTX01PRFVMRQogfTsKIAorc3RhdGljIGJvb2wgdXNlX2NoaXBfZ29vZF9m
b3Jfd3JpdGU7CisKIC8qCiAgKiBVc2Ugc3RhdHVzIHJlZ2lzdGVyIHRvIHBvbGwgZm9yIEVy
YXNlL3dyaXRlIGNvbXBsZXRpb24gd2hlbiBEUSBpcyBub3QKICAqIHN1cHBvcnRlZC4gVGhp
cyBpcyBpbmRpY2F0ZWQgYnkgQml0WzE6MF0gb2YgU29mdHdhcmVGZWF0dXJlcyBmaWVsZCBp
bgpAQCAtMjgzLDYgKzI4NiwxNyBAQCBzdGF0aWMgdm9pZCBmaXh1cF91c2Vfd3JpdGVfYnVm
ZmVycyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIH0KICNlbmRpZiAvKiAhRk9SQ0VfV09SRF9X
UklURSAqLwogCitzdGF0aWMgdm9pZCBmaXh1cF91c2VfY2hpcF9nb29kX2Zvcl93cml0ZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCkKK3sKKwlzdHJ1Y3QgbWFwX2luZm8gKm1hcCA9IG10ZC0+
cHJpdjsKKwlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsKKwor
CWlmIChjZmktPm1mciA9PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09IFMyOUdMMDY0Tl9N
TjEyKQorCQlyZXR1cm47CisKKwl1c2VfY2hpcF9nb29kX2Zvcl93cml0ZSA9IHRydWU7Cit9
CisKIC8qIEF0bWVsIGNoaXBzIGRvbid0IHVzZSB0aGUgc2FtZSBQUkkgZm9ybWF0IGFzIEFN
RCBjaGlwcyAqLwogc3RhdGljIHZvaWQgZml4dXBfY29udmVydF9hdG1lbF9wcmkoc3RydWN0
IG10ZF9pbmZvICptdGQpCiB7CkBAIC00NjIsNyArNDc2LDcgQEAgc3RhdGljIHN0cnVjdCBj
ZmlfZml4dXAgY2ZpX2ZpeHVwX3RhYmxlW10gPSB7CiAJeyBDRklfTUZSX0FNRCwgMHgwMDU2
LCBmaXh1cF91c2Vfc2Vjc2kgfSwKIAl7IENGSV9NRlJfQU1ELCAweDAwNUMsIGZpeHVwX3Vz
ZV9zZWNzaSB9LAogCXsgQ0ZJX01GUl9BTUQsIDB4MDA1RiwgZml4dXBfdXNlX3NlY3NpIH0s
Ci0JeyBDRklfTUZSX0FNRCwgMHgwYzAxLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9LAor
CXsgQ0ZJX01GUl9BTUQsIFMyOUdMMDY0Tl9NTjEyLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9y
cyB9LAogCXsgQ0ZJX01GUl9BTUQsIDB4MTMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMg
fSwKIAl7IENGSV9NRlJfQU1ELCAweDFhMDAsIGZpeHVwX3MyOWdsMDMybl9zZWN0b3JzIH0s
CiAJeyBDRklfTUZSX0FNRCwgMHgxYTAxLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LApA
QCAtNDc0LDYgKzQ4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgY2ZpX2ZpeHVwIGNmaV9maXh1cF90
YWJsZVtdID0gewogI2lmICFGT1JDRV9XT1JEX1dSSVRFCiAJeyBDRklfTUZSX0FOWSwgQ0ZJ
X0lEX0FOWSwgZml4dXBfdXNlX3dyaXRlX2J1ZmZlcnMgfSwKICNlbmRpZgorCXsgQ0ZJX01G
Ul9BTlksIENGSV9JRF9BTlksIGZpeHVwX3VzZV9jaGlwX2dvb2RfZm9yX3dyaXRlIH0sCiAJ
eyAwLCAwLCBOVUxMIH0KIH07CiBzdGF0aWMgc3RydWN0IGNmaV9maXh1cCBqZWRlY19maXh1
cF90YWJsZVtdID0gewpAQCAtODAxLDQyICs4MTYsNjEgQEAgc3RhdGljIHN0cnVjdCBtdGRf
aW5mbyAqY2ZpX2FtZHN0ZF9zZXR1cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAlyZXR1cm4g
TlVMTDsKIH0KIAotLyoKLSAqIFJldHVybiB0cnVlIGlmIHRoZSBjaGlwIGlzIHJlYWR5Lgot
ICoKLSAqIFJlYWR5IGlzIG9uZSBvZjogcmVhZCBtb2RlLCBxdWVyeSBtb2RlLCBlcmFzZS1z
dXNwZW5kLXJlYWQgbW9kZSAoaW4gYW55Ci0gKiBub24tc3VzcGVuZGVkIHNlY3RvcikgYW5k
IGlzIGluZGljYXRlZCBieSBubyB0b2dnbGUgYml0cyB0b2dnbGluZy4KLSAqCi0gKiBOb3Rl
IHRoYXQgYW55dGhpbmcgbW9yZSBjb21wbGljYXRlZCB0aGFuIGNoZWNraW5nIGlmIG5vIGJp
dHMgYXJlIHRvZ2dsaW5nCi0gKiAoaW5jbHVkaW5nIGNoZWNraW5nIERRNSBmb3IgYW4gZXJy
b3Igc3RhdHVzKSBpcyB0cmlja3kgdG8gZ2V0IHdvcmtpbmcKLSAqIGNvcnJlY3RseSBhbmQg
aXMgdGhlcmVmb3JlIG5vdCBkb25lCShwYXJ0aWN1bGFybHkgd2l0aCBpbnRlcmxlYXZlZCBj
aGlwcwotICogYXMgZWFjaCBjaGlwIG11c3QgYmUgY2hlY2tlZCBpbmRlcGVuZGVudGx5IG9m
IHRoZSBvdGhlcnMpLgotICovCi1zdGF0aWMgaW50IF9feGlwcmFtIGNoaXBfcmVhZHkoc3Ry
dWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAsCi0JCQkgICAgICAgdW5z
aWduZWQgbG9uZyBhZGRyKQorc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX2NoZWNrKHN0cnVj
dCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAorCQkJICAgICAgIHVuc2ln
bmVkIGxvbmcgYWRkciwgbWFwX3dvcmQgKmV4cGVjdGVkKQogewogCXN0cnVjdCBjZmlfcHJp
dmF0ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2OwotCW1hcF93b3JkIGQsIHQ7CisJbWFwX3dv
cmQgb2xkZCwgY3VyZDsKKwlpbnQgcmV0OwogCiAJaWYgKGNmaV91c2Vfc3RhdHVzX3JlZyhj
ZmkpKSB7CiAJCW1hcF93b3JkIHJlYWR5ID0gQ01EKENGSV9TUl9EUkIpOworCiAJCS8qCiAJ
CSAqIEZvciBjaGlwcyB0aGF0IHN1cHBvcnQgc3RhdHVzIHJlZ2lzdGVyLCBjaGVjayBkZXZp
Y2UKIAkJICogcmVhZHkgYml0CiAJCSAqLwogCQljZmlfc2VuZF9nZW5fY21kKDB4NzAsIGNm
aS0+YWRkcl91bmxvY2sxLCBjaGlwLT5zdGFydCwgbWFwLCBjZmksCiAJCQkJIGNmaS0+ZGV2
aWNlX3R5cGUsIE5VTEwpOwotCQlkID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKKwkJY3VyZCA9
IG1hcF9yZWFkKG1hcCwgYWRkcik7CiAKLQkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1h
cCwgZCwgcmVhZHksIHJlYWR5KTsKKwkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1hcCwg
Y3VyZCwgcmVhZHksIHJlYWR5KTsKIAl9CiAKLQlkID0gbWFwX3JlYWQobWFwLCBhZGRyKTsK
LQl0ID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKKwlvbGRkID0gbWFwX3JlYWQobWFwLCBhZGRy
KTsKKwljdXJkID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKKworCXJldCA9IG1hcF93b3JkX2Vx
dWFsKG1hcCwgb2xkZCwgY3VyZCk7CisKKwlpZiAoIXJldCB8fCAhZXhwZWN0ZWQpCisJCXJl
dHVybiByZXQ7CisKKwlyZXR1cm4gbWFwX3dvcmRfZXF1YWwobWFwLCBjdXJkLCAqZXhwZWN0
ZWQpOworfQorCitzdGF0aWMgaW50IF9feGlwcmFtIGNoaXBfZ29vZF9mb3Jfd3JpdGUoc3Ry
dWN0IG1hcF9pbmZvICptYXAsCisJCQkJCXN0cnVjdCBmbGNoaXAgKmNoaXAsIHVuc2lnbmVk
IGxvbmcgYWRkciwKKwkJCQkJbWFwX3dvcmQgZXhwZWN0ZWQpCit7CisJaWYgKHVzZV9jaGlw
X2dvb2RfZm9yX3dyaXRlKQorCQlyZXR1cm4gY2hpcF9jaGVjayhtYXAsIGNoaXAsIGFkZHIs
ICZleHBlY3RlZCk7CiAKLQlyZXR1cm4gbWFwX3dvcmRfZXF1YWwobWFwLCBkLCB0KTsKKwly
ZXR1cm4gY2hpcF9jaGVjayhtYXAsIGNoaXAsIGFkZHIsIE5VTEwpOwogfQogCisvKgorICog
UmV0dXJuIHRydWUgaWYgdGhlIGNoaXAgaXMgcmVhZHkuCisgKgorICogUmVhZHkgaXMgb25l
IG9mOiByZWFkIG1vZGUsIHF1ZXJ5IG1vZGUsIGVyYXNlLXN1c3BlbmQtcmVhZCBtb2RlIChp
biBhbnkKKyAqIG5vbi1zdXNwZW5kZWQgc2VjdG9yKSBhbmQgaXMgaW5kaWNhdGVkIGJ5IG5v
IHRvZ2dsZSBiaXRzIHRvZ2dsaW5nLgorICoKKyAqIE5vdGUgdGhhdCBhbnl0aGluZyBtb3Jl
IGNvbXBsaWNhdGVkIHRoYW4gY2hlY2tpbmcgaWYgbm8gYml0cyBhcmUgdG9nZ2xpbmcKKyAq
IChpbmNsdWRpbmcgY2hlY2tpbmcgRFE1IGZvciBhbiBlcnJvciBzdGF0dXMpIGlzIHRyaWNr
eSB0byBnZXQgd29ya2luZworICogY29ycmVjdGx5IGFuZCBpcyB0aGVyZWZvcmUgbm90IGRv
bmUJKHBhcnRpY3VsYXJseSB3aXRoIGludGVybGVhdmVkIGNoaXBzCisgKiBhcyBlYWNoIGNo
aXAgbXVzdCBiZSBjaGVja2VkIGluZGVwZW5kZW50bHkgb2YgdGhlIG90aGVycykuCisgKi8K
KyNkZWZpbmUgY2hpcF9yZWFkeShtYXAsIGNoaXAsIGFkZHIpIGNoaXBfY2hlY2sobWFwLCBj
aGlwLCBhZGRyLCBOVUxMKQorCiAvKgogICogUmV0dXJuIHRydWUgaWYgdGhlIGNoaXAgaXMg
cmVhZHkgYW5kIGhhcyB0aGUgY29ycmVjdCB2YWx1ZS4KICAqCkBAIC04NTUsMjggKzg4OSw3
IEBAIHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9yZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1h
cCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9nb29k
KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAogCQkJICAgICAg
dW5zaWduZWQgbG9uZyBhZGRyLCBtYXBfd29yZCBleHBlY3RlZCkKIHsKLQlzdHJ1Y3QgY2Zp
X3ByaXZhdGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsKLQltYXBfd29yZCBvbGRkLCBjdXJk
OwotCi0JaWYgKGNmaV91c2Vfc3RhdHVzX3JlZyhjZmkpKSB7Ci0JCW1hcF93b3JkIHJlYWR5
ID0gQ01EKENGSV9TUl9EUkIpOwotCi0JCS8qCi0JCSAqIEZvciBjaGlwcyB0aGF0IHN1cHBv
cnQgc3RhdHVzIHJlZ2lzdGVyLCBjaGVjayBkZXZpY2UKLQkJICogcmVhZHkgYml0Ci0JCSAq
LwotCQljZmlfc2VuZF9nZW5fY21kKDB4NzAsIGNmaS0+YWRkcl91bmxvY2sxLCBjaGlwLT5z
dGFydCwgbWFwLCBjZmksCi0JCQkJIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOwotCQljdXJk
ID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKLQotCQlyZXR1cm4gbWFwX3dvcmRfYW5kZXF1YWwo
bWFwLCBjdXJkLCByZWFkeSwgcmVhZHkpOwotCX0KLQotCW9sZGQgPSBtYXBfcmVhZChtYXAs
IGFkZHIpOwotCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwotCi0JcmV0dXJuCW1hcF93
b3JkX2VxdWFsKG1hcCwgb2xkZCwgY3VyZCkgJiYKLQkJbWFwX3dvcmRfZXF1YWwobWFwLCBj
dXJkLCBleHBlY3RlZCk7CisJcmV0dXJuIGNoaXBfY2hlY2sobWFwLCBjaGlwLCBhZGRyLCAm
ZXhwZWN0ZWQpOwogfQogCiBzdGF0aWMgaW50IGdldF9jaGlwKHN0cnVjdCBtYXBfaW5mbyAq
bWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkciwgaW50IG1vZGUp
CkBAIC0xNjk5LDcgKzE3MTIsNyBAQCBzdGF0aWMgaW50IF9feGlwcmFtIGRvX3dyaXRlX29u
ZXdvcmRfb25jZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKIAkJICogImNoaXBfZ29vZCIgdG8g
YXZvaWQgdGhlIGZhaWx1cmUgZHVlIHRvIHNjaGVkdWxpbmcuCiAJCSAqLwogCQlpZiAodGlt
ZV9hZnRlcihqaWZmaWVzLCB0aW1lbykgJiYKLQkJICAgICFjaGlwX2dvb2QobWFwLCBjaGlw
LCBhZHIsIGRhdHVtKSkgeworCQkgICAgIWNoaXBfZ29vZF9mb3Jfd3JpdGUobWFwLCBjaGlw
LCBhZHIsIGRhdHVtKSkgewogCQkJeGlwX2VuYWJsZShtYXAsIGNoaXAsIGFkcik7CiAJCQlw
cmludGsoS0VSTl9XQVJOSU5HICJNVEQgJXMoKTogc29mdHdhcmUgdGltZW91dFxuIiwgX19m
dW5jX18pOwogCQkJeGlwX2Rpc2FibGUobWFwLCBjaGlwLCBhZHIpOwpAQCAtMTcwNyw3ICsx
NzIwLDcgQEAgc3RhdGljIGludCBfX3hpcHJhbSBkb193cml0ZV9vbmV3b3JkX29uY2Uoc3Ry
dWN0IG1hcF9pbmZvICptYXAsCiAJCQlicmVhazsKIAkJfQogCi0JCWlmIChjaGlwX2dvb2Qo
bWFwLCBjaGlwLCBhZHIsIGRhdHVtKSkgeworCQlpZiAoY2hpcF9nb29kX2Zvcl93cml0ZSht
YXAsIGNoaXAsIGFkciwgZGF0dW0pKSB7CiAJCQlpZiAoY2ZpX2NoZWNrX2Vycl9zdGF0dXMo
bWFwLCBjaGlwLCBhZHIpKQogCQkJCXJldCA9IC1FSU87CiAJCQlicmVhazsKQEAgLTE5Nzks
MTQgKzE5OTIsMTQgQEAgc3RhdGljIGludCBfX3hpcHJhbSBkb193cml0ZV9idWZmZXJfd2Fp
dChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKIAkJICogImNoaXBfZ29vZCIgdG8gYXZvaWQgdGhl
IGZhaWx1cmUgZHVlIHRvIHNjaGVkdWxpbmcuCiAJCSAqLwogCQlpZiAodGltZV9hZnRlcihq
aWZmaWVzLCB0aW1lbykgJiYKLQkJICAgICFjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIGRh
dHVtKSkgeworCQkgICAgIWNoaXBfZ29vZF9mb3Jfd3JpdGUobWFwLCBjaGlwLCBhZHIsIGRh
dHVtKSkgewogCQkJcHJfZXJyKCJNVEQgJXMoKTogc29mdHdhcmUgdGltZW91dCwgYWRkcmVz
czoweCUuOGx4LlxuIiwKIAkJCSAgICAgICBfX2Z1bmNfXywgYWRyKTsKIAkJCXJldCA9IC1F
SU87CiAJCQlicmVhazsKIAkJfQogCi0JCWlmIChjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIs
IGRhdHVtKSkgeworCQlpZiAoY2hpcF9nb29kX2Zvcl93cml0ZShtYXAsIGNoaXAsIGFkciwg
ZGF0dW0pKSB7CiAJCQlpZiAoY2ZpX2NoZWNrX2Vycl9zdGF0dXMobWFwLCBjaGlwLCBhZHIp
KQogCQkJCXJldCA9IC1FSU87CiAJCQlicmVhazsKLS0gCjIuMzIuMAoK

--------------GtUZkn42cTAeAlz6LID7Qxpr--
