Return-Path: <linuxppc-dev+bounces-6332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC3A3AA65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 22:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyBpF1d2Vz2yDr;
	Wed, 19 Feb 2025 08:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739901484;
	cv=none; b=I5kRw08IFeAwIrQ9A4czi6tlVIaiRSVw+5EVudzVLkmG98EECP24+QY6sC1epuGgB+1zqRKJSZkHjjL5jyHZq29AsXbxt4M62JD2f3PtNM9ISoPjXUQUpyCVICBHPUP2SrBhmkakte7MV5SfRnDs5I4f0MhnAYTXq/ujlMXye1lmdCYGRv9AVIQsI1bsFTyuWcOMIDAxZ3af8u1yN6IZyPvbd1PXPp7DQwsE8dgniUH09mTnxSGHBF6aNllIdxTVMpkEkhy0cOcG4UDWqYhHbdzdfgUvUbc6l1FWIJ3v1ObmmFS72iAQlPPF7TSLZPvvi94vG4P+z69UGJzWHw03Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739901484; c=relaxed/relaxed;
	bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TSOzxomrtR9e4WiVHvXjpH8FD9UZnZiJcdW4HSm92Er1FWzI2KsMCJvIPdUHZ+1BOgGLpDKcWjDJsFnu90QPUWu/t5z8mc+l6u7CHc92UAUL7bannlU9xZEXeMnrPX/E75r1FClwRX0Q4XW7T1Q7FPfrhJdcqx9WwkUWmj0LRUNFqLvCbwPx8q1/stXZlo3Cn44C0R8OYCW0fTnIL8gicdoUpezby8GMdza3NUMG84TfagSko9N2mebFfyQCEf9fe/q5gR29R/rxEKEgnTBheiCFmJl5S1xnoxtiFGuUada8+mI/HsrBmbgzjBNBKBrqaxD/OuxpvBQnFgt+kFB7EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btXP7VqF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btXP7VqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy6gt2Vwnz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 04:58:01 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5439a6179a7so27237e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901476; x=1740506276; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=btXP7VqFi0ONFoSVqnOf+JocC1xRy4kwRdH+mwE4H0Hgu/MDQQqF5bZE04JWXlKw5W
         8l6uyIoxXosQFusfWqcKFytEzWX8ongh2jPVrCsRvnIdFvGwEDt2AUQMiGtpEEcAQtgS
         8bbFxP4E3xHeAz/rmOxYUugIkDfg86dGLtiA3g/fV4UTCGxba213gJuDk2VJJXEOOfbn
         s2jEgTC3aZyo+K0SnCz+Hzkp3YfA0b4aB5DnDOdtCXjQHzudai2KNthiYs0Ce7jv7xdW
         C5dlhCmVxPid76QuKjYgPEUufeD/51WH/plj2V2n9OmE4lJUbAWAoo+uhEU0u0ecH7lm
         8fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901476; x=1740506276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=BDWd4Rfxm8hhiWZ5oAU2CBF+CHgSW2mfR+4ZYX0a/BK698nd3zGgaZ4+OfqE7cyo/i
         SsqXrIbKZH3MT7OsY36L60jyWIQYUhwv46FmP2IDckKZktjUbwnsDioTT/cA/kfRPo4u
         JBzn6162oQrS+PnT2WLDq1xZKyIEVk/6kdmcupXEJb0Vxmz1cUHNyGI0VIF1eIqw3HYh
         +nrIk3742BcYW1thS38jWc3XgUoTvjzuc3ussjpV8aJ+I4EGcA6r+YVtoo2qyT6U/778
         FwgPjtGKevWIlSANMNte5tSsD966OtxNF2McdM06q1VOihfYivE6ZQVMm6KQ+L74dus2
         ge9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIbf2q7VFOBJK2VpMKO5lTKy4iCm1ctZsydCJ69bfveUTuEz0Uzy1PgUaWrELDuSzB+jUr/gn21kgLEzY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHYHecYJIrsk5ef17kEC1PAXw8FP7f5++L6wIgKdHrNjYGAany
	V7sIERxInVDUqa6xVbc9RC1eURzXbdZD41net2B6w2yHnJbrtkTp
X-Gm-Gg: ASbGncuzPoPJTLv4L+59i8vaij0uNS/hVDt7c1Lsj1uqbmrPBmHM3p1XENc0S/kgM+u
	6YoKYhcckgxMveO2JVC0P6WC/uAIEouWsTqHnUylbrRHHKSbDi1uwcjJk4chHZPerZRuf/nhXOc
	UXVn9t2TG5i1VaK77Z7xXvW9C5zFibSHca5eXxwR1EWu5UX/zHTWFtY0F07PlPsr0GQ4LT51oQ2
	3vbUV3m1LJRiACzeKedvrueV+YKNwBSnPnarg0a7aNEioEvNVdsCkHXUMMe7YcJZWvnIXd7H9fH
	O5vkDSdjpZTFTb55EpJ1fNoCLhP7TatgtLp5NdBBNqwQoBAnk5JvoklzQy5zNQ==
X-Google-Smtp-Source: AGHT+IGfFBi/u9SniGtV33nIqkglJaUtkaaAX/KBzbUXSrhxIdAk38ItpiS7x3PdO+hl8rMx2A+8sQ==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5462eaa1f1amr241343e87.5.1739901475583;
        Tue, 18 Feb 2025 09:57:55 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:54 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:13 +0100
Message-ID: <20250218175735.19882-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The first version of this patch intended to fix issues with swap memory on
alpha, when swapoff fails to writeback exclusive swap pages and gets stuck
in an infinite loop trying to do so. This problem appeared after commit
a172d5128706028ac07b8db709728379ecc72f6e and as far as I know only
affected the alpha architecure.

Changes in v2:
As suggested by Al Viro, rather than doing a bit-shift alpha-only fix this
version of the patch makes pte_swp_exclusive return bool instead of int.
As Al pointed out, this will also better reflect how pte_swp_exclusive
is actually used in the code.

Best regards
Magnus Lindholm linmag7@gmail.com

 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)

