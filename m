Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E12CABC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 17:54:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cz1J2SwfzDqP0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 01:54:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cyzl1FDnzDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 01:53:06 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id u11so18217192otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 08:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SEzbBlQG9PWtd5a62UB1gNIL78kQHaOBX6iGUYxagdo=;
 b=p5MHClw1geJTYyHwXsHnRsWklOC98r/Tn4uuKjsPSmtC9k+arWGInicPrIqlo7wqNb
 Jfi68ZW2kl/cAKZ/K7fLBukVZOohBVZrCjOk2SeFKBxPXzQafR3ptN8MLP2XsSOPpnyX
 6rhKzzgGpkIW6kJfcaHXrDKpewP4Uy9X/iZL641Ua77t+kCHZwkhsJdT2WAUGDZjjJSY
 VdXs5MUbqeBhDUs16OT7wVzEGUZiAKC6CN/NiNafwqMXjmo0WDmyLq/rxCX253tPmAla
 HGrj6tLGhvFe8c4ZM6BlRgKcbcm+H5ArHce5c7eE5tH/l3cZeUhm2UTnn5fwzyAXDAFB
 Qtgg==
X-Gm-Message-State: APjAAAVsm1hgwdKfII8UtNsHgDtrqrLUKniFDLoevdDJ7VS4U7FeLEVy
 39nscumdWEXy4dN7oSFuW1GadS0w35dazHT/kPQ=
X-Google-Smtp-Source: APXvYqz5xuCiYcBraQ+feTCqPEQuyUWUjqF+idvC6b9V1DLp0HFySu2Mo/Dr2zATO9JApzPsBMuZVBeP6sCP1tifo1E=
X-Received: by 2002:a9d:7987:: with SMTP id h7mr14821107otm.284.1559058783533; 
 Tue, 28 May 2019 08:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190312202008.29681-1-malat@debian.org>
 <20190312212318.17822-1-malat@debian.org>
 <87d0k2q025.fsf@concordia.ellerman.id.au>
In-Reply-To: <87d0k2q025.fsf@concordia.ellerman.id.au>
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 28 May 2019 17:52:52 +0200
Message-ID: <CA+7wUswLP5cffrYZuEZ9bJeq1-FNNq6LFurMrOM1bmnDDN7E-g@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/32: sstep: Move variable `rc` within
 CONFIG_PPC64 sentinels
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 1:40 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Mathieu Malaterre <malat@debian.org> writes:
>
> > Fix warnings treated as errors with W=1:
> >
> >   arch/powerpc/lib/sstep.c:1172:31: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
> >
> > Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Signed-off-by: Mathieu Malaterre <malat@debian.org>
> > ---
> > v2: as suggested prefer CONFIG_PPC64 sentinel instead of unused keyword
>
> I'd rather avoid adding more ifdefs if we can.
>
> I think this works?

It does ! ;)

Reviewed-by: Mathieu Malaterre <malat@debian.org>

> cheers
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 3d33fb509ef4..600b036ddfda 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1169,7 +1169,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
>  int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>                   unsigned int instr)
>  {
> -       unsigned int opcode, ra, rb, rc, rd, spr, u;
> +       unsigned int opcode, ra, rb, rd, spr, u;
>         unsigned long int imm;
>         unsigned long int val, val2;
>         unsigned int mb, me, sh;
> @@ -1292,7 +1292,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>         rd = (instr >> 21) & 0x1f;
>         ra = (instr >> 16) & 0x1f;
>         rb = (instr >> 11) & 0x1f;
> -       rc = (instr >> 6) & 0x1f;
>
>         switch (opcode) {
>  #ifdef __powerpc64__
> @@ -1307,10 +1306,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>                 return 1;
>
>  #ifdef __powerpc64__
> -       case 4:
> +       case 4: {
> +               unsigned int rc;
> +
>                 if (!cpu_has_feature(CPU_FTR_ARCH_300))
>                         return -1;
>
> +               rc = (instr >> 6) & 0x1f;
> +
>                 switch (instr & 0x3f) {
>                 case 48:        /* maddhd */
>                         asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
> @@ -1336,6 +1339,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>                  * primary opcode which do not have emulation support yet.
>                  */
>                 return -1;
> +       }
>  #endif
>
>         case 7:         /* mulli */
