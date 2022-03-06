Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C240B4CEE7D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 00:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBd7J5BRVz3bZf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 10:28:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Iltodzo+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBd6j6l4Kz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 10:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Iltodzo+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBd6f13N4z4xsk;
 Mon,  7 Mar 2022 10:27:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646609258;
 bh=ecFwYfD7mRQxoIkEczbbOaKJ1xong6ZLGztAcRw7l6g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Iltodzo+XuUBbPmqGgFaECqIb5PjFin+/o+OsX7hG5fep9Ro7yAS1hRJVLZPhBrui
 5I1hiydo1xnX/UMeha2bDyMVTnO7zkBD29rUVSwFAvLxPpYV7jbIXlbLfy218W/drD
 ZH01hEBVaGn7fTB5VGcuca4PsrNnJSUtJG6sxphCDeKRfjJRtPDFZ7tQzHOEhd1o+2
 rurc+7Nzn5KwYEowDSz4YVzK885QIam2kymI8UbXRTKhxDgUnw+kwWMgWTqtL+Cdi8
 ZGzbByLPg6/0yjat1+COw6CU4MLHjvx26M+E8UAVi4Kw1YgAIRoEddIYVUHusHtJNL
 o3N0J6opa4e0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-5 tag
In-Reply-To: <CAHk-=whEQRDQ3fJT1KVVAeaWiJ+mYTM+MwYoXEOUQrnbERLa5w@mail.gmail.com>
References: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
 <CAHk-=whEQRDQ3fJT1KVVAeaWiJ+mYTM+MwYoXEOUQrnbERLa5w@mail.gmail.com>
Date: Mon, 07 Mar 2022 10:27:31 +1100
Message-ID: <878rtmoe58.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 muriloo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sat, Mar 5, 2022 at 11:51 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> powerpc fixes for 5.17 #5
>>
>> Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set.
>
> Hmm.
>
> I'm *still* not seeing the fix for the reported
> powerpc:skiroot_defconfig failure:
>
>     arch/powerpc/kernel/stacktrace.c: In function 'handle_backtrace_ipi':
>     arch/powerpc/kernel/stacktrace.c:171:9: error: implicit
> declaration of function 'nmi_cpu_backtrace'
>
> which has been pending forever.
>
> The alleged fix (commit 5a72345e6a78: "powerpc: Fix STACKTRACE=n
> build") has been in linux-next for three weeks by now, but hasn't been
> sent to me. And you must be aware of it, since you're the author,
> signed off on it and committed it.
>
> What's up? This has been reported forever, and was already failing in
> rc2. I'm about to release rc7 and it's *still* there.

Yeah, hmm indeed.

It's in my next branch, not my fixes branch. That's why you see it in
linux-next.

I don't recall why I put it in next, possibly I thought it wasn't a
regression in this release, but I may have just put it in next by
accident.

I'll cherry pick it into fixes and send it to you before the release.

cheers
