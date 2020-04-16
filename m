Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C91AB60B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 04:57:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492kQn69QzzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 12:57:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vdlW0vB0; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492kMT3r6ZzDrDg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 12:54:13 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k18so824578pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lLNbxLPEmJyAwYNKxo9v4vAHZXAgKtB/PX1Pq9OmgM4=;
 b=vdlW0vB0Kn8o4q2DLFeiSzGBUwfXEHsFwu4Jw2x5girwUMP6n08lSG53RPj3QQSWx+
 XSKQ1dyUnTvg8JpD/mVb1hs+iJaWg3PBphY8lUqfr034Im+lLsbN/4BHnxPRTbjWb1Ez
 MKyERFneOvtek5HdoKA3kUIDmZIxpsDJZeyMKhePmRmOvM6wYgd6l/F9ho7cCX3zga7C
 Kl+HIRu35Y6X3+Rt7xS20g7QPs40xfVa3WFg2dni0v4j/upGGFNff0zi7X7kIi2eSIfb
 GaL+ezOhXbymJ4Zjix1kviSCI6gOArWkjEFww67oZtMpaUR816+aUF1c2RLmSYM6FTvx
 N6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lLNbxLPEmJyAwYNKxo9v4vAHZXAgKtB/PX1Pq9OmgM4=;
 b=O8Ybr/7iAr2j16VaNDTk7RLIAzjzCqp9dTWpwtHTJqwk3OFrRGx4tPx4c1cv14pDnV
 YK9cGZvzQHiHkO+Zrc7FMYpzDRQGgqlQtPYsdAisTJEI7RnNNMnzNB37Wk8MIhyO1BRd
 ASuPCPWgjN0chGZs1yFR/hF1jq7De2aMjCAnfdhvuvh66cCvZ/5to870Ww/ljEHChLDF
 3v2Q9OiBMaymTKDekR/AtFLV+5/XjbRwNntt4AXsmVIU1VqcbeOiAn3CKSJAZn6ftEmB
 92ZVtq8iwc1hpXKZdrq5whGs7Y3hVyP3h9/d68LpWB+oh/QePHLKPVKIYK4NEda3paoW
 B6Tg==
X-Gm-Message-State: AGi0PuaCI78odbDhrfy95a8OYlFnzHNYvuAOJ+EAb7Epc+uoDSmN1dBm
 r38XvILhxxOsrc6lbYLXIMI=
X-Google-Smtp-Source: APiQypLn1XwWmgK/wlfgK8bb63/Y5yL6+2SRpvjsP4Qbspe9So2Bp7TA/W4Rkd4ki/bhyYn9x+R/bQ==
X-Received: by 2002:a17:90b:4d04:: with SMTP id
 mw4mr2490284pjb.180.1587005650426; 
 Wed, 15 Apr 2020 19:54:10 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id x76sm14937361pfc.190.2020.04.15.19.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 19:54:09 -0700 (PDT)
Date: Thu, 16 Apr 2020 12:53:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416004843.GO11469@brightrain.aerifal.cx>
 <1587002854.f0slo0111r.astroid@bobo.none>
 <20200416023542.GP11469@brightrain.aerifal.cx>
In-Reply-To: <20200416023542.GP11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587004907.ioxh0bxsln.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 16, 2020 12:35 pm:
> On Thu, Apr 16, 2020 at 12:24:16PM +1000, Nicholas Piggin wrote:
>> >> > Likewise, it's not useful to have different error return mechanisms
>> >> > because the caller just has to branch to support both (or the
>> >> > kernel-provided stub just has to emulate one for it; that could wor=
k
>> >> > if you really want to change the bad existing convention).
>> >> >=20
>> >> > Thoughts?
>> >>=20
>> >> The existing convention has to change somewhat because of the clobber=
s,
>> >> so I thought we could change the error return at the same time. I'm
>> >> open to not changing it and using CR0[SO], but others liked the idea.
>> >> Pro: it matches sc and vsyscall. Con: it's different from other commo=
n
>> >> archs. Performnce-wise it would really be a wash -- cost of condition=
al
>> >> branch is not the cmp but the mispredict.
>> >=20
>> > If you do the branch on hwcap at each syscall, then you significantly
>> > increase code size of every syscall point, likely turning a bunch of
>> > trivial functions that didn't need stack frames into ones that do. You
>> > also potentially make them need a TOC pointer. Making them all just do
>> > an indirect call unconditionally (with pointer in TLS like i386?) is a
>> > lot more efficient in code size and at least as good for performance.
>>=20
>> I disagree. Doing the long vdso indirect call *necessarily* requires
>> touching a new icache line, and even a new TLB entry. Indirect branches
>=20
> The increase in number of icache lines from the branch at every
> syscall point is far greater than the use of a single extra icache
> line shared by all syscalls.

That's true, I was thinking of a single function that does the test and=20
calls syscalls, which might be the fair comparison.

> Not to mention the dcache line to access
> __hwcap or whatever, and the icache lines to setup access TOC-relative
> access to it. (Of course you could put a copy of its value in TLS at a
> fixed offset, which would somewhat mitigate both.)
>=20
>> And finally, the HWCAP test can eventually go away in future. A vdso
>> call can not.
>=20
> We support nearly arbitrarily old kernels (with limited functionality)
> and hardware (with full functionality) and don't intend for that to
> change, ever. But indeed glibc might want too eventually drop the
> check.

Ah, cool. Any build-time flexibility there?

We may or may not be getting a new ABI that will use instructions not=20
supported by old processors.

https://sourceware.org/legacy-ml/binutils/2019-05/msg00331.html

Current ABI continues to work of course and be the default for some=20
time, but building for new one would give some opportunity to drop
such support for old procs, at least for glibc.

>=20
>> If you really want to select with an indirect branch rather than
>> direct conditional, you can do that all within the library.
>=20
> OK. It's a little bit more work if that's not the interface the kernel
> will give us, but it's no big deal.

Okay.

Thanks,
Nick
