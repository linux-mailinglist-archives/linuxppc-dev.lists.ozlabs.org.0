Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B119718F204
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:41:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Xn6hFPzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:41:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OqEv/rk7; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8QD70pfzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:36:04 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id k9so1464477oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=piRwzaPD3pougSV9RdmSkoAsx0v1P64pV+qgLrRR3X0=;
 b=OqEv/rk71H9NF3gUCT4pfPDrc7tH0YKDqu+38/oJl8Ch2QjO4ML7QjDsi1JaZLTiKi
 dNfxvVmwqpJe3F7abvdynaRkk/wQgD3PHr5YeFh1M6Hz1SZ8CU0P/RW777GfHYwcInv+
 pyKsYYNR8v0rcD0esRVnrg8Bm470mZEaSXhOu2IYn9vH+wkwTB/1EI31/2D3o7dys0bR
 6Dt/fCJTh2B/JbE18imUiW3i0OJzegubIiEoS8VB06C1vXeSV/y3eagJTuUCabX9ii+w
 fQJG1QMDgeZGOU/uVKy2HBPUWvR0AlagrJi+F1uivaaBqIXf02KtkGRtEQJcsoA51IPB
 gWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=piRwzaPD3pougSV9RdmSkoAsx0v1P64pV+qgLrRR3X0=;
 b=rZryW0pqOBtqZxTKfluTSJm+CQGr1cLtytryBsSLo/1om6Hj4y0OZ3dPVfAxMovxje
 OvOY6DuDD6539Fh9MXWtwyPU8g9AbN1BXnPCxcq9G1z8A9gHvAKx6MarNGmE1IUJ59Pp
 U/Wy/olwXdNxTTD52/NrkM5okzl6ch+ujyI6wxA497I6ejmL1m0wWs0EiQeaPB/oh8YD
 b/EpQPD60CtywCjqXmO/8y7vKo/zPSaltrnc6JG/QNGSHD8vKrzGDa+7kJhZqk9Mu7u8
 9bB+zPgVp1kqlVkvfiAZSIb1j7mrnzRwkPK6ePSdpa+UBgzbki8WBjE4bC72RM+Ao3Qm
 P52g==
X-Gm-Message-State: ANhLgQ0CJcC/pF0obd2TDJg/1v12htNcEYIwjlCkJDqoWVkQ3BcGnc2r
 rp9mdUsbN/GQcDgVpbqkZWLGLySdGF+HxS87UGs=
X-Google-Smtp-Source: ADFU+vt1fnW6kuqdL1ZrCcGcyh0EQOPlb2XbSk0Z9k/TkHXBg9inWGTvXnb6rGkD7gG8suyD8xgBXKHH9rnRk0bejmA=
X-Received: by 2002:aca:1913:: with SMTP id l19mr5981707oii.12.1584956162469; 
 Mon, 23 Mar 2020 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-14-jniethe5@gmail.com>
 <1584947091.jsvdec8of0.astroid@bobo.none>
In-Reply-To: <1584947091.jsvdec8of0.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:35:50 +1100
Message-ID: <CACzsE9poG75tQoT05oBVJP4zs0ZwB2cB+-PNdx-3xrDuEJjyLQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] powerpc: Support prefixed instructions in
 alignment handler
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 6:09 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:18 pm:
> > Alignment interrupts can be caused by prefixed instructions accessing
> > memory. Prefixed instructions are not permitted to cross 64-byte
> > boundaries. If they do the alignment interrupt is invoked with SRR1
> > BOUNDARY bit set.  If this occurs send a SIGBUS to the offending process
> > if in user mode.  If in kernel mode call bad_page_fault().
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
> > commit (previously in "powerpc sstep: Prepare to support prefixed
> > instructions").
> >     - Rename sufx to suffix
> >     - Use a macro for calculating instruction length
> > v3: Move __get_user_{instr(), instr_inatomic()} up with the other
> > get_user definitions and remove nested if.
> > v4: Just do the things for alignment_exception(). Other changes handled
> > elsewhere.
> > ---
> >  arch/powerpc/kernel/traps.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> > index a4764b039749..cd8b3043c268 100644
> > --- a/arch/powerpc/kernel/traps.c
> > +++ b/arch/powerpc/kernel/traps.c
> > @@ -583,6 +583,10 @@ static inline int check_io_access(struct pt_regs *regs)
> >  #define REASON_ILLEGAL               (ESR_PIL | ESR_PUO)
> >  #define REASON_PRIVILEGED    ESR_PPR
> >  #define REASON_TRAP          ESR_PTR
> > +#define REASON_PREFIXED              0
> > +#define REASON_BOUNDARY              0
> > +
> > +#define inst_length(reason)  4
> >
> >  /* single-step stuff */
> >  #define single_stepping(regs)        (current->thread.debug.dbcr0 & DBCR0_IC)
> > @@ -597,6 +601,10 @@ static inline int check_io_access(struct pt_regs *regs)
> >  #define REASON_ILLEGAL               SRR1_PROGILL
> >  #define REASON_PRIVILEGED    SRR1_PROGPRIV
> >  #define REASON_TRAP          SRR1_PROGTRAP
> > +#define REASON_PREFIXED              SRR1_PREFIXED
> > +#define REASON_BOUNDARY              SRR1_BOUNDARY
> > +
> > +#define inst_length(reason)  (((reason) & REASON_PREFIXED) ? 8 : 4)
>
> Looks good. If you define REASON_BOUNDARY 0, then this will constant
> fold away so no need to define it twice.
Good point.
>
> Thanks,
> Nick
