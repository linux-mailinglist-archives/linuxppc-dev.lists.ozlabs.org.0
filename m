Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D155C1D2FDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 14:35:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N9wd520FzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 22:34:57 +1000 (AEST)
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
 header.s=20161025 header.b=Z7iXcyzE; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N9pM4cTPzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 22:29:31 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id v17so2200265ote.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2Sy4sl116yXj7i7ZHHaAU9Pc0TV6LdwMlrnYdQaZ2o=;
 b=Z7iXcyzEtHBK94FSqty2IOUaxRnxMMd/9nFw6W82uerHu7qsI42GLyToS7eN5eY7RZ
 supuzvS91UVQwuCab9TKO18w11gJuaJ8SCbLJTi/f+2E6zqxsWj/Ovfsm3oNFj9u9+GD
 F9Ei66hWydTYqOI0nHrGCeQIscDYsIHZSGn0cHdBFQbeEB/YIZsDBaGwBX7F02iEK869
 EOEvptdOcZIz3gltu3jm67PqGhRqv5HeKdJAAdp8JgjZQ+/+hAVhpbjW+yXIQB8Y8ET8
 3wFXWMAOMWuMwwUgq+I0c0oD9Bqr3F50SBBy9oFK3OJatLe3gSs5KGP4tDyo+iukY0X3
 p+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2Sy4sl116yXj7i7ZHHaAU9Pc0TV6LdwMlrnYdQaZ2o=;
 b=p+f3Jx0bteHZvFc/QoV79Za8er0WPcOtE0//BjCv7hpfpvQkf0AWsZ7Dx2KvKy4WtO
 RRUmqm2JgiNb9IIIoYVzPNYHAw0ugm2DldcYCJXcKfrs4s20SDTgHd/E43TADfdQUr6P
 6OPQDSeT6TzvW84/cgqnGTxRdREKDlqUo3i3dN+830GuPj7p3i0i5Vs49G7lHMrkX7hZ
 xa0rWRYfrjGHai/plRZ1g6pri9BmkGlu0Fg2Yri8sFqhfr3ex2+JMccGtlc/7IcDFWOA
 GG5WjDkUgD3R/4rUNVcEvI0aZT2QZj/G+ioh0jPXgFe4tcE2nWoyAV/RskCFebIaVA+z
 +N8g==
X-Gm-Message-State: AOAM530iAWZpQGjkyvQmDw4aG/J3rbM3ILP3u4Li15xjdc24P+UXxuOE
 8rrMf0l7E3he1D/DRWcYF2oKArX797C/FgZvrE8=
X-Google-Smtp-Source: ABdhPJwc/xcABq5v6Pwvq7zOg4A1Rw1++qnpaJ+4xtkz5Q6/zpCyjY5NZeN+Bo4xF46Ve4SWPUjQ6ZkhSlE3vtJemvM=
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr3512114oth.155.1589459367777;
 Thu, 14 May 2020 05:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-24-jniethe5@gmail.com>
 <56ca6bcb-c719-a049-63b0-aae73023bde5@csgroup.eu>
 <1850220.JuIOMCfrUL@townsend>
In-Reply-To: <1850220.JuIOMCfrUL@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 14 May 2020 22:29:16 +1000
Message-ID: <CACzsE9qFrCoKFQte6AZHzp5LKvXX7O3zQ+woR=eOefmPc4-Y9Q@mail.gmail.com>
Subject: Re: [PATCH v8 23/30] powerpc: Add prefixed instructions to
 instruction data type
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 10:06 PM Alistair Popple <alistair@popple.id.au> wrote:
>
> On Thursday, 14 May 2020 4:11:43 PM AEST Christophe Leroy wrote:
> > @@ -249,7 +249,7 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p)
> > > * Fixup the template with instructions to:
> > > * 1. load the address of the actual probepoint
> > > */
> > > -       patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > > +       patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> > >
> > > /*
> > > * 2. branch to optimized_callback() and emulate_step()
> > > @@ -282,7 +282,11 @@ int arch_prepare_optimized_kprobe(struct
> > > optimized_kprobe *op, struct kprobe *p) /*
> > > * 3. load instruction to be emulated into relevant register, and
> > > */
> > > -       patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> > > +       temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> > > +       patch_imm64_load_insns(ppc_inst_val(temp) |
> > > +                              ((u64)ppc_inst_suffix(temp) << 32),
> > > +                              4,
> >
> > So now we are also using r4 ? Any explanation somewhere on the way it
> > works ? This change seems unrelated to this patch, nothing in the
> > description about it. Can we suddenly use a new register without problem ?
>
> Unless I missed something there is no change in register usage here that I
> could see. patch_imm32_load_insns() was/is hardcoded to use register r4.
Yes, that is right.
>
> - Alistair
>
>
