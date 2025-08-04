Return-Path: <linuxppc-dev+bounces-10593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8BB1A524
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 16:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwfRw5DDQz3bvf;
	Tue,  5 Aug 2025 00:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754318588;
	cv=none; b=OptDZozA3cQo00/RrtpuWXJx19QlTrZIsMehGocFHA/jiuZG+TsJennb7tHGd6azZ65DNUOSp9JE9aLE0Mu8WpbzaMJLhhptEmgNs0EJzlVVcdQ4vJMFejQIC+r7AkMjAzhP49fovxiP+6XJoWWsMACW7HOnvg8qbVNMFBaguqoz16Ke5RhClngBxDdBOsO9DkOn/AwTK8R/axjD3KlbMcAbJJJbExwCJLGnQDaK5cAjZQU1M7APSsN6DEoiubzfGdCalM1wKfcDLrdcIq8cY87vQ4wmhR2WIf/3uNlVtPHmixwckK0OeA+qtvKIQSWDgYExVx2ttqCiXnv/+Sh9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754318588; c=relaxed/relaxed;
	bh=mZew77Vq4pRHzqWzeExKnFv5JWynzaRBAaz121Z9QjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7tXGfuNwme6MOPqcWZJ7Qf5GtG2YUYlWCN06QQFn/F/U/7XDsSl0RLpOJnIL0LH7+5RBPPHzSHVyNua13S7jLKVc/CiF2YbM46wgB+t2z4WyVJ1MO3pImLvdoQwW1cPYZaNM0iG6Fb1KurCrsBP2UcnP4xZbDKjPWs2r04iD3NvtS00PADqywoHvy5piYRlBCjkZLbhBBVvivV3bK+qUSlGy5iN+19M85Ut6J80wA7bLvlUW6jf0TqkCg2wkFPWoI9noiP59GdX57MGT2P6tfdoSnIgJfqdrlLxd/4dFtoDkIhLc2WnHI7kGFvHtJOqfhDZAaAyCI3qPkkefV1QdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SmthXkGM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SmthXkGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwfRv2fYDz3brH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 00:43:06 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b3f2f8469b7so456839a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754318584; x=1754923384; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZew77Vq4pRHzqWzeExKnFv5JWynzaRBAaz121Z9QjY=;
        b=SmthXkGMEmMH5NGUnUqTID2vhMJO2q28m+GR4p7C003o4txC1kK2/jrb3WDwy/LW2U
         os0h2u2/FpKuT4Yiqi1Vs7oqQV+Azj5176PoqtCR1Ja5M4GIimrMCGUyZZz/kkfap9KA
         htNoN5DOAiyEY75fX8fprnfykh90aHtYOXNmMqIDLtpVonq4BTScS4U04323ILFwF+vm
         n6GXDec/uGVqVOzRjIImmWFrQ2qRaaXVaTEKlLPaKmFTdCDU37Ytf5Jce8QoDD8idRvT
         lWpT9srdtrVaOER9MTq0zQS+1Suu0/qkqOAA1kfGEN22mQc1NhAUpQ2f7mjEJHskdQmN
         I0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318584; x=1754923384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZew77Vq4pRHzqWzeExKnFv5JWynzaRBAaz121Z9QjY=;
        b=xOOoonXfBHeNLull3GdqLTXHp61DhijKTp81ZPfSqxBf1AzfsPdLWb8fa8SNruYtzB
         VtLLt87u8Xrex2VNTo9n70SiRQ7HShR4RwY83ikNIjKxQiCvufbn3gd9UuATRSvbxt9l
         WInKYrialCAw5D6qWRC+HLOXps0kACQQSjUnR4tHtOtoqhhvxCIxCcdqBeJtCgo8wYOR
         zpg6TvCZuvz5rvv2mgVpSuEYRcuJDpsZSbnNMCEPlfXkJB51lo+0v0k7Nu1KDk60KRqn
         EUPxHbBx0Uj8u5QmXnOfyevGXGF10Qek+RGpbr1aozrba2Zar9GwNfRz8U6ukVI0iH64
         9UnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrpnsPST+v0PJw8vv9yqjXy36M3Qlk/sUvZFfYsn+EhYzC5McLoSrtUtOtiJzRCXvOjIiW93HU0HZiNbg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvWLPW/s2yDKF1vIJZNn+mbD3QiDF5jWlGkoS5ApixaNFPoQr1
	kWHzjac2bRMBIpbfRlqH6LnilG7ecS4MPg8h219oWgLwH5BqP0l4liBHrXQKeCXZDBWbm0eCEcf
	Zv4WQH4d7W06ZtNQs8k4VZA3FGkjBobc=
