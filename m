Return-Path: <linuxppc-dev+bounces-13000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8ACBE842F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 13:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp2Gw0v6Pz3bpS;
	Fri, 17 Oct 2025 22:12:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760699560;
	cv=none; b=QGxLYr0GHdFCmOH+QRTvox1zZ4DtJ+7dq4FDYyUonzDC6Tmbqr5v501O1s1srjcOoilc9xQ5AQUrxNFTJUJB1x1dlpehVP6WxOgsVEmNCD7wL5euUJDL7XBlJBzmdMDbgE5vwXduvEtVw4kP76KG2jUcMULbjamOgSDsJQ+39v5Lp7hNAb3WfKLYPlqysWvuniVSaBYsQlxSiwGfH7aehjK81jreChXVBCnAN3FvnLGwtiLbCq4g3bga6vbMkVtfeL5eeRsH91f4NdxXdhHzF+Zm1cjt5JPOsTJ+vFlgPg7ulnrD2Ff/Mf9h+kDeTcHtEYNv3AcVbmg0d6MT9CiAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760699560; c=relaxed/relaxed;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mWGr0D+/0ZSFCin4jv/kPdYg3dQbI3OLZFVv/aWnU9QoyuLOw1zvxrRN9y3kEinaZPNvgOK7P/+5CwZUHF+eXwY/iR/GrFcVaMd2Ik9huqirytsQknd3ZtsDasJvBQJ3mM0OFtvJ0/ZVh2RysFmHuudmUQermj8L76/XDy/jX/z8/XbYShKhFVxZ2tKnANKo0YfusEq5egViaXwhWckey3ZrKiCWI7lRe0rvRifo6Zac+ldu0MXJSqDLg5rsxxH6QFIXn62nfY6b+NKpQaw+Stg3pNPErqcsms6hifrADOsfM61IKLWF/ZLOmv+S1/ASHcjqiU7tAgGpYP9JECSBBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dwf9SVgx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=26gxJBd+; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dwf9SVgx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=26gxJBd+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 3816 seconds by postgrey-1.37 at boromir; Fri, 17 Oct 2025 22:12:39 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp2Gv14HBz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 22:12:39 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760699551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=;
	b=dwf9SVgx1Zm1Pjequ3PR4+DL9xU+zQkUKo/qkUoLgcEfT5hWjmoO+A9ILNUIdfH3PCBjcm
	kjHuIgzpSkUwpYij4l2LrTCRzQ2kOF14XCm2thcKmeyb4xvWKLv4pS9XDX+TSJMhsmM3xZ
	uJd47j3quh7ZP3eF0SSZHcrgy0w23wDuwgQVoKuxn37DVakJ9pvBRscWEovVvfQBQMLfzo
	ZDoCCebSSI7JLCizkNXDwjf37GRsNaYiN4YTYgmYyBOmkYv+luhDR3r613BYkEG6UQ4xEp
	iYq38/MAPfL1wPgY02WJkbXSgs57Re0RYgWYpTOXPn8w5sJohJ8UT9mds3BzsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760699551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=;
	b=26gxJBd+HlY8L8NbIT72iVZHqcHJxgQgi0oCm2WnVTtFtLjxOCcaf7Awkdf4HoaO1nfGV0
	R6vqEwqGMtDc68AQ==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Linus Torvalds
 <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>
Subject: Re: [patch V3 12/12] select: Convert to scoped masked user access
In-Reply-To: <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.570048808@linutronix.de>
 <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
Date: Fri, 17 Oct 2025 13:12:29 +0200
Message-ID: <874irx234y.ffs@tglx>
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

On Fri, Oct 17 2025 at 12:35, Peter Zijlstra wrote:
> On Fri, Oct 17, 2025 at 12:09:18PM +0200, Thomas Gleixner wrote:
>> -		unsafe_get_user(to->p, &from->p, Efault);
>> -		unsafe_get_user(to->size, &from->size, Efault);
>> -		user_read_access_end();
>> +		scoped_masked_user_rw_access(from, Efault) {
>
> Should this not be: scoped_masked_user_read_access() ?

Of course. The wonders of copy & pasta ....

