Return-Path: <linuxppc-dev+bounces-11232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E4B3311D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Aug 2025 17:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c8yDY4dj1z3bkb;
	Mon, 25 Aug 2025 01:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756048557;
	cv=none; b=G8m7Wne/kCPMuMDJNrqaNUFdWQAOyijfS31nwwagaKNuDIak9jYmANIFgFeYmvyRmXUVVqr0lPNppbuEFjgFAzu4/3kLXu1q0Rtu31ZPyuqUdewY1PuR/P+OldMB4FOWjM+RnkZIdeWT7Qe9084mc35Jx2fATjSVeoYG6jfzYcMLgKHDx5jwlsxi788Uu5PGtcBozi1HeaLuIFcHFXW/zIKqtcs+VYidkthI/fCQQ56t6YQKlwuggLysAYOPWVWF47xQv2Y1KA2td6hj4YCt4v139PxioYsXMziiH4yZXAlZQH1t9wSPJVMAVIU6fVfiQe4O0j7xkO9FlfACjPnfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756048557; c=relaxed/relaxed;
	bh=3ik/NRqYHSG8hmITK6G3KaWPdzyg/qMeKl48YWWYUqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OnPIfAAqCf0Ip0nHhpT8YRZKjKWoiNGOUTjDEiVcYoaFqLX7r1AxC+tl51UwfvdZzb3Ab5d+o7b7SRsqwLesM0aVv5qG4PM/xmUJxChi6TcDnh8bKajVKXQqtBLcRi0SBVSzxxlHIfqGrYvyAdcGCNio3l9ZgHTXnTUKdDFs6d9H35Y0eIcV1fk4DfZR1jn1DpGlCXXg5y1Poj9h4a8jTNOdDOlCyppn7SOzonMJf2zrEmPM1G7FGcwg7N5s3IzrpUVzgGVjepAcpQnugA5yiTJgzJnVpPjjTW40rwKGeQmQOwoX2QkrQ+p6+zXblgATUqs4vejwHldiB4Y8oXK4YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FAalNz8n; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cB54om5a; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FAalNz8n;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cB54om5a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 446 seconds by postgrey-1.37 at boromir; Mon, 25 Aug 2025 01:15:55 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c8yDW6flpz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 01:15:55 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756048097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ik/NRqYHSG8hmITK6G3KaWPdzyg/qMeKl48YWWYUqc=;
	b=FAalNz8n80tXbjLu1YEIFUu9UhX73vltRahVCO39qSG0lfGoaJew0vQszt0dphBAjPSnLe
	7C/FD4/TKQG67Y1B/y0dsYTwbjJzp8XI+uPmsYWLSRhFSL8psTth1rBNfiHP7Pwxv8lCkS
	TDI4rdGp9S0oezXRjJ36bL2EAtg+sygQdbSF6fTVdqYLjKZ7jo4U5NfPpkFOr2o9HOuWTj
	/6PuKr1BAXjl0+x4heqkOUOddzMYeBWs8AGL29P6pJnHTVKAF8UGAby6xTND2ABPKNgVED
	AOj44YWy7naeuHasGmrTDOFaMXE/8Txy4Eo3Krw9/b2ZNN1pdjjL+l+L00m6aQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756048097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ik/NRqYHSG8hmITK6G3KaWPdzyg/qMeKl48YWWYUqc=;
	b=cB54om5a1WjZnAiZL0WpPY1A+vjsjucby/u6/KzywEDaNIPuqTKO2+T5qzphZpMpszCuEW
	b3lofR6L1VonsTDQ==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, David Laight
 <david.laight.linux@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Daniel Borkmann
 <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-block@vger.kernel.org
Subject: Re: [PATCH v2 03/10] uaccess: Add
 masked_user_{read/write}_access_begin
In-Reply-To: <7b570e237f7099d564d7b1a270169428ac1f3099.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
 <7b570e237f7099d564d7b1a270169428ac1f3099.1755854833.git.christophe.leroy@csgroup.eu>
Date: Sun, 24 Aug 2025 17:08:15 +0200
Message-ID: <87h5xw3ggw.ffs@tglx>
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

On Fri, Aug 22 2025 at 11:57, Christophe Leroy wrote:

> Allthough masked_user_access_begin() is to only be used when reading
> data from user at the moment, introduce masked_user_read_access_begin()
> and masked_user_write_access_begin() in order to match
> user_read_access_begin() and user_write_access_begin().
>
> That means masked_user_read_access_begin() is used when user memory is
> exclusively read during the window, masked_user_write_access_begin()
> is used when user memory is exclusively writen during the window,
> masked_user_access_begin() remains and is used when both reads and
> writes are performed during the open window. Each of them is expected
> to be terminated by the matching user_read_access_end(),
> user_write_access_end() and user_access_end().
>
> Have them default to masked_user_access_begin() when they are
> not defined.

Have you seen:

    https://lore.kernel.org/all/20250813151939.601040635@linutronix.de


