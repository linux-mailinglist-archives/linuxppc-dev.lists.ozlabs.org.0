Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB204A314B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 19:02:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmMcK6lMTz3cRF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 05:02:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kFDbs2pd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=ikegami.t@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kFDbs2pd; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmMbc3Vxcz2yjY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 05:02:02 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id k17so9051269plk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 10:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ocx6uLSE9SZhQHL4f62tymlhjTdr8qnlDcb3gjUZzVI=;
 b=kFDbs2pdduz5Cagog17WvOBs2KSu01Er9gWb6vWwdvJWPYR7NnYWocW0oPqXCW/Z5u
 NsNpC5IpTTnMLq3GgUOmemXhE7bsIj2DagGLJIcaBY3qwuOtRwLW+52AkqOSEyJORYCa
 yy2nKDRtKsWAtIB6QTcPQ1bS52svibqGi21cxks2xPg+dUe3eWoc8fsXx3SivhMeRWTk
 7wQj1Stpt3gjAF2Qtcc+J6NfWe14UqtxrTESznqwdD08qceUa2TwiYYsnnmZ7en4pAmY
 +CwJKrU9c3BSQARPIpXWHdzH4yKl45jt6kvuv6R3GUGQpfNThWv6jBGsGvEbDzlkr4sL
 PHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ocx6uLSE9SZhQHL4f62tymlhjTdr8qnlDcb3gjUZzVI=;
 b=XeIneRLJSP8CBBI0EFyrJfzwSqvLHjEZEwlHLC0TJKaeeV4xIWmnNxuCsZVZqeBheT
 1+ln9YsWuN0QqwTzEWCaI+zOad4I3eHgYAAMGxt0sFowzyjkuX367gyjy6Vj6LjLRK4k
 dj+60os4v8s+2VSt7STVnJMfN+6eKWzQ83GSwVp2faMZ49lwDZzb/Ze4dpbYWytu8ST9
 +fRhVqOXuJY0GzHIXZ3T7Mv7V2VSIh8RVdp732PDOa+IsTNV1igQxeHuX45PpQdk3lBj
 Z6J54uu7pQVmFyj+dVbbO9Lcw2Zv/uzPcMmVuhJz3XX5p7Mn48HSNzDzJofvSkVsObLV
 tDRg==
X-Gm-Message-State: AOAM530IskogjNBBK9pK0BGpBdqUybmXVZ18TdkGQeyEaf5hOtrnDuDQ
 Dn7FbexjYRkMBmG+WuN3b+M=
X-Google-Smtp-Source: ABdhPJxGsvxhGzjVP0O6TjC9lEzfQMoYub87JkBduaepMi6Z39kaOucmpcjys0bXfaOntDjHHk9ZKA==
X-Received: by 2002:a17:90a:c08d:: with SMTP id
 o13mr15970283pjs.187.1643479317756; 
 Sat, 29 Jan 2022 10:01:57 -0800 (PST)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116])
 by smtp.gmail.com with ESMTPSA id oo9sm6445748pjb.15.2022.01.29.10.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 10:01:57 -0800 (PST)
Message-ID: <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
Date: Sun, 30 Jan 2022 03:01:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
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
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, cyrille.pitchen@wedev4u.fr,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ahmad-san,

Thanks for your investigation.

> The issue is still there with #define FORCE_WORD_WRITE 1:
>
>    jffs2: Write clean marker to block at 0x000a0000 failed: -5
>    MTD do_write_oneword_once(): software timeout
Which kernel version has been tested about this?
Since the buffered writes disabled by 7e4404113686 for S29GL256N and 
tested on kernel 5.10.16.
So I would like to confirm if the issue depended on the CPU or kernel 
version, etc.
Note: The chips S29GL064N and S29GL256N seem different the flash Mb size 
basically.
> Doesn't seem to be a buffered write issue here though as the writes
> did work fine before dfeae1073583. Any other ideas?
At first I thought the issue is possible to be resolved by using the 
word write instead of the buffered writes.
Now I am thinking to disable the changes dfeae1073583 partially with any 
condition if possible.
By the way could you please let me know the chip information for more 
detail? (For example model number, cycle and device ID, etc.)

Regards,
Ikegami


On 2021/12/14 16:23, Thorsten Leemhuis wrote:

