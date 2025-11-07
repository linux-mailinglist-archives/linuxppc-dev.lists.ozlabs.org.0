Return-Path: <linuxppc-dev+bounces-13951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97028C41F9E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 00:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3Fpl1fr9z30Qk;
	Sat,  8 Nov 2025 10:37:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762558655;
	cv=none; b=jAXpGUu4q4nwC0c6p5pAAmeBR408XXzR1oez/etXXLZzRWwLc5mz/+02xWhNM+VpNAznLi+BlzlzzTqW12FHJdqk9c6FNy5YIz+Tz1RDL/oduUuVYeArZak9oGnCnZ7KlE+AUuDauH5XK+wtkHKMhY744nlBgHj+UJkwqLMhjnsnCI7akWKGHYZXFKMeZ8a9AvJjr5TFxPiPuAvvSPEmEkrR3G/n9hJxIeGNdJCUGq8nt15jHL7dYtgWZrIoElChhu88edmx7Pri4XY/RmQIlWZzl+uTAyNXEs2TAAO2vCZbuh2xEx8sNTGJ/qZbde55yTYcwWZ9BgCPpWgobIy9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762558655; c=relaxed/relaxed;
	bh=dKdfc/nifvizPXu6zHyg6q4B2C0WsM/OrjAHPKMoa1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBOdHlcfl9mbZGHdW97nwb2esOjYS5R5PAY4tIA/dIrAoQOEmo98IS0E87KLdPVmGXZpvfE7f2AOeo/RI2eFiOX+m0z9t5XBOEKiAucOic3whlv7wyf/H9/ql688LHCBTYZRsLE4AwY1/DlqgW1hjp14oeP0TcbLtRefU1g3jObipSQxt8Ody/aC//3v+AokZ59VPB/7aMJ1Q0TmKrbf117tZztT03Ndqv5N3mHbj1ShLhss8qIWZLBF6lCUhqL1gTRYQVBWJn1psj3pdiO3P828rq8CEgnJxCxci5vZtDjGUNNHUQL/8BCIFs9puPIU+RtXreZaNOGXB67EYyE/qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=dDXksjjD; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=dDXksjjD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3Fph4WpDz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 10:37:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D2EB61934;
	Fri,  7 Nov 2025 23:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCA4C16AAE;
	Fri,  7 Nov 2025 23:37:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dDXksjjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762558644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKdfc/nifvizPXu6zHyg6q4B2C0WsM/OrjAHPKMoa1E=;
	b=dDXksjjDOnQQAvQYvE1Q2Si/elVheo7rfOJrlpPYzvIjolTh+DWB3ui0oD+WvKtYKtV2Ww
	zVuEO6gqpBzF/6r8WDKVuMQ5M4RaIZEHQGhw8I82WVPVMX5+Ds9rkaDFEbCvWTMYH6NMS3
	UtGxV+9w1jkJbyFOAxboRQuCCIQq60I=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b0f7e3ba (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Nov 2025 23:37:24 +0000 (UTC)
Date: Sat, 8 Nov 2025 00:37:15 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 17/34] random: vDSO: remove ifdeffery
Message-ID: <aQ6Cq_5kiIXllEoS@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-17-97ff2b6542f7@linutronix.de>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-17-97ff2b6542f7@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 11:02:10AM +0100, Thomas Weißschuh wrote:
> -#endif
> +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> +		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
> +

This is possible because vdso_k_rng_data is now defined in the C source
on all platforms and under all configurations, even if
!CONFIG_VDSO_GETRANDOM means it's null? Whereas before, some config's
headers didn't have this at all, so the #ifdef was necessary?

If so, can you mention this in the commit message?

Jason

