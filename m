Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A81AB63B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:29:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492l8N0WyYzDrGv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:29:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sqqdKApM; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492l651hRczDr74
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:27:41 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id v7so20020455qkc.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fg/eOvi6U9RqG+QAXvqR+/A5eU3CqPPx0mBk8bdqBpc=;
 b=sqqdKApM5ce3sFe0p7UZQAB0LxbIOVe5qCDvC2TNNyMnNaMRrSKs/HgLDi6tMRGgGj
 bdb/v06R7rOdoHoZ8njblz9bZGa6/Jx6jufj1IYN0FH2HDHn3e/eWJguk20iO44G7q7w
 u8cmsJ52tDsC1YvPQIDj3kst+EZEJTHbhRHCIb+GkGVW99qDPEfxvmZwXf8az6H5oEok
 0bMHR2DdBa2JpaUl8Rn5NH/4XmPaz+hPp14KsMPR+/QydzO5+6okCviEXnX0dPMUz2+k
 W9ap/fs6oDZjonCIT1U8QXI81+17zcibs/w8igrb2TvYzi14WE627kiIhe/MXMCAc0n9
 V72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fg/eOvi6U9RqG+QAXvqR+/A5eU3CqPPx0mBk8bdqBpc=;
 b=E/Nq2ufOXL9IYSrG3ZoZ+5FO7P9RIKzUV/7V9sf3fJ39UsQxYMcvm6456KktXLzFn3
 8BOKRjPubto2XFUl4hJmHVnmGEsmO02slNftcU90/MBygMOZ40eks7R64us/ESWaZIcW
 dSfdHk2AcxbIA34RD7YgvC74iTBPTSuWMuoUSmgUhEYZu53X6hcu6L1qSoQvcJa+OuHW
 0YQcm0L5fs/4LiqhnTsou+5T0rbiPL/8Uwb9b9NrLzgIRN7g/Z86S/aEVG5P+3ev0rXs
 4yeS4lx2ERYgAnfrSdA3rTkFR7loECO/WyKi29BFUPMTuWQXocWV2HRLxjQPJMojx9oh
 7cWg==
X-Gm-Message-State: AGi0PuaufttyAPPGnrusB0A1QDpRbhVXoaNTJDVMN8HYE0q150djU/FZ
 y4gn8AfvEmmrIWhPEL2tGeg=
X-Google-Smtp-Source: APiQypIlIkfUkaU4OrqGbXpo1JULPY+3/SiZ1Tzfile7A/TbCwVMBnhaJ8oVmZ3qzc4ofBXmHvae3g==
X-Received: by 2002:a05:620a:2158:: with SMTP id
 m24mr19374274qkm.272.1587007655928; 
 Wed, 15 Apr 2020 20:27:35 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id c33sm10630441qtb.76.2020.04.15.20.27.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 20:27:35 -0700 (PDT)
Subject: Re: [Bug 206203] kmemleak reports various leaks in
 drivers/of/unittest.c
From: Frank Rowand <frowand.list@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
 <bug-206203-206035-Y3snhDMDgJ@https.bugzilla.kernel.org/>
 <877dyqlles.fsf@mpe.ellerman.id.au>
 <8383090b-f8d1-f346-5ff3-7234a9d44092@gmail.com>
Message-ID: <a717b335-de6c-46eb-1daa-ae5054664e93@gmail.com>
Date: Wed, 15 Apr 2020 22:27:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8383090b-f8d1-f346-5ff3-7234a9d44092@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/8/20 10:22 AM, Frank Rowand wrote:
> Hi Michael,
> 
> On 4/7/20 10:13 PM, Michael Ellerman wrote:
>> bugzilla-daemon@bugzilla.kernel.org writes:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=206203
>>>
>>> Erhard F. (erhard_f@mailbox.org) changed:
>>>
>>>            What    |Removed                     |Added
>>> ----------------------------------------------------------------------------
>>>  Attachment #286801|0                           |1
>>>         is obsolete|                            |
>>>
>>> --- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
>>> Created attachment 288189
>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=288189&action=edit
>>> kmemleak output (kernel 5.6.2, Talos II)
>>
>> These are all in or triggered by the of unittest code AFAICS.
>> Content of the log reproduced below.
>>
>> Frank/Rob, are these memory leaks expected?
> 
> Thanks for the report.  I'll look at each one.

