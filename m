Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478846B9BC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 12:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7cpp04M3z2yn3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2q8xFOS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=X2q8xFOS; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7cp86yjqz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 22:02:39 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id t5so55386738edd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Dec 2021 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0BpwEc/+4c0u+dBlL5ZFFwL9CwrBCeiM6+gZOjhEbJk=;
 b=X2q8xFOSFuGMPFUQxUXUgPkHBzt2OouImoAFq6Je3YBuRztbHBDKnJNe6Ca4Il8ohw
 azgAUAwqPtkx+OTJD7Bzod08TBq3XntnWwRuXzzreewj78QtscE++T4/YahXvp0UMXsd
 CaVPXNxaGLyQgEVMhMrdSaixL2IzUHlkP8wwp3UlZ09xlj+rqW1gtJDtZqalB1Th7vtZ
 g5bgskHOpcOMdOSXXz1lgRFuxOJlG2utxJQGUR2CYXpM6tEDwbfze5OOvki0vkIkX43z
 auyV7mNNeno848UX4Dr72DGk/ilLzS4sLfWHMjGCNTI8IEAfW1f3nnHmh00YPMOdTg2n
 XCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0BpwEc/+4c0u+dBlL5ZFFwL9CwrBCeiM6+gZOjhEbJk=;
 b=ED1TwvSXl8Kq8wSQB3UkvcZMiRiymk05ZBIPdGaYnHWyAzjmhcsLz5j2J19Yzax9U0
 1aJh9md+tw0nk/xjGq8NtbKx0h7dMPrivKBk/kO2Uii9nc1FEYPHRZHjPP8DjhhK6G3g
 hkO73a5i/xoDcVzBjvZBApbO8h4170ps0urENf5KDqGTKqGFF9Q6gO0HjsosLE+uHPJy
 ye3OlSGTuYDn5zDIcokeA8TKlxWvEt/Ifc0L1admUJlZDaT6QuAeQQfQZ6AZGJyxOpFk
 jdOHnUSV90j7hwDRqEGg0fMa8HL3QyFDxOwdphLyvqHmXQU2b8KzopMvbIOX/5JAM1E3
 8e/Q==
X-Gm-Message-State: AOAM533iIR0QEzFGD5PUobc2PVYBQSLQThqLi/CeuhysiKxP4aqy6Yhs
 1W1lAFU71dhHLdCuI9LqwSdoOg==
X-Google-Smtp-Source: ABdhPJydLP4TJ7VYKV5qrQOW1I+z9lY4ca219oUHggFrH/j5HD1/tUZmh1lTuoSHZ+chEvmeJZFbtw==
X-Received: by 2002:a17:906:cb82:: with SMTP id
 mf2mr52738140ejb.266.1638874952179; 
 Tue, 07 Dec 2021 03:02:32 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id cq19sm2630328edb.33.2021.12.07.03.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 03:02:31 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: arnd@arndb.de
Subject: [PATCH] powerpc: platforms: cell: pervasive: fix clang
 -Wimplicit-fallthrough
Date: Tue,  7 Dec 2021 12:02:28 +0100
Message-Id: <20211207110228.698956-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
        case SRR1_WAKEEE:
        ^
arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
        case SRR1_WAKEEE:
        ^
        break;
1 error generated.

Clang is more pedantic than GCC, which does not warn when failing
through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst.
Add athe missing break to silence the warning.

Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/platforms/cell/pervasive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 5b9a7e9f144b..dff8d5e7ab82 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -78,6 +78,7 @@ static int cbe_system_reset_exception(struct pt_regs *regs)
 	switch (regs->msr & SRR1_WAKEMASK) {
 	case SRR1_WAKEDEC:
 		set_dec(1);
+		break;
 	case SRR1_WAKEEE:
 		/*
 		 * Handle these when interrupts get re-enabled and we take
-- 
2.33.0

