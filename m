Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8E3F8989
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 15:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwPZn22Mjz304S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 23:58:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ekcRvvU2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ekcRvvU2; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwPZ40zpRz2yP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 23:58:01 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id m17so1862924plc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E9TK/FY0uzyA65L1hRoCvmxAnawwK7mpkJ6okTYhabg=;
 b=ekcRvvU2ooWKPI6MeFTHN8S/L9g8lfcogPUoC77BnyeOM2LRdfxufEqrML0OnG+lL8
 isHd1ug2swg4N1Sfht28hxO2w0gegowmDoSJYf94xlv9gOlUWgyFEtJLD/lOzpD+S0na
 h7q90XJ1bTy4xjrYYDLBcKgGOxsDsEavQoJtIjo55rD0H0+vmaRYbts+9rW9AHaMgWEI
 sn/3tNeMVF4M1qCCZv67Jy0qr6JlgHZyNLAOUWboCASRq/LtIMKjgjqlXQu2/HwngL9r
 d/lexP0fF9EqBfHvnMz/kqeteOzEEAAIUpLrP7AW6Eurk8S5ApmhdA42Mz/coqJR4da0
 bsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E9TK/FY0uzyA65L1hRoCvmxAnawwK7mpkJ6okTYhabg=;
 b=nDmrpaUq5b5TT6W0ZlZqjdnz7+DjgnG5jJ0ktFKXaLzasPvufZJxGCeWK9qoEm8ckn
 BSlNZSm0M57InefWhW/h0TLerAl6smobEW7jDX8EpbXnaRfMhWgplNgYk+bAJ8nh3iGy
 WNadvzg+GbB9wMspOOnJ41PMbFWdrDifxdo/ttz6YRlKOcNnROypHjXc2MQ6OT4S2oRI
 FzLOpR0U67PIhaklVtcEvqrg6hvpC+7dpv4jAIZBySg+HAg3Lrbq3kI+BOiA1LOiVUBH
 EU2iaJOwIgPn3+jpwlMyMKr+rLbo0pZoYI3L9aZo46M4Ws/Vf+EaBKoGN/Q3xfMHLdA/
 ZxNg==
X-Gm-Message-State: AOAM532hMFT1ZjwGPrRAn3z5veXUnGu8g38PggoEbV6WSzu5r+kl1ilS
 gRd9cmnAkB3GeG2gH9mQGGo=
X-Google-Smtp-Source: ABdhPJwDMyIYnHDE8SQMnJUpIYKgBTH9mJRVCsF0/b7Tlp8QBCXqHLNbZvGQDnxomFsUzwXfK6m3Kw==
X-Received: by 2002:a17:90a:5b0d:: with SMTP id
 o13mr11117577pji.117.1629986278572; 
 Thu, 26 Aug 2021 06:57:58 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id t12sm4063689pgo.56.2021.08.26.06.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:57:58 -0700 (PDT)
Date: Thu, 26 Aug 2021 23:57:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/bug: Remove specific powerpc BUG_ON() and
 WARN_ON() on PPC32
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <1628834356.pr4zgn1xf1.astroid@bobo.none>
 <20210818150653.GJ1583@gate.crashing.org>
 <1629946707.f6ptz0tgle.astroid@bobo.none>
 <20210826124901.GY1583@gate.crashing.org>
In-Reply-To: <20210826124901.GY1583@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1629983260.5jkx2jf0y8.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of August 26, 2021 10:49 pm:
> Hi!
>=20
> On Thu, Aug 26, 2021 at 01:26:14PM +1000, Nicholas Piggin wrote:
>> Excerpts from Segher Boessenkool's message of August 19, 2021 1:06 am:
>> > On Fri, Aug 13, 2021 at 04:08:13PM +1000, Nicholas Piggin wrote:
>> >> This one possibly the branches end up in predictors, whereas conditio=
nal=20
>> >> trap is always just speculated not to hit. Branches may also have a
>> >> throughput limit on execution whereas trap could be more (1 per cycle
>> >> vs 4 per cycle on POWER9).
>> >=20
>> > I thought only *taken* branches are just one per cycle?
>>=20
>> Taken branches are fetched by the front end at one per cycle (assuming=20
>> they hit the BTAC), but all branches have to be executed by BR at one=20
>> per cycle
>=20
> This is not true.  (Simple) predicted not-taken conditional branches are
> just folded out, never hit the issue queues.  And they are fetched as
> many together as fit in a fetch group, can complete without limits as
> well.

No, they are all dispatched and issue to the BRU for execution. It's=20
trivial to construct a test of a lot of not taken branches in a row
and time a loop of it to see it executes at 1 cycle per branch.

> The BTAC is a frontend thing, used for target address prediction.  It
> does not limit execution.

I didn't say it did.

> Correctly predicted simple conditional branches just get their prediction
> validated (and that is not done in the execution units).  Incorrectly
> predicted branches the same, but those cause a redirect and refetch.

How could it validate prediction without issuing? It wouldn't know when
sources are ready.

>=20
>> > Internally *all* traps are conditional, in GCC.  It also can optimise
>> > them quite well.  There must be something in the kernel macros that
>> > prevents good optimisation.
>>=20
>> I did take a look at it at one point.
>>=20
>> One problem is that the kernel needs the address of the trap instruction=
=20
>> to create the entry for it. The other problem is that __builtin_trap=20
>> does not return so it can't be used for WARN. LLVM at least seems to=20
>> have a __builtin_debugtrap which does return.
>=20
> This is <https://gcc.gnu.org/PR99299>.

Aha.

>> The first problem seems like the show stopper though. AFAIKS it would=20
>> need a special builtin support that does something to create the table
>> entry, or a guarantee that we could put an inline asm right after the
>> builtin as a recognized pattern and that would give us the instruction
>> following the trap.
>=20
> I'm not quite sure what this means.  Can't you always just put a
>=20
> bla:	asm("");
>=20
> in there, and use the address of "bla"?

Not AFAIKS. Put it where?

> If not, you need to say a lot
> more about what you actually want to do :-/

We need to put the address (or relative offset) of the trap instruction
into an entry in a different section. Basically this:

   __builtin_trap();
   asm ("1:                               \n\t"
        "    .section __bug_table,\"aw\"  \n\t"
        "2:  .4byte 1b - 2b - 4           \n\t"
        "    .previous");

Where the 1: label must follow immediately after the trap instruction,=20
and where the asm must be emitted even for the case of no-return traps=20
(but anything following the asm could be omitted).

Thanks,
Nick
