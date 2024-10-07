Return-Path: <linuxppc-dev+bounces-1782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6739923B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 06:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMRWn2sWCz2yDl;
	Mon,  7 Oct 2024 15:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728276565;
	cv=none; b=To21Jl/5oQMVxYLalCX9YOnikgREW26/78+JPCMSzmK9PPkZM1CjOHbsi+Cyx0Rt/x1wLItUBi/NW61P5v0N4Jf2mD2uUsfoYUJ3bZ2WRdpjr4JjlSUhUhOqos/+e7OpHOvrwk7fgWCe9CnGtV5gYMqSbaWHyVmHSA9aX/HjbIxU8ifAbdPM3tPq5vdAkDHvjFYH4187S9TR952hmUcXj2BhUAYRPh7AKTSKhSMuPQidN5cGX1qk6DZeh16jh8LKtdhothPvkELqncAV7iWYHwkU7Dt8eD68sTPWV/75TW6RAvuWivtoylS4AwXP7Tpbp0iyeIwwSF4PRzACG/osMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728276565; c=relaxed/relaxed;
	bh=1lvwQPOid1i1r42ZkZnh/p8pKa/FUX1d5F+Gn+3bK3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLktQ04mulQ2bTdoLfyo7AwfeyP5qXapcyD290nMVTDNf7qlHbydHO0nUJF5ZAkLO+Ra86OyGZ/thDureeivDdeeoQHZ9mv+ixz7B9BC9iXv7PEM1kD1l8O25+St1gy2TjcCs1uUKlRvxPkVFt3WX/ldcax4jx0VlMUPfva5Pm70lKEX5aEbDgHQdN4ZNpDAKFT9IIMVAclaykHwh3VqFxGqC2ChsBr+N1ow3ShG9bW4qOIlnqSBJAJ3EZaeKh24NhUwN5cJ6PrB2BDhn+q5OLKq5HPiBwNrA9HG5ClJY7Yx5GPkyC8M1oz9EIPkOltFgYvP8Eme3SQtPPPuwLsJLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kN6aeamt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kN6aeamt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMRWl2Wftz2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 15:49:22 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5389917ef34so4408791e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Oct 2024 21:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728276557; x=1728881357; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lvwQPOid1i1r42ZkZnh/p8pKa/FUX1d5F+Gn+3bK3Q=;
        b=kN6aeamtaadZhfrQc7oXMSIWO0X61ZFMclKbjtNai53G1QhL0WIj/IDv1m8rMxrKX3
         ejnF3oqG1wKX/gqaszYi9nCOx/QltrzXM4M9eZ8NWW7FSv+UfKx1idGxfg04PgxQ81SN
         8a9FxB2CxslmxA2VbUeXBrFNArhDaGxn5qXWCN9N19xVLwwXwnAlcgzCJrhYKPdYGXDE
         u81GNzdpl6HARPAjJVC8OkFPZ2qb+dKw3OWtUysKvlWuMKhr/HfybfcS1++WErld4+kj
         Qvb+G1t4tB/N4gESgn0zf6EvEsiAW1+PNy6QDY8N5B6ZSVHGOjvyyvTC79XW30abPo1q
         lTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728276557; x=1728881357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lvwQPOid1i1r42ZkZnh/p8pKa/FUX1d5F+Gn+3bK3Q=;
        b=qQjD+8vxAbfYI1/MhaTv0l0Cb32q1Xs1xNWKCeepQVIkXok8o1s0AZ8/+iQTuQp9QR
         I4M+8y/HPkVzWcOXCifLg3v/DhsMe2jbpzp47lqovVHz0imc0IJxgfsvbWdGRdanMr/h
         bE8K7pgAIzMjWyWQECWtDqwl+Tz+z7o9uJ7gk+wk2o8ib99XURu82zoASUvFhyHzmJ6h
         iP0C1VT6nPst1VpsbxQ3wG3T8TKmxAq43kYpP579MR3mUsSf9Mr9vKVsy4gKZY3tkmLb
         0m7jnEB/LL8fF2E32UEwtKo5SyB8YoDvaNAt2ynrkCYIxzS25yEuZcers40a2Lx6PR2E
         5Rng==
