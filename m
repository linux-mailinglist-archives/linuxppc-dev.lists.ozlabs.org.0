Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7B389C01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlwdX1lJQz300K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LYhMML5k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LYhMML5k; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flwd36cRhz2yXy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:45:57 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id h202so304338ybg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=klUT/WTsiAfGdXQJFg/88VDyVSdnwJsg1N3k6w/wmSY=;
 b=LYhMML5kcZgASEAsyj1C+0EqOi8WePxkJGBnwaVhPDkokNVYX7cbJ1XsXgaNG1MW14
 tw7DZE0yiYQL854l8cG9yFxe9/j5FAuSwL+KCX9BkA87f0W+uX477KTG6lWKDY5G6Uha
 Of0HqDQc8MtpkTykv9iMuyeSkKDumT3AXZATAsp2q7XnDcm+j6gbPSJOwxD35H7gxAJa
 0+OWMVZMxl+4dz/SXAPfwXyDL7WXlAYWDy8dFrcTobHKRyHUFyYc+Olldo9ONw/SfdNn
 79JkYkzSeQHiudAKf/250ISLBzcEKdconwYdkkgckgHw0R6AUGquPT3QhIT3dkns68sb
 v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=klUT/WTsiAfGdXQJFg/88VDyVSdnwJsg1N3k6w/wmSY=;
 b=JUn9Oq9P23j00jpp49bM7KZqUDQG3k6VPH6dlkpahoOqPyZO//9cpalEjHylLFWVgd
 Nq3fiWxNhspOBb/1eervEDsMFOjKqgqC378ff3ZLR9rT93GQSoXKjae9wtpW8wHynS6a
 8AGAORBg62+qFZxAvb1UEy30bubTrepaMas3IIDaRDEdqJfSYLFFLn31DL0l8QKUo5Wa
 MsKD/y5uvv8bkfRajHsqspbZH9BXdQm2f+FFj/Xw1THweIQK1saAE5qDrqaV66cN76LN
 y88MMCIph2qA6j1/6Dds2hEqCzel4QHBINsqnKFmfv2rlbHz5NhUrJD+1fmvh2AizCDA
 mESQ==
X-Gm-Message-State: AOAM533SVLDILyjOfjj7u2/O+WgiA8RkhsLZyj/81Z5LQ84TMR0VKPSG
 QGT6r8pgckx1ObvTA2ETE6r43/taYsIjSf2GlwU=
X-Google-Smtp-Source: ABdhPJyVm8fLmEO3+AnbxMxQCwGZWKJpHKu3GYqNfnMGID7kBIfJh96cND+K0QyupzQiTiNfhoCFgFObjkTuvCGjDYs=
X-Received: by 2002:a25:a87:: with SMTP id 129mr4091329ybk.377.1621482353894; 
 Wed, 19 May 2021 20:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-28-jniethe5@gmail.com>
 <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
 <1621411610.rhqg7trx2p.naveen@linux.ibm.com>
In-Reply-To: <1621411610.rhqg7trx2p.naveen@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 20 May 2021 13:45:42 +1000
Message-ID: <CACzsE9oUHycpJbFU0ppcWv3M4b97Ys_GtAZCrNpv52LTbLn+xg@mail.gmail.com>
Subject: Re: [PATCH v8 27/30] powerpc/kprobes: Don't allow breakpoints on
 suffixes
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 6:11 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> Christophe Leroy wrote:
> >
> >
> > Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit :
> >> Do not allow inserting breakpoints on the suffix of a prefix instructi=
on
> >> in kprobes.
> >>
> >> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >> ---
> >> v8: Add this back from v3
> >> ---
> >>   arch/powerpc/kernel/kprobes.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprob=
es.c
> >> index 33d54b091c70..227510df8c55 100644
> >> --- a/arch/powerpc/kernel/kprobes.c
> >> +++ b/arch/powerpc/kernel/kprobes.c
> >> @@ -106,7 +106,9 @@ kprobe_opcode_t *kprobe_lookup_name(const char *na=
me, unsigned int offset)
> >>   int arch_prepare_kprobe(struct kprobe *p)
> >>   {
> >>      int ret =3D 0;
> >> +    struct kprobe *prev;
> >>      struct ppc_inst insn =3D ppc_inst_read((struct ppc_inst *)p->addr=
);
> >> +    struct ppc_inst prefix =3D ppc_inst_read((struct ppc_inst *)(p->a=
ddr - 1));
> >
> > What if p->addr is the first word of a page and the previous page is
> > not mapped ?
>
> Good catch!
> I think we can just skip validation if the instruction is at the
> beginning of a page. I have a few cleanups in this area - I will post a
> patchset soon.
Yeah thanks Christophe for noticing that. And thanks Naveen that
sounds like it should fix it.
>
> >
> >>
> >>      if ((unsigned long)p->addr & 0x03) {
> >>              printk("Attempt to register kprobe at an unaligned addres=
s\n");
> >> @@ -114,6 +116,17 @@ int arch_prepare_kprobe(struct kprobe *p)
> >>      } else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
> >>              printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\=
n");
> >>              ret =3D -EINVAL;
> >> +    } else if (ppc_inst_prefixed(prefix)) {
> >
> > If p->addr - 2 contains a valid prefixed instruction, then p->addr - 1 =
contains the suffix of that
> > prefixed instruction. Are we sure a suffix can never ever be misinterpr=
eted as the prefix of a
> > prefixed instruction ?
>
> Yes. Per the ISA:
>   Bits 0:5 of all prefixes are assigned the primary opcode
>   value 0b000001. 0b000001 is not available for use as a
>   primary opcode for either word instructions or suffixes
>   of prefixed instructions.
Yep, a prefix will never be a valid word instruction or suffix.
>
>
> - Naveen
>
