Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2E187BDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:19:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSKW5FqqzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IO4JQczT; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7Y2kckzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:33 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id m15so11362362pgv.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKi8BU578lRrpQgsBEmeY+Wae0ouYy4n5AlvdfJQzlg=;
 b=IO4JQczTQT/nPGt+MKHwSy4fLeYPE21lHjEeuDIbglF0eR0+P22LjN/y+GJTKvz0qI
 fwcJwi6CIN+PxS2q2qQ0zREKL4vBm/KRW4tl0sBB8B9AF3EwDJHubH+iaaeEeanYNG6F
 7OeVdUONjkilp9ulTPHf/cTWyl0fdqZx+/0LjETYiFH8ddL/uKNOb6IxyVx8wInFZ1rt
 K1FqZbLyQHD/QDb5pFEHivLauUBxyYoydLJYUsIUXrgn8HYm4GQxBWlJN20eMufJVZGo
 fRjwTZjwoLByX6ECQLwqhqtBP6eRleti5e9unH/irjiWD9dFgoaw3tcuIBti2NMjzsym
 bbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKi8BU578lRrpQgsBEmeY+Wae0ouYy4n5AlvdfJQzlg=;
 b=hWh6LjfdEj/ECcbqPf+GZ/L52UJjeh0BYZ6lMcFH3sCKSTsb2ire4MxaxEBYOQ97/m
 jyAuL+Q19kl9PKEDctkROkY1R86uT2bAAamp52i2xZY2h/CW21ooS6f+OWAMrNgPVIsv
 TmkbgujzYNWYUw67Z47Oia8l8K25iFcfcpjxqSb8paytOdfSixBdLIjrjeT+1Xvq5hYQ
 aU+nH8IM2LEP5/JeqAgmCi7MTpLsE9tX0GDpRRN6nup/M4ZZ9CfY44WScrVekM2Rh8Kc
 ZvTh/7N7J+dGsZMRppQyEoeP+0dzugqlRaugckjjLjL40zyrtr04Uq7sW7mkOeuNGKsS
 MVvQ==
X-Gm-Message-State: ANhLgQ3aEHZGm7q4Q7qBEZnlPHxXTOriaZ5VANeLtswQ2ybuPwrCp5xe
 yfZ03VbU+vYJKSti/kulh6P7fq2w
X-Google-Smtp-Source: ADFU+vtB/Q/LXRLxuRnweQyLmvmFTUH1hLO3Wg0SsWms6uxH5mF65spaH8uT3dCKFyaxV7SQe+KZiQ==
X-Received: by 2002:aa7:9588:: with SMTP id z8mr3932569pfj.240.1584436231086; 
 Tue, 17 Mar 2020 02:10:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/pseries/ras: FWNMI_VALID off by one
Date: Tue, 17 Mar 2020 19:09:11 +1000
Message-Id: <20200317090913.343097-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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

This was discovered developing qemu fwnmi sreset support. This
off-by-one bug means the last 16 bytes of the rtas area can not
be used for a 16 byte save area.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index c74d5e740922..9a37bda47468 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -395,10 +395,11 @@ static irqreturn_t ras_error_interrupt(int irq, void *dev_id)
 /*
  * Some versions of FWNMI place the buffer inside the 4kB page starting at
  * 0x7000. Other versions place it inside the rtas buffer. We check both.
+ * Minimum size of the buffer is 16 bytes.
  */
 #define VALID_FWNMI_BUFFER(A) \
-	((((A) >= 0x7000) && ((A) < 0x7ff0)) || \
-	(((A) >= rtas.base) && ((A) < (rtas.base + rtas.size - 16))))
+	((((A) >= 0x7000) && ((A) <= 0x8000 - 16)) || \
+	(((A) >= rtas.base) && ((A) <= (rtas.base + rtas.size - 16))))
 
 static inline struct rtas_error_log *fwnmi_get_errlog(void)
 {
-- 
2.23.0