>>> [TLDR: adding this regression to regzbot; most of this mail is compiled
>>> from a few templates paragraphs some of you might have seen already.]
>>>
>>> Hi, this is your Linux kernel regression tracker speaking.
>>>
>>> Top-posting for once, to make this easy accessible to everyone.
>>>
>>> Thanks for the report.
>>>
>>> Adding the regression mailing list to the list of recipients, as it
>>> should be in the loop for all regressions, as explained here:
>>> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
>>>
>>> To be sure this issue doesn't fall through the cracks unnoticed, I'm
>>> adding it to regzbot, my Linux kernel regression tracking bot:
>>>
>>> #regzbot ^introduced dfeae1073583
>>> #regzbot title mtd: cfi_cmdset_0002: flash write accesses on the
>>> hardware fail on a PowerPC MPC8313 to a 8-bit-parallel S29GL064N flash
>>> #regzbot ignore-activity
>>>
>>> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
>>> to the report (the parent of this mail), then regzbot will automatically
>>> mark the regression as resolved once the fix lands in the appropriate
>>> tree. For more details about regzbot see footer.
>>>
>>> Sending this to everyone that got the initial report, to make all aware
>>> of the tracking. I also hope that messages like this motivate people to
>>> directly get at least the regression mailing list and ideally even
>>> regzbot involved when dealing with regressions, as messages like this
>>> wouldn't be needed then.
>>>
>>> Don't worry, I'll send further messages wrt to this regression just to
>>> the lists (with a tag in the subject so people can filter them away), as
>>> long as they are intended just for regzbot. With a bit of luck no such
>>> messages will be needed anyway.
>>>
>>> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
>>>
>>> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
>>> on my table. I can only look briefly into most of them. Unfortunately
>>> therefore I sometimes will get things wrong or miss something important.
>>> I hope that's not the case here; if you think it is, don't hesitate to
>>> tell me about it in a public reply. That's in everyone's interest, as
>>> what I wrote above might be misleading to everyone reading this; any
>>> suggestion I gave thus might sent someone reading this down the wrong
>>> rabbit hole, which none of us wants.
>>>
>>> BTW, I have no personal interest in this issue, which is tracked using
>>> regzbot, my Linux kernel regression tracking bot
>>> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
>>> this mail to get things rolling again and hence don't need to be CC on
>>> all further activities wrt to this regression.
>>>
>>> On 13.12.21 14:24, Ahmad Fatoum wrote:
>>>> Hi,
>>>>
>>>> I've been investigating a breakage on a PowerPC MPC8313: The SoC is connected
>>>> via the "Enhanced Local Bus Controller" to a 8-bit-parallel S29GL064N flash,
>>>> which is represented as a memory-mapped cfi-flash.
>>>>
>>>> The regression began in v4.17-rc1 with
>>>>
>>>>     dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>>>
>>>> and causes all flash write accesses on the hardware to fail. Example output
>>>> after v5.1-rc2[1]:
>>>>
>>>>     root@host:~# mount -t jffs2 /dev/mtdblock0 /mnt
>>>>     MTD do_write_buffer_wait(): software timeout, address:0x000c000b.
>>>>     jffs2: Write clean marker to block at 0x000c0000 failed: -5
>>>>
>>>> This issue still persists with v5.16-rc. Reverting aforementioned patch fixes
>>>> it, but I am still looking for a change that keeps both Tokunori's and my
>>>> hardware happy.
>>>>
>>>> What Tokunori's patch did is that it strengthened the success condition
>>>> for flash writes:
>>>>
>>>>    - Prior to the patch, DQ polling was done until bits
>>>>      stopped toggling. This was taken as an indicator that the write succeeded
>>>>      and was reported up the stack. i.e. success condition is chip_ready()
>>>>
>>>>    - After the patch, polling continues until the just written data is
>>>>      actually read back, i.e. success condition is chip_good()
>>>>
>>>> This new condition never holds for me, when DQ stabilizes, it reads 0xFF,
>>>> never the just written data. The data is still written and can be read back
>>>> on subsequent reads, just not at that point of time in the poll loop.
>>>>
>>>> We haven't had write issues for the years predating that patch. As the
>>>> regression has been mainline for a while, I am wondering what about my setup
>>>> that makes it pop up here, but not elsewhere?
>>>>
>>>> I consulted the data sheet[2] and found Figure 27, which describes DQ polling
>>>> during embedded algorithms. DQ switches from status output to "True" (I assume
>>>> True == all bits set == 0xFF) until CS# is reasserted.
>>>>
>>>> I compared with another chip's datasheet, and it (Figure 8.4) doesn't describe
>>>> such an intermittent "True" state. In any case, the driver polls a few hundred
>>>> times, however, before giving up, so there should be enough CS# toggles.
>>>>
>>>>
>>>> Locally, I'll revert this patch for now. I think accepting 0xFF as a success
>>>> condition may be appropriate, but I don't yet have the rationale to back it up.
>>>>
>>>> I am investigating this some more, probably with a logic trace, but I wanted
>>>> to report this in case someone has pointers and in case other people run into
>>>> the same issue.
>>>>
>>>>
>>>> Cheers,
>>>> Ahmad
>>>>
>>>> [1] Prior to d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>>>>       first included with v5.1-rc2, failing writes just hung indefinitely in kernel space.
>>>>       That's fixed, but the writes still fail.
>>>>
>>>> [2]: 001-98525 Rev. *B, https://www.infineon.com/dgdl/Infineon-S29GL064N_S29GL032N_64_Mbit_32_Mbit_3_V_Page_Mode_MirrorBit_Flash-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ed556fd548b
>>>>
>>>> [3]: https://www.mouser.com/datasheet/2/268/SST39VF1601C-SST39VF1602C-16-Mbit-x16-Multi-Purpos-709008.pdf
>>>>        Note that "true data" means valid data here, not all bits one.
>>>>
>
