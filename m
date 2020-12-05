Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B32CFFB2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 00:19:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpQW65PdVzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 10:18:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QqSC0/j6; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpQQk21HZzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 10:15:09 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q22so6393664pfk.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Dec 2020 15:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=L+vg4JbP0FJBCP1pF1I695Sm385f278Rs5jRmS9rNXg=;
 b=QqSC0/j6vjRBOiUDUATi/LPsIVAKUy7bK3rktA0IiR7ML8OM2DpeGXtMsUyK3nMwvk
 pSIpV88iDIfxTLuHlmK8QbBnKk9K3t3fr+y6EQaJIyRri4NV/kXIDMmBsMZJZSctTZtK
 HhdYeIA6jeB/vHZdcEGMnXvdBMLb3PuBdsn0rJvHnz/Lly9SVkMu+NWh4/mOtxfPk22B
 G98NTD3lNPX4TNB+6ZX95CA788LnFcXhbCyOA600VVkyE4El+oW55ey3b5hgAYD+ZvMV
 XEhp7uyplSDklj4P9m6cf1EiAoFeRjIeP8qF9dgrcpjqlXWreqnm2tGOqgBF6WlFcWiJ
 4FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=L+vg4JbP0FJBCP1pF1I695Sm385f278Rs5jRmS9rNXg=;
 b=H1EVTvoASQKSuYNrIv/cV/5L5Zs/BB+B8sVwP3Nt3EQN02PGWBrpq5hq5z4xdK1M3N
 yrwzYr4JBkg1nF+ltzKWxdPvIYSiU2AlDLtRAuCg9crhL8lpPSeg6JT2C1Uy4u1JJvw1
 S1vybYkmGDNvi+paFkhZBo5IZMfjUE3YoQc+EKKro0emqDyESWzP9mm/tNOKr06xyuva
 NaYzswSNnoGkiKBXpGaAhc4MsVRCAHlWQxHL7mMHG03ZbWgeodkIbmrmjn3AzUbIYwdY
 ackKZwYbXd+m1DB6Ib+EapUFOq8ZTMN6RtBuS2ShZ6arxVCjJAxFg9vwIb/mVA0MX+va
 3O0w==
X-Gm-Message-State: AOAM533sMDrweSmQu3v0RFKc05TplqQNhCRNHfACXCU6r8x00VWVB8LA
 PGXHhhxHUSez6/t89TVp40Y=
X-Google-Smtp-Source: ABdhPJzfxzuJbfqX3AxcZgkq+sDJtUgImoz4dGsHTfVrStKXtO6JvVyi6Isgck4AhVl4gjBk5OYlzg==
X-Received: by 2002:a63:1107:: with SMTP id g7mr12703758pgl.432.1607210105367; 
 Sat, 05 Dec 2020 15:15:05 -0800 (PST)
Received: from localhost ([1.129.241.238])
 by smtp.gmail.com with ESMTPSA id k26sm9514644pfg.8.2020.12.05.15.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 15:15:04 -0800 (PST)
Date: Sun, 06 Dec 2020 09:14:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@amacapital.net>
References: <1607152918.fkgmomgfw9.astroid@bobo.none>
 <116A6B40-C77B-4B6A-897B-18342CD62CEC@amacapital.net>
In-Reply-To: <116A6B40-C77B-4B6A-897B-18342CD62CEC@amacapital.net>
MIME-Version: 1.0
Message-Id: <1607209402.fogfsh8ov4.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 6, 2020 2:11 am:
>=20
>> On Dec 5, 2020, at 12:00 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>>=20
>> I disagree. Until now nobody following it noticed that the mm gets
>> un-lazied in other cases, because that was not too clear from the
>> code (only indirectly using non-standard terminology in the arch
>> support document).
>=20
>> In other words, membarrier needs a special sync to deal with the case=20
>> when a kthread takes the mm.
>=20
> I don=E2=80=99t think this is actually true. Somehow the x86 oddities abo=
ut=20
> CR3 writes leaked too much into the membarrier core code and comments.=20
> (I doubt this is x86 specific.  The actual x86 specific part seems to=20
> be that we can return to user mode without syncing the instruction=20
> stream.)
>=20
> As far as I can tell, membarrier doesn=E2=80=99t care at all about lazine=
ss.=20
> Membarrier cares about rq->curr->mm.  The fact that a cpu can switch=20
> its actual loaded mm without scheduling at all (on x86 at least) is=20
> entirely beside the point except insofar as it has an effect on=20
> whether a subsequent switch_mm() call serializes.

Core membarrier itself doesn't care about laziness, which is why the
membarrier flush should go in exit_lazy_tlb() or other x86 specific
code (at least until more architectures did the same thing and we moved
it into generic code). I just meant this non-serialising return as=20
documented in the membarrier arch enablement doc specifies the lazy tlb
requirement.

If an mm was lazy tlb for a kernel thread and then it becomes unlazy,
and if switch_mm is serialising but return to user is not, then you
need a serialising instruction somewhere before return to user. unlazy
is the logical place to add that, because the lazy tlb mm (i.e.,=20
switching to a kernel thread and back without switching mm) is what=20
opens the hole.

> If we notify=20
> membarrier about x86=E2=80=99s asynchronous CR3 writes, then membarrier n=
eeds=20
> to understand what to do with them, which results in an unmaintainable=20
> mess in membarrier *and* in the x86 code.

How do you mean? exit_lazy_tlb is the opposite, core scheduler notifying
arch code about when an mm becomes not-lazy, and nothing to do with
membarrier at all even. It's a convenient hook to do your un-lazying.
I guess you can do it also checking things in switch_mm and keeping state
in arch code, I don't think that's necessarily the best place to put it.

So membarrier code is unchanged (it cares that the serialise is done at
un-lazy time), core code is simpler (no knowledge of this membarrier=20
quirk and it already knows about lazy-tlb so the calls actually improve=20
the documentation), and x86 code I would argue becomes nicer (or no real
difference at worst) because you can move some exit lazy tlb handling to
that specific call rather than decipher it from switch_mm.

>=20
> I=E2=80=99m currently trying to document how membarrier actually works, a=
nd=20
> hopefully this will result in untangling membarrier from mmdrop() and=20
> such.

That would be nice.

>=20
> A silly part of this is that x86 already has a high quality=20
> implementation of most of membarrier(): flush_tlb_mm().  If you flush=20
> an mm=E2=80=99s TLB, we carefully propagate the flush to all threads, wit=
h=20
> attention to memory ordering.  We can=E2=80=99t use this directly as an=20
> arch-specific implementation of membarrier because it has the annoying=20
> side affect of flushing the TLB and because upcoming hardware might be=20
> able to flush without guaranteeing a core sync.  (Upcoming means Zen=20
> 3, but the Zen 3 implementation is sadly not usable by Linux.)
>=20

A hardware broadcast TLB flush, you mean? What makes it unusable by=20
Linux out of curiosity?
