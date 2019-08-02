Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9292A7F5D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:13:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PfP1x5xzDr0V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mHxyoYa8"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PLz2Vt9zDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:55 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c3so12724079pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGhIaE3C6AvPQiCSNvQnTwKiIpRE0bgrJtHIA8eUBYY=;
 b=mHxyoYa823WaJjX1tr0rQBKIOHXbBXvPy3Rkx3rTEznHonEpc1vUFcSanuYm0VubUJ
 TKrOYUkn2R/b3bBfo4rirfUHs3elEAm5fTf0NfrsJ20MP8XmB/KS2RifS1BbedcJ0Oyp
 SvXXVnn2VZJYJsnkXAzlFpedMihQ96Gn7G8PRf6+cowcTWkMqdBdhrPUxA41iHggmhI8
 6N9ks1qZ9Fe4bds8f5ISn2vIfE/TsNe6Vu7SGC0i6JyG9biTXTr9RVYVZlC7T4/Vwk1p
 6eUTN8uQDFv2R3IhMFtyf6TkI6kfUcw4mZogEujskWqi0bcjv6jU8Br0g9cISDct8Ybb
 T30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGhIaE3C6AvPQiCSNvQnTwKiIpRE0bgrJtHIA8eUBYY=;
 b=Di4RyvN9k/vLx3fDTLziQPfvyowXQhdOEdTnQ4DAAcvShpbu7epPWmLwHJbq94kVwS
 oZcP59lHwU4IHWY+QeRGwjQ3t/VzZN0ReBXtw1eowoV7mh8/7+Q2+lydc58en4nhSUAJ
 dj9nRf2kMC42t6CikuqDW7LOP/1WH07uMEHMlyft8c6XzxBBiWKcRTk/vbPftMTavm8g
 +deC9axNtBn392Cyj0sIbKSGtDUUTfo1slJUiMbf52cV7L1NIjw5IACNm1kfl5JW60KR
 OK6rkceIuajfylo+2eya21zje7GERQaMJTacNFx7QDa0SRBleg76XBoyA+ElGRZjbK6d
 UHAw==
X-Gm-Message-State: APjAAAVkBfoJqimCPKw/Gri8x1CjLZFJ1zUsAwloy1DVgnEA6Drf8qXt
 GlLwoXpSZCOlZhLV8mNClNrAAsWx2n8=
X-Google-Smtp-Source: APXvYqzBiFlF8fpdQQy31SOyb6VcSibTctAsUhumJ1aOtCbgoAcH8IL96+h3BFdswsb7aEZUzZ1c4Q==
X-Received: by 2002:a17:90b:949:: with SMTP id
 dw9mr3797572pjb.49.1564743593135; 
 Fri, 02 Aug 2019 03:59:53 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/44] powerpc/64s/exception: machine check pseries should
 always run the early handler
Date: Fri,  2 Aug 2019 20:56:30 +1000
Message-Id: <20190802105709.27696-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that pseries with fwnmi registered runs the early machine check
handler, there is no good reason to special case the non-fwnmi case
and skip the early handler. Reducing the code and number of paths is
a top priority for asm code, it's better to handle this in C where
possible (and the pseries early handler is a no-op if fwnmi is not
registered).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index dbd1a8c68636..8188c4ce4a49 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -934,11 +934,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXMC
-BEGIN_FTR_SECTION
 	b	machine_check_common_early
-FTR_SECTION_ELSE
-	b	machine_check_pSeries_0
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-- 
2.22.0

