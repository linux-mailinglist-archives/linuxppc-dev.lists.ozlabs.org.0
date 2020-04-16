Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1B1AD246
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 23:54:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493CgZ1DKHzDrgN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=saxIS9Bo; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Ccs2qSvzF0B3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 07:52:29 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id l13so282840qtr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5muy41xpG05GO44qMPdBBo4WoMG+wseXc4iMRPJrNUY=;
 b=saxIS9BoL7RKAWOSyLjOwifTJ95qb6v4SLpXdkrzPI5XKOPPyPhDg8vhlRhy64i3JG
 5byLCgHgHocCFOeMZHuAX+Uwhqc7pBkIKTSmf4b4lfDZC7HERvHuBCTtkR+1VbKVS4lZ
 Bn8Uwew0/rYkUwFTYypc5KBPHPgzclfZgLgKhafeZ4wN7RoygowpUkfZvQv0jWy/1oI5
 ryW9LOdWBF2hgld2rbIrFOn9b9U9PKtcuK64Zk1Y+I868xInwWWYDhOxELwhbcXQ3U7Q
 Jdbo8HYso7Ki5BrTcIuiBdb/uikj0d40tj36joPNm3t58W/b5BCF5y4wq+LMZ24zKdb4
 ziqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5muy41xpG05GO44qMPdBBo4WoMG+wseXc4iMRPJrNUY=;
 b=aU1PwqZxxyBi/O+7+THDMDvp8yiK/wge5rZhSyU/MLQeXpOd2mWe89jraHmq93Tm+9
 RSq8yIO3AkJAqgK2R3BDqHXqbr1q4qpH2m82M7lykoiuNMVqOB5XAKIUnyNqih4FaEDd
 zt3nxvzB72XyZAIlCzUoHmQwkP7WhbpUqfwNKGnqfyqDLHrt3Bb4NCpJpp0ogvxr0XiV
 CnVnwTXmi2r599JT8tVgSdCmb4geWJWFtLueCXkQAGAnzXAT9mpM+z59DTelzb3hy3cT
 JSN1Xr64ZWXA8148ZdVQXmO34pUBCnox7tNqMtvnJ6ji+eFz1/C0W6x+oDUgg95s+kvo
 DmkA==
X-Gm-Message-State: AGi0PuaIOxI17l1D8N0wjHC2jvCFRVEEdYKtuz9tLDIlJvRiA28IKBnQ
 yI6NX7ZPXAlNFMJi42dnQLI=
X-Google-Smtp-Source: APiQypI/pCBWiEgBYpC56NwpN5qL4psYkP6Xnj5lSjzPlcFkrEmKNuFx1DD6GfhH3+VuOENfMJVz9g==
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr25328726qto.72.1587073946674; 
 Thu, 16 Apr 2020 14:52:26 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id m7sm7671620qke.124.2020.04.16.14.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 14:52:26 -0700 (PDT)
Subject: Re: [Bug 206203] kmemleak reports various leaks in
 drivers/of/unittest.c
From: Frank Rowand <frowand.list@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
 <bug-206203-206035-Y3snhDMDgJ@https.bugzilla.kernel.org/>
 <877dyqlles.fsf@mpe.ellerman.id.au>
 <8383090b-f8d1-f346-5ff3-7234a9d44092@gmail.com>
 <a717b335-de6c-46eb-1daa-ae5054664e93@gmail.com>
Message-ID: <8ff9a2e5-9b49-73d3-6f57-2c5a62bc4f97@gmail.com>
Date: Thu, 16 Apr 2020 16:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a717b335-de6c-46eb-1daa-ae5054664e93@gmail.com>
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

On 4/15/20 10:27 PM, Frank Rowand wrote:
> On 4/8/20 10:22 AM, Frank Rowand wrote:
>> Hi Michael,
>>
>> On 4/7/20 10:13 PM, Michael Ellerman wrote:
>>> bugzilla-daemon@bugzilla.kernel.org writes:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206203
>>>>
>>>> Erhard F. (erhard_f@mailbox.org) changed:
>>>>
>>>>            What    |Removed                     |Added
>>>> ----------------------------------------------------------------------------
>>>>  Attachment #286801|0                           |1
>>>>         is obsolete|                            |
>>>>
>>>> --- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
>>>> Created attachment 288189
>>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=288189&action=edit
>>>> kmemleak output (kernel 5.6.2, Talos II)
>>>
>>> These are all in or triggered by the of unittest code AFAICS.
>>> Content of the log reproduced below.
>>>
>>> Frank/Rob, are these memory leaks expected?
>>
>> Thanks for the report.  I'll look at each one.
> 
> Only one of the leaks was expected.  I have patches to fix the
> unexpected leaks and to remove the expected leak so that the
> kmemleak report of it will not have to be checked again.
> 
> I expect to send the patch series tomorrow (Thursday).

The patches for the memory leaks that I saw on an ARM board are at:

   https://lore.kernel.org/r/1587073370-25963-1-git-send-email-frowand.list@gmail.com

-Frank

< snip >