X-Forwarded-Encrypted: i=1; AJvYcCXs2LTUD7g6iwpo2Go/083bqHOieO9Y6R++LCIPgv3vIs4LqRYxirSfTsvpH8z5M43YPlkEC209zvN7M/M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4QTXrm0LjEJlhX9IhBviTYeavAi6+1P4TaMDALRwQqYtGgcKH
	BkFwf+deST4eEqIgzF6h+oJ2YGofJ2XA4Dc2vYZcT99NYJzYcSGYOULwXpTxubSK9WJOAED/lfZ
	PraTUSPhxkMmIOrsIJaAVlvB2DN4=
X-Google-Smtp-Source: AGHT+IEqYdkAsBK40ts4UhEMsF1yFermt8J6Dvxy5IFPcLo+Hv58lpgoIpYRR++uyhCFnESMlrPik/53JXVKb3ATJUg=
X-Received: by 2002:a05:6512:4019:b0:52e:9e70:d068 with SMTP id
 2adb3069b0e04-539ab85b365mr4201855e87.4.1728276556297; Sun, 06 Oct 2024
 21:49:16 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241003060650.18454-1-wuhoipok@gmail.com> <d2704a2b-ceb2-4919-81d3-f6ff58a734fe@xenosoft.de>
 <c868e394-b1ad-4f30-b27b-c779e3458c42@csgroup.eu>
In-Reply-To: <c868e394-b1ad-4f30-b27b-c779e3458c42@csgroup.eu>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Mon, 7 Oct 2024 12:49:04 +0800
Message-ID: <CANyH0kDWaS8mavzuUeH4CPHBN9kBQ3hcCGjWA8U0UU2_y=5Gnw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add late_register for connector
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, 
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au, 
	Christian Zigotzky <info@xenosoft.de>, Darren Stevens <darren@stevens-zone.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thank you. I am looking at the problem now.

