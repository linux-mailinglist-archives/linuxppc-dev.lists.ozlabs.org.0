Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896A3CF88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:53:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NY0J6Rp7zDqcW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BO3QV5ML"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXYt5nr9zDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:33:54 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so7587396pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFfCzXojAz8hr7/rjajWB/3p01pt8TIDMhzk3/4DhGs=;
 b=BO3QV5MLiwjNuVDS+O6gsFkaO9Dr60BEvvbuezdCbwBFVc5ye0Kphh2y7UVEGF1/+o
 QUDIH2cIpro2JgHTbUuz9G6l0G5Xvz8w19mqVJmmFsCXfl/S83mrykb+CyzqUxPQvKZn
 4pC2ZMIqACVo347m8/wKIFs91iuaYF0b7L94ZFcan9Df7OQ7lkIqWoaWauKaLrPi0mht
 Svnc00ZxZ2hwFU6rng/Hsgpy7VqYMX7GcLm6Yyb2i4zNTPX8X4rDXYElPw2Mbj9Zae7U
 33mdTO3ZBC1in7be2Tov6wn7k1AApLrZF4gXShl9r1shWYgKYydfb7v+368FeUfp+0u9
 NcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFfCzXojAz8hr7/rjajWB/3p01pt8TIDMhzk3/4DhGs=;
 b=p1719jG6AFWSlhH5/TUYD4kTTt7B24DNqPgBLtrgNYgPf/OP6Z44pAtExlMjNeMaqZ
 UkzZygKircx4W7MvWcDuK96cp2LOJnSU7SyEx1/pWl0uvAnf7tBFt1pcGpmu2Zw0kQ6E
 VywcFpsVCOdgL5cX+DgemzUU+DbQjFPpsWTkTlyTvNILNreJ5JYzX2VEqFBFmJkn8fXQ
 EGvDQpx9wkG0ugMoC1WCfI9VLO50Lmx5yp28yXzuU3D0NJ5+EIic2ulAhO9S2zwR1OJk
 qLt3iwmKekTXNmHGkpXYFxrGSHm4acPBcuEG8cPB3zfpazMVI5HLPygUd5voEpZFcctc
 56Ow==
X-Gm-Message-State: APjAAAW9JM0gD0fGBmtx1rEtas2kBe1NlLdip1VZbXacZZKFCL1hvjpV
 PIlGBQ95c7LCE/i2JuFHR3hLqDgn
X-Google-Smtp-Source: APXvYqx0YzQDrnZywt0rPX3ctULOVwK/5/ZHyAEW5CZBnY2+9+zY1gHbGUxZsO3NSwBJW1//30NNWQ==
X-Received: by 2002:a63:f959:: with SMTP id q25mr12436081pgk.357.1560263631239; 
 Tue, 11 Jun 2019 07:33:51 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:33:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/28] powerpc/64s/exception: fix sreset KVM test code
Date: Wed, 12 Jun 2019 00:30:17 +1000
Message-Id: <20190611143040.7834-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

The sreset handler KVM test theoretically should not depend on P7.
In practice KVM now only supports P7 and up so no real bug fix, but
this change is made now so the quirk is not propagated through
cleanup patches.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bb286f7e1aee..b34d7a9acae6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -126,10 +126,10 @@ EXC_VIRT_NONE(0x4000, 0x100)
 	bltlr	cr1 ;	/* no state loss, return to idle caller */	\
 	BRANCH_TO_C000(r10, system_reset_idle_common) ;			\
 1:									\
-	KVMTEST_PR(n) ;							\
-	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206) ;	\
+	KVMTEST_PR(n)
 #else
-#define IDLETEST NOTEST
+#define IDLETEST KVMTEST_PR
 #endif
 
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
-- 
2.20.1

