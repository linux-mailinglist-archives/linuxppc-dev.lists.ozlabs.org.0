Return-Path: <linuxppc-dev+bounces-13001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54801BE8475
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 13:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp2Sv1mh9z3cZN;
	Fri, 17 Oct 2025 22:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760700079;
	cv=none; b=cwN1cufc0sgOFvjkvVXealLe+F4xiLeKqCbmIwjPNSBth1FdsAq6dlbBCZ0wHHyre8UuNIE34zJpdizDUdWZi9YohOJ9BbtcizgWH+gCukjzpgMcMB7SB2gz8DUIhjSf9nPk0ZguKzRY5Vx8Be1oiw4fRsxh22lrRTNuv5mCysOXqPtjDelHqrliIbgGkwEUlH9hGumKsUY4z7JCyvJDbEFb5GSUqX5h6JJ2re7lrGoEgvQ4v/hUgBp/E/gRm/hH3jt0NwJFeL+w07elrOaPsnsdvraF/VePVloInSB4ddIuYYpbE5cBB8GAkUID8E6cyWMbOBR30wyy4Yi6HptttA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760700079; c=relaxed/relaxed;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Si20yTsVA7mshG1M54+5lct4oouIULfVzJ4je4ykIOGFvagimBtc0cZWDA0syr1pZBo7hwo1wV4OajuMllwuvQYlV1GBXKltVSUDTJMsVT/DhCT6sE4kzOjkoo2NwoqiGIESxZPCB0H6lWo2OinKk6kz+23dCIsbZCeGyCifQ31LOXm31TMziphQG2mSUgHmP69SU8V0fFN4SPhnFEawN2X7/Z9bihSQWPoBnzOUsFav4wK8NnZ2EIGO1MkN5bvjjn0E/bDrOqfaHbp6URwRR6oI7F91y6yTTmeVDFt8GK6jQzlQwZohnWOKgzMtsV6rt9llaR9DmibYQLc9xyWdlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0w22HeRq; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yb2o+SyR; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0w22HeRq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yb2o+SyR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp2Ss6FCpz3cZ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 22:21:17 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=0w22HeRqwsEaDWfFRcdym9ZdxujQL/SMlrRPuJJ8G0lW0VU+roLNqAQqn+5ddD4XHPvhCI
	G8RfcOVLaDb522FTklVP+T9AWU7a2YUuU3/zS9de1315WWxBoHvU0Nj9QJ0h9Ke1JMi7Um
	5yCRggrIaasOfxTCXZDvGcnXQN5DpN5DBZjhPihilyQSh9zfnpDA51OSo91RRi6YZ2ajDU
	zq9nd/fL2MnY3jElVShCHCxnhdw8CHKx+HzZyOCYRxfE/8sQpHPMZx5+Owgr0vwuACBi4W
	Im9zYuGn3kphxZ4bkop+xrUFJb6ZrY64lUNREC8dmKGqVpm3CuTHhMBvBTfxjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=yb2o+SyRVbqNJx1T2MjsSgrIjIm9/+bN/XuOD9YUNJmae1nSpVUZAsBLSIxLGfTfjAFqpz
	FrlXldlLVbWUzqBA==
To: Andrew Cooper <andrew.cooper@citrix.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Peter
 Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
Date: Fri, 17 Oct 2025 13:21:14 +0200
Message-ID: <871pn122qd.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17 2025 at 12:08, Andrew Cooper wrote:

> On 17/10/2025 11:09 am, Thomas Gleixner wrote:
>> --- a/include/linux/uaccess.h
>> +++ b/include/linux/uaccess.h
>> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
>> +for (bool ____stop =3D false; !____stop; ____stop =3D true)						\
>> +	for (typeof((_uptr)) _tmpptr =3D __scoped_user_access_begin(_mode, _up=
tr, _size, _elbl);	\
>> +	     !____stop; ____stop =3D true)							\
>> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;=
		\
>> +		     ____stop =3D true)					\
>> +			/* Force modified pointer usage within the scope */			\
>> +			for (const typeof((_uptr)) _uptr =3D _tmpptr; !____stop; ____stop =
=3D true)	\
>> +				if (1)
>> +
>
> Truly a thing of beauty.=C2=A0 At least the end user experience is nice.
>
> One thing to be aware of is that:
>
> =C2=A0=C2=A0=C2=A0 scoped_masked_user_rw_access(ptr, efault) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe_get_user(rval, &ptr->rv=
al, efault);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe_put_user(wval, &ptr->wv=
al, efault);
> =C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 // unreachable
> =C2=A0=C2=A0=C2=A0 }
>
> will compile.=C2=A0 Instead, I think you want the final line of the macro=
 to
> be "if (0) {} else" to prevent this.

Duh. yes. But I can just remove the 'if (1)' completely. That's a
leftover from some earlier iteration of this.

> While we're on the subject, can we find some C standards people to lobby.
>
> C2Y has a proposal to introduce "if (int foo =3D" syntax to generalise the
> for() loop special case.=C2=A0 Can we please see about fixing the restric=
tion
> of only allowing a single type per loop?=C2=A0=C2=A0 This example could b=
e a
> single loop if it weren't for that restriction.

That'd be nice. But we can't have nice things, can we?

Thanks,

        tglx

