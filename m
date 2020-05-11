Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7191CCF18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 03:21:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L36Y2XP6zDqnr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 11:21:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Je6b+SxW; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L34m0GLCzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 11:19:35 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id m13so6261638otf.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+nrsInudP14T4ADxRZKanU8vfTGdRJnWfzH/VHbSJy8=;
 b=Je6b+SxWRc0CHirF/GG7hvyOo59vpdOiyt3R+NNAeILPauCSt2xyvzO+Brph3PIJAI
 c3aS84XXVYNq5CcQ1RPgaup9fF94/8Itds6Ym52wIa4X5PhZmHf1f7qWvtXWyDPSyM/k
 JKsboDs4OwEpXN7xOGIu/zSkfQxCWt1PaQy3xK7UpBYt9OYBBStxEU1ApI3fkREU+Pow
 1BD4ums8v1hoAa+UwOG5an0QJo9Iy0/lroYpI0mOuomWQRjCr7y7qTWltYvB8TUWq7bl
 HTTgf1h1cH4PtuDFhaj7k71VkbDPUBflltMVM+studTeyE8cnZj7LegP1Og8Ns8Lxc5L
 LJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+nrsInudP14T4ADxRZKanU8vfTGdRJnWfzH/VHbSJy8=;
 b=Si7NhCZcx80p2ZnHO70TLJX2iV1tes/fOl41NlQTC3FVLjwV0YvzcNQa7bl4mpCjW/
 qzihUXhdigugaJ96+S9XYxVrejimZItwAgdjU00vN82vU2SISNCpysF6bd32gubULYyn
 jcLQXHq0R8HfJhmFCCUXiCD40lMtA3fXtkvCyXpCM4KaWAlONdasYPvtPDsZhl3hfoJm
 XT/idE6X/30sCCHzL+TCIQLRIVMCGJ+ChUaiBHLARfw/ANL1cc93zah4DpkoBGEp+M4c
 GV0ralFYE5lVX3cunwU9xt0FYspSxwd90lwDwPhrpstsATkt7B486j6QX4ffj+wjsfna
 ONpQ==
X-Gm-Message-State: AGi0PuaVQVlYmVjNuzBYmHB/eeEXj7D0rE6oKo+/jcnjvmfvj0WYkeYh
 Yut8Ey9hRXoDIyy2urTz8E7GQsvCCayRsQRMk6M=
X-Google-Smtp-Source: APiQypK3+T8chcmAfcnCIIhuOXCrcHVw0VwrsJimlpsdAO24vMkHjZOtpI27+K99Jhbxg2LE9UnTYqfJIrATnsH3J2Q=
X-Received: by 2002:a9d:784b:: with SMTP id c11mr11420522otm.28.1589159972762; 
 Sun, 10 May 2020 18:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-12-jniethe5@gmail.com>
 <CACzsE9qRUk8E+DRMH+zuHjhRfOjV0x-4JF5AEZ93tYV9pp3QuA@mail.gmail.com>
 <7494f275-da54-d6d8-92a8-aede820bb2a7@csgroup.eu>
In-Reply-To: <7494f275-da54-d6d8-92a8-aede820bb2a7@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 11 May 2020 11:19:21 +1000
Message-ID: <CACzsE9r+BKgEiiz5SztLESZKwYrO-=Y+-pQ+3THJcKzd71udhA@mail.gmail.com>
Subject: Re: [PATCH v8 11/30] powerpc: Use a datatype for instructions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 8, 2020 at 5:17 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/05/2020 =C3=A0 03:51, Jordan Niethe a =C3=A9crit :
> > On Wed, May 6, 2020 at 1:45 PM Jordan Niethe <jniethe5@gmail.com> wrote=
:
> >>
> >> Currently unsigned ints are used to represent instructions on powerpc.
> >> This has worked well as instructions have always been 4 byte words.
> >> However, a future ISA version will introduce some changes to
> >> instructions that mean this scheme will no longer work as well. This
> >> change is Prefixed Instructions. A prefixed instruction is made up of =
a
> >> word prefix followed by a word suffix to make an 8 byte double word
> >> instruction. No matter the endianness of the system the prefix always
> >> comes first. Prefixed instructions are only planned for powerpc64.
> >>
> >> Introduce a ppc_inst type to represent both prefixed and word
> >> instructions on powerpc64 while keeping it possible to exclusively hav=
e
> >> word instructions on powerpc32.
> >>
> >> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >> ---
> >> v4: New to series
> >> v5: Add to epapr_paravirt.c, kgdb.c
> >> v6: - setup_32.c: machine_init(): Use type
> >>      - feature-fixups.c: do_final_fixups(): Use type
> >>      - optprobes.c: arch_prepare_optimized_kprobe(): change a void * t=
o
> >>        struct ppc_inst *
> >>      - fault.c: store_updates_sp(): Use type
> >>      - Change ppc_inst_equal() implementation from memcpy()
> >> v7: - Fix compilation issue in early_init_dt_scan_epapr() and
> >>        do_patch_instruction() with CONFIG_STRICT_KERNEL_RWX
> >> v8: - style
> >>      - Use in crash_dump.c, mpc86xx_smp.c, smp.c
> >> ---
>
> [...]
>
> >>
> >
> > Hi mpe,
> > Could you add this fixup.
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -356,7 +356,7 @@ static void patch_btb_flush_section(long *curr)
> >          end =3D (void *)curr + *(curr + 1);
> >          for (; start < end; start++) {
> >                  pr_devel("patching dest %lx\n", (unsigned long)start);
> > -               patch_instruction(start, ppc_inst(PPC_INST_NOP));
> > +               patch_instruction((struct ppc_inst *)start,
> > ppc_inst(PPC_INST_NOP));
> >          }
> >   }
> >
>
> Why not declare stard and end as struct ppc_inst ? Wouldn't it be
> cleaner than a cast ?
What I was thinking was if struct ppc_inst was the prefixed version,
then start++ would increase it by 8 bytes, but the NOPs that are being
patched in are only 4 bytes.
>
> Christophe
