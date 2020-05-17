Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC91D6678
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 09:42:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PvJ85DKtzDqft
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 17:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dKE1WEZD; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PvGd4zgXzDqZl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 17:41:29 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id i22so6252517oik.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqKNktXaZ1j8wPs5/OscOTo2d5HzhDo1F2eTr1lW/hk=;
 b=dKE1WEZDo356zIAP4kMvDwHDxYpKCa5NLZ6TLBRFiFWxdX+ki3H9H6YtpvX/JJTZrq
 NaXWJuwNyThuHVYcf9Q3ytwVS5Og9DuGfRP76gHJN5Ka8hA1n2gO8h2P2ltZRl6mPV0y
 zFFxhX8X+QybazBtURlDoB8rZntHbBD8rKr94rZGHHerEACV/bJlpCDy00ZyBb0r4v9m
 SM/JzctDiqalVAt/fjG6ze8IzY+Ig2lOxnsMSHgglEtdXEiVGR7QgaLRmoU4yMq4ADRP
 CRwVz+mOOAjr7xz0pcPmABdMUO0rBVHeLqu0Q++LHhWlNYYU6kcXFcorIiCB6wTjD937
 S3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqKNktXaZ1j8wPs5/OscOTo2d5HzhDo1F2eTr1lW/hk=;
 b=sp/6xEh5sgiQTmGy83jXkpGRH8mC92vbVm5LKQxSWsrvgtxDo6DhuT1sI8kW7douiR
 d0wziphRDXPUiYs7L0X0xK6F+PAu2+MZc6jTteiIFk7U7CcLCHiWcaGy27Eu8MxlxtQQ
 yZVlePhlgAXs9qTnKLCP39WUJYSf9IZAf8nHnp4fvhzbX/LG+aGAK6Eo7nRMX4ckRSBA
 Z3+6uitQFNQfCoWWRnOo4mcAYeA49quXHhyIXH59pWSvDYMgw+gF8hsV1OkwFsebkf8u
 C0hZlYaRB98rofYlwYNJoFNEluXepSUFYteCusttDtw/rgAZINPc9CjKqYdEK3rK5jep
 XLFg==
X-Gm-Message-State: AOAM530BA1kTeMyW60xhOiCbQncD503xAjL8BEn8Tz+y/6aV2ZYcs5Os
 I9H8aFgaAchSgAklNlxl7F2c8cDt7ouiY7xHBac=
X-Google-Smtp-Source: ABdhPJxobn8JYX3EjgXCdEvEaZ+FHJV9eUGOqgewpfWGXrFfGNl0qtBV5ufohB4DJMzjrW49mABOJHWufacfLkbU2T0=
X-Received: by 2002:aca:40c2:: with SMTP id n185mr6393247oia.12.1589701286093; 
 Sun, 17 May 2020 00:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-9-jniethe5@gmail.com>
 <CACzsE9o0DNZ+fwO4Zh-oUp8B+zMukXAr_bicCi0V5PYcnJO7_A@mail.gmail.com>
 <87v9kw9lx3.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v9kw9lx3.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sun, 17 May 2020 17:41:14 +1000
Message-ID: <CACzsE9p4NbSDr02EQs0VRXZXEJf6bVxYL5sGoik1Dz3Esuwv5w@mail.gmail.com>
Subject: Re: [PATCH v8 08/30] powerpc: Use a function for getting the
 instruction op code
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 16, 2020 at 9:08 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > mpe, as suggested by Christophe could you please add this.
>
> I did that and ...
>
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -2,6 +2,8 @@
> >  #ifndef _ASM_INST_H
> >  #define _ASM_INST_H
> >
> > +#include <asm/disassemble.h>
>
> .. this eventually breaks the build in some driver, because get_ra() is
> redefined.
>
> So I've backed out this change for now.
Thanks, that is fine with me.
>
> If we want to use the macros in disassemble.h we'll need to namespace
> them better, eg. make them ppc_get_ra() and so on.
>
> cheers
>
> >  /*
> >   * Instruction data type for POWER
> >   */
> > @@ -15,7 +17,7 @@ static inline u32 ppc_inst_val(u32 x)
> >
> >  static inline int ppc_inst_primary_opcode(u32 x)
> >  {
> > -    return ppc_inst_val(x) >> 26;
> > +    return get_op(ppc_inst_val(x));
> >  }
> >
> >  #endif /* _ASM_INST_H */
> > --
> > 2.17.1