Only one of the leaks was expected.  I have patches to fix the
unexpected leaks and to remove the expected leak so that the
kmemleak report of it will not have to be checked again.

I expect to send the patch series tomorrow (Thursday).

-Frank

> 
> -Frank
> 
> 
>>
>> cheers
>>
>>
>> unreferenced object 0xc0000007eb89ca58 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 00 00 d9 21 38 00 00 00 00 00 00 00 00  ......!8........
>>     c0 00 00 07 ec 97 80 08 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<00000000e2115f4f>] .of_unittest_changeset+0x13c/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec978008 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 8 bytes):
>>     6e 31 00 6b 6b 6b 6b a5                          n1.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<00000000e2115f4f>] .of_unittest_changeset+0x13c/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89e318 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 00 00 d9 21 38 00 00 00 00 00 00 00 00  ......!8........
>>     c0 00 00 07 ec 97 ab 08 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<00000000881dc9c4>] .of_unittest_changeset+0x194/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec97ab08 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 8 bytes):
>>     6e 32 00 6b 6b 6b 6b a5                          n2.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<00000000881dc9c4>] .of_unittest_changeset+0x194/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89e528 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 97 bd d8 00 00 00 00 00 00 00 00  ................
>>     c0 00 00 07 ec 97 b3 18 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<00000000af6923cb>] .of_unittest_changeset+0x1ec/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec97b318 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.747s)
>>   hex dump (first 8 bytes):
>>     6e 32 31 00 6b 6b 6b a5                          n21.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<00000000af6923cb>] .of_unittest_changeset+0x1ec/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1fb00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 97 90 28 00 00 00 03 00 00 00 00  .......(........
>>     c0 00 00 07 ec 97 8e d0 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<000000003079b8f2>] .of_unittest_changeset+0x310/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec979028 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<000000003079b8f2>] .of_unittest_changeset+0x310/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec978ed0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 8 bytes):
>>     6e 31 00 6b 6b 6b 6b a5                          n1.kkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<000000003079b8f2>] .of_unittest_changeset+0x310/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1bc80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 97 b4 70 00 00 00 03 00 00 00 00  .......p........
>>     c0 00 00 07 ec 97 b1 c0 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<000000000f97f174>] .of_unittest_changeset+0x368/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec97b470 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<000000000f97f174>] .of_unittest_changeset+0x368/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec97b1c0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.757s)
>>   hex dump (first 8 bytes):
>>     6e 32 00 6b 6b 6b 6b a5                          n2.kkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<000000000f97f174>] .of_unittest_changeset+0x368/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1d800 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 97 88 18 00 00 00 03 00 00 00 00  ................
>>     c0 00 00 07 ec 97 bd d8 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<00000000c71a088a>] .of_unittest_changeset+0x3c0/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec978818 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<00000000c71a088a>] .of_unittest_changeset+0x3c0/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec97bdd8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 8 bytes):
>>     6e 32 31 6b 6b 6b 6b a5                          n21kkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<00000000c71a088a>] .of_unittest_changeset+0x3c0/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec979d98 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 8 bytes):
>>     6e 31 00 6b 6b 6b 6b a5                          n1.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<00000000530ec4ee>] .of_changeset_apply+0x54/0xc0
>>     [<0000000039fa95c3>] .of_unittest_changeset+0x8a4/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec9796e0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 8 bytes):
>>     6e 32 00 6b 6b 6b 6b a5                          n2.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<00000000530ec4ee>] .of_changeset_apply+0x54/0xc0
>>     [<0000000039fa95c3>] .of_unittest_changeset+0x8a4/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec979ef0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878935 (age 824.764s)
>>   hex dump (first 8 bytes):
>>     6e 32 31 00 6b 6b 6b a5                          n21.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<00000000530ec4ee>] .of_changeset_apply+0x54/0xc0
>>     [<0000000039fa95c3>] .of_unittest_changeset+0x8a4/0xa20
>>     [<00000000925a8013>] .of_unittest+0x1ba0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e98800 (size 2048):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.760s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 92 dc 40 ff ff ff ff 00 00 00 00  .......@........
>>     c0 00 00 07 ec 92 dc 40 c0 00 20 07 f2 e9 88 18  .......@.. .....
>>   backtrace:
>>     [<00000000d07b7b2c>] .platform_device_alloc+0x34/0x100
>>     [<00000000d9abb21d>] .of_device_alloc+0x44/0x390
>>     [<0000000002d381f5>] .of_platform_device_create_pdata+0x78/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec92dc40 (size 64):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.760s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 63 61 73 65 2d 64 61 74 61 3a 70 6c  testcase-data:pl
>>     61 74 66 6f 72 6d 2d 74 65 73 74 73 3a 74 65 73  atform-tests:tes
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<00000000cce6fd03>] .dev_set_name+0x2c/0x40
>>     [<000000007d4be46f>] .of_device_alloc+0x2b0/0x390
>>     [<0000000002d381f5>] .of_platform_device_create_pdata+0x78/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb8aa100 (size 256):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.760s)
>>   hex dump (first 32 bytes):
>>     00 00 00 00 de ad 4e ad ff ff ff ff 00 00 00 00  ......N.........
>>     ff ff ff ff ff ff ff ff c0 00 00 00 02 30 31 a8  .............01.
>>   backtrace:
>>     [<000000008039b6cb>] .device_add+0x578/0x980
>>     [<0000000012aa326f>] .of_device_add+0x58/0x70
>>     [<00000000d6a8e21f>] .of_platform_device_create_pdata+0xc4/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e9a000 (size 2048):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.764s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f2 e7 a2 40 ff ff ff ff 00 00 00 00  .. ....@........
>>     c0 00 20 07 f2 e7 a2 40 c0 00 20 07 f2 e9 a0 18  .. ....@.. .....
>>   backtrace:
>>     [<00000000d07b7b2c>] .platform_device_alloc+0x34/0x100
>>     [<00000000d9abb21d>] .of_device_alloc+0x44/0x390
>>     [<0000000002d381f5>] .of_platform_device_create_pdata+0x78/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e7a240 (size 64):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.764s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 63 61 73 65 2d 64 61 74 61 3a 70 6c  testcase-data:pl
>>     61 74 66 6f 72 6d 2d 74 65 73 74 73 3a 74 65 73  atform-tests:tes
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<00000000cce6fd03>] .dev_set_name+0x2c/0x40
>>     [<000000007d4be46f>] .of_device_alloc+0x2b0/0x390
>>     [<0000000002d381f5>] .of_platform_device_create_pdata+0x78/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb8ac100 (size 256):
>>   comm "swapper/0", pid 1, jiffies 4294878936 (age 824.764s)
>>   hex dump (first 32 bytes):
>>     00 00 00 00 de ad 4e ad ff ff ff ff 00 00 00 00  ......N.........
>>     ff ff ff ff ff ff ff ff c0 00 00 00 02 30 31 a8  .............01.
>>   backtrace:
>>     [<000000008039b6cb>] .device_add+0x578/0x980
>>     [<0000000012aa326f>] .of_device_add+0x58/0x70
>>     [<00000000d6a8e21f>] .of_platform_device_create_pdata+0xc4/0x1a0
>>     [<00000000c7a45eba>] .of_platform_bus_create+0x214/0x2f0
>>     [<00000000c6ba35e7>] .of_platform_bus_create+0x268/0x2f0
>>     [<0000000076525030>] .of_platform_populate+0x78/0x140
>>     [<00000000d3aeed04>] .of_unittest_platform_populate+0x328/0x50c
>>     [<000000003978eb44>] .of_unittest+0x24a8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89f7b8 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.760s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 f1 ea 17 b0 00 00 00 00 00 00 00 00  ................
>>     c0 00 20 07 f2 e8 47 40 00 00 00 00 00 00 00 00  .. ...G@........
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e84740 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.764s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 34 00 a5  test-unittest4..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1c680 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.764s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f2 e8 70 f0 00 00 00 09 00 00 00 00  .. ...p.........
>>     c0 00 20 07 f4 2e b6 b0 c0 00 00 07 f1 c1 df 80  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e870f0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.764s)
>>   hex dump (first 16 bytes):
>>     63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42eb6b0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.764s)
>>   hex dump (first 16 bytes):
>>     75 6e 69 74 74 65 73 74 00 6b 6b 6b 6b 6b 6b a5  unittest.kkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1df80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 7f ec 60 00 00 00 05 00 00 00 00  .......`........
>>     c0 00 00 07 ec 7f f4 70 c0 00 00 07 f1 c1 e2 00  .......p........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec7fec60 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 8 bytes):
>>     73 74 61 74 75 73 00 a5                          status..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec7ff470 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 8 bytes):
>>     6f 6b 61 79 00 6b 6b a5                          okay.kk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1e200 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 7f dc 40 00 00 00 04 00 00 00 00  .......@........
>>     c0 00 00 07 ec 7f cc 20 c0 00 00 07 f1 c1 97 00  ....... ........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec7fdc40 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 8 bytes):
>>     72 65 67 00 6b 6b 6b a5                          reg.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec7fcc20 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.767s)
>>   hex dump (first 8 bytes):
>>     00 00 00 04 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c19700 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.770s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 7f c5 68 00 00 00 0f 00 00 00 00  .......h........
>>     c0 00 20 07 f4 2e bb 00 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec7fc568 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.770s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42ebb00 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.770s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 34 00 a5  test-unittest4..
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42e8fe0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878937 (age 824.770s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 34 00 a5  test-unittest4..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<0000000067290146>] .of_overlay_fdt_apply+0xb00/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<00000000d856304a>] .of_unittest+0x2758/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89e108 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.767s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb a1 c8 a0 00 00 00 00 00 00 00 00  ................
>>     c0 00 20 07 f4 2e 8b 90 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42e8b90 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.767s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 00  test-unittest10.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c18f80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.767s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f4 2e 8a 20 00 00 00 09 00 00 00 00  .. .... ........
>>     c0 00 20 07 f4 2e a5 70 c0 00 00 07 f1 c1 8a 80  .. ....p........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42e8a20 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.770s)
>>   hex dump (first 16 bytes):
>>     63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42ea570 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.770s)
>>   hex dump (first 16 bytes):
>>     75 6e 69 74 74 65 73 74 00 6b 6b 6b 6b 6b 6b a5  unittest.kkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c18a80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.770s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 61 a0 00 00 00 05 00 00 00 00  .. ..Wa.........
>>     c0 00 20 07 f5 57 4e d0 c0 00 00 07 f1 c1 94 80  .. ..WN.........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f55761a0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 8 bytes):
>>     73 74 61 74 75 73 00 a5                          status..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5574ed0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 8 bytes):
>>     6f 6b 61 79 00 6b 6b a5                          okay.kk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c19480 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 50 28 00 00 00 04 00 00 00 00  .. ..WP(........
>>     c0 00 20 07 f5 57 71 c0 c0 00 00 07 f1 c1 c1 80  .. ..Wq.........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5575028 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 8 bytes):
>>     72 65 67 00 6b 6b 6b a5                          reg.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f55771c0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 8 bytes):
>>     00 00 00 0a 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1c180 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.774s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f4 2e 99 f0 00 00 00 04 00 00 00 00  .. .............
>>     c0 00 20 07 f5 57 74 70 c0 00 00 07 f1 c1 ab 00  .. ..Wtp........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5577470 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.777s)
>>   hex dump (first 8 bytes):
>>     00 00 00 01 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1ab00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.777s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f4 2e 88 b0 00 00 00 04 00 00 00 00  .. .............
>>     c0 00 20 07 f5 57 7d d8 c0 00 00 07 f1 c1 8d 00  .. ..W}.........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42e88b0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.777s)
>>   hex dump (first 16 bytes):
>>     23 73 69 7a 65 2d 63 65 6c 6c 73 00 6b 6b 6b a5  #size-cells.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5577dd8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 8 bytes):
>>     00 00 00 00 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c18d00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 48 18 00 00 00 10 00 00 00 00  .. ..WH.........
>>     c0 00 20 07 f4 2e ac a0 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5574818 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42eaca0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 00  test-unittest10.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89d8c8 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb a1 cb 50 00 00 00 00 00 00 00 00  .......P........
>>     c0 00 00 07 ea dd 8d 20 00 00 00 00 00 00 00 00  ....... ........
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadd8d20 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.780s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 31  test-unittest101
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1a880 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f4 2e af 80 00 00 00 09 00 00 00 00  .. .............
>>     c0 00 20 07 f4 2e 81 80 c0 00 00 07 f1 c1 92 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42eaf80 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 16 bytes):
>>     63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f42e8180 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 16 bytes):
>>     75 6e 69 74 74 65 73 74 00 6b 6b 6b 6b 6b 6b a5  unittest.kkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c19200 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 75 c8 00 00 00 05 00 00 00 00  .. ..Wu.........
>>     c0 00 20 07 f5 57 7c 80 c0 00 00 07 f1 c1 d3 00  .. ..W|.........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f55775c8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 8 bytes):
>>     73 74 61 74 75 73 00 a5                          status..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5577c80 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.784s)
>>   hex dump (first 8 bytes):
>>     6f 6b 61 79 00 6b 6b a5                          okay.kk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f1c1d300 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.787s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 77 20 00 00 00 04 00 00 00 00  .. ..Ww ........
>>     c0 00 20 07 f5 57 5d 98 c0 00 00 07 f2 25 0f 80  .. ..W]......%..
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5577720 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.787s)
>>   hex dump (first 8 bytes):
>>     72 65 67 00 6b 6b 6b a5                          reg.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5575d98 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.787s)
>>   hex dump (first 8 bytes):
>>     00 00 00 01 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007f2250f80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.790s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f5 57 68 58 00 00 00 11 00 00 00 00  .. ..WhX........
>>     c0 00 00 07 ea dd a2 40 00 00 00 00 00 00 00 00  .......@........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f5576858 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.790s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadda240 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.790s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 31  test-unittest101
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6bc70 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.790s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 00  test-unittest10.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<0000000067290146>] .of_overlay_fdt_apply+0xb00/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadd9540 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878938 (age 824.790s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 30 31  test-unittest101
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<0000000067290146>] .of_overlay_fdt_apply+0xb00/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<00000000e3d25537>] .of_unittest_apply_overlay_check+0xfc/0x1e4
>>     [<000000009b1b95aa>] .of_unittest+0x2da4/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89e738 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.787s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb a1 98 a0 00 00 00 00 00 00 00 00  ................
>>     c0 00 20 07 ec e6 8e 70 00 00 00 00 00 00 00 00  .. ....p........
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece68e70 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.790s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 00  test-unittest11.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec886200 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.790s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 ec e6 a4 00 00 00 00 09 00 00 00 00  .. .............
>>     c0 00 20 07 ec e6 99 f0 c0 00 00 07 ec 88 55 80  .. ...........U.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6a400 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.790s)
>>   hex dump (first 16 bytes):
>>     63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece699f0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 16 bytes):
>>     75 6e 69 74 74 65 73 74 00 6b 6b 6b 6b 6b 6b a5  unittest.kkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec885580 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f8 5d a0 48 00 00 00 05 00 00 00 00  .. ..].H........
>>     c0 00 20 07 f8 5d ac 60 c0 00 00 07 ec 88 46 80  .. ..].`......F.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85da048 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 8 bytes):
>>     73 74 61 74 75 73 00 a5                          status..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85dac60 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 8 bytes):
>>     6f 6b 61 79 00 6b 6b a5                          okay.kk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec884680 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f8 5d ab 08 00 00 00 04 00 00 00 00  .. ..]..........
>>     c0 00 20 07 f8 5d 9a e8 c0 00 00 07 ec 88 6e 80  .. ..]........n.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85dab08 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.794s)
>>   hex dump (first 8 bytes):
>>     72 65 67 00 6b 6b 6b a5                          reg.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85d9ae8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 8 bytes):
>>     00 00 00 0b 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec886e80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 ec e6 a6 e0 00 00 00 04 00 00 00 00  .. .............
>>     c0 00 20 07 f8 5d b3 18 c0 00 00 07 ec 88 44 00  .. ..]........D.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6a6e0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 16 bytes):
>>     23 61 64 64 72 65 73 73 2d 63 65 6c 6c 73 00 a5  #address-cells..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85db318 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 8 bytes):
>>     00 00 00 01 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec884400 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 ec e6 81 80 00 00 00 04 00 00 00 00  .. .............
>>     c0 00 20 07 f8 5d 92 d8 c0 00 00 07 ec 88 3a 00  .. ..]........:.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece68180 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.797s)
>>   hex dump (first 16 bytes):
>>     23 73 69 7a 65 2d 63 65 6c 6c 73 00 6b 6b 6b a5  #size-cells.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85d92d8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.800s)
>>   hex dump (first 8 bytes):
>>     00 00 00 00 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec883a00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.800s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f8 5d 80 08 00 00 00 10 00 00 00 00  .. ..]..........
>>     c0 00 20 07 ec e6 b3 d0 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85d8008 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.800s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6b3d0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 00  test-unittest11.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb89fde8 (size 192):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb a1 9b 50 00 00 00 00 00 00 00 00  .......P........
>>     c0 00 00 07 ea dd 85 00 00 00 00 00 00 00 00 00  ................
>>   backtrace:
>>     [<0000000007b50c76>] .__of_node_dup+0x38/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadd8500 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 31  test-unittest111
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000a074532f>] .__of_node_dup+0x50/0x1c0
>>     [<000000006f73e286>] .build_changeset_next_level+0x280/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec886c00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 ec e6 8a 20 00 00 00 09 00 00 00 00  .. .... ........
>>     c0 00 20 07 ec e6 ab 30 c0 00 00 07 ec 88 0a 80  .. ....0........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece68a20 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 16 bytes):
>>     63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6ab30 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.804s)
>>   hex dump (first 16 bytes):
>>     75 6e 69 74 74 65 73 74 00 6b 6b 6b 6b 6b 6b a5  unittest.kkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec880a80 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.807s)
>>   hex dump (first 32 bytes):
>>     c0 00 20 07 f8 5d a5 a8 00 00 00 05 00 00 00 00  .. ..]..........
>>     c0 00 00 07 eb 18 c8 18 c0 00 00 07 ec 88 58 00  ..............X.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f85da5a8 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.807s)
>>   hex dump (first 8 bytes):
>>     73 74 61 74 75 73 00 a5                          status..
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb18c818 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.807s)
>>   hex dump (first 8 bytes):
>>     6f 6b 61 79 00 6b 6b a5                          okay.kk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec885800 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb 18 fc 80 00 00 00 04 00 00 00 00  ................
>>     c0 00 00 07 eb 18 f4 70 c0 00 00 07 ec 88 41 80  .......p......A.
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb18fc80 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 8 bytes):
>>     72 65 67 00 6b 6b 6b a5                          reg.kkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb18f470 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 8 bytes):
>>     00 00 00 01 6b 6b 6b a5                          ....kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec884180 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb 18 dd 98 00 00 00 11 00 00 00 00  ................
>>     c0 00 00 07 ea dd b4 20 00 00 00 00 00 00 00 00  ....... ........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb18dd98 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eaddb420 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.810s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 31  test-unittest111
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<0000000038c6aced>] .add_changeset_property.isra.0+0x61c/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<0000000034ba1197>] .build_changeset_next_level+0x334/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007ece6a850 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.814s)
>>   hex dump (first 16 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 00  test-unittest11.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<0000000067290146>] .of_overlay_fdt_apply+0xb00/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadda580 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878939 (age 824.814s)
>>   hex dump (first 32 bytes):
>>     74 65 73 74 2d 75 6e 69 74 74 65 73 74 31 31 31  test-unittest111
>>     00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  .kkkkkkkkkkkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<0000000001df4c62>] .kvasprintf_const+0xa8/0xf0
>>     [<00000000b7ba15a5>] .kobject_set_name_vargs+0x34/0xf0
>>     [<0000000076cbbcf2>] .kobject_add+0x50/0xe0
>>     [<000000002d7a6157>] .__of_attach_node_sysfs+0xa8/0x160
>>     [<000000004ed552f3>] .__of_changeset_entry_apply+0x32c/0x390
>>     [<0000000062a8a683>] .__of_changeset_apply_entries+0x48/0x110
>>     [<0000000067290146>] .of_overlay_fdt_apply+0xb00/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<000000003ad7372f>] .of_unittest_apply_overlay.constprop.0+0x54/0xb8
>>     [<000000008fda7969>] .of_unittest_apply_revert_overlay_check.constprop.0+0xc4/0x2b4
>>     [<00000000ea132166>] .of_unittest+0x2ee0/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec881200 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.800s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 ec 71 d0 28 00 00 00 0c 00 00 00 00  .....q.(........
>>     c0 00 20 07 f2 e8 c5 d0 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<000000004e6be113>] .of_unittest+0x3458/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec71d028 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.800s)
>>   hex dump (first 8 bytes):
>>     6e 61 6d 65 00 6b 6b a5                          name.kk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<000000004e6be113>] .of_unittest+0x3458/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007f2e8c5d0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.804s)
>>   hex dump (first 16 bytes):
>>     5f 5f 73 79 6d 62 6f 6c 73 5f 5f 00 6b 6b 6b a5  __symbols__.kkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<000000004e6be113>] .of_unittest+0x3458/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eaddb280 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     2f 74 65 73 74 63 61 73 65 2d 64 61 74 61 2d 32  /testcase-data-2
>>     2f 73 75 62 73 74 61 74 69 6f 6e 40 31 30 30 00  /substation@100.
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000c2320ab8>] .kasprintf+0x2c/0x40
>>     [<000000005511b2ac>] .add_changeset_property.isra.0+0x170/0xaf0
>>     [<0000000060888297>] .of_overlay_fdt_apply+0x5e4/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000daa7ed62>] .of_unittest+0x3404/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eadd9880 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     2f 74 65 73 74 63 61 73 65 2d 64 61 74 61 2d 32  /testcase-data-2
>>     2f 66 61 69 72 77 61 79 2d 31 00 6b 6b 6b 6b a5  /fairway-1.kkkk.
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000c2320ab8>] .kasprintf+0x2c/0x40
>>     [<000000005511b2ac>] .add_changeset_property.isra.0+0x170/0xaf0
>>     [<0000000060888297>] .of_overlay_fdt_apply+0x5e4/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000daa7ed62>] .of_unittest+0x3404/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eaddbc40 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     2f 74 65 73 74 63 61 73 65 2d 64 61 74 61 2d 32  /testcase-data-2
>>     2f 66 61 69 72 77 61 79 2d 31 00 6b 6b 6b 6b a5  /fairway-1.kkkk.
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000c2320ab8>] .kasprintf+0x2c/0x40
>>     [<000000005511b2ac>] .add_changeset_property.isra.0+0x170/0xaf0
>>     [<0000000060888297>] .of_overlay_fdt_apply+0x5e4/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000daa7ed62>] .of_unittest+0x3404/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eaddbaa0 (size 32):
>>   comm "swapper/0", pid 1, jiffies 4294878943 (age 824.804s)
>>   hex dump (first 32 bytes):
>>     2f 74 65 73 74 63 61 73 65 2d 64 61 74 61 2d 32  /testcase-data-2
>>     2f 66 61 69 72 77 61 79 2d 31 00 6b 6b 6b 6b a5  /fairway-1.kkkk.
>>   backtrace:
>>     [<00000000154ad5cf>] .kvasprintf+0x60/0xd0
>>     [<00000000c2320ab8>] .kasprintf+0x2c/0x40
>>     [<000000005511b2ac>] .add_changeset_property.isra.0+0x170/0xaf0
>>     [<0000000060888297>] .of_overlay_fdt_apply+0x5e4/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000daa7ed62>] .of_unittest+0x3404/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec37b000 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.797s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb 7a 42 f0 00 00 00 04 00 00 00 00  .....zB.........
>>     c0 00 20 07 ef af e1 a0 00 00 00 00 00 00 00 00  .. .............
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000043c13a57>] .build_changeset_next_level+0x21c/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb7a42f0 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.797s)
>>   hex dump (first 16 bytes):
>>     72 70 6d 5f 61 76 61 69 6c 00 6b 6b 6b 6b 6b a5  rpm_avail.kkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000043c13a57>] .build_changeset_next_level+0x21c/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007efafe1a0 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.797s)
>>   hex dump (first 8 bytes):
>>     00 00 00 64 6b 6b 6b a5                          ...dkkk.
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<0000000043c13a57>] .build_changeset_next_level+0x21c/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007ec37bf00 (size 128):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.797s)
>>   hex dump (first 32 bytes):
>>     c0 00 00 07 eb 7a 5b 60 00 00 00 08 00 00 00 00  .....z[`........
>>     c0 00 20 07 ef af f7 20 00 00 00 00 00 00 00 00  .. .... ........
>>   backtrace:
>>     [<00000000fd6c039b>] .__of_prop_dup+0x48/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0000007eb7a5b60 (size 16):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.800s)
>>   hex dump (first 16 bytes):
>>     72 70 6d 5f 61 76 61 69 6c 00 6b 6b 6b 6b 6b a5  rpm_avail.kkkkk.
>>   backtrace:
>>     [<00000000c939be68>] .kstrdup+0x44/0xb0
>>     [<00000000f0610228>] .__of_prop_dup+0x60/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>> unreferenced object 0xc0002007efaff720 (size 8):
>>   comm "swapper/0", pid 1, jiffies 4294878945 (age 824.800s)
>>   hex dump (first 8 bytes):
>>     00 00 00 64 00 00 00 c8                          ...d....
>>   backtrace:
>>     [<00000000a2a61f11>] .kmemdup+0x30/0x70
>>     [<00000000fcebe2cd>] .__of_prop_dup+0x7c/0x130
>>     [<00000000e6e185ca>] .add_changeset_property.isra.0+0x960/0xaf0
>>     [<000000008b0977be>] .build_changeset_next_level+0x74/0x370
>>     [<000000009598e32c>] .of_overlay_fdt_apply+0x504/0xf90
>>     [<00000000a7d4460c>] .overlay_data_apply+0xa8/0x118
>>     [<00000000eaf6e6ea>] .of_unittest+0x35b8/0x3778
>>     [<00000000af117d89>] .do_one_initcall+0x7c/0x420
>>     [<00000000c99776b4>] .kernel_init_freeable+0x318/0x3d8
>>     [<0000000001b957ee>] .kernel_init+0x14/0x168
>>     [<000000001fe347b5>] .ret_from_kernel_thread+0x58/0x68
>>
> 
> 

