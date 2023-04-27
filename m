Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A422D6EFFB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 05:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6LMF3TSxz3f8T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 13:10:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e1nt/ZiO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6LLM6Mpsz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 13:09:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e1nt/ZiO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q6LLC06rnz4x5Q;
	Thu, 27 Apr 2023 13:09:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682564947;
	bh=S9vkNzq/sWnQ+hKq02kIHxm1YcRt+uc5ZstHfvPkWpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e1nt/ZiO8mHb9GEdS2Yydj8tDRxfv4ZT82IOTGN3flhKqTGusk1IG4Ic57tPh3QuE
	 cMUCSzCTgN/qlohDGakAXqdCcyD89/Uxfl4Uzdyi03xL9Ynpiz1D7oRWYyTd/riNNT
	 +VUqIxK4Dlr2CaJe+z4kcboYKQoD7tR99d5r3fBrv5/m7CksW6Is8Je421WZn/2gNe
	 tzHhXFBchgbCRpA4nlADdN7G7P1h69RKXK6JULfpXQXpTv1E19Jfa/OUg/3KN2Pwxu
	 6TeCw2N2QG6q+/zWtsTaCV0h+Xq4vbtN3neRftU1AM9dynCu0U2N59kj1ngUI0ZrSK
	 JBaDokcmE8gfQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia>
 <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
 <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com>
Date: Thu, 27 Apr 2023 13:09:06 +1000
Message-ID: <87v8hixbql.fsf@mail.concordia>
MIME-Version: 1.0
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
Cc: rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> On Tue, Apr 25, 2023 at 2:01=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.com=
> wrote:
>> On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
...
>> >
>> > There's 12.2.0 here:
>> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64=
/12.2.0/
>> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64l=
e/12.2.0/

> powerpc64le-linux-gnu-gcc-12 cross compiler on my Ubuntu 22.04 does
> not seem to have that issue as gcc-10 does

OK. So so far it's only that GCC 10 that shows the problem.

If you have time, you could use some of the other versions to narrow
down which versions show the bug:

  https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/

There's an 11.0, 11.1 and 11.3 there, as well as 9.5 and so on.

There's=20
