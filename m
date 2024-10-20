Return-Path: <linuxppc-dev+bounces-2431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B959A56C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 22:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWrDX6kdFz2xfK;
	Mon, 21 Oct 2024 07:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729456905;
	cv=none; b=YEc7+7FNom6cxaeV9g/Hj10b7T3tfc5OMD4MOW+P+6rttjq+/9tyB4bRynbGgIm/0WF8YxOBWehgcX5Gb+i17XTen7whkedSXvrbKBIvLU5rEXkQnX9w+2FpXPt2q/FqN1uW9tiUuGGBLCk6dguvmfPzpMpGNkd/y6O36j9+XAHJuCZKuV2XCDAIzkZfRS5j77K8gY7jPi1oJsLehZFV7jnkt9rQaslKm07CV2ehlFd8+WaFaSkRishmbiv4mjfDJuwuZVmOTsg9AKDxsVbTG//h/CtDDS73e4+XieuadBBx1RCuei0tZpsxj2sOAS7WsO4rVh3/arFi2jbDd0pDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729456905; c=relaxed/relaxed;
	bh=GXCHDEQcm8YdN8F1iwjzE6iyroHSAz0L4jbGCcItr1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SBJ/JsA9sWQDT1hMBU8WI3wYpjGcM+fXY7cnX+KEdRPXjNRmOqHzJQFarj8v08+5shVUMMAkMmCpU4f9YMcQe7JiqjXGUNNAIW3WBL2OWuQN1gLO5wVk9KPocR5tdI+tlY/CXJxlbN+NlESZgBP5vLgzSSqOIh34ncvlnk8YBP1NqyuhzMBZbvPqwwytfKNuhE4017NJtory5SFJXhbcMRkp8qVd11MfqQVYn74dbdi5tYIf6u+WjGhzy9DD4z11SbfNwzqoS4KJwIyhN9CNGNrPd2cqJujYQzfWRbc7BuNih2OlygkN/cRU4aBo0W0LI6HTNWg/GucVGRcrqoYU9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Uif+QDAT; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8MLJ6yVf; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Uif+QDAT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8MLJ6yVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWr2b71zqz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 07:41:43 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729456889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GXCHDEQcm8YdN8F1iwjzE6iyroHSAz0L4jbGCcItr1Y=;
	b=Uif+QDATu7vVQXyUT4WrkPkf5V3xQI+9bKdPfS34vwzdyPWZlWKY3UH5nzwqpArLJruZ9z
	hGp2Mf2T97eNm19LYpchfVWy+rgJa551pgVuUSulKZjuIF0D1NHLKa2h3S6b3jPXATLQtc
	omISRON/QzgoAvRiiTNryiaumewY93jrx96jxB8Dz7HVdASwc4cT+M6PiVvusnnNz3VY/r
	q8fnzZMjxvJSD+lQnlU18kyZ7ZtfcS9eZ7S5DgATXL1QXGJzbGwX0iylkDK9nW4QsUn9IT
	T7fZBm7hA92oVjs3JBcoBM11Fv0HAtQY1AHfqUEgcmvPmsNVforCGOQRxL0FDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729456889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GXCHDEQcm8YdN8F1iwjzE6iyroHSAz0L4jbGCcItr1Y=;
	b=8MLJ6yVf5L/ODBLGiCSy6Vtul+9dPVFi7xz7Cwedcm/BFROxM5l0kuSsDKaAhihuGadhAK
	B1xaNPOR02IRFxAg==
To: Ryo Takakura <ryotkkr98@gmail.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, sourabhjain@linux.ibm.com, hbathini@linux.ibm.com,
 leobras.c@gmail.com, pmladek@suse.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ryo
 Takakura <ryotkkr98@gmail.com>
Subject: Re: [PATCH] powerpc/crash: Allow direct printing on kexec
In-Reply-To: <20241020071755.328706-1-ryotkkr98@gmail.com>
References: <20241020071755.328706-1-ryotkkr98@gmail.com>
Date: Sun, 20 Oct 2024 22:47:28 +0206
Message-ID: <844j56v75z.fsf@jogness.linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,INVALID_DATE_TZ_ABSURD,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ryo,

On 2024-10-20, Ryo Takakura <ryotkkr98@gmail.com> wrote:
> Let legacy consoles print directly so that we can see messages on kexec, as
> the commit b6cf8b3f3312 ("printk: add lockless ringbuffer") turned printk
> ring buffer lockless and there should be no worries panicked CPU 
> deadlocking writing into ringbuffer after shutting down non-panicked CPU.

It is correct that the ringbuffer is now lockless. But the legacy
console drivers are not. Allowing them to print directly in panic can
lead to similar effects that commit af2876b501e4 ("powerpc/crash: Use
NMI context for printk when starting to crash") was working around.

Note that although printk is deferred, it is only the printing that is
deferred. The messages are landing in the ringbuffer immediately. So
they would be available to kdump and crash kernels.

Rather than removing the deferring, it would be better to convert the
console you are using to the new NBCON API. Then it would be able to
print direct and safe during panic. (printk_deferred does not affect
NBCON consoles.) What console driver are you using that you want to see
the messages on?

John Ogness

