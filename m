Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C544E7B72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:37:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727N73FPgzDrhP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SIpiQHIo"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hL59YmzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:07 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id w9so357431wmm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=uRLJnnkoKtrt3q1ob0/siBgAznuJHarDQvJURi9aQb4=;
 b=SIpiQHIotDzzIYqm9aXXXSdbbNyIiBGfjR5nwKGqhflsnh3A5ENnvL5ku7plympJ56
 nU36hscWDg92/FfoUgg6mGZV1MQZ06P3qheMpNe3W+BoMzXYLyDOcBz9DFqkhDIEdh5B
 gqbt6pLe8aajvT9/ApxWiQy6qHncmnK9uEhkZ9EqPdAXzu6B6PFTNwcVhG3P2ju+X3f/
 sfPBA2pEnzU6TygZk9bck8dKivYNrYpRDwfFHpK5yH8NWhYl07OW9N75iEfLQn0AVE4T
 Xhi5EjkHr/H2F2I9Ee4ffmNMGotxS1WZGlXL+yrOupHrVgXxi75kCPijWu4pb+5VrVqk
 yHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uRLJnnkoKtrt3q1ob0/siBgAznuJHarDQvJURi9aQb4=;
 b=oBn2YksEf3xpjyqYj1Q12ydQmjMrTJPrW2zV4daVkUaITrPn98E/gWkays4qb77Pgs
 as0kn5WwbBsCKjNNfF7ItGkC3K+QBHRm2JURNXbCzVrhiVNyg3/60N+0uY+uvZNd2Zx7
 p2hRGKxjwXSXMXMgE+pmjYKYDC9WF7xHUSIOPZSqd4WMPmuTxo4d3lMq71aKqlxTwB9G
 Vbi4OGbLNQmZdojDkJCgFQGNPbrTv2ZkVTBG29tM5HTEEIp/YOrk4bVtwN83UAq2mY0b
 OdgpW5asyBTezHYVdA15x4KcCI8ARQ9cZF9Rsk6HUTMjaCN21vndxHdu5PGSFXmWfFzx
 wFcQ==
X-Gm-Message-State: APjAAAWklnK3TAtfruqzSZqTtdBJkSs8U+FdHZZkXajmRIeA34BmmRrX
 SyTyKDS2sOLkimmw2KFVql5P2A==
X-Google-Smtp-Source: APXvYqxLhsR1PGtmh9drHOLTiE38etYU0uqVFMpWhqoC1tXLMotQdsLS61o8y7c30loRYYNwzvsK1Q==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr1133067wmj.115.1572296762897; 
 Mon, 28 Oct 2019 14:06:02 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 0/6] Improvements for random.h/archrandom.h
Date: Mon, 28 Oct 2019 22:05:53 +0100
Message-Id: <20191028210559.8289-1-rth@twiddle.net>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 29 Oct 2019 08:33:29 +1100
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During patch review for an addition of archrandom.h for arm64,
it was suggeted that the arch_random_get_* functions should be
marked __must_check.  Which does sound like a good idea, since
the by-reference integer output may be uninitialized when the
boolean result is false.

In addition, I noticed a few other minor inconsistencies between
the different architectures: x86 defines some functional macros
outside CONFIG_ARCH_RANDOM, and powerpc isn't using bool.


r~


Richard Henderson (6):
  random: Mark CONFIG_ARCH_RANDOM functions __must_check
  x86: Move arch_has_random* inside CONFIG_ARCH_RANDOM
  x86: Mark archrandom.h functions __must_check
  powerpc: Use bool in archrandom.h
  powerpc: Mark archrandom.h functions __must_check
  s390x: Mark archrandom.h functions __must_check

 arch/powerpc/include/asm/archrandom.h | 24 +++++++++++++-----------
 arch/s390/include/asm/archrandom.h    |  8 ++++----
 arch/x86/include/asm/archrandom.h     | 24 ++++++++++++------------
 include/linux/random.h                |  8 ++++----
 4 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.17.1

