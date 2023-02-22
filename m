Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3B69F112
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:14:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM9T22zFLz3cK5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I0Oo+Nla;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=jencce.kernel@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I0Oo+Nla;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM9S62M3qz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:13:25 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id cf8so7587041ybb.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 01:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6a4YhtYQMpphc+YPS7agPVIdZsgacEWmaqhtKEOVpzg=;
        b=I0Oo+Nla6WUq2AUPYY9zBmh7a7YS91onpZLYxV3/9Kb4KniDqukZha+PFYuC7+xLZy
         H1xcBmENbjGmPI7kWxKncIwmoTjvFahbnbjSmPdIH7ipl8XX6UNzHybFMlM+3ZCpgZ37
         jVH6/vd+ZQmBbZaT5vMB6t4mYObOeLCeysOSJxkkSVBA+tlP2xd6AS+GCglndcP9KNrp
         QqO1G8kQD/OH/TcmETuGTM6KCt98eycaaGUXTa4Z6sJBihilG2CTTr1I97LR2Tg+fK0T
         0d1e5ahK3UzP9fXuPY6QVWPKGqVnNwpCaBaXrq7t1FRk4vYq5HunrC7EEiZrAMyEV7B8
         Khcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6a4YhtYQMpphc+YPS7agPVIdZsgacEWmaqhtKEOVpzg=;
        b=F0f5PK3mDOTVjFJAS7vGbxAHf8Vmq9Vb2JYHHcljRuAbOGNCY5DBqcbIHp41UP7mKg
         x6mnkHzkwfLPLwqjzCsFeXF7hvlsbPvG5DqdySasDiLLYRCK4BG6umrmpcArJSmQQtbp
         1wgoAhg67Przy2QyNWd7HwXn4VMMRidcwso/YEzM5J3RMgBoIbsEZ3725oRGAdX05l2/
         Tu7tlVkbNwK+3J81PwQsnolHwy/2I6Pj/AbEszxEqdiN8pF7+9k9FnnUc+lkiAHKtu66
         NvTJBfANrpaLBYEYMbBgS0AlHOZhD0k96tppks//ciZ/LGFw1gYHLkWfirb+fSUuR/0k
         DVAg==
X-Gm-Message-State: AO0yUKVGmy6CkGyQo7fPl05GO0qNdmGj5z1c+4UHYzwaS0KoqNntpyDC
	V5Cr0yVrOoNFBOaj3TdvhyawVNlISccU8BlpXuo=
X-Google-Smtp-Source: AK7set+rj+FdnSnbLEbZTrTYAh5fFT+PFoHKokSyr7lnT8c+6+J6ijFFDVpMjbT+nfF7tGU3fl+qQUvUQvj5ygJzWXU=
X-Received: by 2002:a5b:f87:0:b0:8ff:dc75:b93d with SMTP id
 q7-20020a5b0f87000000b008ffdc75b93dmr514915ybh.261.1677057200661; Wed, 22 Feb
 2023 01:13:20 -0800 (PST)
MIME-Version: 1.0
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
In-Reply-To: <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
From: Murphy Zhou <jencce.kernel@gmail.com>
Date: Wed, 22 Feb 2023 17:13:09 +0800
Message-ID: <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
Subject: Re: linux-next tree panic on ppc64le
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-Next <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

next-20230221

I'll try powerpc/next.