X-Gm-Gg: ASbGncvsQ8tI1LU75hpiQB2QL8MlUkHP2+28hg7COHqki4Ap9PVAXiJ/QBbOgDRwTAI
	PlWssIsLztsXMmnka+YWbaXUWCQSBhr2gkn415xAQaQulPMXjMI551L3dJJnzNrqmD+D0JvN5p0
	eFEPLmWXzOFBLnGbfqAVg7WpuKhIVrOdCz4L8bl/ai5k/ajndVrKFMs4dfjUJPV+y4+b7NAx6wL
	ryTyPEgb0ZlNF+svIs=
X-Google-Smtp-Source: AGHT+IHVSj80KJwNH4YI+iqSzNiYfR/hb1veI0XP1yIqG04eqM6MQ5Qn77isDPYP1PCASf4K/gj2u5ROXPDRru7U58U=
X-Received: by 2002:a17:90b:1804:b0:31f:55a7:6504 with SMTP id
 98e67ed59e1d1-321162c71c9mr6290659a91.5.1754318584479; Mon, 04 Aug 2025
 07:43:04 -0700 (PDT)
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
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de> <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
 <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de> <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
In-Reply-To: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 10:42:53 -0400
X-Gm-Features: Ac12FXxHnqxgWPlbY24YJlBB8xzNoT512tqD7nkD3769V9O-pXqwC-E-XOiQyJg
Message-ID: <CADnq5_OpJdbc4YKtV-9+5JyeKyqd4+irhT6OtFq_K9KJF24VSQ@mail.gmail.com>
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulaton
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	"R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>, 
	Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>, amd-gfx@lists.freedesktop.org, 
	alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 3, 2025 at 11:28=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hello,
>
> I have the same issue on another machine either. Blank screen during the
> boot. The Radeon graphics framebuffer device doesn't work anymore.
>
> Here is the modifed code from the DRM updates (drm-next-2025-07-30):
>
> -
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
> -
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b4=
2b9cba5d2

This change just bumps the driver version it shouldn't affect the fbdev.

> -
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2
> -
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2

This only affects acceleration, it should not affect fbdev.

What chip are you using?  Can you attach your full dmesg output?  Can
you bisect?  This cultrit could be a core drm change.

Alex

>
> Do you have a patch for reverting these modifications? I would like to
> revert these modifications for testing.
>
> Thanks in advance,
> Christian
>
> On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
> > Hello,
> >
> > Xorg doesn't work after the DRM updates drm-next-2025-07-30.
> >
> > Error messages:
> >
> > [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize
> > framebuffer -22
> > radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=3D=
-22)
> > brd module loadedm
> > lop: module loadd
> > mpt3ss version 52.10.00.00 loaded
> > nve nvme0: pci fuction 0002:04:0.0
> > fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
> > scs host0: sata_fs
> > ta1: SATA max DMA/133 irq 68 pm-pol 0
> > ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
> > ata1: Signatue Update detectd @ 0 msecs
> > scsihost1: sata_fsl[0m
> > ta2: SATA max UMA/133 irq 69 lm-pol 0
> > nvme nvm0: 4/0/0 defaul/read/poll queus
> > nvme0n1: p1 p p3 p4 p5 p6 p7[0m
> > drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze
> > framebuffer 22
> > fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/
> > fman@40000/ethernet@e6000 failed
> > radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22=
)
> > fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
> > sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
> >
> > Could you please check the latest DRM updates?
> >
> > Thanks,
> > Christian
> >
>

