Return-Path: <linuxppc-dev+bounces-14162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82935C5A519
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 23:32:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6w53737Mz2yv7;
	Fri, 14 Nov 2025 09:32:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763073159;
	cv=none; b=LyH30jzNQXCHPzNlx7T0wT2Yps691xYIB+QygorYtiLUiEOGu0M6t2Vo3IhCDDNzgVbVM8zoJVI3z8OZtkkVxoG9CwqT0iSi3t4NREgsZtfquvn39CmpVmsVNROkjwx83nh2M4BjYXXxmRd2HSLP7cM5KfEENq6eE/eoFWvMj0B4cP7mX6mK09TZMmTgyj1z+4ZCp2DqSAvIaF1KQEl3Y7uHGafrm5PCo9q/IO7fT0/ugo/XE2oe6gVChcMkfK9Sc28QlLqsm5MERz4xuSl6dejavYIsG+aHn45AhHd9HI0cCQpuIbRStgSfZnN+9rQNOgkUyMg6EV+VI6Jwc63acw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763073159; c=relaxed/relaxed;
	bh=oqfIb2AsLZ18FUcu13I3BhblJiPBNh67QC0c/VhsTKY=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=dY/315wyTLI2BEMIHVMwz5yF/eHWmj3rWd7mdACF81NgX38oDvC8ibYDX7gG1s3OWE52f/nmRKiFBCfv67uiGlYXWa5YSNnMw+3tkc4oB3UKFwgSlh9KVF64qj+osNvNd+rH5ZgZLe0zFoAueCNYBABA8pUbkdzdgcIleJiIPlBOYi3Lx/eAUazAanLttog0kPp8MpCfwqgyng7+Z1FKEuTvBRvsujwWoiiAbSSAsUpeJScCUwZARuDBzvNXRPJbmIVIrOkvYooEovy3GK7ge34Yl/cJlRBACeUTc8vvMbEtEDSxG2OqX2kqK1w8dIytA/zEElgVvART/U2txy5euA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jxdXRv9N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jxdXRv9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6w516tgcz2yjx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 09:32:36 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4e88ac010b0so1199391cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 14:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763073154; x=1763677954; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqfIb2AsLZ18FUcu13I3BhblJiPBNh67QC0c/VhsTKY=;
        b=jxdXRv9Nx2M3Iu+zwBwTb9jdsJ+QeLcBl1SFUsqsgcPdHVDytZvR/VtRhmCugYgs4Q
         biT7MyQgZRtGjnSGplRPKeH0ZDDsWdg5J0LG7uXu9ba33KsAyFf+OtWz37Q58U/gywlS
         BhwuW5trcBKbTf2eW+chEeDHt7ZXTIQzh4l5p2UsTUXHc4XKM+QkwfABI0qFJ2Iil/Mc
         dqBakjjzIKGRFJi77/c/Yw3uqFdCRVbRoumHmLupb2q9H87GxbeHcEI+ap6mYMxuiHpY
         UBqhE/8vmRdnhjpr9Fql2e6IpodPL38hbKT7yqImP25V/u8H9d/rwzJDpTeByY1/GCes
         Bkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763073154; x=1763677954;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqfIb2AsLZ18FUcu13I3BhblJiPBNh67QC0c/VhsTKY=;
        b=XVcspz2vJ1nW/yMTvjXMREtnVdnSGIAejK6NZhgsQXy9GQnPA4QOoKDjfnhl/zjolj
         D8pGkgWOhnC+I5an7kUzDdOGIPI7PkhjPRNYfu5fVrsm9i/Meqo5fn4oJREcoJUuGV5X
         itHPyo/MN2NhdoXWT4/fX6YEsQ32Izht/TUHXnkfOWEvHkONgPtUPtdWiuKpEIoBpdN1
         J3hMhBM7nm1VhMiCCm+9VqGpRjb09tyhSXN2HdfXuM+8zaHiz7rpUOo04Kd8Xb1OEwYU
         eUqilcPQvq5XGKNSBJ3xaz2xOESAd1wJo0y3Pb76ld2uLig45cmOAPHVNpkRrNqf4xuh
         W1sA==
