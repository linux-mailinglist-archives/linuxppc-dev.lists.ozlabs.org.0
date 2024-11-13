Return-Path: <linuxppc-dev+bounces-3139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E89C69A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 08:05:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDp86lQ2z2yYd;
	Wed, 13 Nov 2024 18:05:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731481552;
	cv=none; b=HAh007k1ojsjPu+m2jsyAR39YN6/c8G3yy/q+9wMNI8CjOv8Vk3UxOP4tMFVeYSP95fNJ2qcgMZwzyDoE5ssdfvXTB58E949KK1OEXlce5fSPJwbU2gmTcGlXgQU4LBhVWqRK4n8ixvAHPdhfcnqWrr9wBdpFU35wSyOtD/WirYe2uy7QGe8qWGxTRHYD+ZyrH0ojD+VbPeYYed87mH2EsvHrvI6Kl6jNUu0t2UCbAMum3uGIXHIvYII5NLKfhKdJiAxdgtaEkucB4x8OUAlILOX5aMdwXBV+ydO8oZOynuP0oG/qD7hwK1bycNAn8Cn642fvgaZOTmW0O4vBJmilw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731481552; c=relaxed/relaxed;
	bh=R3ODfK7Vw7GBZ1b5MupvYZDTvxJZVNfsQzIadf/tXDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R0JpmqMWnxEYSybi4UtnDfxQ0ZhGY25FwA4EfyB+n7z/K4fcCaAvO9jop/8kJjs9iYYy+UYv+hDKiniEMoQl6X7b98uoBUu8mwWNoTXAmivvMKqdHApqohPRjZJd5OTgP/ayXS5HnRVBjqGb7lpYe2so9VYifE1IbH7uHZ3AMf6rvu7B3WZ6/EUyRG5zLgiSbK3PKdsEMNlA2yh7RkUYEG3Jgl/dyIdSHckbktB3LG+o8V9AUdAbC5kLEpj4AlFLjgmXDvVMAR2Ksycm42lmTdIoesZijriLdiclWU2BfV80djbUC6EyvkMuPzmY7llVKMKHKbseq3HjA68LNpbpYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2MEFKuKQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iOlcy+Ce; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2MEFKuKQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iOlcy+Ce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDp72fC3z2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 18:05:51 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731481549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R3ODfK7Vw7GBZ1b5MupvYZDTvxJZVNfsQzIadf/tXDE=;
	b=2MEFKuKQ07qRMd3BuxqPDKuO12Bn6C0cqslwetsqxBjYO8g30oAQCx41c8L0BaYuWURlly
	MDK6GMR2oNRGdDRcm2frDpzvcCv86hDjBCyW7TEfo2awyoA8JGk1/31JK/6u4+SdjByxQc
	/bcRc0+zyaUPRLKxy83tIaU76RegXyph0TSBRFGahkNIGBAiUKiYpgAudQdThysZD1tAMo
	N88GZdGaAJE6H7vkSh6XXbU97DEXBzsMp23nWbsMVfpcfRHLD6b4oW4Icy93KZtnt/XuTm
	/2a9M1zojqgb6wT7L5LaUg1frb0/tVgogetH0bJ999CYO5lIlUDYjf3wCtWOCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731481549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R3ODfK7Vw7GBZ1b5MupvYZDTvxJZVNfsQzIadf/tXDE=;
	b=iOlcy+Ce/AWf3qV8788BZkRuenn9ddM2wHKoUaMF29iVerQbB6WlP2+MCFI3UTPGJEsIYJ
	bpzurHfMEE6DgaBg==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v2 8/8] powerpc/entry: fix ppc syscall entry issues for
 common entry
In-Reply-To: <AD7BF1A62C0AD367+20241111031934.1579-16-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <AD7BF1A62C0AD367+20241111031934.1579-16-luming.yu@shingroup.cn>
Date: Wed, 13 Nov 2024 08:06:04 +0100
Message-ID: <87y11nlijn.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:
> Due to the common layer and internal calls details are hidden from
> the top level at the call side in ppc arch code, there are some
> difficulties in preserving
> all semantics implications of the original code in the patch. e.g  when
> we got -1 returned
> from syscall_enter_from_user_mode, without touching common code, we have
> to do
> our own inference to recover the reasonable route to return, in order to
> have correct errno
> and syscall work behaviors,that are tested in seccomp_bpf 98 test
> cases.

This indicates that your conversion to the common code is broken to
begin with. Which is not surprising given the amount of issues I found
already.

You need to sit down an come up with a proper conversion design and not
just randomly replace things and then hack around the fallout later on.

If that requires changes to the core code, then they have to be designed
up front and implemented in a way which does not affect existing users.

Thanks,

        tglx



