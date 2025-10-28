Return-Path: <linuxppc-dev+bounces-13455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF21C159EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 16:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cww2y6Mvgz304l;
	Wed, 29 Oct 2025 02:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761666970;
	cv=none; b=oLQX/gAQojIRzq14Ctdws5/YlFSMeRYXQhqp9gKJbPPOnT4DW/YrtIhq6uELtx1dIv+Zkok2xKa9XyjMcmcrq1uLKgYPJL04Qmtm+mvlt2OyqlxcVeVMqJOZaAnP/s/q9lVQdjrUdIOdPNITixC6vbKnIbIdkCiBruRn3zi3ocJcp0LOlKsR7HR6EVbqt3Z4GHZ0pmkBnmbSAYf3Dy0A/GYmnzAz1GBWgHVbAK17vp2gOwABOfs05PzavpHAVnOQooJ9zGFNDyVNnaH8nKCc6Fx20nW7PSmOluk7QhyWhUKeyg2teeUaZEjE78GDQugpf0bI+fURwK1lwC4T1CCWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761666970; c=relaxed/relaxed;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iTxlt0MaL3NItIlyLmPCxqAHje6JnDh+Y6b6dbWTEVH2UqebEYxEabnLfQvog/a8GMOq3CzAj7KyEo58d+8GpDxa9IPpAWvWTR/kywDTxrT+DSFCj9j3RnwdgyA/chWiwOmPeHITD9tMeTGttz182lzI9G8kv5auwr2SxQ0inNqHhfMgjjZ+J1FAnKoZkNenGJ1MgdIYq3QA7gLlsSWxP2sHlo79hGwPlk/xDK2QIJYBKqCcO2cPX+fFmTWKcUGx+TxVYP76WUlqbxDZ2CcMc+2Xs4ad+wXZJVXgk4KCGKCT6V2Ud6mzwVVDF8x6rkisdNLNa/+2+ITcMnOg/FDGMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OzfJrQma; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+BHGZAi3; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OzfJrQma;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+BHGZAi3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cww2x1ynsz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 02:56:09 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=OzfJrQmaGSYN7SjKtIVGt8XfMPuNg4JidCQ8tWQK7AVcOCmFMWTyt7m3oaUqsJxpyM0pab
	+9VYgPLRugbHDX88KcBOysbJ/aq1qSI58eSdNkEqVOW7qjKTKIUy5Dlk/fxAOLwId5eUGL
	MMCc/R6qmw7qog3LmZOpn1hDbjFJ/yfaXhgNJR3gCLTsi/v5MgAafS4ZxWm/T3HYbhDBYz
	7c21YHT0Nu/Sjny5kfjGTXYYbNGtZT06Axwaf1pQQ7shqgfmdljAo2APs5uuRC3KZQDlgK
	uYX1vd7MjyQwAwEqJ1sI+OyJphVkD9lM3WBrKG1nbnqWkrsRgH5c5NF/n8hOYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=+BHGZAi3yNFrAvpwe9vwol5p0lVACxAmOqomEwb4Pm2KqtlBgDYqoGb8xyRWB/0XxRQyXl
	VePkBymJj4BQJSAg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?An?=
 =?utf-8?Q?dr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, kernel test robot <lkp@intel.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Linus
 Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
In-Reply-To: <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
Date: Tue, 28 Oct 2025 16:56:03 +0100
Message-ID: <87frb3uijw.ffs@tglx>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28 2025 at 10:24, Mathieu Desnoyers wrote:
> On 2025-10-27 04:44, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> Replace the open coded implementation with the new get/put_user_inline()
>> helpers. This might be replaced by a regular get/put_user(), but that needs
>> a proper performance evaluation.
>
> I understand that this is aiming to keep the same underlying code,
> but I find it surprising that the first user of the "inline" get/put
> user puts the burden of the proof on moving this to regular
> get/put_user() rather than on using the inlined version.
>
> The comment above the inline API clearly states that performance
> numbers are needed to justify the use of inline, not the opposite.
>
> I am concerned that this creates a precedent that may be used by future
> users of the inline API to use it without performance numbers
> justification.

There was not justification for the open coded inline either and
converting it to get/put must be a completely seperate change.

