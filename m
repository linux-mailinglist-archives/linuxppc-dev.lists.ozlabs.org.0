Return-Path: <linuxppc-dev+bounces-12150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814BDB566C9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb4P4zP6z30HB;
	Sun, 14 Sep 2025 14:37:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757823573;
	cv=none; b=Kmm7kAd38OApyfpINviPQUxoWe6hA0Z4zyWGpDvxsoet/ttiwv6eGgiiOEOHklUnP/q94uQTd9+uX8BfmGe2oW1ooRfPGTGp8vfNX/05qUvkgNNWDkbFS73XmLL5wbqA5c62OfP/ns84aUe3QWqepqcsO0/yrrwID8fvXgZMo3ktJ+EjfD0joT99uW9CzHSToEp3RW5m1yB6mHpyY7WVurQSOaXccNU3nDZXlXzJ59mWApzH4EKqt6NnoSHCHwDtgQUABA8VVOQA/Zty03wp2WuKDLUVTsP5+ba/J4d/1GoczmmpjQ/ObNZT7BnkuIlwwajaSxBUhR+MmqRftQPiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757823573; c=relaxed/relaxed;
	bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epo3ScGxsiVEJI8X1xJSzuyWVWTOjFjs8y99317lRZeTiFpzyFizaSQl3zDMHEV2KYbPixyyb3oTVQG8xUmZ8g3z5JBK9eDFVzeHCPMNNX5gUy2s8WtGetEPovW4oW19Y7I8Y5xgr+G1IfSB5v2SLqiV/zg/KX9CfuFn2T46MEgebIkB3ek/FJDkLaDCvLngqW+zqmAlx9QfWInGedZQ1CeQ2zAlXgda3FP8uRCU35H70Ze6aNvBZX4oULrVrILOIrFcnuoEye8KfYKcKaxfbbCJtjhxv/u5PIRlncMubYPGa3Cke0r5HfTOSJKptHAmQtMpxpwXPXiRklhJVKqrRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9DFTDQR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9DFTDQR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZgS2sz2z303X
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 14:19:31 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so451150566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=A9DFTDQREeuxoInLI5QhJ/OUkYwXdUepATauAMT+aXYDUNVya7zsxOQ/VVSUZWBZeh
         tHtGcW5/gqptGGEkFBGRXbjbMdU7LM+Zgom0Ke54UnNJcgnRR19F0lBGiIoviIaGQ4W5
         WmB8gYvGSfOhn2SybNby6oCmirh61mHeWeQBTGh2p+FmvwRNTA2NKGGVAjOpBi8w2RSH
         7rbTlJBHGssORR/9w6ykF5VrjN9VnJEvWKD1grdJ4AgECbwGM7/LCGBRZ6Mq/SOFr6bL
         4MOC/8Hq2vCGGuddj6mXlC4rFvrGqxAlUghZ/CBl65McYq6aS0VpT+UDJlQRtsKqHsYt
         mtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=QCbnM4E2wek3boF9NE6D6B+ElQAGn8CSpJ9NYbjAFBB3LwDcBC8HRH8OIF/BLcu3Ll
         6cbaRwF1TT3yB6+r0C3W9v0Z+2lxJsASZ7d/DS4Fncin0WuN3b4YPugzU7fjUTsTfEzd
         qBgsvGwDZt+nVn7/Jrw9t6yP35kD3vszPm0nqMckk/Uo/Fe8yQiYC23VbnQvE/3ugU1N
         NCQKzQbgIYC3zzlaYiL5p1Zl44BIwJ8EDgsaejUJZlz0l6uaDaCV8+69ANXFKKPx704l
         xL12OrXrs7Xv02aeY2tcgFuuZmo0XuqS1ItFqL6uTmZ2QyV5JzZjg5IWzncF08VKzrch
         9xbA==
X-Forwarded-Encrypted: i=1; AJvYcCUPbcbE3P0rf2Mv/7oqUiMG/0mlJyWyFEqJxqU8ClNoWBky8EpIXTsrf2BWwpTz+eTqYo+rZAS7kgLgS3c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybKtICf7la0HcTTu7tCY1vyDCIpmLJuDWG+Xt47ogGaz6Vy+wG
	OY2cgLvzj+y5R2oMbfYMoCCMXp4KCY8UcOTPqg5OxHZcLx/4AnEUcfq1
X-Gm-Gg: ASbGncuPRMZ9VSnsDNpDSQXatHF1I4yvclacySk61LRyEmRHLqmJtI6A7VDfob4+PyY
	MHlYH+SHE8pTi/N0V+lVLoOIn5m69sG+BevRyfF1672Zvt0kb67MOvxF0P+1z1ptgcgTeQbBKJU
	VyxADt7Fi+8nKqXqmtyBP4d8L7bh2cs4XW/GCsBbNqd51IE5R6eAHsWpcNPrjnMo02eiFYcOcIg
	xgy7h0deU9K9b1s9qIrXxwSmS3jnvgbkkL8eRxd+AMPZ0yWABfJE6lY6/ZJurLosPDKko+0nsIn
	IN/PMXhY+7GXk+KOzRRrLD9c1b7KOlMaYdiZwnveCbjOtQvli4gEwxGZOZbqcdgUKCfRJJx9499
	x14piSdbL78rdUczMlnNui/7GTFZenA==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
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

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin

