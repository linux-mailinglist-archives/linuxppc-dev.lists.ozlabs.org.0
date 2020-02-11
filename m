Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F345E159D3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 00:33:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HJxc71GFzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 10:33:40 +1100 (AEDT)
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
 header.s=20161025 header.b=vES5Vm7Q; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HJvk3VVQzDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 10:32:02 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 59so36359otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2ARTEvjyBkxwEgAe80L7HN4bBHrTu10GifooDvNkjJA=;
 b=vES5Vm7QyU9SoaR7UaEUWZESwePom4etswhAAwwT8+YNrKjNP9zPxalIbd4nqJUm4L
 Ae2zzeSKFTqYJEwVc8dm2plg9jvcSciCA+YJ+xBBpo5SXqELzLkipxuIoaNS8PEENn1j
 1eT9lievFJbO9YQFC1SiS3rKHMgH03Ko0J5BeaYiH9gdtzXKuN4wZQfW8YC/h53aEDIU
 rjr+coU0JMcERIhb39l/IgrKSKxMV6IwqLduP/v/bvA8iAHeJwWKYQumffd8EkSK5o0w
 RJQFlqgH19ivihWKFTCTi7MSppGwWj8zHhQCNLxYUkOBHKWH9ArL2GWYeR/bBYedhVS7
 k4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ARTEvjyBkxwEgAe80L7HN4bBHrTu10GifooDvNkjJA=;
 b=nBW9NRGosaFqMblYwrh2mcir5Qr0D9lcE1i4J898MdkYshmj7aYmOgt/qAG5glZgaK
 PjDn1sER9sljxbMZXLXRwqAk3GblLrd7UuDbUyHCUjnVvf0kZpoF7niVX7jZzPGOR/JQ
 LvZifKLP/+pith5QTFh5faJu4T8B6hIlaysWZC9Ikazo3rda/h+LRE+xSSWmDBiHgMcm
 bLi/gavO49WOraLetSGsQ1/HsseU9zq6Sd1/9t3/lN263+Im0ZrUdI5IK9eAtqe9ECdc
 RTDL4t0PswrftOHGmEfb2u20uVKznsutJLGsYi6RrGezU2FV5YK96MixTUWfRqIkFfre
 QNfQ==
X-Gm-Message-State: APjAAAWtGvg1K5HbqSfJWGqWzccat0Y3aEo3yiIs6Z6N/YPqbtAiG5kF
 yWQuDCtEZujpDAL2fdAjqsfyc3xXyklrEximRDs=
X-Google-Smtp-Source: APXvYqzb+kl9ehORfoFU2Mdu03HAnnJFEvVwKKpviz1s3wRdip6rhimXdpIwV5oAdxJ3zk2MsfcjRWTSb4A9C5Q/Qs4=
X-Received: by 2002:a05:6830:607:: with SMTP id
 w7mr7503352oti.155.1581463917178; 
 Tue, 11 Feb 2020 15:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-4-jniethe5@gmail.com>
 <11bf9d8f-ef21-3534-1c49-e3644a60b06d@c-s.fr>
