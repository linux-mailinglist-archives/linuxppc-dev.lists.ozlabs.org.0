Return-Path: <linuxppc-dev+bounces-13720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B5C300AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 09:49:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d12FS4Sd2z3bfZ;
	Tue,  4 Nov 2025 19:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762246172;
	cv=none; b=nTsEADXmiqyJZ2vZacuCRdGGKGgqoAOt0yNOFPLL0f1PJn9RT0xF31TW/XxfKMS01lQju2F+/q0oNLOE7dOSFt/H3DnyqjaVX3EqsK5/Q45jp0wmauYInqcuR2nvlTvM7tkK9UqOvw+K0+a8TS/0+ZdgwaR8ORP7D+2Szc9Cr6jzCLnstYlioaY0kjlM5v//sXSGs2EwZaCS9Zl0/EYQLWXh1mJgimvuRbSB+4H+S6md+y+p5got0JWaBE/t1ZBOqC5gYipdCLFJXqlxw6m5GwT7lN+fd9PwHcCMYxUev9pizVznoVD9kLNkzXQ7dZW1seagLOrRSeu1foeNEPE5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762246172; c=relaxed/relaxed;
	bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD9uJxGCB2Vooe/Fl7HYH2ccmyEbIEk8dGASN5F6jl3KkgD9uaTaONtwMXTFKySQqGDDBoDdoi0OTU+yg2SfpcPRzw/qj9UpbTQMZcT2pPfwgl//BosfVjxBc0cRPWSRCtcEGO7TbllBTyswQIKiAJfbV/C3E+CyCCjtGoePkEzy4bjb/oLrCa2FenHtlJoyyvJF6/bzJYo3g6/k88eUEdeRKAGs+Fgd6QmY40wrRqQ9CuLoiIT9I8+04TMUdtBPdfbaX6UyHjr9mSjGIH1jqWI3FAPJ7AAz/EiO0TpAMQNZpqpuIiwF8UQfiPLfHyDswhmB7udlBEoU2aKlkmuzTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WTuH5qhq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=prabhakar.csengg@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WTuH5qhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=prabhakar.csengg@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d12FR2Mk8z2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 19:49:30 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b95cdcacd95so2024946a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 00:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246168; x=1762850968; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=WTuH5qhq6jgtb0f0qcytgT3inIjf+o93AJ1MYlXvpoS4ClmBwFVZf8WFW1tKvhZrUT
         ajr9Wh4ZTPlqbBH39a/8rSKq7QFRHqyqaQQCT0/JbCO+fknqKfsyCHMTRA8/M0FJe71r
         pdUbSNRjrMJKXRExJfa3xOH/4lUsHg+SntchSowT80CmtxSZm9MH9/zfIqml1vSm5M+F
         fiji8Gdi1N67T1XX9tv4X/YVqlumr6S4X4NU3e6WQG+qFxQypH8crmJBWVTjVt8XuVTg
         5JDKA4hI9w8IWUQvARllwMnDHq2LdaRO1CrV5h2hK9FeN0xiFV5w7N+pGdZtM3VuYbr1
         QMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246168; x=1762850968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=BhzmsojlcpTvSNtNWywaoZ8ou3jVGkReYmNFB8kKz5DBVu7lvQGVixqLAaGBxqi6Os
         9VgDUi7bVmfZD2ZA01c/9JE3YgMfznzCtH6Aez3WQ9Vzs/QfW7NzyNcfD66nKQnwyvx7
         E2kO5dHKCQt8TvZs6z4y0cAQ/31U7P5OLsCr4i0Qs3GizFIVDFrp6A3WQbvhPWkAhBV0
         oKOe/ekLhyq+lJTTBZDQ4iqmWy9G0V38taU59dU5i9AZE0XczrCHG2fK07PlCSJI1Cdi
         gZYidY1r9mz2FVPwmTEOh/h0tXL06mmaL5/2F8zSqhvD5wf3JQeVqEJpH4uSMQ9QKcQp
         ImSw==
X-Forwarded-Encrypted: i=1; AJvYcCXTINCcE0nJ1WD5+eBYARzL+IEzwFERi9eY+hoRnBOTad/eoYIenQXA93A5ZvT0Y9Zmh8ceGXTBvR68E5k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxjl47NJZ8Abgf5H8shaD21K/l5QnHoqG0aUwkvjs3JxVrQWzEV
	ni7xRST4awDx7wcOV7I3O22DMQfL6wleKOfSbRq4lBIFbKHRgKv1CpQ6
X-Gm-Gg: ASbGncuu5rJDEufJoJQ9NN05f6DIWH6j7uVZFMfJGELwc4Aj2mBayrPK+QJHWUnhX7N
	ID1sXTn57ERjAev3c2SgkD0ruowx9JNw807kLwUrcvsfHHC/quSZpHl/1L650RD978p0akWfkCg
	p396/nGQxO3QXJRbJQhEWIdzd8v9h+EClVEE3U0Wm89U5c4StiqC14Me1zBxbGl79898uUuFqTR
	2Xuk5SMi9FtX19v3HBQh9PBFRGskN2ZR6Z5DasETVX+ydQROI75Z7i4wek6jG+8NyusUZ51Cxmf
	Qc1yVoTwFnYV9kcPMORvevQRdvTnOjAWXQxkZynGI6/fRFRrxMtaFtXEvxrSlmeaXLB8ctiSawX
	yXlZjfj08YSZcBagc1UynqzXcD6D7+P3ZvCnnY0NXnojB6l2Jze8MC9yYzG+l2y8+4MIVpxAGJh
	Awua6Ec1IXpLMqLhhxHsZVLw==
X-Google-Smtp-Source: AGHT+IEjMIiSe0x3JjyWJftYAjRTnLk4yj1+5guJH64mFdGd5LprT3gQcg1E9FYpKQf1UnNjUVPGcA==
X-Received: by 2002:a17:902:e801:b0:295:7f3f:b943 with SMTP id d9443c01a7336-2957f3fd4d1mr114855785ad.28.1762246167913;
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:d663:3d9f:b9aa:53e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cc1sm3692393a91.18.2025.11.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: thomas.weissschuh@linutronix.de
Cc: Jason@zx2c4.com,
	agordeev@linux.ibm.com,
	andreas@gaisler.com,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	christophe.leroy@csgroup.eu,
	davem@davemloft.net,
	glaubitz@physik.fu-berlin.de,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	jstultz@google.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	nagarathnam.muthusamy@oracle.com,
	nick.alcock@oracle.com,
	npiggin@gmail.com,
	sboyd@kernel.org,
	shuah@kernel.org,
	sln@onemain.com,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	tytso@mit.edu,
	vincenzo.frascino@arm.com,
	will@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [tip: timers/vdso] vdso/datastore: Allocate data pages dynamically
Date: Tue,  4 Nov 2025 08:49:11 +0000
Message-ID: <20251104084911.6961-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This commit breaks boot on Renesas arm64 RZ/V2H and RZ/V2N platforms.

The boot process doesn't complete anymore with no obvious error logs to
indicate the cause of the failure.

Reverting the following two commits fixes the boot issue:
  10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
  6a011a228293 ("vdso/datastore: Map pages through struct page")

Cheers,
Prabhakar

