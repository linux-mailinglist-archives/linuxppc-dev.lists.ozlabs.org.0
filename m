Return-Path: <linuxppc-dev+bounces-3791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8939E3C28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 15:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3K8c4xfKz30Sy;
	Thu,  5 Dec 2024 01:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733321232;
	cv=none; b=kO2ANOhzBhCikX+HIRcYMfmOuFGukCGKGIb8EHGonXqOOMA6Ag1uWXszodKP8NNvVy4Qum1SpU4AHqJaJdS3VeY4MJZI9OhtFt/nuXhEjVu2b6AXxNFCwQ99gQ0zgVIIp6tfjsCT4luHVBd28UVsBlomx29vFVEb+f/SacT+aRPR2CTJMhaeDtyGVFTk18/tTk11atJGUPipzIpKGkv2irMXydy80XRqNREzIny/uYvgSiz9Ur2srf1OJqYv+p9JjHjeUHRaOXWuOuSc3B85vkn/JuA/ZLGkhSM2cHWRmsx3RLboauTBZaALsZCT7b7F+p5dM1/tVBFvjsHI1eTYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733321232; c=relaxed/relaxed;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lhb8h0FL2CE7QJ7feJg6UYGRgP7qoTOIrI8qzH09ePzMdASXCz/YueLSJvqt8BHtsa0QnngHuOILY/tE9dDrhtXUhbHa1KUpqsCC0JnYv2HJLimyGNq14lliYbhgeYL9pshuUHoazfN5y3+0sWwXeQAMKstxqznvWgekt3y0sMVVZ8UT4z4+4ImjLKMzHcbRZTrijguriwJCn+Ww55Rm81znnjaR/5sG9fNCWp39z1ds7oryUbC2b5jLqrOF6NOtjQ/6+nMQyFNhsqBI11rVqdOIycLBNeTKF4mD1d9moOxe4e79dcvv+r7/dFX5Anmb/WPnZ8WK0BQZtee4Z7BntQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i59dpYrB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rFgraBJi; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i59dpYrB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rFgraBJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3K8Z6Ndhz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 01:07:10 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733321225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=;
	b=i59dpYrBRlLQ057IQD+T4m5M7lpO59XtNnXcllxm0azECg+mQR7gjCtSFJUzmntL7SJmZC
	4zukglpfsCdmJGwx5Z+hqXxpE3cxg0WvdntaBx0ncQH5XXKwOiKOfpUz4wp6dwnEcuyFZ/
	pMMZJjgzG12cBsHnukPaIOXcIcDUu692AOXGorBHtUdVj7L+d1KGhHi22yNm3CGcKUrCB0
	gkwU+sLNF1XOqir7XWdgvQDjoXoGQIRVeFN7Fc2/mjoYWQb1llLLCrCFwAlesHqPT4owFy
	K3ncjHzcFU6flsXJdmO1JgyzOgRl7iqLmMLdlbOb2k3kKRWzpQxuvnYrsx7w/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733321225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=;
	b=rFgraBJi5MaUfQcP6GbqNvYKx9OUvIAKMYmsXvtKehJIbs0vaEMLh1hGlf9zsExS+qw3zc
	tvHpj9K2sTYvr1CA==
To: "Farber, Eliav" <farbere@amazon.com>, Jiri Slaby <jirislaby@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "naveen@kernel.org" <naveen@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
 <bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
 "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
 "adityag@linux.ibm.com" <adityag@linux.ibm.com>,
 "songshuaishuai@tinylab.org" <songshuaishuai@tinylab.org>,
 "takakura@valinux.co.jp" <takakura@valinux.co.jp>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
References: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
Date: Wed, 04 Dec 2024 15:07:04 +0100
Message-ID: <875xnzsfsn.ffs@tglx>
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

On Wed, Dec 04 2024 at 11:40, Eliav Farber wrote:
> I'm just waiting for a reply if the new configuration option should be
> placed inside or after the following section:

I think you got one yesterday :)

