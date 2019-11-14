Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EB7FC208
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:02:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DFqG75FLzF3xQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="DqCtJziY"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFmt6k0JzF4ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:00:14 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id q5so4378226lfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PlNrN2GhAvRY7IW8hzvOGZWhxEVtG6SWuwKkUSlWRyI=;
 b=DqCtJziYkryUZAUqd2xAAGwJFBCGTywmDlEpqjTs1//7QvPdR0AwIUntDfUsmL7VXt
 inp5/f3kzSiCI/REeaZwhuroE7fO4RLz1hNiMXce1uHOOoWd/krMOrPvIsHk8VUu/Idx
 CVhp6Qxtadp2q8Bf0VYuQFMBrMOjcRmWU1E3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PlNrN2GhAvRY7IW8hzvOGZWhxEVtG6SWuwKkUSlWRyI=;
 b=OpHnfzyqLM5OxGVLU/rY0QlLnFW32Y018C4IUoMa0A2aV+V4dBAfzw15Kt+zzwPrrn
 cLJdHcnC+WulNKcu/IbYTCi6iTGJuxnhKm0RACSxuWupQcWed8/QTzCDGRq6Lc8kBznP
 ckCigwO9RMZnG3uAJOINfHthCKFdQTKsZIxZS2xr4fFS1ZG3M/aWf6P+Fr9raDV+gc9m
 kQnTrAtsc+cuBdu52Wa4Cm+5IWi6vSDIVPZq5zvOyarEfo23P5x+f8IP9M6Ct7T4YnfE
 vmx+iyFDyWhqUtl1NWOEMceHv1F0H8w87ua8+OyQ10xjQ/XqJujFbW8YbneDVXsIdR0W
 qY3Q==
X-Gm-Message-State: APjAAAUMILjfmniOqEScReIlqYs3jQoR3PinoR8Wm5hrveM4TeNov42o
 UnbtAOtyGdedklKzWnSAJ5YLpg==
X-Google-Smtp-Source: APXvYqziuBwUwTFwvFITVp9Y42/Pf1aEQFfzH3vqpE2R1SKDE+E1rudpEqbbReFJja9okUlvGnJRkA==
X-Received: by 2002:a19:c386:: with SMTP id t128mr2627137lff.7.1573722009265; 
 Thu, 14 Nov 2019 01:00:09 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2073916lfi.57.2019.11.14.01.00.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 01:00:08 -0800 (PST)
Subject: Re: [PATCH v4 30/47] serial: ucc_uart: factor out soft_uart
 initialization
To: Timur Tabi <timur@kernel.org>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-31-linux@rasmusvillemoes.dk>
 <CAOZdJXVQ_wQLK-4uutb2e6zOt0b8FBVY3qoWdoo4UM8p7=bV0A@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <73337067-953c-55e2-986a-24116fb10544@rasmusvillemoes.dk>
Date: Thu, 14 Nov 2019 10:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOZdJXVQ_wQLK-4uutb2e6zOt0b8FBVY3qoWdoo4UM8p7=bV0A@mail.gmail.com>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/11/2019 06.14, Timur Tabi wrote:
> On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> -       /*
>> -        * Determine if we need Soft-UART mode
>> -        */
>>         if (of_find_property(np, "soft-uart", NULL)) {
>>                 dev_dbg(&ofdev->dev, "using Soft-UART mode\n");
>>                 soft_uart = 1;
>> +       } else {
>> +               return 0;
>>         }
> 
> How about:
> 
> if (!of_find_property(np, "soft-uart", NULL))
>     return 0;

of_property_read_bool() if anything. But I didn't want to do that kind
of transformation - just a pure "move this code out and fix the
indentation" with the minor edits needed to hook it back up where it
came from.

> And I think you should be able to get rid of the "soft_uart" variable.

Eh, no, it's used in several other places in the driver. I kind of hope
gcc is smart enough to see that in the !PPC32 case it is a static,
never-assigned-to, never-escapes variable so all the "if (soft_uart)"
branches go away, but that's not really very important.

Rasmus