On Mon, Oct 7, 2024 at 1:37=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/10/2024 =C3=A0 18:56, Christian Zigotzky a =C3=A9crit :
> > On 03 October 2024 at 08:06 am, Wu Hoi Pok wrote:
> >> This is a fix patch not tested yet,
> >> for a bug I introduce in previous rework of radeon driver.
> >> The bug is a null dereference in 'aux.dev', which is the
> >> 'device' not registered, resulting in kernel panic. By having
> >> 'late_register', the connector should be registered after
> >> 'drm_dev_register' automatically.
> >>
> >> Please help testing thank you.
> > Hello Wu Hoi Pok,
> >
> > Thanks a lot for your patch. Unfortunately there is a new issue after
> > patching the RC1. Could you please fix the following issue?
> >
> > Thanks,
> > Christian
> >
> > ---
> >
> > Linux fienix 6.12.0-rc1-2-powerpc64-smp #1 SMP Fri Oct  4 08:55:45 CEST
> > 2024 ppc64 GNU/Linux
> >
> > [   29.167145] systemd[1]: Sent message type=3Dsignal sender=3Dn/a
> > destination=3Dn/a
> > path=3D/org/freedesktop/systemd1/unit/NetworkManager_2eservice
> > interface=3Dorg.freedesktop.DBus.Properties member=3DPropertiesChanged
> > cookie=3D103 reply_cookie=3D0 signature=3Dsa{sv}as error-name=3Dn/a
> > error-message=3Dn/a
> > [   29.542140] systemd-journald[1301]: Successfully sent stream file
> > descriptor to service manager.
> > [   29.561863] BUG: Kernel NULL pointer dereference on read at 0x000000=
00
> > [   29.567156] Faulting instruction address: 0xc000000000c973c0
> > [   29.571574] cpu 0x1: Vector: 300 (Data Access) at [c000000006f97640]
> > [   29.576637]     pc: c000000000c973c0: .drm_gem_object_free+0x20/0x70
> > [   29.581708]     lr: c000000000d28dd8: .radeon_bo_unref+0x58/0x90
> > [   29.586428]     sp: c000000006f978e0
> > [   29.588695]    msr: 9000000000009032
> > [   29.590962]    dar: 0
> > [   29.591925]  dsisr: 40000000
> > [   29.593496]   current =3D 0xc0000000085b1f00
> > [   29.596286]   paca    =3D 0xc00000003ffff680     irqmask: 0x03
> > irq_happened: 0x01
> > [   29.602119]     pid   =3D 1524, comm =3D Xorg.wrap
> > [   29.605257] Linux version 6.12.0-rc1-2-powerpc64-smp
> > (geeko@buildhost) (powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU ld
> > (GNU Binutils; devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 SMP
> > Fri Oct  4 08:55:45 CEST 2024
> > [   29.623892] enter ? for help
> > [   29.625487] [c000000006f97960] c000000000d28dd8
> > .radeon_bo_unref+0x58/0x90
> > [   29.631083] [c000000006f979e0] c000000000e287b0
> > .radeon_vm_fini+0x260/0x330
> > [   29.636765] [c000000006f97aa0] c000000000d07c94
> > .radeon_driver_postclose_kms+0x1a4/0x1f0
> > [   29.643579] [c000000006f97b30] c000000000c9374c
> > .drm_file_free+0x28c/0x300
> > [   29.649174] [c000000006f97be0] c000000000c93900 .drm_release+0x90/0x=
170
> > [   29.654508] [c000000006f97c70] c000000000304790 .__fput+0x120/0x3b0
> > [   29.659495] [c000000006f97d10] c0000000002fe0fc .__se_sys_close+0x4c=
/0xc0
> > [   29.665004] [c000000006f97d90] c000000000025bac
> > .system_call_exception+0x22c/0x260
> > [   29.671295] [c000000006f97e10] c00000000000b554
> > system_call_common+0xf4/0x258
> > [   29.677164] --- Exception: c00 (System Call) at 00000000006b2b48
> > [   29.681876] SP (fff4b3d0) is in userspace
> > [   29.684577] 1:mon>  <no input ...>
> > [   31.666727] Oops: Kernel access of bad area, sig: 11 [#1]
> > [   31.670829] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 A-EON Amiga=
one X1000
> > [   31.676144] Modules linked in: snd_hda_codec_idt
> > snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg
> > snd_hda_codec snd_hda_core dm_mod
> > [   31.688703] CPU: 1 UID: 0 PID: 1524 Comm: Xorg.wrap Not tainted
> > 6.12.0-rc1-2-powerpc64-smp #1
> > [   31.695932] Hardware name: pasemi,nemo PA6T 0x900102 A-EON Amigaone =
X1000
> > [   31.701417] NIP:  c000000000c973c0 LR: c000000000d28dd8 CTR:
> > c000000000d07af0
> > [   31.707250] REGS: c000000006f97640 TRAP: 0300   Not tainted
> > (6.12.0-rc1-2-powerpc64-smp)
> > [   31.714128] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI> CR:
> > 28002222  XER: 20000000
> > [   31.720773] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
> >                 GPR00: c000000000d28dd8 c000000006f978e0
> > c00000000207a800 c0000000085f5468
> >                 GPR04: 0000000000000b9b 0000000000000b9a
> > 0000000179779000 c0000000086a4b00
> >                 GPR08: 0000000000000000 0000000000000000
> > 0000000000000001 0000000000000000
> >                 GPR12: 0000000048002202 c00000003ffff680
> > 0000000000000000 0000000000000000
> >                 GPR16: 00000000006e3318 0000000000000001
> > 00000000006e289c 0000000000000063
> >                 GPR20: 00000000c04064a0 00000000007f0088
> > 00000000fff4c734 00000000007d165c
> >                 GPR24: 00000000007d1668 c000000024b6a220
> > c000000003588000 c000000024b6a200
> >                 GPR28: c000000003b3cc00 c000000024b6a248
> > c000000002d48820 c0000000085f5468
> > [   31.778903] NIP [c000000000c973c0] .drm_gem_object_free+0x20/0x70
> > [   31.783701] LR [c000000000d28dd8] .radeon_bo_unref+0x58/0x90
> > [   31.788062] Call Trace:
> > [   31.789199] [c000000006f978e0] [c000000006f97990] 0xc000000006f97990
> > (unreliable)
> > [   31.795388] [c000000006f97960] [c000000000d28dd8]
> > .radeon_bo_unref+0x58/0x90
> > [   31.801142] [c000000006f979e0] [c000000000e287b0]
> > .radeon_vm_fini+0x260/0x330
> > [   31.806982] [c000000006f97aa0] [c000000000d07c94]
> > .radeon_driver_postclose_kms+0x1a4/0x1f0
> > [   31.813954] [c000000006f97b30] [c000000000c9374c]
> > .drm_file_free+0x28c/0x300
> > [   31.819707] [c000000006f97be0] [c000000000c93900] .drm_release+0x90/=
0x170
> > [   31.825197] [c000000006f97c70] [c000000000304790] .__fput+0x120/0x3b=
0
> > [   31.830342] [c000000006f97d10] [c0000000002fe0fc]
> > .__se_sys_close+0x4c/0xc0
> > [   31.836010] [c000000006f97d90] [c000000000025bac]
> > .system_call_exception+0x22c/0x260
> > [   31.842460] [c000000006f97e10] [c00000000000b554]
> > system_call_common+0xf4/0x258
> > [   31.848476] --- interrupt: c00 at 0x6b2b48
> > [   31.851267] NIP:  00000000006b2b48 LR: 00000000006b2b20 CTR:
> > 0000000000000000
> > [   31.857101] REGS: c000000006f97e80 TRAP: 0c00   Not tainted
> > (6.12.0-rc1-2-powerpc64-smp)
> > [   31.863978] MSR:  100000000200f032 <HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR=
:
> > 28002400  XER: 00000000
> > [   31.871235] IRQMASK: 0
> >                 GPR00: 0000000000000006 00000000fff4b3d0
> > 00000000f7b7f3a0 0000000000000003
> >                 GPR04: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> >                 GPR08: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> >                 GPR12: 0000000000000000 00000000007efff4
> > 0000000000000000 0000000000000000
> >                 GPR16: 00000000006e3318 0000000000000001
> > 00000000006e289c 0000000000000063
> >                 GPR20: 00000000c04064a0 00000000007f0088
> > 00000000fff4c734 00000000007d165c
> >                 GPR24: 00000000007d1668 00000000fff4b400
> > 0000000000000001 0000000000000001
> >                 GPR28: 00000000fff4b46c 0000000000000000
> > 00000000007bfff4 0000000000000003
> > [   31.926053] NIP [00000000006b2b48] 0x6b2b48
> > [   31.928930] LR [00000000006b2b20] 0x6b2b20
> > [   31.931720] --- interrupt: c00
> > [   31.933466] Code: ebe1fff8 7c0803a6 4e800020 60000000 7c0802a6
> > fbe1fff8 7c7f1b78 f8010010 f821ff81 60000000 60000000 e93f0140
> > <e9290000> 7d2a0074 794ad182 0b0a0000
> > [   31.946913] ---[ end trace 0000000000000000 ]---
> >
> >
>
> That's a NULL pointer dereference in drm_gem_object_free().
>
> Trying to read obj->funcs->free while obj->funcs is NULL.
>
> Christophe

