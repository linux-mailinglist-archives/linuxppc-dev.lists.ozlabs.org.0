Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C34A5733
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 07:28:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnw4746SBz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mTUEIvPx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mTUEIvPx; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnw3Q0Tt9z30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 17:27:59 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id j16so14594489plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 22:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=gj9kj0vJHS5uY+vWRzk07OLpJJnfKN9iF4H5jPcpDFE=;
 b=mTUEIvPxZcPoTgKUS7xTvYhYUpXwE2vIQ9azfbRa8mq56CnK41Xdn7RM5I44vU5ZLU
 Wbt2WbVv1fPG/ZbYmwApi6unLZgFcr/vvv624aVWTt236XsB8ZSn+ry3lGXFcg3le36z
 AxORrr2mJ6CDiE+gU291s1+9HM0Tfv3GRK8rJchEs9hVNSrzVrozdzoCCVPCacKSpF9Q
 3Zwey/S+VfOAP0q8QK6Ia2KVHOWyyBPUGAlJJJANEseOJOmYE7sIdUMI/qWRAEt5GgD+
 hQRkJ2kN92X351nJkO4zJ910TduuZJjTG5qrWvK5qauZCKHXgaQ3JUF+u8ohnEyfHu05
 cm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gj9kj0vJHS5uY+vWRzk07OLpJJnfKN9iF4H5jPcpDFE=;
 b=hIYVlVkgzwEPnN7hN1cKz+Ll+PQOTFuAX8ufGfRcNnt//93OBzdswn22XSAPFoufw6
 4MizS7tPVSRQtfxmJqXtwWpoYUAQPV9tbxuxR5vsaUr49assxodN13Sk0+W3JaZ8+xJ1
 NiNrS3+ymo6aY0l+SWqDVcp3xErkKRYzGhIEMvVjKYD7agm3QKWHDkVR8jOmqT/UOxDb
 dRsotSmwxT5MPGXldfLU/lD03zO+IF5TbSnbVYtYv/C/iJMvJu/d1hi3o61rtI1P/c5Q
 WAYxQ4cJvNmxgfSTMPhGDpn9XbH9RgCT8iNRHZNcPKsDuN7xOaUedYYNhG1QvsWJztWz
 ejxA==
X-Gm-Message-State: AOAM531NOEWUlTr2QEZ1NNSBajUcP0++15pUeYExBwA5LfDYTq4IpFIM
 VQwK178JIVoia4/BYXawMGU=
X-Google-Smtp-Source: ABdhPJzv1lU7NeDaPaeDyrw9sx4OztLQQYpRsG2GQzcT7JKRf63pfpmHCpz8Wx+NqTmxrqBDl2+GQQ==
X-Received: by 2002:a17:903:1207:: with SMTP id
 l7mr24213270plh.19.1643696876711; 
 Mon, 31 Jan 2022 22:27:56 -0800 (PST)
Received: from localhost ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id j2sm18268283pfc.209.2022.01.31.22.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:27:56 -0800 (PST)
Date: Tue, 01 Feb 2022 16:27:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: microwatt booting linux-5.7 under verilator
To: Libre-Soc General Development <libre-soc-dev@lists.libre-soc.org>,
 linuxppc-dev@lists.ozlabs.org, Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 lkcl <luke.leighton@gmail.com>, openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
 <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
In-Reply-To: <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
MIME-Version: 1.0
Message-Id: <1643696448.f3llnvzeyb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from lkcl's message of January 31, 2022 2:19 pm:
>=20
>=20
> On January 31, 2022 3:31:41 AM UTC, Nicholas Piggin <npiggin@gmail.com> w=
rote:
>>Hi Luke,
>>
>>Interesting to read about the project, thanks for the post.
>=20
> no problem. it's been i think 18 years since i last did linux kernel work=
.
>=20
>>> i also had to fix a couple of things in the linux kernel source
>>> https://git.kernel.org/pub/scm/linux/kernel/git/joel/microwatt.git
>>
>>I think these have mostly (all?) been upstreamed now.
>=20
> i believe so, although last i checked (6 months?) there was some of dts s=
till to do. instructions online all tend to refer to joel or benh's tree(s)
>=20
>>> this led me to add support for CONFIG_KERNEL_UNCOMPRESSED
>>> and cut that time entirely, hence why you can see this in the console
>>log:
>>>=20
>>>     0x5b0e10 bytes of uncompressed data copied
>>
>>Interesting, it looks like your HAVE_KERNEL_UNCOMPRESSED support
>>patch is pretty trivial.=20
>=20
> yeah i was really surprised, it was all there
>=20
>> We should be able to upstream it pretty
>>easily I think?
>=20
> don't see why not.

Okay then we should.

>=20
> the next interesting thing which would save another hour when emulating H=
DL at this astoundingly-slow speed of sub-1000 instructions per second woul=
d be in-place execution: no memcpy, just jump.
>=20
> i seem to recall this (inplace execution) being a standard option back in=
 2003 when i was doing xda-developers wince smartphone reverse-emgineering,=
 although with it being 19 years ago i could be wrong

Not sure of the details on that. Is it memcpy()ing out of ROM or RAM to=20
RAM? Is this in the arch boot code? (I don't know very well).

>=20
> other areas are the memset before VM is set up, followed by memset *again=
* on.individual pages once created.  those are an hour each

Seems like we could should avoid the duplication and maybe be able to=20
add an option to skip zeroing (I thought there was one, maybe thinking=20
of something else).

>=20
> another hour is spent on early device tree flat walking.

Are you using optimize for size? That can result in much slower code in
some places. In skiboot we compile some of the string.h library code
with -O2 for example.

Thanks,
Nick

>=20
> one very big one (90+ mins) is the sysfs binary tree walk.  i'm sure even=
 just saving the last node in a 1-entry cache would improve time there, or,=
 better, a 4-entry cache (one per level)
>=20
> although it sounds weird talking in a timeframe that is literally 100,000=
 times slower than what anyone else is used to, if improved it results in d=
ramatic reduction in boot times for embedded IoT e.g BMC systems.
>=20
>>> however in the interim, the attached patch suffices by manually
>>> altering the clock in microwatt.dts to match that of the SYSCON
>>> parameter.
>>
>>There is a dt_fixup_clock() that's used by a few platforms. Can we
>>read that parameter say in linux/arch/powerpc/boot/microwatt.c
>>platform_init() and fix it up there?
>>
>>How do you even read the SYSCON parameter for frequency?
>=20
> SYSCON is just a term for a memory-mapped wishbone ROM which contains a c=
rude easily-decoded binary form of devicetree.
>=20
> when you read 0xc0001000 (say) its contents tell you the clock speed.
>=20
> at 0xc0001008 is the number of UARTs.
> 0xc0001010 contains the UART0 speed or well you can see the real contents=
 syscon.vhdl
>=20
> it is _real_ basic but contains everything that
> a cold-start BIOS needs to know, such as "do i even have DRAM, do i have =
an SPI Flash i can read a second
> stage bootloader from" etc etc
>=20
> https://github.com/antonblanchard/microwatt/blob/master/syscon.vhdl
>=20
> Paul said it was always planned to do reading of these params, the entrie=
s in devicetree are a temporary hack.
>=20
> l.
>=20
