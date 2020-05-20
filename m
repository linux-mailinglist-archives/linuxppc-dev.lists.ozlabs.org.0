Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C21DBAFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:18:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rzwj6KH7zDqgw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dmitry.torokhov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PsTQzxra; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rztj4lgszDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 03:16:26 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y198so1881218pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QOr9A6/o+X7HN0o8pNRUCaleEl/+hhlZ4ITogdoH+tM=;
 b=PsTQzxra0jbxZGBdtbvJFoxoHPuxr0tzFZ5WhlDoa+NVXcYDIfqXIfwP1Q5y6vnrap
 9R8VdlzbCLF2e72JjNwZp5wS1bBf3gyayzW4ZeFc40YpwLJ6DXhgrfGY2pCfqs55Ze9d
 rDyxeBw+5s/Dx4Yw+Bn4xOKZZxLXazS4Or93V2Q5ySxRGXsCWw9ucRs2rM8pnfIDNPmb
 t+7RNVBq8+EgX50l3FvwnilCiPlGXjhpdhABz0OP8Ec7s8pGYF5uViPfE3CrcjYXSOtY
 4PW0tyayfiF7JoL26m/0iw8MQlJROUSQuox78rY6WgrKVJcIGdMw0hQeIw8Rl5a641G0
 SIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QOr9A6/o+X7HN0o8pNRUCaleEl/+hhlZ4ITogdoH+tM=;
 b=LDiwtxRLTRnYvZBIPaw89ynfItyB5/YixYWbb7+hTQODb5pBjGNy8lYioDoqn9//x2
 +HbcTUjHM/6eUrIwgeqsIvCwK227vsUlj7zu9A5bdfDH8EQWCmMcg+PvApdjzh9Yk5RU
 a9dQv8rVRLP9Palopi2ndZK52m8MhcWr9ldL0eOQkS1O9CrEuULMVzbcRCI9T+7sg9KJ
 Z3Hi2eBjYGRlusypY9GQv/fs4xS7gpTiEPnQaquci+lfVIIAHPobuycDTzOyXDZyDqtF
 bTM+16ZpxRkp1nLrkPuViob5ypx/uB9lZMhHAagtxJ8hmOdRgmRuCabY9v5AmzUqtI6/
 YQzA==
X-Gm-Message-State: AOAM531Iv0mqnQplQJTERLF4TietVgBIPnVtMTte2TFV68E+6Dj0wDlx
 nC9mRWL561WGyvHvj7n8uRQ=
X-Google-Smtp-Source: ABdhPJyE8U+eqza0u+/BgRwGYurqbJZJmair/oCm+T178M7MykVJpxyH+LIUWsRiHrVZ78W2i90TKg==
X-Received: by 2002:aa7:82d7:: with SMTP id f23mr5685263pfn.198.1589994981193; 
 Wed, 20 May 2020 10:16:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
 by smtp.gmail.com with ESMTPSA id t188sm2544922pfb.185.2020.05.20.10.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 10:16:20 -0700 (PDT)
Date: Wed, 20 May 2020 10:16:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] input: i8042: Remove special PowerPC handling
Message-ID: <20200520171618.GT89269@dtor-ws>
References: <87a7254bxd.fsf@mpe.ellerman.id.au>
 <20200518181043.3363953-1-natechancellor@gmail.com>
 <87ftbv87i3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftbv87i3.fsf@mpe.ellerman.id.au>
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-input@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, May 20, 2020 at 04:07:00PM +1000, Michael Ellerman wrote:
> [ + Dmitry & linux-input ]
> 
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > This causes a build error with CONFIG_WALNUT because kb_cs and kb_data
> > were removed in commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
> > include/asm-ppc").
> >
> > ld.lld: error: undefined symbol: kb_cs
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >
> > ld.lld: error: undefined symbol: kb_data
> >> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced 15 more times
> >
> > Presumably since nobody has noticed this for the last 12 years, there is
> > not anyone actually trying to use this driver so we can just remove this
> > special walnut code and use the generic header so it builds for all
> > configurations.
> >
> > Fixes: 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  drivers/input/serio/i8042-ppcio.h | 57 -------------------------------
> >  drivers/input/serio/i8042.h       |  2 --
> >  2 files changed, 59 deletions(-)
> >  delete mode 100644 drivers/input/serio/i8042-ppcio.h
> 
> This LGTM.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> I assumed drivers/input/serio would be pretty quiet, but there's
> actually some commits to it in linux-next. So perhaps this should go via
> the input tree.
> 
> Dmitry do you want to take this, or should I take it via powerpc?
> 
> Original patch is here:
>   https://lore.kernel.org/lkml/20200518181043.3363953-1-natechancellor@gmail.com

I'm fine with you taking it through powerpc.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Also, while I have your attention ;), could you please ack or take
https://lore.kernel.org/lkml/20191002214854.GA114387@dtor-ws/ as I
believe this is the last user or input_polled_dev API and I would like
to drop it from the tree.

Thanks!

-- 
Dmitry
