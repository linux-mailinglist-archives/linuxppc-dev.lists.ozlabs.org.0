Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27278757F5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 16:23:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qAXNX/lA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EjBcdbH7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R51Qc0XbCz30fZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qAXNX/lA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EjBcdbH7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 67122 seconds by postgrey-1.37 at boromir; Wed, 19 Jul 2023 00:22:46 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R51Pf2tyvz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 00:22:46 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1689690158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fDWCSjXXEjX/JODVcgeDXco/4WMx9FK0mGR8q+fC6xQ=;
	b=qAXNX/lAeJqtzaQ8nkhj1vDqiyGCCqLkDf3gypZGmi+V9INLceXoGIOn2wbuSBZpyhzpkM
	Y0Wckb3qc9MqPembkuys1PqsYsdfG8H+DJ0JQmoBCxVTwRPuobCrR6c9J9vg110ahlgLOk
	HaVdtc3fQpRAwpFxXKXhUw1RGH6MMEF5orcaL+EKZmjpAi9qE3WTrNXgUT5/gl34aDQWQr
	oLsyCW9E4HHiK09Uj0Ux20c/i6v4eVQWv6NHxfe2cCQZdA9xuDaFxkBa79jQZAINYcReP+
	Pf1q3sWqHxAk66ivgBV80FL4CjNmr/2J2/jYMqiaLms2d2xxIQJsjIEnwnFxlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1689690158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fDWCSjXXEjX/JODVcgeDXco/4WMx9FK0mGR8q+fC6xQ=;
	b=EjBcdbH7zAovwjWUL22ZOe1cLiBklkUiP9RmMz6urf5mO80PVKt5JDYF6x5Mks4jkuJ9iy
	P/A3MBd5RoXoOsBA==
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/build: vdso linker warning for orphan sections
In-Reply-To: <871qh5jrz2.fsf@mail.lhotse>
References: <20230609051002.3342-1-npiggin@gmail.com>
 <871qh6wcgb.fsf@jogness.linutronix.de> <871qh5jrz2.fsf@mail.lhotse>
Date: Tue, 18 Jul 2023 16:28:36 +0206
Message-ID: <87o7k9l2oj.fsf@jogness.linutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-18, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> ld: warning: discarding dynamic section .rela.opd
>>
>> and bisects to:
>>
>> 8ad57add77d3 ("powerpc/build: vdso linker warning for orphan sections")
>
> Can you test with a newer compiler/binutils?

Testing the Debian release cross compilers/binutils:

Debian 10 / gcc 8.3.0  / ld 2.31.1: generates the warning

Debian 11 / gcc 10.2.1 / ld 2.35.2: generates the warning

Debian 12 / gcc 12.2.0 / ld 2.40:   does _not_ generate the warning

I suppose moving to the newer toolchain is the workaround. Although it
is a bit unusual to require such a modern toolchain in order to build a
kernel without warnings.

John Ogness
