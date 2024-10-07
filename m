Return-Path: <linuxppc-dev+bounces-1796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15A992CF4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 15:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMfpD2nTsz2ygG;
	Tue,  8 Oct 2024 00:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728307060;
	cv=none; b=QBWSWy4324VyO8cNjvqoGbDXwEpE12zp6X/QiNt1++HPjbCouDHbBGSNIU79J7fNBU4fdLokhQ3+fwxf4oAbczT3VHsppXpNh4V7yIiyKEffI2YwZmPXd9tKClSSWzyrVAFLOb7TEY6Jvwp300BuDYqzjqg8bwJcytVqFHnoqJjqyhv8KtHECyCGQ0kZ3jJc53QLANL1V3rdVCkJlj6HoBU1DBR7HX69KTGrvwz8ay+CTbBx0OfbZTeNEGj1HcYjcLQmGpH67XU398eoka8bpcrZsDyQNcaWyOgrlZQ1aczbuJQ0JvU8OLN1Z1YOl5BN19eCIeYgQVF9T/jf8mpC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728307060; c=relaxed/relaxed;
	bh=UzKiiQL3EI3IDr1l8nY/KAW6iC7df0rzMYPbYqPhEfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4axqN+hYKA5bH36B+vZRDSD8CcBdAA3vM6ibmsePvNpz6KLto6HSp3SfLl/uZp0GpJ3RF+RfdlnAeVo7tMvco185Eq/eiKTuGTDPLcAkz1UCeXPF1ADUZcDEgIdwvYgjigz2DlNNRtJopCQcZTYBM2yDIpaOhP7l85yL1IKHUU8J8u0cT0anDrpfTXikL1s8+N0LcYxPz8712O5efFKwnGzsfXfRHM3iQUuTIerOUddlJrBwmRj8x8D/C8G0L8bQe4nQHyVL1jy6pvYBE1/I4yfTUki9tqtNK8dQNHpBPfQ9rKkcgPO3eaL0BtbPr2q5762NI1jCcbha+e849YrJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cOFFepNN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cOFFepNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMfpB5S8fz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 00:17:37 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71dec222033so347773b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728307054; x=1728911854; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzKiiQL3EI3IDr1l8nY/KAW6iC7df0rzMYPbYqPhEfw=;
        b=cOFFepNNpb7h2yV4CFPYEVLHSbcNzZQ8X6b7TVV0lfKQcJxUDuFpyTg3IXRJH95umz
         QSwGXTAyIwQY+SKjoQy2dgHmJMmnFuxuGS6wEmihm3O1iquN1VKOWFcepgbs4Qmakpkh
         XJ+UU/3q73Y/dv+PYZTUUm7Vuk2YvqTnNIG8iFbfZeeqVOEjdVhrB5NiG05nOmO3YpcK
         LMi93H9xfWk5Ven77qpUeByPdj01O5Nu+5ErMysVvSIQAkRCgB6zdAH8UuidENymzVzn
         ZeOH7rQYXw13BouoNmHA+evrGujLWLuZoJjl9g3FOd0npECtz2S0JDDUUVGCoQlRk+/F
         +sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307054; x=1728911854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzKiiQL3EI3IDr1l8nY/KAW6iC7df0rzMYPbYqPhEfw=;
        b=g+ov7ZAUXmX0W8PF9sdHorbJeToXml/+NZVhXorrEMGcOeSc4Iyoa7oWw16rWIlHmr
         hBb+NE6ZQS/33lj3KAy1p/IdyxqoOiviPoMw5n8T+XJhrtBxZpQCpchpoWW9KFEGG0QE
         6+L6HBRJSD7E+J113vY/BI1Xb7SGmj/iBJ96H1aYtZqrRx0qH/4ZCJkqiDrfgN5ImOpu
         bqO7glcHaJm+rv3SMfUNMIkVjG416D+paGeV0iAIzW/9l/Lk3ms3iPmEqgxo0SeZ8D/g
         O3kWuNgAkcJph2hPfK+Mklw3fT9+GOFC1xiB+VYu2LObGQriOY/aQwh3F1exDfu8xDRC
         fXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxtXzZ1Qs97pSlf2JrjEheTHPZp2b9sie9o3mQLqZ2m/JbFce8zUioymDjkJX0mFLpxHvl0I6pC95ZMJM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqYeJvKv5tLLk4SmRY2VvOi7x3nvDM/BMhoOUh7BcpynVZD04O
	vKu8Vl8N8TEeczX5dYbaItFupzi5BjhDiXKt55NrOgPxby2H1qblLy0o08lH7JmGWZNRv1v5PCd
	725/y3sKRrmK/YVVDzVbwX2n6g7E=
X-Google-Smtp-Source: AGHT+IHxLqJ4yjEnteY4GLZxQXgFstmP9TCJO7FY4S0XvVp7wAzpcyXHsyNYeBqrDA9rqlZv30dQ0lfq1akuR5ulq1s=
X-Received: by 2002:a05:6a20:2591:b0:1cf:52f5:dc with SMTP id
 adf61e73a8af0-1d6dfa1e5bfmr8344894637.1.1728307054351; Mon, 07 Oct 2024
 06:17:34 -0700 (PDT)
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
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2024 09:17:21 -0400
Message-ID: <CADnq5_N8RgDKb=8Up8gnk2t=o5btFqhD0Y10qguyZxUzo2ysKA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add late_register for connector
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Wu Hoi Pok <wuhoipok@gmail.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

This is a different issue related to the radeon ttm to gem conversion.
@Christian Koenig is working on the fix.

Alex

On Mon, Oct 7, 2024 at 4:23=E2=80=AFAM Christophe Leroy
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

