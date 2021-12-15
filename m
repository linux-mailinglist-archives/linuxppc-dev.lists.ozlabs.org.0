Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10A476BD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:24:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4rv6dHKz3djM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:23:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m00XMhOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=ikegami.t@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=m00XMhOd; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDj6t0n7Cz308h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:34:44 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso19899415pjl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 09:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MfGtGBM9C7JPuVJECcCNHUNWvvK0seZqKUnWH3D4pMk=;
 b=m00XMhOdWYF7mAZq+HqV8o9uQ946ethMEf97ILFu8aCok/Raz7syVluU6zbmcp7Hp8
 epeMEh9GKXpVlhubBd/tVgdGrsv3zX6lr69QaLpBGozoK0Gv1AZ5aoqm0gxUBZ5EIomI
 y+dqk9Cz0eqn0WRHVIVkMh1Qz8ozWVvRC7KP7ETbulTumfW0IfhkENWlRTYRVfOtKHv3
 TRqRWrqZFE9UPVM90jbZAu6yr9aU8AlCfcTp4knOwZ4+OiFQXoIp2tV5lcMeyaMhuxXU
 x5KHXglPDRXVJ9enIVo2HzVVhg48XYwwKK3Hag5NJ16qWb9csum6/x4veO5VLLeXLUST
 DE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MfGtGBM9C7JPuVJECcCNHUNWvvK0seZqKUnWH3D4pMk=;
 b=sHSL0vICH7b/TfXUNcMLT+52lPhYiClidOjdQjmH2DFX5XK3s087QtTO24VL3YHta7
 J9bSOLPC2XO4y3pRSJRiAIvfV+Rts7I7nDdQaSmpDD83HuvXiNlIp/FE/QNdY47WXu5E
 Axt/AN58Y1HKhAIJN2qOl/a4hIubR/yvW7SoisoH2LWTt3sGVZ3tseyMfRuCMTIDcfv6
 Yn7YcGMo/OZfetNgyBgfQJyEJy64ld7j8FGOewb55sSMR16CuZLkBYYseZrAnItOnYee
 N7cKVlLzAt6dyroih5vteKp4m0+vMeByvoH/TXsyFY0mcMyvsAJ4qdaLutA0sRExed+p
 Twyg==
X-Gm-Message-State: AOAM532qeQvVWo5cKDo5qn7HuXUDW/6/BZQLjWSULamJy11epWCXehpO
 PwiD4Bf6tm08Av0FqVBNCCo=
X-Google-Smtp-Source: ABdhPJx8DGlIyOIGtZKFbT+HR5Di88zgHGFdJJ/pnjscj0U0CCek5lnRh5ICoxrY1NieaR6Rnvikmw==
X-Received: by 2002:a17:902:db01:b0:148:a2f7:9d51 with SMTP id
 m1-20020a170902db0100b00148a2f79d51mr5389600plx.112.1639589680954; 
 Wed, 15 Dec 2021 09:34:40 -0800 (PST)
Received: from ?IPV6:240b:10:2720:5500:3f10:2a2d:7fb1:8480?
 ([240b:10:2720:5500:3f10:2a2d:7fb1:8480])
 by smtp.gmail.com with ESMTPSA id d12sm3554934pfu.91.2021.12.15.09.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:34:40 -0800 (PST)
Message-ID: <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
Date: Thu, 16 Dec 2021 02:34:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-mtd@lists.infradead.org,
 Joakim.Tjernlund@infinera.com, miquel.raynal@bootlin.com, vigneshr@ti.com,
 richard@nod.at, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
 Shaohui.Xie@nxp.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ahmad-san,

Sorry for the regression issue by the change: dfeae1073583.
To make sure could you please try with the word write instead of the 
buffered writes?

FYI: There are some changes to disable the buffered writes as below.
   1. 
https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ar71xx/patches-4.9/411-mtd-cfi_cmdset_0002-force-word-write.patch;h=ddd69f17e1ac16e8fc3a694c56231fee1e2ef149;hb=fec8fe806963c96a6506c2aebc3572d3a11f285f
   2. 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/chips/cfi_cmdset_0002.c?h=v5.16-rc5&id=7e4404113686868858a34210c28ae122e967aa64

Note:
   Currently I am not able to investigate the issue on the product for 
the change before.

   By the way in the past I had investigated the similar issue on 
Buffalo WZR-HP-G300NH using the S29GL256N.
   It was not able to find the root cause by the investigation since not 
required actually at that time.
   Also actually the buffered writes were disabled on the OpenWrt 
firmware as the change [1] above.
   But I am not sure the reason detail to disable the buffered writes on 
the OpenWrt firmware.
   I thought the issue not caused by the change: dfeae1073583 since the 
issue happened without the change.

   So I am not sure why the above change [2] needed to disable the 
buffered writes on Buffalo WZR-HP-G300NH.
   Probably seems needed to disable the buffered writes on the other 
firmware also but not OpenWrt firmware.

   Anyway there are difference with your regression issue as below.
     1. Flash device: S29GL064N (Your regression issue), S29GL256N 