X-Gm-Message-State: AOJu0YxWTrr6LeuEXDNvICgr8dst8zkgSt3QufXyyR8UZ8HA7jXO96+w
	Sj55H7P5+gTUa8JOWWkNXhMP1GFgcPq7nBVSi/TNuyKRhm5vpq/v0f9R
X-Gm-Gg: ASbGncvDW9TCkRn+vCLrPYFVKF9JqMhic7qCrhts4bGzGfyIQTlZDCOUvhuoxvJr6ex
	puYWj3Xy0iAkFhQekzr/W69Ba3BAF2WhpzTJLilpQzSTp8ijPJQH4yc6WiElFaRABtbT4xT8v7D
	4plT6ac6C+HkYMLHYH4HThykAUsGceSK8nFizJOGINXSrmiH7xLtE5bTqC86o9aRGhNR8GWgJ/D
	8tFgkBJYZusiqcoQ+TEpdBwvf5DB4M59SoVLAnuS8/OOUz72e13D1BVzwIPxXd3rvHOQ1iw+CUZ
	pNzbwMBFI1VbNWYKqKIGHE2WwjW/jRxY32Dr//8IOlXZRU3R0xppkpI0MyP5L9AbvKrl6GlsCJw
	INej6tfGbp7gkqHWIznpgKbjuS4i4Itykhv36tWajP8PYjkvg1ai9rU9Uhx0YL6IrREhN9KnG45
	GXIycAYNaN3Yh2e2dsaT6z8CXasOiZIDU+V1tyYyPDmUBUKw==
X-Google-Smtp-Source: AGHT+IFGiBuyEN0tTaBeBcwNAX8s/etCIai0EFteke5Agx5OZSjI49Dlytf2X6p/OGMsHAqsN3N0jg==
X-Received: by 2002:ac8:5743:0:b0:4ec:f075:50cb with SMTP id d75a77b69052e-4edf35bdeaemr7593741cf.2.1763073153435;
        Thu, 13 Nov 2025 14:32:33 -0800 (PST)
