Return-Path: <linuxppc-dev+bounces-9675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14FAE5F6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 10:33:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRJ9v4VFBz2xk5;
	Tue, 24 Jun 2025 18:33:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750753987;
	cv=none; b=XfNZL4SZQwAHe0HcbWA8kB7JD0XNeewR0C/aao4H50rO9/z/ERaDhlKQrr2hPYHAspD2HV9huKlyhjQrpYTfrRjf3JWsBPtgwnlwMD+mabk4NXhLHOAuFqaCnIZAvMU20ktRFiaG4iGeAUit3uLIou14Ba0/Iz2rydsdvclNtEhGo1YsCyVBK8KyDhD5aIyn7bWfQPBtNA00Om3AcLBdo8jlG6O3kGvM5J+pKO/wNjFSvH5igu9DvG5sMQ3HZ2J+cvpKLPLnBOiBzSGrFvSOMRNuC2O8kk8uuoWy7VE2rs1gxxbXIsJDAgCCmX0dTSYvpwGIGAoSa85MngCnNYYznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750753987; c=relaxed/relaxed;
	bh=HAcUzdSSJoRNC6czCmlN0ZjREWVQ1d/qdtR05/VTcrw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNg8FZY34AAEZG6/v3PbNLe1jzGCFZsX1xBPG0erTEZusjU4lOG32qWdyNwrvkcRQGGSwY0PIjDolsbwdP1FbEu+7pEb1yJi74jAXbMR0FPMi6jq7BRcdiABeJqXthqoFzo5vC0pLZLz6u4RTcvfhmrSrwIW3xWCEFw+oeDM4iiXxsHxcjQjrRzZEw4dZX3iDpPp7bOeIFD+KU0j6a9ae5mV9lfPdr3sbd0HnK71Dpg88avAcptR4NraOkX3GvHrxBzby0o4FeWFwNq3e4KkhjQ/D0jDFSxLpc6InoGaB0QpyGuRIfnbaxF0dmGJoUFZxG0qShQNTZMnQaxTvdMgWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/spYUKq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/spYUKq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRJ9s63fCz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 18:33:04 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3298426f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750753980; x=1751358780; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAcUzdSSJoRNC6czCmlN0ZjREWVQ1d/qdtR05/VTcrw=;
        b=h/spYUKqWcLnkFa4dueNivTlCFsQMxBs2X0tnynHOtrQrbpdoxfAUiIyPSqbZpBKlD
         nQTYmLEHKwMv7jU9X4FoBiMdMWW8uRnv54O4xh/PbU8iXQtZeYthEAE6TVettnVgnxYK
         SUbe+bZt7xiytkhpm/tzdNY5xIKzvOD2PqEfAk/1R7Xb9eUj54P3GtU6klIIwBBFwlcq
         b9XRDAkT6NaXDodV9gKXioF2RnMPBr8uTNwJsG8f44pMpNryR0006SQi7Dhcqw2PW2w7
         QWxUqeotU15mBtZEJV4iZJm+ES2dyQ7aJVwpvc6YmkZacfKVixG2Osaw00KGWEkKOoPk
         2vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753980; x=1751358780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAcUzdSSJoRNC6czCmlN0ZjREWVQ1d/qdtR05/VTcrw=;
        b=JISf9Q6wp36yyjtK97Y5Xfa82xWrJFwPnflhnpNYUsP0hjQeyE46QS4y3PPMCsdo3D
         TT4RyuWYkLsbMbyTbF/qzJy/ddZFwuAKFKQf2bMCyWfYWenJzlkWhAOIfsICBQhGZvhp
         ZDXrmiXOzHhlCiAcw+D3aCiw8caHk8TAz4n0IA2WBqk7UvQJ51KsCq0rbpPan0MWxiOg
         bpvLjGit5yl/UEYRtGP+7Kj0ENvZBTD6LXcu3ku7q0n4+rs+sILeGcHu3at0fJMt2M4C
         DLA/Q9qQFDuY/VDJ6GnpwE++nvYba/SotLQyJgPIaDAPAssaOPWZN+6KOYtgh52m5hb/
         nnsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUycNsPiK8j0zdSFTyS0W+dQGX4lSkpVXY4ZQV3FIGnb5aKMJRyaDzyBF57hewS9jYhlQGfS89lrZArkMs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzP6gjg8iNvh23WsSgK6/Ceamtn/a4vgN0hmDx07NUVwVY10GnG
	qkzui63ixKUaGRz5Z0zjwREUGFdIMleavsX+zgF+QhKF7eseadgDmYoa