(WZR-HP-G300NH)
     2. Regression issue: Yes (Your regression issue), No (WZR-HP-G300NH 
as I investigated before)

Regards,
Ikegami

On 2021/12/14 16:23, Thorsten Leemhuis wrote:
> [TLDR: adding this regression to regzbot; most of this mail is compiled
> from a few templates paragraphs some of you might have seen already.]
>
> Hi, this is your Linux kernel regression tracker speaking.
>
> Top-posting for once, to make this easy accessible to everyone.
>
> Thanks for the report.
>
> Adding the regression mailing list to the list of recipients, as it
> should be in the loop for all regressions, as explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
>
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
>
> #regzbot ^introduced dfeae1073583
> #regzbot title mtd: cfi_cmdset_0002: flash write accesses on the
> hardware fail on a PowerPC MPC8313 to a 8-bit-parallel S29GL064N flash
> #regzbot ignore-activity
>
> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
> to the report (the parent of this mail), then regzbot will automatically
> mark the regression as resolved once the fix lands in the appropriate
> tree. For more details about regzbot see footer.
>
> Sending this to everyone that got the initial report, to make all aware
> of the tracking. I also hope that messages like this motivate people to
> directly get at least the regression mailing list and ideally even
> regzbot involved when dealing with regressions, as messages like this
> wouldn't be needed then.
>
> Don't worry, I'll send further messages wrt to this regression just to
> the lists (with a tag in the subject so people can filter them away), as
> long as they are intended just for regzbot. With a bit of luck no such
> messages will be needed anyway.
>
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
>
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply. That's in everyone's interest, as
> what I wrote above might be misleading to everyone reading this; any
> suggestion I gave thus might sent someone reading this down the wrong
> rabbit hole, which none of us wants.
>
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
>
> On 13.12.21 14:24, Ahmad Fatoum wrote:
>> Hi,
>>
>> I've been investigating a breakage on a PowerPC MPC8313: The SoC is connected
>> via the "Enhanced Local Bus Controller" to a 8-bit-parallel S29GL064N flash,
>> which is represented as a memory-mapped cfi-flash.
>>
>> The regression began in v4.17-rc1 with
>>
>>    dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>
>> and causes all flash write accesses on the hardware to fail. Example output
>> after v5.1-rc2[1]:
>>
>>    root@host:~# mount -t jffs2 /dev/mtdblock0 /mnt
>>    MTD do_write_buffer_wait(): software timeout, address:0x000c000b.
>>    jffs2: Write clean marker to block at 0x000c0000 failed: -5
>>
>> This issue still persists with v5.16-rc. Reverting aforementioned patch fixes
>> it, but I am still looking for a change that keeps both Tokunori's and my
>> hardware happy.
>>
>> What Tokunori's patch did is that it strengthened the success condition
>> for flash writes:
>>
>>   - Prior to the patch, DQ polling was done until bits
>>     stopped toggling. This was taken as an indicator that the write succeeded
>>     and was reported up the stack. i.e. success condition is chip_ready()
>>
>>   - After the patch, polling continues until the just written data is
>>     actually read back, i.e. success condition is chip_good()
>>
>> This new condition never holds for me, when DQ stabilizes, it reads 0xFF,
>> never the just written data. The data is still written and can be read back
>> on subsequent reads, just not at that point of time in the poll loop.
>>
>> We haven't had write issues for the years predating that patch. As the
>> regression has been mainline for a while, I am wondering what about my setup
>> that makes it pop up here, but not elsewhere?
>>
>> I consulted the data sheet[2] and found Figure 27, which describes DQ polling
>> during embedded algorithms. DQ switches from status output to "True" (I assume
>> True == all bits set == 0xFF) until CS# is reasserted.
>>
>> I compared with another chip's datasheet, and it (Figure 8.4) doesn't describe
>> such an intermittent "True" state. In any case, the driver polls a few hundred
>> times, however, before giving up, so there should be enough CS# toggles.
>>
>>
>> Locally, I'll revert this patch for now. I think accepting 0xFF as a success
>> condition may be appropriate, but I don't yet have the rationale to back it up.
>>
>> I am investigating this some more, probably with a logic trace, but I wanted
>> to report this in case someone has pointers and in case other people run into
>> the same issue.
>>
>>
>> Cheers,
>> Ahmad
>>
>> [1] Prior to d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>>      first included with v5.1-rc2, failing writes just hung indefinitely in kernel space.
>>      That's fixed, but the writes still fail.
>>
>> [2]: 001-98525 Rev. *B, https://www.infineon.com/dgdl/Infineon-S29GL064N_S29GL032N_64_Mbit_32_Mbit_3_V_Page_Mode_MirrorBit_Flash-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ed556fd548b
>>
>> [3]: https://www.mouser.com/datasheet/2/268/SST39VF1601C-SST39VF1602C-16-Mbit-x16-Multi-Purpos-709008.pdf
>>       Note that "true data" means valid data here, not all bits one.
>>