Received: from smtpclient.apple (ec2-3-87-7-19.compute-1.amazonaws.com. [3.87.7.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862c7fd3sm20062596d6.3.2025.11.13.14.32.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Nov 2025 14:32:33 -0800 (PST)
From: Mohammad Amin Nili <manili.devteam@gmail.com>
Message-Id: <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CD1337D0-509F-45D9-8F51-C422B394E1EA"
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
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: =?utf-8?Q?Re=3A_=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Ker?=
 =?utf-8?Q?nel_halts_after_Radix_MMU_init_on_booting_Linux_on_Zynq_version?=
 =?utf-8?Q?_of_Microwatt?=
Date: Thu, 13 Nov 2025 17:32:29 -0500
In-Reply-To: <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
To: Oliver O'Halloran <oohall@gmail.com>
References: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
 <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail=_CD1337D0-509F-45D9-8F51-C422B394E1EA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Oliver,
Thanks a lot for your time and the answer.

> Right, you turn on the MMU and the next time printk() is called the
> console driver tries to write to 0xFF00_0000. That's not a valid
> virtual address so it explodes. To make an address usable in both real
> mode (i.e. pre-mmu) and virtual mode you need to have the page tables
> setup so that virtual address maps to the same physical address.
> Setting up that mapping is what early_ioremap() does. That's why
> there's a warning telling you to use it.
>=20
> Based on the in-tree DTS files earlycon doesn't seem to be used on any
> powerpc systems. My guess would be that most ppc platform use udbg
> (very old, powerpc specific thing) rather than earlycon for this kind
> of super-early debug output. Considering you're getting console output
> via udbg I'd say just removing earlycon from your kernel command line
> will probably fix your issue.

Well, I disabled all the early logs (now bootargs =3D =E2=80=9C=E2=80=9D =
in dts) and modified .config
so that no earlycon.c gets compiled at all. The followings are the only =
compiled
files within the `/derivers/tty/serial`:

serial_base_bus.o, serial_core.o, serial_ctrl.o, serial_port.o, =
xilinx_uartps.o

Now, I get no outputs during booting procedure which sounds normal, I =
guess.
But still no luck getting to the rootfs or anywhere which actually =
initializes the
`xilinx_uartps` driver and print something.

Also please check shenki=E2=80=99s blogpost=E2=80=99s logs, if you have =
enough time:

https://shenki.github.io/boot-linux-on-microwatt =
<https://shenki.github.io/boot-linux-on-microwatt>

Based on the blog post, I think there should be no problem to get the =
early
booting logs.

Bests,
Manili=

--Apple-Mail=_CD1337D0-509F-45D9-8F51-C422B394E1EA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hi Oliver,</div><div class=3D"">Thanks a lot for your time =
and the answer.</div><br class=3D""><div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">Right, you turn on the MMU =
and the next time printk() is called the<br class=3D"">console driver =
tries to write to 0xFF00_0000. That's not a valid<br class=3D"">virtual =
address so it explodes. To make an address usable in both real<br =
class=3D"">mode (i.e. pre-mmu) and virtual mode you need to have the =
page tables<br class=3D"">setup so that virtual address maps to the same =
physical address.<br class=3D"">Setting up that mapping is what =
early_ioremap() does. That's why<br class=3D"">there's a warning telling =
you to use it.<br class=3D""><br class=3D"">Based on the in-tree DTS =
files earlycon doesn't seem to be used on any<br class=3D"">powerpc =
systems. My guess would be that most ppc platform use udbg<br =
class=3D"">(very old, powerpc specific thing) rather than earlycon for =
this kind<br class=3D"">of super-early debug output. Considering you're =
getting console output<br class=3D"">via udbg I'd say just removing =
earlycon from your kernel command line<br class=3D"">will probably fix =
your issue.<br class=3D""></div></div></blockquote></div><br =
class=3D""><div class=3D"">Well, I disabled all the early logs (now =
bootargs =3D =E2=80=9C=E2=80=9D in dts) and modified .config</div><div =
class=3D"">so that no earlycon.c gets compiled at all. The followings =
are the only compiled</div><div class=3D"">files within the =
`/derivers/tty/serial`:</div><div class=3D""><br class=3D""></div><div =
class=3D"">serial_base_bus.o, serial_core.o, serial_ctrl.o, =
serial_port.o, xilinx_uartps.o</div><div class=3D""><br =
class=3D""></div><div class=3D"">Now, I get no outputs during booting =
procedure which sounds normal, I guess.</div><div class=3D"">But still =
no luck getting to the rootfs or anywhere which actually initializes =
the</div><div class=3D"">`<span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">xilinx_uartps`&nbsp;</span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">driver and print something.</span></div><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></div><div class=3D""><font color=3D"#000000" =
class=3D"">Also please check shenki=E2=80=99s blogpost=E2=80=99s logs, =
if you have enough time:</font></div><div class=3D""><font =
color=3D"#000000" class=3D""><br class=3D""></font></div><div =
class=3D""><font color=3D"#000000" class=3D""><a =
href=3D"https://shenki.github.io/boot-linux-on-microwatt" =
class=3D"">https://shenki.github.io/boot-linux-on-microwatt</a></font></di=
v><div class=3D""><font color=3D"#000000" class=3D""><br =
class=3D""></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">Based =
on the blog post, I think there should be no problem to get the =
early</span></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">booting =
logs.</span></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">Bests,</span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">Manili</span></font></div></body></html>=

--Apple-Mail=_CD1337D0-509F-45D9-8F51-C422B394E1EA--

