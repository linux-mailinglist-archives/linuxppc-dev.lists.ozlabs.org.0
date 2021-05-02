Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6584370F63
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 23:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYKNb6W2qz30D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 07:43:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JU9W/xnD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=ali.kaasinen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JU9W/xnD; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYJYc4cCDz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 07:06:10 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id b21so4485156ljf.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N7Yqh79l2fm2YthqZGJy/4v3jPHgVVehObKuu0oKfEI=;
 b=JU9W/xnDmpy9qH74iotexdN48jCFjPv+eFhuUnAbFENynmfWePJbMoBnfQSm7XWs+l
 o8h/uhfhqzWMJucn92gIG9Okv5/MyMdAFj2mj7nt+cf/PUl4ozBbnj4iRRnn2qRmPeYX
 HW5qvgcm5HgATizwthp/ysQOaJv5NnA/Iw05Csrr8LTZwMyjVjZDWxZDXHR++SNsZ5dd
 Bxv4xEfiFqpFfNOX/lOivJrw2OTWJAwvkJhZX+ybmEPFw2Ec4YLpmibqAWyfso69ukgu
 t7nX2a9FsyxFJr7ckPwClPzE479B0NUPXkLM+QhMTGmzYY5d8bSaL2riGmpDnsolJLpU
 H39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N7Yqh79l2fm2YthqZGJy/4v3jPHgVVehObKuu0oKfEI=;
 b=naktQQ5lBbE0mCx4ocMgz4OsAvVRhqwTOZEvNKqilf9dRc/qToVu9QVgntK0Ld5phU
 mi75/qK+R41D1/lysr0tHTak3s9vVeKyGsAEYHnKKsylBw9wFCpgZ2qdJ6j1eGsO9ZPc
 h7eTxtDHDOmZrxfZMO00pDTozvNmYWVg27a2ko1DGOy3VQhGj2bJ7u4tDfrD9Y9czRHz
 ATcNVCnzBsNpYiyYo6nybtE6Rb0McBGDSe/pU4UhmhOAOaCX0RE//yDzaHa1JsDCeSly
 0iBxEEtd8+vnT+A7y5TBK2u8FFc0VBUL4BJ1Dqd9Kw9yLhHISZdWfwij8B28k3upPSwD
 Av1A==
X-Gm-Message-State: AOAM530kEGGiFmd8IsJ7ytD+LmN91JhxhBkn03kp1mYO197yV8hGlFmY
 12z6B4ZsSQD79i5y4jC687Y=
X-Google-Smtp-Source: ABdhPJyFdolNvSlvoH3O9+/CNW7drmqIFS0V+aTPiSan0DUukLYT6G12bs4xGHCF2oOGcHObWcQ3mA==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr6110327ljc.116.1619989559570; 
 Sun, 02 May 2021 14:05:59 -0700 (PDT)
Received: from [192.168.1.218] (dsl-trebng21-58c191-211.dhcp.inet.fi.
 [88.193.145.211])
 by smtp.gmail.com with UTF8SMTPSA id m17sm944171lfg.171.2021.05.02.14.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 14:05:59 -0700 (PDT)
Message-ID: <9198344a-f318-55b4-62b6-22354227ff2d@gmail.com>
Date: Mon, 3 May 2021 00:05:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
From: Ali Kaasinen <ali.kaasinen@gmail.com>
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 May 2021 07:43:03 +1000
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/05/2021 23.32, Segher Boessenkool wrote:

> On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
>> On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
>>> On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
>>>> Why not raise the minimum gcc compiler version even higher?
>> On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
>>> Everyone should always use an as new release as practical
>> []
>>
>>> The latest GCC 5 release is only three and a half years old.
>> You argue slightly against yourself here.
> I don't?
>
>> Yes, it's mostly a question of practicality vs latest.
>>
>> clang requires a _very_ recent version.
>> gcc _could_ require a later version.
>> Perhaps 8 might be best as that has a __diag warning control mechanism.
> I have no idea what you mean?
>
>> gcc 8.1 is now 3 years old today.
> And there will be a new GCC 8 release very soon now!
>
> The point is, you inconvenience users if you require a compiler version
> they do not already have.  Five years might be fine, but three years is
> not.
>
>
> Segher

Users & especially devs should upgrade then. 3 years of not updating 
your compiler - if you regularly build the kernel - seems nonsensical.


Ali
