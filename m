Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B9F183C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:16:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477T9H1nBDzF4nj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:16:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="tKY8u23a"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T615StszF38g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:28 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so3608457wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=5J/Ofk6ylx2fNP9WdzIRZXeA0e3ywJAg5ijroGTIp5E=;
 b=tKY8u23aHs4/HPdanAkyFxDTfKUnmDGznwlyn9XjBCxK/OLl/98xLhDrlyXoAOfIaZ
 MTBKdzqlKcEi8Yg41n3F5ev4DIFFQCUugd5VfyB2HNWmoU4XikzTEDyANulDHbwvbcGt
 xDbwaS0xj8NvMvT+e/hpqaCLf8gOoFmdK/P02ME8aqM1f5ZIJy6RTYY9NhG5l3KDA+Wz
 PKOJOKmxd+5yxjo8fgNIlhqZK0EwwkMOR65hNLRR3VHbZAkOsiDGtqkOuLP1c2k9yL1F
 S4Ldyo5DpLfVAkoXEkLbUX6dB4/D40XNuTz48F2pAWJ0Ju6Z3ObFK2KYX4cDHUyK++vo
 VXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5J/Ofk6ylx2fNP9WdzIRZXeA0e3ywJAg5ijroGTIp5E=;
 b=udGFZ+XH65O16NibtHQzuvGiJpPfdFKMtHT+mwQ/ugp2bt53tIc8J1suVOdB1y7/zP
 JxihB7IeTuxn1vlXOkjapPipQ/NvtsuGip7wLHCi4I4ouqpCeEa1UIbD4rOPNTQSqKo8
 5SDGsGY7II6E5aRHsCS/+/HPs9Nd9OU6ad4HDurd2oFg+QqeaGz4yMy2bojafnpV9G1W
 yparsPlRLpK5gtiO8MvB4eGQX7aZ+FXy/MHy/R4YaKjYSFDoB1uuHCbgO2+bmEabxBjF
 UYqnAbCbZ4L0LLnJnjgSkq9j+zR0Jhg1TfQTzh5pmGhifIhI4n26Z4wzQtfcdJLv+N7K
 KXOw==
X-Gm-Message-State: APjAAAXSFoZNKmK1W7+Yd2q5KjAbp3khXB78+Lb+y0qEkmn0383SXUEw
 iSH01yyi4kxqaq6dy8Enr73roQ==
X-Google-Smtp-Source: APXvYqz5N5+MuHewN3HtZf0o/tcihZPJ2fkIuNFxsMWdBRetpBqj57Ix1x+D/JGw4/oRNCMLLNTfOw==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr2938042wml.115.1573049602083; 
 Wed, 06 Nov 2019 06:13:22 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 00/10] Improvements for random.h/archrandom.h
Date: Wed,  6 Nov 2019 15:12:58 +0100
Message-Id: <20191106141308.30535-1-rth@twiddle.net>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 herbert@gondor.apana.org.au, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During patch review for an addition of archrandom.h for arm64, it was
suggeted that the arch_random_get_* functions should be marked __must_check.
Which does sound like a good idea, since the by-reference integer output
may be uninitialized when the boolean result is false.

In addition, it turns out that arch_has_random() and arch_has_random_seed()
are not used, and not easy to support for arm64.  Rather than cobble
something together that would not be testable, remove the interfaces
against some future accidental use.

In addition, I noticed a few other minor inconsistencies between the
different architectures, e.g. powerpc isn't using bool.

Change since v1:
  * Remove arch_has_random, arch_has_random_seed.


r~


Richard Henderson (10):
  x86: Remove arch_has_random, arch_has_random_seed
  powerpc: Remove arch_has_random, arch_has_random_seed
  s390: Remove arch_has_random, arch_has_random_seed
  linux/random.h: Remove arch_has_random, arch_has_random_seed
  linux/random.h: Use false with bool
  linux/random.h: Mark CONFIG_ARCH_RANDOM functions __must_check
  x86: Mark archrandom.h functions __must_check
  powerpc: Use bool in archrandom.h
  powerpc: Mark archrandom.h functions __must_check
  s390x: Mark archrandom.h functions __must_check

 arch/powerpc/include/asm/archrandom.h | 27 +++++++++-----------------
 arch/s390/include/asm/archrandom.h    | 20 ++++---------------
 arch/x86/include/asm/archrandom.h     | 28 ++++++++++++---------------
 include/linux/random.h                | 24 ++++++++---------------
 4 files changed, 33 insertions(+), 66 deletions(-)

-- 
2.17.1

