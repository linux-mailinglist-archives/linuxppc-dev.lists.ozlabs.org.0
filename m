Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F021766601
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 09:59:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=h3KqjBdP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v0mAYXza;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC0Qz08fnz3cPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 17:59:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=h3KqjBdP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v0mAYXza;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1101 seconds by postgrey-1.37 at boromir; Fri, 28 Jul 2023 17:58:50 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC0Q23swDz30Qm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 17:58:50 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1690531127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2d/NQgST3OleKl0Jw+5SHcTojuKsykf8D+CZyk9mUA=;
	b=h3KqjBdPA4v2gP3IJl3i4HKURHxrs7Z5zalvYFOXjqo5taHgckMES/Ak2aXstzmdk0h1Zl
	vdGk9Q44NlT4AJ29PCV0W6W2q8tx8RidGxHWChicPXnOZ6vUUtCWGERVTYO4tDd2C1KHE9
	6HQ18KUtgSpdSIRwHAHpW9flJMyN5Qr5e0T+LkogiYQs907k+p6PVC2lLIVNMa8QCnI5Tj
	Uh5F7gzHbWSHqEOXp2w4AKIl7Wu8PiRg9uoRzKFIEaDL0AVSPbGeKlL7hQb5f0dAGbHeTM
	MkHPtBbVI7dAu6zjZ9YVGAgxNixDe8ZxyysVnQzvhPUUk5c04LeQ8A6yPwZprg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1690531127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2d/NQgST3OleKl0Jw+5SHcTojuKsykf8D+CZyk9mUA=;
	b=v0mAYXzamMC3q0Q2OV8KW7XiJxlxCHl7htvJxDhy7rV+jL9o+Kr7oEtmoThFL05diOag8V
	MnN8MMUFkbWycpAw==
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 00/10] Introduce SMT level and add PowerPC support
In-Reply-To: <20230705145143.40545-1-ldufour@linux.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
Date: Fri, 28 Jul 2023 09:58:46 +0200
Message-ID: <87tttoqxft.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent, Michael!

On Wed, Jul 05 2023 at 16:51, Laurent Dufour wrote:
> I'm taking over the series Michael sent previously [1] which is smartly
> reviewing the initial series I sent [2].  This series is addressing the
> comments sent by Thomas and me on the Michael's one.

Thanks for getting this into shape.

I've merged it into:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp/core

and tagged it at patch 7 for consumption into the powerpc tree, so the
powerpc specific changes can be applied there on top:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp-core-for-ppc-23-07-28

Thanks,

        tglx
