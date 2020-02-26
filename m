Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F5170CD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 00:57:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SXlm5Nt2zDqhF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 10:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cOvFbn4v; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SXjZ0WZ3zDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:55:13 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id c16so1465297oic.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYJqqXKw2CCJkhBonhnPl1NW2iZrp7qAkX2+wgE0jT0=;
 b=cOvFbn4v7jxdN+z2vxj5M/vGwIGzD6aL4Hv5Hji/N/MHDcp1keW1IBctOPWDtXXRHY
 5UEQASjnw7F5amJzsFXikFXxPRj+rOiszUyyLNZ6/sll66arikI91bB0HrqFKVCm7mHQ
 40CkGXCKPjvPVCaW0OQ4XPyvHg8+8TCB1tpGawS4xziXfUHPHvONS/q2RKZa7x5/AFAi
 PsftAYLCWjbvf9G6C5YthHkr7wISVbPd/mgfkvfp/+D8GRLFinQTGhXM0JbJNsuKvQg2
 jg8N51OFWa236/cUEyj9UNv9uZTraF/7awKyF/MGHBxG3dfxnnDxephSmBxKPZjVyxwm
 VaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYJqqXKw2CCJkhBonhnPl1NW2iZrp7qAkX2+wgE0jT0=;
 b=RoJqB0SsH/ytcunvB/kYrKH5MK3QUcqKhw6etaVk4Z/UdlXB9CfXI9JA0NIwf6togD
 /ORWCB8dUm5ymS/nSfz19tYP9AFkN0EdcBLaKt/5F4V87xDKhzzMC4N3YyI0ucKeGKKn
 ptQaPsLXUYxNkfJ/UoZBomLwZR7LIAdnKyL7xa5cQnII9Kk/vKDiXug/9ywDm67HjJZO
 0bGvstPNhb0vJS2Y5002ImW4fO17roNmiG2MV5B656rVPLbBuTGYDuD4n2BLTxOEl6AS
 hQA9G1oECmUa9U36pe9hHfzP0FKTGZ1zntp5vwjLnMSe8oVNn94pkEp4+UjODakDWSDN
 2Nyg==
X-Gm-Message-State: APjAAAXSsEWQ7pVu6UEWpHQMEQEnbopk0Cf09xseOX7DtXjzlMjnFBPw
 ozVw4JY3QJTF3qE5rdLbRUheskfio7UyFcs5tDw=
X-Google-Smtp-Source: APXvYqzheQYdWqHS8DOEyZoT5hV2Un6txzHwcD/tg2AaemR8ZlAwW+epCqJAiA1wSOLl8/Tv5l5+G7sb5s0GbcXPGSM=
X-Received: by 2002:a05:6808:218:: with SMTP id
 l24mr1196030oie.108.1582761310213; 
 Wed, 26 Feb 2020 15:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-9-jniethe5@gmail.com>
 <1582699938.333f3hx0ka.astroid@bobo.none>
In-Reply-To: <1582699938.333f3hx0ka.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 27 Feb 2020 10:54:59 +1100
Message-ID: <CACzsE9qiRGEGHdk5sv3V043RsF31tF=EgzH7O0SaUV=p3ojrtQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] powerpc/xmon: Remove store_inst() for
 patch_instruction()
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 6:04 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on February 26, 2020 2:07 pm:
> > For modifying instructions in xmon, patch_instruction() can serve the
> > same role that store_inst() is performing with the advantage of not
> > being specific to xmon. In some places patch_instruction() is already
> > being using followed by store_inst(). In these cases just remove the
> > store_inst(). Otherwise replace store_inst() with patch_instruction().
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/xmon/xmon.c | 13 ++-----------
> >  1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 897e512c6379..a673cf55641c 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -325,11 +325,6 @@ static inline void sync(void)
> >       asm volatile("sync; isync");
> >  }
> >
> > -static inline void store_inst(void *p)
> > -{
> > -     asm volatile ("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r" (p));
> > -}
> > -
> >  static inline void cflush(void *p)
> >  {
> >       asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
> > @@ -882,8 +877,7 @@ static struct bpt *new_breakpoint(unsigned long a)
> >       for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
> >               if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
> >                       bp->address = a;
> > -                     bp->instr[1] = bpinstr;
> > -                     store_inst(&bp->instr[1]);
> > +                     patch_instruction(&bp->instr[1], bpinstr);
> >                       return bp;
> >               }
> >       }
> > @@ -913,7 +907,7 @@ static void insert_bpts(void)
> >                       bp->enabled = 0;
> >                       continue;
> >               }
> > -             store_inst(&bp->instr[0]);
> > +             patch_instruction(&bp->instr[0], bp->instr[0]);
>
> Hmm that's a bit weird. Can you read instructions into a local variable
> first, do the checks on them, then patch them into their execution
> location?
I agree it is weird, local variables would be better.
>
> Otherwise, good cleanup.
>
> Thanks,
> Nick