In-Reply-To: <11bf9d8f-ef21-3534-1c49-e3644a60b06d@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 10:31:45 +1100
Message-ID: <CACzsE9rvFDCjsrZG5m5Npg21KJbYbXTKv_twF-sKDcVZ16zOkA@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] powerpc sstep: Prepare to support prefixed
 instructions
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
Cc: Balamuruhan S <bala24@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 4:57 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > Currently all instructions are a single word long. A future ISA version
> > will include prefixed instructions which have a double word length. The
> > functions used for analysing and emulating instructions need to be
> > modified so that they can handle these new instruction types.
> >
> > A prefixed instruction is a word prefix followed by a word suffix. All
> > prefixes uniquely have the primary op-code 1. Suffixes may be valid wor=
d
> > instructions or instructions that only exist as suffixes.
> >
> > In handling prefixed instructions it will be convenient to treat the
> > suffix and prefix as separate words. To facilitate this modify
> > analyse_instr() and emulate_step() to take a suffix as a
> > parameter. For word instructions it does not matter what is passed in
> > here - it will be ignored.
> >
> > We also define a new flag, PREFIXED, to be used in instruction_op:type.
> > This flag will indicate when emulating an analysed instruction if the
> > NIP should be advanced by word length or double word length.
> >
> > The callers of analyse_instr() and emulate_step() will need their own
> > changes to be able to support prefixed instructions. For now modify the=
m
> > to pass in 0 as a suffix.
> >
> > Note that at this point no prefixed instructions are emulated or
> > analysed - this is just making it possible to do so.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: - Move definition of __get_user_instr() and
> > __get_user_instr_inatomic() to "powerpc: Support prefixed instructions
> > in alignment handler."
> >      - Use a macro for returning the length of an op
> >      - Rename sufx -> suffix
> >      - Define and use PPC_NO_SUFFIX instead of 0
> > ---
> >   arch/powerpc/include/asm/ppc-opcode.h |  5 +++++
> >   arch/powerpc/include/asm/sstep.h      |  9 ++++++--
> >   arch/powerpc/kernel/align.c           |  2 +-
> >   arch/powerpc/kernel/hw_breakpoint.c   |  4 ++--
> >   arch/powerpc/kernel/kprobes.c         |  2 +-
> >   arch/powerpc/kernel/mce_power.c       |  2 +-
> >   arch/powerpc/kernel/optprobes.c       |  3 ++-
> >   arch/powerpc/kernel/uprobes.c         |  2 +-
> >   arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
> >   arch/powerpc/lib/sstep.c              | 12 ++++++-----
> >   arch/powerpc/lib/test_emulate_step.c  | 30 +++++++++++++-------------=
-
> >   arch/powerpc/xmon/xmon.c              |  5 +++--
> >   12 files changed, 46 insertions(+), 32 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/inclu=
de/asm/ppc-opcode.h
> > index c1df75edde44..72783bc92e50 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -377,6 +377,11 @@
> >   #define PPC_INST_VCMPEQUD           0x100000c7
> >   #define PPC_INST_VCMPEQUB           0x10000006
> >
> > +/* macro to check if a word is a prefix */
> > +#define IS_PREFIX(x) (((x) >> 26) =3D=3D 1)
>
> Can you add an OP_PREFIX in the OP list and use it instead of '1' ?
Will do.
>
> > +#define      PPC_NO_SUFFIX   0
> > +#define      PPC_INST_LENGTH(x)      (IS_PREFIX(x) ? 8 : 4)
> > +
> >   /* macros to insert fields into opcodes */
> >   #define ___PPC_RA(a)        (((a) & 0x1f) << 16)
> >   #define ___PPC_RB(b)        (((b) & 0x1f) << 11)
> > diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/as=
m/sstep.h
> > index 769f055509c9..9ea8904a1549 100644
> > --- a/arch/powerpc/include/asm/sstep.h
> > +++ b/arch/powerpc/include/asm/sstep.h
> > @@ -89,11 +89,15 @@ enum instruction_type {
> >   #define VSX_LDLEFT  4       /* load VSX register from left */
> >   #define VSX_CHECK_VEC       8       /* check MSR_VEC not MSR_VSX for =
reg >=3D 32 */
> >
> > +/* Prefixed flag, ORed in with type */
> > +#define PREFIXED     0x800
> > +
> >   /* Size field in type word */
> >   #define SIZE(n)             ((n) << 12)
> >   #define GETSIZE(w)  ((w) >> 12)
> >
> >   #define GETTYPE(t)  ((t) & INSTR_TYPE_MASK)
> > +#define OP_LENGTH(t) (((t) & PREFIXED) ? 8 : 4)
>
> Is it worth naming it OP_LENGTH ? Can't it be mistaken as one of the
> OP_xxx from the list in asm/opcode.h ?
>
> What about GETLENGTH() instead to be consistant with the above lines ?
Good point, will do.
>
> Christophe
