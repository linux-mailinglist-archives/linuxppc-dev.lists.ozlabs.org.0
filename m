Return-Path: <linuxppc-dev+bounces-14164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B08C5B06A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 03:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d71fC41zKz2yv7;
	Fri, 14 Nov 2025 13:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763088195;
	cv=none; b=kaJxi1QJP0yPTsNhIwLyEnyU7asly98deGRKT1hajUpdY5q3gNUqLeJs2v5R80H4mUTdkDsIwnfNgG1loVyy7XXASAy+UqrN7pi+RbwTqY22NGoznVgAQkzGMdQLl9TkN+u/Yb5d2wYCOrfG58aJ201HybyP6M/Z2kC9Jj+RwTWFroVo7MGGKRPdaeT7LOAzUl8hEQu35nRoRQZvYGM1Y2tILuwa9T83HPauqJ4w04N7fc3n2RNO45dVl+QkCkYSIVoMYUt4E5aKD6a24Bh7sT8IM9wJ8w7r6ldDp/Pn93rCrNNr/9OOKjcWRtCaGI3oC0DpAW490K4rC6Lv1fwD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763088195; c=relaxed/relaxed;
	bh=/9p8Kvwo1kz51BmtbITeiTCgMSd89NJ8yO2wuB4rXAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjLCH84X76gYqfxv+Q3ZAGyLjcrH2C28pf50+aPwwBGn0Or7UtHvejOSAUMCCDNVwS5TllTw4HcDq6stSXCB89v5SEJLHC4F0z2kN+6YeWs0Tzn92lW+6ykZZ/ziPAzKLpEEDoVUVleikrc/pRFzmkyMcbmxJwxON2UP6/mCca4+Tfg04udR2QXzkSK1/hxgd73dwicMLn4xMOhdQTlE5uhRut1ujukaZRGTk4trptBHDspyuMgqQYAc5vmcz3NGmDAl9Msqnp3JbV18vs6KB6l+wNCvtMJXBLbtDuvnDHZPi3K/k05P6gs6ZxxFMtP0G7DInTpjgyst7xGuqvxbFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZvJjV2BM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZvJjV2BM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d71f963Nsz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 13:43:12 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so245454066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 18:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763088188; x=1763692988; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9p8Kvwo1kz51BmtbITeiTCgMSd89NJ8yO2wuB4rXAU=;
        b=ZvJjV2BMRygEjd56iHL5qiSaGCSiWn6zzn79HxMXAdJaOR/KPX50SGl1qkMmQtthiG
         fJtlkIiIdtvlFSXNFU7c4n438jaw+WUQfcrIPTdcOUQrwoFE8mdvgmfGKATb47jNkQKt
         Dc3AK13g/IUy0qUjdx0bOTzkGGqPJ3NX4U9HNNxYxOxvh+655+YWdiIbU3vfoulCsiF8
         hqgpA0HOM9ulZGs4/AfWaebGDte7bkhD7+kolcafR5clBJ85Nrb6B1l0rRmOWekWuXR0
         n0zUAcaKbthFOAGqzDv75F0grCB6QnwTephmpj7B5N+eDcriqd9c1A7AQKPz2nE3Pi8E
         +n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763088188; x=1763692988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9p8Kvwo1kz51BmtbITeiTCgMSd89NJ8yO2wuB4rXAU=;
        b=Ei0F4pfp54Nhnmfr4vbMJKfHZIYKHC9qptx4M9O346HDzEvX+WcRkc4x184OeQEAm/
         0VFYIrb7uA5Hv6e5Le4lJpaFprx75WPvBb/NXXU3zC7cKdtX9mHhgC7gOZG328Q4Moaw
         rlMD3MGIQPTK9kl2CyKlEgKm2tgM6QMkwP4C5MYbkcw/propWU79mVZzfPskBg40oD8Z
         DC7aQxG2Q/XGD/5z6wWhXf1f1PC9cMtm5DbslrIeXxDaY9zHEwOcEkeQm7EfK+X/Y9mU
         cCq2W5TelGlezJAAFbDDIBCVklCf4fz75poVChv99GTp9oEm9svfE7vMNEeXbexvpu6i
         2ACg==
