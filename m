Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17D2D9234
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 05:09:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvSZS2t87zDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 15:09:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jBTloPwF; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvSXd6c7bzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 15:07:44 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x126so2419755pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 20:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PWh+Vdx5/CQGyHUaGmwrxc21bpz+T3vvjsxDr9do1W0=;
 b=jBTloPwFVdlwdlyZC+hyxpB8boEXRewMRO9QCB0wjdmJOmvQb80Ek4uI5dvhIFgIUN
 wSKp+HV+IHGiktwJA1TU+TMZf+X7ZRlOLvK0X4IEYwtvStmIsH2unXn4Ek85lTmYj0eP
 Wnr1x3fWaGpVL1qqbaasFyRoQxNoWidjeeDS7jMm6BIAgHEljWpEp0mJGpKO26gbxkPN
 jD3d4spmbJmrIjKKZ+IzejsU0bowKWdXcuMRD/DC2XuOsVdrFbv4SMYpMXeiX8rw5r5N
 KY3WPknXhjPc5qPpz7J7VoDsQVWeQTs7DhT73S/0wyCEWsVGzZ1wMh0Esl6ayKxhsjZe
 pGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PWh+Vdx5/CQGyHUaGmwrxc21bpz+T3vvjsxDr9do1W0=;
 b=Iboeu4XLmwTqjg+EewfWRN/aH7sRS/afX7oPuEELm5lCra7/5EeLqKib2wtUM/rRPz
 9AcZ97oC2wK7Eiekqr2Lpz32TlkIzceh5aSwjZVTD/TkQ+NZc2/lM0vyldRzLC/LuFSB
 15DizPg3k7Vl4GXUgEql8uon3+r1M5RBTKBpNqiAmIXwZKC58QnKGF2c8McOz+Oe4GAI
 tr3K3KKYyzjeTJHnqas3w/Yh0n1pLzYAwo1uOED4IUlAJyCzUlmctevTbCjOcU0aG3SX
 pzZztZsRkCjJpDef2RB1N9bwejS6W0KG0RAFx55C+SSMjDsrp0s/cVg1xr75MJ1t2fsE
 iRRA==
X-Gm-Message-State: AOAM533tDDTM2Np3O5qYzMyWHbQFZW+U1Rnf8Pq/wYKx5aHkhVBPFGP1
 ih2z+S1iuYniXHUhJubwZdo=
X-Google-Smtp-Source: ABdhPJyIyQ6qEDAOiugwK5Wi7/4KOuz1OqcXosU9vwHYM/fnFbs9BdwPCBgfN29SdfYCrzjFH+R7Vw==
X-Received: by 2002:a62:6c2:0:b029:19e:b63a:91e9 with SMTP id
 185-20020a6206c20000b029019eb63a91e9mr18792139pfg.79.1607918861170; 
 Sun, 13 Dec 2020 20:07:41 -0800 (PST)
Received: from localhost ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id 37sm14724169pjz.41.2020.12.13.20.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 20:07:40 -0800 (PST)
Date: Mon, 14 Dec 2020 14:07:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>
References: <1607152918.fkgmomgfw9.astroid@bobo.none>
 <116A6B40-C77B-4B6A-897B-18342CD62CEC@amacapital.net>
 <1607209402.fogfsh8ov4.astroid@bobo.none>
 <CALCETrWFjOXAd5=ctX3tzgUbyfwM+bT-f8WY_QWOeuDdFxhWbg@mail.gmail.com>
 <1607224014.8xeujbleij.astroid@bobo.none>
 <CALCETrV5BzXuUYm5YAoEKPZZPfLrbHckvwBHzWKrxZS8hqzHEg@mail.gmail.com>
In-Reply-To: <CALCETrV5BzXuUYm5YAoEKPZZPfLrbHckvwBHzWKrxZS8hqzHEg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1607918323.6muyu2l982.astroid@bobo.none>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 11, 2020 10:11 am:
>> On Dec 5, 2020, at 7:59 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>=20
>> I'm still going to persue shoot-lazies for the merge window. As you
>> see it's about a dozen lines and a if (IS_ENABLED(... in core code.
>> Your change is common code, but a significant complexity (which
>> affects all archs) so needs a lot more review and testing at this
>> point.
>=20
> I don't think it's ready for this merge window.

Yes next one I meant (aka this one for development perspective :)).

> I read the early
> patches again, and I think they make the membarrier code worse, not
> better.

Mathieu and I disagree, so we are at an impasse. I addressed your=20
comment about not being able to do the additional core sync avoidance=20
from the exit tlb call (you can indeed do so in your arch code) and=20
about exit_lazy_tlb being a call into the scheduler (it's not) and
about the arch code not being able to reconcile lazy tlb mm with the
core scheduler code (you can).

I fundamentally think the core sync is an issue with what the membarrier
/ arch specifics are doing with lazy tlb mm switching, and not something
the core scheduler needs to know about at all. I don't see the big
problem with essentially moving it from an explicit call to=20
exit_lazy_tlb (which from scheduler POV describes better what it is=20
doing, not how).

> I'm not fundamentally opposed to the shoot-lazies concept,
> but it needs more thought and it needs a cleaner foundation.

Well shoot lazies actually doesn't really rely on that membarrier
change at all, it just came as a nice looking cleanup so that part
can be dropped from the series. It's not really foundational.

Thanks,
Nick