On Wed, Feb 22, 2023 at 10:35 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 2/22/23 07:55, Murphy Zhou wrote:
> > Hi,
> >
> > [   59.558339] ------------[ cut here ]------------
> > [   59.558361] kernel BUG at arch/powerpc/kernel/syscall.c:34!
> > [   59.558373] Oops: Exception in kernel mode, sig: 5 [#1]
> > [   59.558384] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> > [   59.558397] Modules linked in: rfkill i2c_dev sunrpc ast
> > i2c_algo_bit drm_shmem_helper drm_kms_helper ext4 syscopyarea
> > sysfillrect sysimgblt ofpart ses powernv_flash enclosure
> > scsi_transport_sas ipmi_powernv at24 mbcache jbd2 ipmi_devintf
> > regmap_i2c opal_prd ipmi_msghandler mtd ibmpowernv drm fuse
> > drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
> > crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e aacraid vmx_crypto
> > [   59.558494] CPU: 29 PID: 6366 Comm: kexec Not tainted 6.2.0-next-20230221 #1
> > [   59.558508] Hardware name: CSE-829U POWER9 0x4e1202
> > opal:skiboot-v6.0.7 PowerNV
> > [   59.558521] NIP:  c000000000031e4c LR: c00000000000d520 CTR: c00000000000d3c0
> > [   59.558534] REGS: c000000097247b70 TRAP: 0700   Not tainted
> > (6.2.0-next-20230221)
> > [   59.558548] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:
> > 84424840  XER: 00000000
> > [   59.558570] CFAR: c00000000000d51c IRQMASK: 3
> > [   59.558570] GPR00: c00000000000d520 c000000097247e10
> > c0000000014b1400 c000000097247e80
> > [   59.558570] GPR04: 0000000084424840 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR08: 0000000000000000 900000000280b033
> > 0000000000000001 0000000000000000
> > [   59.558570] GPR12: 0000000000000000 c0000007fffcb280
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR16: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR20: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR24: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR28: 0000000000000000 0000000084424840
> > c000000097247e80 c000000097247e10
> > [   59.558689] NIP [c000000000031e4c] system_call_exception+0x5c/0x340
> > [   59.558705] LR [c00000000000d520] system_call_common+0x160/0x2c4
> > [   59.558719] Call Trace:
> > [   59.558725] [c000000097247e10] [c000000000031f18]
> > system_call_exception+0x128/0x340 (unreliable)
> > [   59.558743] [c000000097247e50] [c00000000000d520]
> > system_call_common+0x160/0x2c4
> > [   59.558759] --- interrupt: c00 at plpar_hcall+0x38/0x60
> > [   59.558770] NIP:  c0000000000f58dc LR: c00000000011277c CTR: 0000000000000000
> > [   59.558783] REGS: c000000097247e80 TRAP: 0c00   Not tainted
> > (6.2.0-next-20230221)
> > [   59.558796] MSR:  900000000280b033
> > <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 84424840  XER: 00000000
> > [   59.558821] IRQMASK: 0
> > [   59.558821] GPR00: 0000000084424840 c0000000972479e0
> > c0000000014b1400 000000000000041c
> > [   59.558821] GPR04: 0000000097ff4000 0000000000000200
> > c000000097247930 c0000007fe233ef8
> > [   59.558821] GPR08: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR12: 0000000000000000 c0000007fffcb280
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR16: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR20: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR24: 0000000000000004 c0000000ba704000
> > 00000000000000c6 c008000014d20000
> > [   59.558821] GPR28: 000000000417b200 0000000000000000
> > c0000000af848800 c000000097ff4000
> > [   59.558935] NIP [c0000000000f58dc] plpar_hcall+0x38/0x60
> > [   59.558946] LR [c00000000011277c] _plpks_get_config+0x7c/0x270
> > [   59.558958] --- interrupt: c00
> > [   59.558966] [c0000000972479e0] [c00000000011275c]
> > _plpks_get_config+0x5c/0x270 (unreliable)
> > [   59.558982] Code: 7c9d2378 60000000 60000000 39200000 0b090000
> > 60000000 e93e0108 692a0002 794affe2 0b0a0000 692a4000 794a97e2
> > <0b0a0000> e95e0138 794a07e0 0b0a0000
> > [   59.559018] ---[ end trace 0000000000000000 ]---
> > [   60.564314] pstore: backend (nvram) writing error (-1)
> > [   60.564336]
> > [   61.564343] Kernel panic - not syncing: Fatal exception
>
> Panic on what linux-next tag? Can you test powerpc/next tree?
>
> --
> An old man doll... just what I always wanted! - Clara
>
