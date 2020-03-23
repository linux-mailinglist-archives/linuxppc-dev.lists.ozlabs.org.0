Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4E18F271
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:12:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m9Cd52G6zDqnf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 21:11:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N+yxhhPJ; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m99X2HTMzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:10:08 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id c9so2611177otl.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lR9a3O4qZZWQPTv2sL1CyfinxvBR3lIFt8xMrysSwRg=;
 b=N+yxhhPJ+UjkzoXYBs3efvhA/I3ju6q5TbCivYE1pCODtVyFkemJzLOG07HYYX6HGi
 HQWaFDTZso63xnTiUJx49+5pyfolmbWsSIq+rmNDxfvK2/EzjthQ82dUeciLU6SY0azX
 p5tw0mBz7LWY+P722GkqIH9thh99fv4PQvXCiQoAjxiahnlB/rrh8nHpXZ8jHQ2338hG
 RoJHDBwNE7Y3tT2RKmdc6f6ZACEHnW5zIMor6QVJCgSHgHA0dNhWIl4SljaMhUkH4msv
 8e22DLz/G+PTgBBbyyHovx49LSrfTwog8q98f8EH2uVubQ8haXpFXwnIFXMMzCsE/LMd
 GFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lR9a3O4qZZWQPTv2sL1CyfinxvBR3lIFt8xMrysSwRg=;
 b=tdwLK4jFEhV5jDiHGqnfnGL6Ip0SQ9dG6/WMpzQL8d/fzpo5/V4VBibbeIg25zfJyx
 wPk18z3mlbM+uV7JiwhrtIy9beQD6/Ekwf2xTV1oAIL7hXHKlrQFPrRdA0nBIS4/gjCs
 hutmsXfRVtXAFdlqemzVVUKKi0FgMBdJ907FKA7iifCGF91CAAkcatXsW/UhLgx2nqS5
 QR+SnHHMlWyff9K5abQ6G2BXXo6CEBvhrMFc0sNY5YWqRLSaOke5XhRf/q9LB4gVfz4o
 A+IPqKUq/Zkq5FSUogDFUJNaqDMLsmFT4LJ64eSgZIkkpHvXnkW+qcEIBg6j7xmm1Yyg
 HhaQ==
X-Gm-Message-State: ANhLgQ3aa7zmKZl7I6V9gJROqxfB8OhhQGfJk4pxcV8dAREqc8Rh+2yh
 w5q/xsXaUZA8Ac2HbGCixjha8yuOvmSBBRp8HNg=
X-Google-Smtp-Source: ADFU+vtFI+KV8co8YuJ0ulORRw9qPa3ZE1SoyykobCg2SaUI1VxsVBV5v9ScirYMtwAaY31GSjVaIr57pTxRWd/pyxw=
X-Received: by 2002:a05:6830:1683:: with SMTP id
 k3mr7190040otr.28.1584958206379; 
 Mon, 23 Mar 2020 03:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-10-jniethe5@gmail.com>
 <1584946118.tw98vo7hqx.astroid@bobo.none>
In-Reply-To: <1584946118.tw98vo7hqx.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 21:09:55 +1100
Message-ID: <CACzsE9qL6FhFuMbHy1Qz6EvOEeuA-2rjK=nuqwikZEapS9VmNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] powerpc: Use a function for reading instructions
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

On Mon, Mar 23, 2020 at 7:03 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:18 pm:
> > Prefixed instructions will mean there are instructions of different
> > length. As a result dereferencing a pointer to an instruction will not
> > necessarily give the desired result. Introduce a function for reading
> > instructions from memory into the instruction data type.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/include/asm/uprobes.h |  4 ++--
> >  arch/powerpc/kernel/kprobes.c      |  8 ++++----
> >  arch/powerpc/kernel/mce_power.c    |  2 +-
> >  arch/powerpc/kernel/optprobes.c    |  6 +++---
> >  arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++-----------
> >  arch/powerpc/kernel/uprobes.c      |  2 +-
> >  arch/powerpc/lib/code-patching.c   | 22 ++++++++++----------
> >  arch/powerpc/lib/feature-fixups.c  |  6 +++---
> >  arch/powerpc/xmon/xmon.c           |  6 +++---
> >  9 files changed, 49 insertions(+), 40 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
> > index 2bbdf27d09b5..fff3c5fc90b5 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -23,8 +23,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
> >
> >  struct arch_uprobe {
> >       union {
> > -             u32     insn;
> > -             u32     ixol;
> > +             u8      insn[MAX_UINSN_BYTES];
> > +             u8      ixol[MAX_UINSN_BYTES];
> >       };
> >  };
>
> Hmm. I wonder if this should be a different patch. Not sure if raw
> bytes is a good idea here. ppc probes also has a ppc_opcode_t, maybe
> could be replaced with ppc_insn_t and used here instead?
You are right this should not really be in this patch. I felt bytes
made sense as we have  MAX_UINSN_BYTES, which could be updated once
prefixed instructions were introduced.
By replace do you mean define uprobe_opcode_t as ppc_inst_t instead of
ppc_opcode_t? That will not really work with the arch indep code in
places like:

bool __weak is_swbp_insn(uprobe_opcode_t *insn)
{
    return *insn == UPROBE_SWBP_INSN;
}

Or do you mean something like this:
  struct arch_uprobe {
       union {
 -             u32     insn;
 -             u32     ixol;
 +             pcc_inst_t     insn;
 +             ppc_inst_t     ixol;
       };
 };

>
> Also can't find where you define ppc_inst_read.
>
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> > index 7614a9f537fd..ad451205f268 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -41,6 +41,12 @@
> >  #define      NUM_FTRACE_TRAMPS       8
> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> >
> > +static long
> > +read_inst(ppc_inst *inst, const void *src)
> > +{
> > +     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> > +}
>
> Humbly suggest probe_kernel_inst_read.
The other probe_kernel_*  functions were from generic code so I
thought it might be misleading to call it that.
>
> Thanks,
> Nick
>
