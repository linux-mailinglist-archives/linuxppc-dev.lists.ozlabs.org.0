Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753B4A3CE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 05:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnFGV2F7wz3bd3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 15:20:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WhuMIB9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=luke.leighton@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WhuMIB9N; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnFFs1qxNz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 15:19:43 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id me13so38810512ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 20:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:in-reply-to:references:mime-version:content-transfer-encoding
 :subject:to:from:message-id;
 bh=MF0aflaLMdO2uFD7zIGRv19HrJp0ZAt9VWM65h1HO6c=;
 b=WhuMIB9NWsOKnQLwAc74Txp6y7NucXGZmhMTQ9SxStUUTJLras25nU/KpKh/YFJfpE
 Ti8SA1UbjvyqMBovJWnCpWd8/BJCt0wvgEFrR3j+rerlrMi34n8Gbm513kaMdIBlAEkc
 L1e3f8Aqs6b0WJjAmIsW8pT0Iyvf95wIgwQGw7dMdA9wVnJUrCL4BCHHMvcSnyiAh/ch
 WMzeM1YbcRvjYCjDhlTcHCCHrwP60GOpjdOwEeOLt+sC4yREumGey2UO4vXBhTG2PyRA
 NLwfu5c2ZdkUM+6i7pDiBM/pnsP4X9T0ge4cBb1bNyQE5Z81UEpeaZ6EALPAFXL6Pha7
 70Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:from:message-id;
 bh=MF0aflaLMdO2uFD7zIGRv19HrJp0ZAt9VWM65h1HO6c=;
 b=RVdN7fyzJEjHXJmlnehTS4NWSC+FAqptRzfg3c1Cs6a7K1141d+XsfzUxugPjpZi7b
 CdFVlH/ZJMP02ls1LlmMRz4BjNcZdumxlKYqZ6TCrddG/cY8u/KecowTdqRvLejQZC7v
 v6t9tt25Y98oZW2QQxWvnaKEvgR0gLtmkHjbAgpmZdTmJ2W7t0F41ntlcl4trKOMvZDi
 QDlvFqJo2vQlfqSf1iy+OklUFCK1slRXJkKk1ujq676D5h0Fcn6g8zXtnhkT/2UQOSl1
 k0bomp1DDSTS/BXSvSTJNkkKNeOi7n3v/nLqsj5wVJgQpRxLQ5oKdOc1fX5cQj0D8NCr
 FSWw==
X-Gm-Message-State: AOAM5312oC/4imIR7dzt6vpSl5LU3JrLQ8FQ8qBlKJrn2cvDx34E1Tpd
 GOfk+Oej4TAwHw8bZTkyUys=
X-Google-Smtp-Source: ABdhPJw/yG9clS2Ze6Op6cem9oY+0S2zULlzlez0Bbxsi5xIfe6BLO9HfWaDeaVLovgGITiZNALOIw==
X-Received: by 2002:a17:906:478b:: with SMTP id
 cw11mr15649916ejc.302.1643602777284; 
 Sun, 30 Jan 2022 20:19:37 -0800 (PST)
Received: from [192.168.1.100] (92.40.189.183.threembb.co.uk. [92.40.189.183])
 by smtp.gmail.com with ESMTPSA id
 r3sm12921894ejd.129.2022.01.30.20.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Jan 2022 20:19:36 -0800 (PST)
Date: Mon, 31 Jan 2022 04:19:37 +0000
In-Reply-To: <1643598916.2hjoqtw60c.astroid@bobo.none>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: microwatt booting linux-5.7 under verilator
To: Nicholas Piggin <npiggin@gmail.com>,
 Libre-Soc General Development <libre-soc-dev@lists.libre-soc.org>,
 linuxppc-dev@lists.ozlabs.org, Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 openpower-hdl-cores <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
From: lkcl <luke.leighton@gmail.com>
Message-ID: <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
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



On January 31, 2022 3:31:41 AM UTC, Nicholas Piggin <npiggin@gmail=2Ecom> =
wrote:
>Hi Luke,
>
>Interesting to read about the project, thanks for the post=2E

no problem=2E it's been i think 18 years since i last did linux kernel wor=
k=2E

>> i also had to fix a couple of things in the linux kernel source
>> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/joel/microwatt=2Egi=
t
>
>I think these have mostly (all?) been upstreamed now=2E

i believe so, although last i checked (6 months?) there was some of dts st=
ill to do=2E instructions online all tend to refer to joel or benh's tree(s=
)

>> this led me to add support for CONFIG_KERNEL_UNCOMPRESSED
>> and cut that time entirely, hence why you can see this in the console
>log:
>>=20
>>     0x5b0e10 bytes of uncompressed data copied
>
>Interesting, it looks like your HAVE_KERNEL_UNCOMPRESSED support
>patch is pretty trivial=2E=20

yeah i was really surprised, it was all there

> We should be able to upstream it pretty
>easily I think?

don't see why not=2E

the next interesting thing which would save another hour when emulating HD=
L at this astoundingly-slow speed of sub-1000 instructions per second would=
 be in-place execution: no memcpy, just jump=2E

i seem to recall this (inplace execution) being a standard option back in =
2003 when i was doing xda-developers wince smartphone reverse-emgineering, =
although with it being 19 years ago i could be wrong

other areas are the memset before VM is set up, followed by memset *again*=
 on=2Eindividual pages once created=2E  those are an hour each

another hour is spent on early device tree flat walking=2E

one very big one (90+ mins) is the sysfs binary tree walk=2E  i'm sure eve=
n just saving the last node in a 1-entry cache would improve time there, or=
, better, a 4-entry cache (one per level)

although it sounds weird talking in a timeframe that is literally 100,000 =
times slower than what anyone else is used to, if improved it results in dr=
amatic reduction in boot times for embedded IoT e=2Eg BMC systems=2E

>> however in the interim, the attached patch suffices by manually
>> altering the clock in microwatt=2Edts to match that of the SYSCON
>> parameter=2E
>
>There is a dt_fixup_clock() that's used by a few platforms=2E Can we
>read that parameter say in linux/arch/powerpc/boot/microwatt=2Ec
>platform_init() and fix it up there?
>
>How do you even read the SYSCON parameter for frequency?

SYSCON is just a term for a memory-mapped wishbone ROM which contains a cr=
ude easily-decoded binary form of devicetree=2E

when you read 0xc0001000 (say) its contents tell you the clock speed=2E

at 0xc0001008 is the number of UARTs=2E
0xc0001010 contains the UART0 speed or well you can see the real contents =
syscon=2Evhdl

it is _real_ basic but contains everything that
a cold-start BIOS needs to know, such as "do i even have DRAM, do i have a=
n SPI Flash i can read a second
stage bootloader from" etc etc

https://github=2Ecom/antonblanchard/microwatt/blob/master/syscon=2Evhdl

Paul said it was always planned to do reading of these params, the entries=
 in devicetree are a temporary hack=2E

l=2E
