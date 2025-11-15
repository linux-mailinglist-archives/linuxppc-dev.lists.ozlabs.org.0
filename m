Return-Path: <linuxppc-dev+bounces-14195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C696FC60810
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 16:52:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7z654BZwz2yrQ;
	Sun, 16 Nov 2025 02:52:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763221933;
	cv=none; b=XJ83R9R9+z4l6aRSKUP025BV48RTpQBTvITRfOAOJKuV/OVRcfGrRnsqkNIt2ooHIZ/qZ3je1HSd6bmuM/I/rVMsY16gJbGwifdnfrnOlIriPlWc7uN+6fk10zGeMN9/tn8hiOa2fJMjuVjg2GSwhF8binLkX72lxBRUEmLL28aAXr3vVWZC3IzqHH+dWvY+myIZxcvepoRWt1rPEikhRlGsNnX+osEllZ3pnxnxOEKjnoWd5x7j2GiKsi1gG2/GnOSSXXgVGs06Ca67BWKgivCKlqfV1LvMnNumBUwtOAz/qTukqbczlsDMYo07r+PUbAguD3CgoeFLrpeJWiqekA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763221933; c=relaxed/relaxed;
	bh=HSPnZMDPrSmy6ZnP5yUFLoTkZttJ+ulSH2tuXAA3xPU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ed4Xs6K1gbRx6M3T4cFeUnOgAsYOgZSt6qG+HzmVsv8G4rvJDvsPvt2/IRmTl1BuxyiWW8JXbv0gOV5k1SVPNo5j67thjAXwccw2MgmZ/y2wMHXKt8HGbK+NIa76LMgCRUEQQve8KeNocWzekdP516efdyvvL0GAZsvf0zi7Fy3D+NF0ZFzF4R0vbc25IZxqTdsWBhRUX/W620wUn4A0T18WhHP/cvIs4kLB2rzvQQnH+QmQ9D3Ui8UjMC629m5xBNTIpPutM86FnExndT6Ie8hA8QXHnK2YnlxqdgDOlBZJLLo8aGefslDs2+EQ0aJarZeT2Thj3MRhH9nLinT+RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bSRDkmmk; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q9EioKQO; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bSRDkmmk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q9EioKQO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7z635b61z2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 02:52:11 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763221920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HSPnZMDPrSmy6ZnP5yUFLoTkZttJ+ulSH2tuXAA3xPU=;
	b=bSRDkmmkFM+3H86HARt9T+Nmon/tHmmTmfBcVZ4meeRSD/6sMoF05cS6o02IaEF/X5+AEp
	hGCyUIWGfdlI4ROZmuOkcp6c7VwUy1/HYtgAeUur21/RD6NrfG2g0tOyKkY5OR3ghE4Bdy
	OirG2HWhgC9w1EtGdh5jSgAE4WIwhxnYOTwp5Wp1uknEDQ5rbTlo7cvZP0n6HojpnCqu6x
	lonK55GQltRVV07NyHSFktsseUp4Z2NUBUcwMuX2XeP/hY0n+HDSIkuASxqHOB7Ll/+859
	xqV7wA1p/qgQo31iITdEy1A0lWOY32oK3oOUYgmokDoqg5BNgkF5nfXIq+64mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763221920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HSPnZMDPrSmy6ZnP5yUFLoTkZttJ+ulSH2tuXAA3xPU=;
	b=q9EioKQOs2kPRGrhP2HBDkWUx314/kUIkP+PNQvawiMxyrLHb6u/YSqyHWKp7a/d4AxH90
	QE0X4Os16XT0NFCA==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman
 <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 02/10] uaccess: Add speculation barrier to
 copy_from_user_iter()
In-Reply-To: <598e9ec31716ce351f1456c81eee140477d4ecc4.1762427933.git.christophe.leroy@csgroup.eu>
References: <cover.1762427933.git.christophe.leroy@csgroup.eu>
 <598e9ec31716ce351f1456c81eee140477d4ecc4.1762427933.git.christophe.leroy@csgroup.eu>
Date: Sat, 15 Nov 2025 16:51:59 +0100
Message-ID: <87jyzr9tuo.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06 2025 at 12:31, Christophe Leroy wrote:
> The results of "access_ok()" can be mis-speculated.  The result is that
> you can end speculatively:
>
> 	if (access_ok(from, size))
> 		// Right here

This is actually the wrong patch ordering as the barrier is missing in
the current code. So please add the missing barrier first.

As a bonus the subject of the first patch makes actually sense
then. Right now it does not because there is nothing to avoid :)

Also please use the same prefix for these two patches which touch the
iter code.

> For the same reason as done in copy_from_user() by
> commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
> copy_from_user()"), add a speculation barrier to copy_from_user_iter().
>
> See commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
> copy_from_user()") for more details.

No need to repeat that. Anyone with more than two braincells can look at
that commit, which you mentioned already two lines above already.

Thanks,

        tglx