X-Gm-Message-State: AOJu0YxUa59zqR8oaeB4zpL4fXcf9dICm+ifjBAf7AiwVfMR8YYGdWgm
	WoFbOXt4LngvvWX3YACUkC9o4Ax8OvAgt4ZWGQQ9Jr1tREIbcl2B1x9d4E5/vJmO5F+KcrdjVp5
	y5mlueyzxdP2GhGkVKmKU6M04TFpwgwE=
X-Gm-Gg: ASbGncu+aEsd+N/mdqIuvyGab99sXXkrvVwz3L6qVTK72KEkaK+Q2i9mWnfqbiY2B04
	/HRvng8LmSjHZrhTE7FGnaNLg80vhOaunXvRasL4M8PuXnYepKMIqY49uHByITAjRou0ztjtLRH
	ey+f/VyTv3E5PZUYbslFeol4DlpTAhjLBPX1/wM0MhsPHplKPq7nZ0pGDrknfa8uQNkWouytx4D
	I3GIrt29oO3temT+o/HewE2hAKsF3gK3yh8rOfOc3wgnOBXGgNLbA9bZD4=
X-Google-Smtp-Source: AGHT+IF/d0XuC3vWUlMjqkMu0Ycjcr4aiIqGf7qdAls2LE6YFzHmmcv1pSa2A9f6oXycjqB9W9xTDpoIn8DWZSlPc2I=
X-Received: by 2002:a17:907:1c82:b0:b73:4006:1884 with SMTP id
 a640c23a62f3a-b7367b8d999mr159245966b.37.1763088188460; Thu, 13 Nov 2025
 18:43:08 -0800 (PST)
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
References: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
 <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com> <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com>
In-Reply-To: <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 14 Nov 2025 13:42:56 +1100
X-Gm-Features: AWmQ_bk0yOOHbj2tlv1ddOdjGrM_Mwy4xqRPmpA5N16-I_DIZDjmuBSm1GYKJ10
Message-ID: <CAOSf1CEQPBrXBXkLkJ7o7VJYbrT1jXQDzqqe=FjRyKv62sfC0Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Kernel_halts_aft?=
	=?UTF-8?Q?er_Radix_MMU_init_on_booting_Linux_on_Zynq_version_of_Microw?=
	=?UTF-8?Q?att?=
To: Mohammad Amin Nili <manili.devteam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 9:32=E2=80=AFAM Mohammad Amin Nili
<manili.devteam@gmail.com> wrote:
>
> Well, I disabled all the early logs (now bootargs =3D =E2=80=9C=E2=80=9D =
in dts) and modified .config
> so that no earlycon.c gets compiled at all. The followings are the only c=
ompiled
> files within the `/derivers/tty/serial`:
>
> serial_base_bus.o, serial_core.o, serial_ctrl.o, serial_port.o, xilinx_ua=
rtps.o
>
> Now, I get no outputs during booting procedure which sounds normal, I gue=
ss.
> But still no luck getting to the rootfs or anywhere which actually initia=
lizes the
> `xilinx_uartps` driver and print something.

It might be reaching the rootfs. Initialising a console doesn't
necessarily mean anything is going to use it. Try adding console=3DttyS0
to your command line.

> Also please check shenki=E2=80=99s blogpost=E2=80=99s logs, if you have e=
nough time:
>
> https://shenki.github.io/boot-linux-on-microwatt
>
> Based on the blog post, I think there should be no problem to get the ear=
ly
> booting logs.

And yet you're having problems...

The series that blog post is based on added a udbg driver for the
potato UART they were using for microwatt development. The udbg driver
itself provides early console output and gets turned into hvc0 by the
hvc_udbg driver later on during boot. In your case you don't have
either of those things so you don't get any output. If you wanted to
do something similar you would need to implement a udbg driver for
your xilinx UART. That shouldn't be too hard to do, but fixing the
earlycon driver so it uses early_ioremap() might also work.

