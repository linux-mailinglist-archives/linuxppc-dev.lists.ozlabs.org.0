Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5D4C6C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:27:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tr12330hzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mvnd8niu"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tql26XqdzDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:10 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id ay6so869276plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFfCzXojAz8hr7/rjajWB/3p01pt8TIDMhzk3/4DhGs=;
 b=Mvnd8niuSbkV6erwK/jF64WJSLuGhIUGmjrs8tPwgzEgaJSS0L7DoyVJftZUckqTWq
 NHpHt/tF+WAAxEBW8ocTuFeoZBv6IBQAr9DYp62tf+4WtWMs0tsOEiAjSYecxKapPet+
 f5d3vw5uV7ivr5QdDJ/IgP9F51+Od/mhRGR9cwg78mKklKBUFYNzoMKBBw/VGomQ3uYr
 kL3Vm98BqSkReouqWceS7UxqXJ3D1uoDDXbsLcfqGVXKI++Gw8yzT0UWjpNML+VdsRmj
 h+FYkRwbTV1O59p3dKcQBnhV4pACejNlC2wa5ikPIi9RLIiwDdP1P5Uao9jCERGPYdre
 nmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFfCzXojAz8hr7/rjajWB/3p01pt8TIDMhzk3/4DhGs=;
 b=BEnRg3P3P2TlkgkbfC7txryJlDvBTAU6wA3ECGMG0qTOfwn68s+3aJ43qUvo6e1bsp
 eyAuiVefeclx/LaliN4gnMpI1MuNh87GnCB+F+DnW+qim783ObfoTpGhlbdwsF7tBItz
 ZcPt6v3IbtNkwGc1vsrPU1Zgb3eaJJ+kRQigK05olVYiNBlz9NRGVDkHxRB6OUESm9ju
 mbLsewAe4v4a9vKbRf8AeQAx1WOSjUbLTYijHZZZVn8me5/q7s0PXkzmMgmxJE2xoJ1I
 Km6Ldq2lTm/+9MrJxqUrk/iE9QvVTiDb67y3psY8AyrOJRO7lhjocTGhJZuU0+pbO/ES
 sXpA==
X-Gm-Message-State: APjAAAWJ5YKj0k0Cji1BNHNelInFf00sJQ1aJX09uOT6020eDjWlWcFv
 k6q6D+hH9eQd1wh+LpYC6DqOwjyd
X-Google-Smtp-Source: APXvYqz8GGKIzlLr7L1UQczLYWoS4dn7Ry5g+N/mPv8DNalgIHt7N03ZRLe4aNS6CMKACgHgKGvUbA==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr31628069plr.309.1561007708473; 
 Wed, 19 Jun 2019 22:15:08 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/52] powerpc/64s/exception: fix sreset KVM test code
Date: Thu, 20 Jun 2019 15:14:12 +1000
Message-Id: <20190620051459.29573-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

