Return-Path: <linuxppc-dev+bounces-12013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178CB5225C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 22:34:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMXVD2ld7z3dVR;
	Thu, 11 Sep 2025 06:34:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757536468;
	cv=none; b=QzNAFBIjUdwDg6UgsW9L/l/9QYaV1tTwaf5pl32vL7tdGR1LOjSD514czhILkjOjlEk/fG+MLMsp+UI8ojx9rS1xqKJiBQ+A6TrGB91ZWs/RVY0F3qkcWkh8YPNERWDFpsiA04QXEYB6ashi5uFW+T1ABLf/LJR2L6Xb6n9Vr7bT10f4hra4t+S78qO15Kz0ROhwJ/b3pSrhxgTsrOB4So5IFIploJF1y/Pb9hT7ynEuND7fMyKjoHFACoKYln9ph3nyEVwOM+Yfa15dvDPF2kJObcpTo0CUpCm3uT/nfBkbqJHBsKGEyciPhXSNB9SVxP1xL5MFLSVmnMMbjeiaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757536468; c=relaxed/relaxed;
	bh=BWJUP15r3n8/MjXCZffpwVy4cTnE3JTu8kOjPPspzQs=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fl+Z+WqdROnNSvMiwfNY1Z4NkU4iMlrkwZnevBONtp7LfKwYfu/aE3ZK48s0iFsGAutpFtUhTyBf6N4nyXDElitAQg1DgkEeRuk+S+TsKfJFFQbcXhHT/ZfWAhbGUBTzXEbjGBYaPGddPmGnC/ILpm36BmoRh+52+vCqQBpyfpJYMFHGoNgFcU7UUQ1/J4+x+9cFwR7LpFEzxljj+6dopRazEuvP59vUEgynj+RaXlTj55iTvkuZX+QJG2IWYzjLDx49xIoNPsuPmYCwrm9YyAHteev7HRAglz/16f4nZmSlVDGiF1gheyhcEQ84gAPNVTHB2iqejqtQlCHel1Pz6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4u2QK7Y4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VHkPU86z; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4u2QK7Y4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VHkPU86z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMXVC1b0Bz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 06:34:27 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757536454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWJUP15r3n8/MjXCZffpwVy4cTnE3JTu8kOjPPspzQs=;
	b=4u2QK7Y4xS6JHeik30JB/GnrUN8xYNIDP6DiFVjfq/omGy9itJpsopIUwNK/9/fjvhNpbO
	Mk171iZmCEMsphtYhyEw63SgMWji0SlRDb27yjJbDm6MbASSmvPf2TUheNOsMgrDZCiE6y
	YCnyRLQkwhm1gZlsPNMck7099jZNMyubEnKMbmk3lwSyZlwAxeUwEQzZmgCgTCr5c2AYHK
	Y/E15WlQmg9OvW6Xk1t+fp7xyCQtWVeyVBB7wNIAtXn+dRw4DIbmwDJTCInnEJbmC7nXdc
	w9gthwATNmpQy7qEg+CofNOfBpy35q/DzQxgTrtv7/gdHZpi5sGtrLmRHzJdvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757536454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWJUP15r3n8/MjXCZffpwVy4cTnE3JTu8kOjPPspzQs=;
	b=VHkPU86zocAfXvfPyLQ30cXywQDKQ5ukn+GdpWbASXj3o4C7v4KOvtagO6a9S/nqHO62Q3
	+spOKOIoGDiDl1Bw==
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org,
 mchauras@linux.ibm.com, deller@gmx.de, ldv@strace.io, macro@orcam.me.uk,
 charlie@rivosinc.com, akpm@linux-foundation.org, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
 thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
 namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
 oliver.upton@linux.dev, mark.barnett@arm.com, atrajeev@linux.vnet.ibm.com,
 rppt@kernel.org, coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC V2 0/8] Generic IRQ entry/exit support for powerpc
In-Reply-To: <20250908210235.137300-2-mchauras@linux.ibm.com>
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
Date: Wed, 10 Sep 2025 22:34:13 +0200
Message-ID: <87ikhqrqre.ffs@tglx>
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

On Tue, Sep 09 2025 at 02:32, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>
> This is slightly tested on ppc64le.
>
> The performance benchmarks from perf bench basic syscall are below:
>
> | Metric     | W/O Generic Framework | With Generic Framework | Improvement |
> | ---------- | --------------------- | ---------------------- | ----------- |
> | Total time | 0.885 [sec]           | 0.880 [sec]            | ~0.56%      |
> | usecs/op   | 0.088518              | 0.088005               | ~0.58%      |
> | ops/sec    | 1,12,97,086           | 1,13,62,977            | ~0.58%      |
>
> Thats close to 0.6% improvement with this.

Cool!

>  18 files changed, 698 insertions(+), 810 deletions(-)

Thanks for moving ppc over to this. Makes everyones life easier!

       tglx

