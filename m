Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39C291D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 09:35:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459J7H4NcczDqhn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 17:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459J6345DHzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 17:34:18 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id j49so7803095otc.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 00:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Z+3LPVkvEfoWX5i7ie3Y/Hp/ghZqvzHw4rW94WsKAY=;
 b=Lt3PTIdkJMrMcybvxV1NmpWlK3GLLXdT6xJi2jU0uIBx6avHGC1hDPOHXFPoEv4DxY
 5+KRah43OyOo+W3DlwTKsM4uO35Ve+Pn+4EO/bkOEezyg/8Dv4Kp5hM4kVpLCHYvhIm6
 /ZzKIbTDuK5vlp9SWjvvpjMKIrh96dYnt0uNkRNEIz2N7Kh+ANyVi04k4m0QYER+K8Gn
 HKNVQ2kGKH55DPbSCP6eVXq/SZKxck9dH1vlTXXYV4SGaWnAtKu2vAJUq/n8ivFdRmyV
 5Qti5+Pn3yVp0V3POq2GosX++TkhoQr4UNe4c/YqStLRWlwlQG1sU4L4fpQChbXW9B2U
 GegA==
X-Gm-Message-State: APjAAAV8OLn6qTVP9fT7/9IwnJqr7Qer5okg5cJq9lfSQbiU4Bjk6rQE
 16IntLoY6a33nMuUCf7FoEHHgL52WN8+nlTAeKo=
X-Google-Smtp-Source: APXvYqw2euQJPf4yIOBJa8+4dq7W2oL8Y7TXiAnGqDO7Ne0A79hBDXlcEbOW1HJCMDGAlB+GsdrbGblBfrJeVmlQstY=
X-Received: by 2002:a9d:27c7:: with SMTP id c65mr60260474otb.335.1558683256356; 
 Fri, 24 May 2019 00:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
 <CA+7wUsxoCrqw5MH+8QrT4kVVC0AcwdgUu3Zuy+-GGU=bU1_ezg@mail.gmail.com>
 <225acfb1-2eed-ed7b-fd82-732a3f8b746a@c-s.fr>
In-Reply-To: <225acfb1-2eed-ed7b-fd82-732a3f8b746a@c-s.fr>
From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 24 May 2019 09:34:05 +0200
Message-ID: <CA+7wUsyKXpifPbURqhi3dssCYf_D8WfsZ2A4rL5RuaZOVBpZ_Q@mail.gmail.com>
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 8:12 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> On 05/23/2019 10:16 AM, Mathieu Malaterre wrote:
> > On Thu, May 23, 2019 at 11:45 AM Christophe Leroy
> > <christophe.leroy@c-s.fr> wrote:
> >>
> >>
> >>
> >> Le 23/05/2019 =C3=A0 10:53, Mathieu Malaterre a =C3=A9crit :
> >>>
> >>> I confirm powerpc/merge does not boot for me (same config). Commit id=
:
> >>>
> >>> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
> >>> 'next' and 'fixes' into merge
> >>
> >> I see in the config you sent me that you have selected CONFIG_KASAN,
> >> which is a big new stuff.
> >>
> >> Can you try without it ?
> >
> > With same config but CONFIG_KASAN=3Dn (on top of a27eaa62326d), I can
> > reproduce the boot failure (no change).
> >
> > Time for bisect ?
> >
>
> I found the issue. In order to be able to support KASAN, the setup of
> segments have moved earlier in the boot. Your problem is a side effect
> of this change.
> Function setup_disp_bat() is supposed to setup BAT3 for btext data.
> But setup_disp_bat() rely on someone setting in disp_BAT the values to
> be loaded into BATs. This is done by btext_prepare_BAT() which is called
> by bootx_init().
> The problem is that bootx_init() is never called, so setup_disp_bat()
> does nothing and the access to btext data is possible because the
> bootloader has set an entry for it in the hash table.
>
> But by setting up the segment earlier, we break the bootloader hash
> table, which shouldn't be an issue if the BATs had been set properly as
> expected.
>
> The problematic commit is 215b823707ce ("powerpc/32s: set up an early
> static hash table for KASAN)"
>
> Here is a dirty fix that works for me when CONFIG_KASAN is NOT set.
> Of course, the real fix has to be to setup the BATs properly, but I
> won't have time to look at that before June. Maybe you can ?
>
> diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.=
S
> index 755fab9641d6..fba16970c028 100644
> --- a/arch/powerpc/kernel/head_32.S
> +++ b/arch/powerpc/kernel/head_32.S
> @@ -162,7 +162,6 @@ __after_mmu_off:
>         bl      flush_tlbs
>
>         bl      initial_bats
> -       bl      load_segment_registers
>   #ifdef CONFIG_KASAN
>         bl      early_hash_table
>   #endif
> @@ -920,6 +919,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
>         RFI
>   /* Load up the kernel context */
>   2:    bl      load_up_mmu
> +       bl      load_segment_registers
>
>   #ifdef CONFIG_BDI_SWITCH
>         /* Add helper information for the Abatron bdiGDB debugger.

With above patch I can boot powerpc/merge just fine. Thanks Christophe !

$ dmesg | head
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Total memory =3D 512MB; using 1024kB for hash table
[    0.000000] Linux version 5.1.0+ (malat@debian.org) (gcc version
8.3.0 (Debian 8.3.0-7)) #12 Thu May 23 11:56:33 UTC 2019


> Christophe