X-Gm-Gg: ASbGncuQjgTxEP9b6fMNVra/HJMTEl86MUvpZJlhA/dG7htt89XJi9LeuaD8TNxbLS5
	Xo4NkRPnOJR6xRQh8jCKAIcd45KMvn5g668gdWPij7C6LkTP/kKVgjY7iWEaJN+qC77VAAUVH+S
	EV+X+mKZfAN++PE3kngAntKLL+74z8mrwc5T6zeAWUdpqt2FxpmnE0AOK8/80QcM0t95fW+QnNE
	SkUQDbsYCwjgeDAD166uuFo0OK4f9vSgHq/xmFTe+NYu43LAR4rgbL1vk6wNM8MDIlI4eiRt3Av
	UP6mVCrfq4bATOTlXPznTEDxqsqOlIo5yowIO93DW2vUeqstqSZkZhhYXf98dmSDfaSPiGQhxrj
	ExqAhLM3Bd1Lh0dPah725EF2m
X-Google-Smtp-Source: AGHT+IFa8wKlAMcVrotXu5zgRzJw7hFatpGh+UkLiPFv+ni6YiXds6pDi5irzSKPmq0uy7jsxhYgzw==
X-Received: by 2002:a05:6000:645:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a6d130e802mr13287583f8f.40.1750753979983;
        Tue, 24 Jun 2025 01:32:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810caefsm1285937f8f.87.2025.06.24.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:32:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:32:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250624093258.4906c0e0@pumpkin>
In-Reply-To: <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 24 Jun 2025 07:27:47 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 22/06/2025 =C3=A0 18:20, David Laight a =C3=A9crit=C2=A0:
> > On Sun, 22 Jun 2025 11:52:38 +0200
> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >  =20
> >> Masked user access avoids the address/size verification by access_ok().
> >> Allthough its main purpose is to skip the speculation in the
> >> verification of user address and size hence avoid the need of spec
> >> mitigation, it also has the advantage to reduce the amount of
> >> instructions needed so it also benefits to platforms that don't
> >> need speculation mitigation, especially when the size of the copy is
> >> not know at build time. =20
> >=20
> > It also removes a conditional branch that is quite likely to be
> > statically predicted 'the wrong way'. =20
>=20
> But include/asm-generic/access_ok.h defines access_ok() as:
>=20
> 	#define access_ok(addr, size) likely(__access_ok(addr, size))
>=20
> So GCC uses the 'unlikely' variant of the branch instruction to force=20
> the correct prediction, doesn't it ?

Nope...
Most architectures don't have likely/unlikely variants of branches.
So all gcc can do is decide which path is the fall-through and
whether the branch is forwards or backwards.
Additionally unless there is code in both the 'if' and 'else' clauses
the [un]likely seems to have no effect.
So on simple cpu that predict 'backwards branches taken' you can get
the desired effect - but it may need an 'asm comment' to force the
compiler to generate the required branches (eg forwards branch directly
to a backwards unconditional jump).

On x86 it is all more complicated.
I think the pre-fetch code is likely to assume 'not taken' (but might
use stale info on the cache line).
The predictor itself never does 'static prediction' - it is always
based on the referenced branch prediction data structure.
So, unless you are in a loop (eg running a benchmark!) there is pretty
much a 50% chance of a branch mispredict.

I've been trying to benchmark different versions of the u64 * u64 / u64
function - and I think mispredicted branches make a big difference.
I need to sit down and sequence the test cases so that I can see
the effect of each branch!

>=20
> >  =20
> >> Unlike x86_64 which masks the address to 'all bits set' when the
> >> user address is invalid, here the address is set to an address in
> >> the gap. It avoids relying on the zero page to catch offseted
> >> accesses. On book3s/32 it makes sure the opening remains on user
> >> segment. The overcost is a single instruction in the masking. =20
> >=20
> > That isn't true (any more).
> > Linus changed the check to (approx):
> > 	if (uaddr > TASK_SIZE)
> > 		uaddr =3D TASK_SIZE;
> > (Implemented with a conditional move) =20
>=20
> Ah ok, I overlooked that, I didn't know the cmove instruction, seem=20
> similar to the isel instruction on powerpc e500.

It got added for the 386 - I learnt 8086 :-)
I suspect x86 got there first...

Although called 'conditional move' I very much suspect the write is
actually unconditional.
So the hardware implementation is much the same as 'add carry' except
the ALU operation is a simple multiplex.
Which means it is unlikely to be speculative.

	David


>=20
> Christophe
>=20


