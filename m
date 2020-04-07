Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B911A06AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:47:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGdn5KmLzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U11KZoGh; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0p4yv8zDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:19:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a13so272087pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jihMKlMJVkAPxpzXawv9A4UZu5xnq3ijgXSpiO4HgmI=;
 b=U11KZoGhj/pZC+DhoeAZO24gWv3Q0DLicEwuNFQ8cqTAf5JTE8Y13HiTYeSL94i7kO
 Z5RLrRCXwauDbTSG42i/v9oxa7PE0xwDME5e+IoqwA2WlSBGqluiHJnyJ4QjIyoMfcM2
 HiaA0Dizk3gJEVbHweHg8dJVTnj02xuUu2lkaJVehFD+sFUuslMcF9n33cm8Vnf74GmP
 dSnZpUFE47RATtLWSpWf6L0D3zAYNPrjTh0D+oiJxYexTvdBPMxOJNDMuu7eV8zun3SL
 gd3e4D1bYKi4bGBmW2GRPF5491yF0U9GANnQ43gVdMsXhwXtOs8DVVzFZMV95diqRYY3
 H0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jihMKlMJVkAPxpzXawv9A4UZu5xnq3ijgXSpiO4HgmI=;
 b=uiI3j/nVw0Go/Ftr2z7+iCAd9iXMYgy/BXrBJnmxPNRus2EF2EWYPXftuJ1h+aKej5
 JROR7X1kg6i0tChr4qDeqYa8tDbW14LCVLmcCsSaubfWFMmpj4IBkGfc9ORzhhBOcVus
 Nu8QCs6iwarwRSNZYK6vITU+U6hik9mbvKrEjePiKDE7kawSNjK+u9yUlI5GPW1YwehW
 Ew0o98Cp2PrungrATYDJJYryvBpIYcs9vQud/iA+y8lzOceDXfRV6MNn5cTqjnGyM027
 dL6zQwhzAIawuIC7qRnw5vKwQTBuGyLHJfnIyw1PLewmfigNz089KNL7Xd/hZBwuCN3c
 tOnQ==
X-Gm-Message-State: AGi0Pub5D1qCiA1t6vhRj2VaThoumP/4lme7sfObgDEt92cI9QLa1dgY
 DEZe1OY6JWKWU/CAigsExyffMfX2
X-Google-Smtp-Source: APiQypJ/SCeUhm76IqqWPM4dyMkWgLEZdMYv2a8JJSz98eBtakYyimsTiCV6dJSo8qL5RoF/12Gc1w==
X-Received: by 2002:a63:b954:: with SMTP id v20mr303021pgo.381.1586236744210; 
 Mon, 06 Apr 2020 22:19:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:19:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/15] powerpc: make unrecoverable NMIs die instead of panic
Date: Tue,  7 Apr 2020 15:16:36 +1000
Message-Id: <20200407051636.648369-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

System Reset and Machine Check interrupts that are not recoverable due
to being nested or interrupting when RI=0 currently panic. This is
not necessary, and can often just kill the current context and recover.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1beae89bb871..afed3de33a9a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -513,11 +513,11 @@ void system_reset_exception(struct pt_regs *regs)
 #ifdef CONFIG_PPC_BOOK3S_64
 	BUG_ON(get_paca()->in_nmi == 0);
 	if (get_paca()->in_nmi > 1)
-		nmi_panic(regs, "Unrecoverable nested System Reset");
+		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable System Reset");
+		die("Unrecoverable System Reset", regs, SIGABRT);
 
 	if (saved_hsrrs) {
 		mtspr(SPRN_HSRR0, hsrr0);
@@ -858,7 +858,7 @@ void machine_check_exception(struct pt_regs *regs)
 bail:
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable Machine check");
+		die("Unrecoverable Machine check", regs, SIGBUS);
 }
 
 void SMIException(struct pt_regs *regs)
-- 
2.23.0

