Return-Path: <linuxppc-dev+bounces-14694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FCFCAE383
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 22:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQFHV5ysSz2xJT;
	Tue, 09 Dec 2025 08:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765211113;
	cv=none; b=ZINrw1SIsLeFFS9SkabIM9QVfYYQpzWvWlrC+WfVUI4jl+bOKQDDC9VMEYB+py+bu7MvYxZiBXY6DMx/cFX13IWH3tHypkcCe0ElsbLaBeyKIu3e/OQFOegrr+UuP4P/yAB4esMQvZfqKLl2SrBikbuYdn7qPAhJvfo1GRpH8Sv/tfo2rT2aEFaIrEVXe9ZBuDAtvpCseEZT2MJa1vcmr23n0Bcgljf/bxlU2NZ89WgAf/5Z8BB6fNXsmJVHYZ/EXE65pWj8ZbKuT4PmoMq0K0KJ1dgnvmnjLJWYuvqTZRj6CUTiyJmFM/Dr2LdAclZ/d+1tpF49zPEdc59iFX53ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765211113; c=relaxed/relaxed;
	bh=u/wdM7l3xLykxuO7vutzg6S4GMlYxKv4J0Fu0clmfsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkFMZC+/8zod2vIAzVl14sCVQSDbI+azOCAMN5uUAtu/F4nC10ITxRYQeqws6TH9tIpXu8Qz41wnLKBvdyaUaqwohzbA6dOUJBRhaw1+n97m+HZ2hA8i6JFAV7biyfYZ9ttncLREsILOv0AveeS1di4fIjCKQ7YC6Pp0p8bB/NRjD09rZiuLTtVAKcU+/o2N4MGlALpyltJ4PR3/4+18GRa95YfeB3KQPBsooejP5wAGiXRZw+NlrLCvnGuN4ZqR7Jpeo0ILAkTpFcsO/KqDB+jairDcNLH3/w+SUlnjX1Jpx6H9fZuLPhdJcQPupP0ffvil0y10R7MK/G34xL4b7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U6zLnmeT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=stanley.j.johnson.001@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U6zLnmeT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=stanley.j.johnson.001@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ6lX2KGvz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 03:25:11 +1100 (AEDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-656b8ca52e8so2624751eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211109; x=1765815909; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/wdM7l3xLykxuO7vutzg6S4GMlYxKv4J0Fu0clmfsI=;
        b=U6zLnmeTNrkjPnxSqgiuOVDnpm4aPofbnQAZPkIFryOsSCa8GITNS89/tsGKbMKGLc
         V9NZHvEzGZIsUm6e9l67Xw5LOZtm/r+8KUBJoWQPaZSU70zSoku0W+Cl0fMy3zYvz/0h
         rwQMY+wLMWeyNv+GoTXh0tnvsoiBGgaPurNUSZC21hHOfqHhUtM7nHbAf9A+mLjanCKz
         crMajgrgVJsMTOkMvC//dqLmj2PJplKP6VUC4HF90Q5LqPs2iRwCqBGMal9rAaxelrKu
         TEi5a8mPec6H9we5gdrdzHJENqFUuB9StPOeI939uxX1nZeJ4u035z9oXMury6WNRytu
         Wt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211109; x=1765815909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/wdM7l3xLykxuO7vutzg6S4GMlYxKv4J0Fu0clmfsI=;
        b=VpkKyNDrcEgcfPFTDlItGf/ioR6/SMDTZ466LSHikmcZBqOd/SQZ9isG/kOwNwZxIW
         oRfQOuwFovXp/YdZllFwxo/ryGd48AxWye0tnFFS9j9dglmZGuwyDo2qqQkv/dSxStAQ
         24Wu4fGMMbceoz7Pk+qO28bLzuY/LCzceE/ujJQGNfuO6k2n5TEJO1oKPfzVwH6bxeqJ
         YlFAVid01P5WJCHCxgVPVNXN8KfhSLFwNcCWsNlODmg46ZMCoV5J+j74WJOKwwlsNnmR
         D86lQcEPJr62Hj4YZHfj837HtOBDsK7WBnbEP6BKpC5lDGTjAu4ko8PU+2eVzzHWjQ9l
         3kWw==
X-Gm-Message-State: AOJu0YwaH4iNmDw5j60JdCJRIFbctFiRJDYf8Hdr+kJL53ytgHYoF32h
	Ypy/iNdA52ZcgWYozix7ulz76BJhCfn7AwFzJiZ6PmJ86OcrCxonwkBy
X-Gm-Gg: ASbGncvuqppiE23iyuwrrj+1Gxkerlx6UcBsr0lSJmOLyjxOwQnIgHzAKhIjXqK0Tq/
	5lw4z1sPekIFZF0Ie91Ffb2zZyBGEPuEEDR4vHjg5MM4jq4YcgkKKPSRmObGPoWouzqOFGMhIKm
	8Ef09O4jrqN3CpL+/oB6s6wGHy+Aa2qFJ/4ENPLHMALvHuAyhC8JHVEcUzKTn/0Y+Lmau0ag6HO
	UQu7UB+q6FGpUywAB/QqLH0EDPXBOZpxWjVeDtf2xc4sLxxU6R36mpNqexJOfruMIRdOmOk6nRz
	ZRx7+X8txFJk3T+u4GEdB6N7yik1YWYydsAJ17V7ifMWMOLf1wJeq9HDl5+78by5e3SHc/09rsx
	2/NNNJtAeHPooQPo7M9C3cfhL5mBK3PBkeHMjct0ZUsapxailZ2VJ9SnrVEIZA0vnsp0bJQWh1P
	09SF+AbzRDhiJj/SzlvABoVcmVHc7BY4uSpKwHyWGZgBVIZg==
X-Google-Smtp-Source: AGHT+IFiBhn5yYfteNuwXNQYegX2Ich+VBUptcLz6sdrXAdCnEEA4iU3Kx4BFh/WSD6RRUWuSqPrVA==
X-Received: by 2002:a05:6820:1886:b0:654:f691:9da8 with SMTP id 006d021491bc7-6599a89f18cmr3358963eaf.7.1765211108987;
        Mon, 08 Dec 2025 08:25:08 -0800 (PST)
Received: from [192.168.1.35] ([143.109.162.29])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-6597ef0d5a6sm6305802eaf.10.2025.12.08.08.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:25:08 -0800 (PST)
Message-ID: <8995fec0-133a-4b8c-9e6e-980772d155d4@gmail.com>
Date: Mon, 8 Dec 2025 09:25:07 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Excluded List for "#size-cells" warning
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Rob Herring <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Finn Thain <fthain@linux-m68k.org>
References: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com>
 <78e43ec2-a60a-9876-9f03-c0ad92b7da1d@yahoo.com>
 <CAL_JsqJ8amo2ggUVfL=YzRrA9UnqKfKCipn-_yOkahJKZVs5=A@mail.gmail.com>
 <aQHCU1pb7zT167rO@gate> <3a9bb788-d527-af08-894e-8011490fcab5@yahoo.com>
 <a9467bf5-4756-1297-9ef8-c00a326f786b@yahoo.com>
Content-Language: en-US
From: "Stanley J. Johnson" <stanley.j.johnson.001@gmail.com>
In-Reply-To: <a9467bf5-4756-1297-9ef8-c00a326f786b@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

Please let me know if you have any information regarding this issue.

thanks

-Stan Johnson

On 10/30/25 4:14 PM, Stan Johnson wrote:
> Attached are the dtc output files for a PB Lombard and a PB 3400c. If 
> you need any other information, please let me know.
> 
> Thanks for looking into this.
> 
> -Stan Johnson
> 
> -----
> 
> On 10/29/25 11:00 AM, Stan Johnson wrote:
>> On 10/29/25 1:29 AM, Segher Boessenkool wrote:
>>> On Tue, Oct 28, 2025 at 08:17:27PM -0500, Rob Herring wrote:
>>>> On Tue, Oct 28, 2025 at 7:05 PM Stan Johnson <userm57@yahoo.com> wrote:
>>>>>
>>>>> -------- Forwarded Message --------
>>>>> Subject: Excluded List for "#size-cells" warning
>>>>> Date: Tue, 28 Oct 2025 10:00:25 -0600
>>>>> From: Stan Johnson <userm57@yahoo.com>
>>>>> To: debian-powerpc@lists.debian.org
>>>>> CC: Finn Thain <fthain@linux-m68k.org>, Christophe Leroy
>>>>> <christophe.leroy@csgroup.eu>
>>>>>
>>>>> Hello,
>>>>>
>>>>> On a PowerBook G3 Pismo running the latest Debian SID, dmesg 
>>>>> reports the
>>>>> warning shown below. I've also seen the warning on PowerBook 
>>>>> Lombard and
>>>>> Wallstreet systems. I haven't checked PowerBook 3400c or Kanga.
>>>>
>>>> Can you send me a dump of the device tree on these systems:
>>>>
>>>> dtc -O dts /proc/device-tree
>>
>> Please see the attached compressed files containing dtc output for a 
>> Wallstreet (dtc_wallstreet.txt) and a Pismo (dtc_pismo.txt).
>>
>>>>
>>>> We've been fixing up these cases such as in commit 7e67ef889c9a
>>>> ("powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7")
>>>
>>> And of course it is perfectly fine for an actual Open Firmware to *not*
>>> repeat the defaults.  As the documentation (the main IEEE 1275 thing)
>>> says: "A missing “#size-cells” property signifies the default value of
>>> one."  There are many other places in OF geared towards this default
>>> btw, take for example the "reg" word, that silently assumes your node's
>>> #size-cells is 1, and does completely the wrong thing if not.
>>>
>>> Flattened device trees are a fine thing, but the gratuitous ways it
>>> differs from OF, are not.
>>>
>>>
>>> Segher


