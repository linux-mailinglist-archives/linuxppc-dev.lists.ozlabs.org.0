Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1218F303
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:41:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m9sk0rh5zDr34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 21:41:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GwUOdK5X; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m9r35l5KzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:40:03 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id i13so7325278pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=IuulIYeaHJEeJRP8QUYbv3wsT7vVWcF+/PT5MHRspkw=;
 b=GwUOdK5XpdWB3+zOofTlQCYqP2+ZQzt2zb3hq2Pd//rwJUqH0bRoJyDttHhMvRt+XW
 NuXuEwjglLo6eWj2yqtXFyxIWVj6KNnhcwZSSdhiN0wN1yRLPWmuXzm+dQSaLr4po43w
 ByZM/FFvIEcKUNHJQDlCeVONjbv2g/CNR97hEzorkYb0g5uqjjapmX9wkWhUu6dcajAI
 YBrzJqvQV9FO4Sn27UBGxEfVLUYlD+fx/PeSiNlrc693hjFXfHo1DPMXQ4yaUgTQFO0g
 NIiLA/2fEJ1DNXZQ2+wAFdzSBTi04KLd+Ce1YyCBRizirFEo+j/bbVrhM0bbqZX/f8xl
 LZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=IuulIYeaHJEeJRP8QUYbv3wsT7vVWcF+/PT5MHRspkw=;
 b=HAB5CjTuglTdF2wVGDKuoN/h7W8/jOmC9ZzNJbTW457/zc+Aq4FmdhKxqTNup64oxs
 4d0Yo1Q+HUKCak56pNa85veaIGHtoQL8t/PKFJT3ptPaudbbwX72RnDXFLpBkc7YTCyk
 qQ0DT7jq77R3dliBcmcXISN868ky6vpzEYHH9umCkz97HIPJVJXE/jhu1whTdZZu3FuK
 LrrmqB6q5ROc8D/NIaQ9KR8W8BaPnxoQPgaGZJe2bDv4W6DI8nhPheKRSZHEVk7D6UnO
 yabwIX8wLOjX0sNza3CEPBxH2ElxGT6x8z8Yi5FGSKDgl8y0+avIscnMMoYkI6Dyyg3C
 jGAA==
X-Gm-Message-State: ANhLgQ2XI6Rmcc1lrjp3VdBLmeokcPex13nkm6NXfYjOG23ZuPZwkbXL
 pO67ognnZmXDTEYQuaBZBoxJa2iL
X-Google-Smtp-Source: ADFU+vtiE8quLMZSuIjmzIY53hW6vScyNtGTZEQvVSv60SbI2bXKve+T4vd5tyYJ1/vpOd/TNC5TTA==
X-Received: by 2002:a63:3850:: with SMTP id h16mr6159900pgn.344.1584960001104; 
 Mon, 23 Mar 2020 03:40:01 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id p7sm12502082pjp.1.2020.03.23.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 03:40:00 -0700 (PDT)
Date: Mon, 23 Mar 2020 20:36:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/16] powerpc: Use a function for reading instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-10-jniethe5@gmail.com>
 <1584946118.tw98vo7hqx.astroid@bobo.none>
 <CACzsE9qL6FhFuMbHy1Qz6EvOEeuA-2rjK=nuqwikZEapS9VmNA@mail.gmail.com>
In-Reply-To: <CACzsE9qL6FhFuMbHy1Qz6EvOEeuA-2rjK=nuqwikZEapS9VmNA@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584959427.79kdt9w1gm.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 23, 2020 8:09 pm:
> On Mon, Mar 23, 2020 at 7:03 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on March 20, 2020 3:18 pm:
>> > Prefixed instructions will mean there are instructions of different
>> > length. As a result dereferencing a pointer to an instruction will not
>> > necessarily give the desired result. Introduce a function for reading
>> > instructions from memory into the instruction data type.
>> >
>> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> > ---
>> > v4: New to series
>> > ---
>> >  arch/powerpc/include/asm/uprobes.h |  4 ++--
>> >  arch/powerpc/kernel/kprobes.c      |  8 ++++----
>> >  arch/powerpc/kernel/mce_power.c    |  2 +-
>> >  arch/powerpc/kernel/optprobes.c    |  6 +++---
>> >  arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++----------=
-
>> >  arch/powerpc/kernel/uprobes.c      |  2 +-
>> >  arch/powerpc/lib/code-patching.c   | 22 ++++++++++----------
>> >  arch/powerpc/lib/feature-fixups.c  |  6 +++---
>> >  arch/powerpc/xmon/xmon.c           |  6 +++---
>> >  9 files changed, 49 insertions(+), 40 deletions(-)
>> >
>> > diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include=
/asm/uprobes.h
>> > index 2bbdf27d09b5..fff3c5fc90b5 100644
>> > --- a/arch/powerpc/include/asm/uprobes.h
>> > +++ b/arch/powerpc/include/asm/uprobes.h
>> > @@ -23,8 +23,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
>> >
>> >  struct arch_uprobe {
>> >       union {
>> > -             u32     insn;
>> > -             u32     ixol;
>> > +             u8      insn[MAX_UINSN_BYTES];
>> > +             u8      ixol[MAX_UINSN_BYTES];
>> >       };
>> >  };
>>
>> Hmm. I wonder if this should be a different patch. Not sure if raw
>> bytes is a good idea here. ppc probes also has a ppc_opcode_t, maybe
>> could be replaced with ppc_insn_t and used here instead?
> You are right this should not really be in this patch. I felt bytes
> made sense as we have  MAX_UINSN_BYTES, which could be updated once
> prefixed instructions were introduced.

Okay.

> By replace do you mean define uprobe_opcode_t as ppc_inst_t instead of
> ppc_opcode_t? That will not really work with the arch indep code in
> places like:
>=20
> bool __weak is_swbp_insn(uprobe_opcode_t *insn)
> {
>     return *insn =3D=3D UPROBE_SWBP_INSN;
> }

Ah, yeah I did mean that, you probably told me that already.

> Or do you mean something like this:
>   struct arch_uprobe {
>        union {
>  -             u32     insn;
>  -             u32     ixol;
>  +             pcc_inst_t     insn;
>  +             ppc_inst_t     ixol;
>        };
>  };

I didn't mean that, but it would be nicer than the change you've got,
if it works.

>> Also can't find where you define ppc_inst_read.
>>
>> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/=
trace/ftrace.c
>> > index 7614a9f537fd..ad451205f268 100644
>> > --- a/arch/powerpc/kernel/trace/ftrace.c
>> > +++ b/arch/powerpc/kernel/trace/ftrace.c
>> > @@ -41,6 +41,12 @@
>> >  #define      NUM_FTRACE_TRAMPS       8
>> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
>> >
>> > +static long
>> > +read_inst(ppc_inst *inst, const void *src)
>> > +{
>> > +     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
>> > +}
>>
>> Humbly suggest probe_kernel_inst_read.
> The other probe_kernel_*  functions were from generic code so I
> thought it might be misleading to call it that.

It's probably not too bad, you could add a __ or ppc_ prefix if
it would help?

Thanks,
Nick
=
