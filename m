Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B0DD0A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 22:53:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vytW6kpgzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 07:53:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="IBXlhzy0"; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vyrt37JYzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 07:52:12 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id b9so7605631wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 13:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uGEXsE8/NXoRF+D14w+boPYF50JZvz72YuC6YAN3OA0=;
 b=IBXlhzy0RGoAwB2ojEYPz7abKSVVtIzYBJwWK4c2HgNYuYnc1H23Y0feBGiRroGP5j
 JubIc4JzQMtDXZ7uQ2jlmTdmFKQ4Bt4Hz0G5tO902wI3BGWJDjMXjHQyCP4UQrcIkQmy
 OLOi1qgwk8pQzNaoyvNk5TUdcbynJpX0xd/4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uGEXsE8/NXoRF+D14w+boPYF50JZvz72YuC6YAN3OA0=;
 b=nnOZ9ic5OChIQ0E+k6KY+7QqYEpUUv96FLnq0mYwp5QK53AFd55RTfwr5SdhZ6962S
 d5G1+8hNKjfp5+CkwPKy7XeMgXFpSZwNjr2ho2xsvn+MuZgRUDHp/hTuu8T2Mvz82MCT
 Zbs0tmYDePhL7zamo4RwsdJC8RouxHXGv1USBsH6MwmHMh+2gG4gxy5RT3fVSgvNTbbD
 SLryG+khlOZJ0mx0zJ4Ef88TnGKku3o5NqsKhtBtF+ZetjRkPHOeQT2UO5SYydiW1S35
 o1DWyIUMBJBZ4/Logr+X7LTnx0/MctLhBb29vVOBxLKiH6aNJ1bMEZr78yc+05fQ7fI4
 BalA==
X-Gm-Message-State: APjAAAWwr18dour1nhNc/wtacdrLWu5IR67mebMzn4lAfzmBKyokr6br
 quoPcGWSdGvxBIseNvs+Xjg2OA==
X-Google-Smtp-Source: APXvYqz0kY5/OxYYxhR/1u58qGdFKWyMZCctPVLRK43Po/wT6eyex+6FLmeTJjDYNDpKlXaZ7a7AbA==
X-Received: by 2002:adf:9101:: with SMTP id j1mr8966445wrj.71.1571431925821;
 Fri, 18 Oct 2019 13:52:05 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id n15sm8053302wrw.47.2019.10.18.13.52.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:52:05 -0700 (PDT)
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Leo Li <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Timur Tabi <timur@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
Date: Fri, 18 Oct 2019 22:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/10/2019 22.16, Leo Li wrote:
> 
>>
>> There have been several attempts in the past few years to allow building the
>> QUICC engine drivers for platforms other than PPC. This is (the beginning of)
>> yet another attempt. I hope I can get someone to pick up these relatively
>> trivial patches (I _think_ they shouldn't change functionality at all), and then
>> I'll continue slowly working towards removing the PPC32 dependency for
>> CONFIG_QUICC_ENGINE.
> 
> Hi Rasmus,
> 
> I don't fully understand the motivation of this work.  As far as I know the QUICC ENGINE is only used on PowerPC based SoCs. 

Hm, you're not the Leo Li that participated in this thread
<https://lore.kernel.org/lkml/AM3PR04MB11857AE8D2B0BE56121B97D391C90@AM3PR04MB1185.eurprd04.prod.outlook.com/T/#u>?


 Can you give an example on how is it used on ARM system?

LS1021A, for example, which is the one I'm aiming for getting fully
supported in mainline.
<https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/layerscape-communication-process/qoriq-layerscape-1021a-dual-core-communications-processor-with-lcd-controller:LS1021A>

The forks at https://github.com/qoriq-open-source/linux.git have various
degrees of support (grep for commits saying stuff like "remove PPCisms"
- some versions can be found on
<https://lore.kernel.org/lkml/?q=remove+ppcisms>). Our current kernel is
based on commits from the now-vanished 4.1 branch, and unfortunately at
least the 4.14 branch (LSDK-18.06-V4.14) trivially doesn't build on ARM,
despite the PPC32 dependency having been removed from CONFIG_QUICC_ENGINE.

>>
>> Tested on an MPC8309-derived board.
> 
> MPC8309 is also PPC based.

True, of course. This is just some first few steps, and I'm not claiming
that this is sufficient to make the QE drivers build on ARM yet. But I
have a customer with both mpc8309-based and ls1021a-based platforms, and
they want to run the same, as-close-to-mainline-as-possible, kernel on
both. So I will take a piecemeal approach, and try to make sure I don't
break the ppc boards in the process (just building and booting one board
is of course not sufficient, but better than nothing). Once I get to
actually build some of the QE drivers for ARM, I'll of course also test
them.

Rasmus
