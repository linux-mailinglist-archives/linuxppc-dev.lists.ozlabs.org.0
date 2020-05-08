Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478F1CA26B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:51:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHvy73kYzDqbF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nJNdLZKU; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHY83Y3jzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:36 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id e6so3668303pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GfUgzWLbitF9qaGUNCmu1l6A97VMBe9r/QOhCM2woYA=;
 b=nJNdLZKUblc1WhaspIbSyAZh7ykqN/NRaNT3KIgIAsxLsRGe/NC4N6GVnFBxC48HuN
 NWXwJF+KgiHLLaF+FAt5jNnOD/zXlPJbJTDPNhcCprimeG6D/Fg3dxTV1ihFQnuwY95n
 FPxel4e8QOzUlYo7miT2N57DZcIzqJJ6qTdHobDx0OB2ygjEevkQjVhBCEwQdzrQHrss
 NiBxJkZmuPJru0ffxofMzg3hb6ooUF4UuZKIcCFEcqMZhrjwfnQluf5pcsSAsqtlGMOK
 lXA6Al5jiZoUO5gIZKNBK8ZalzljX4rccPHcG20I0iuV7eKhOqM2+cfahVUZXcUUTN2u
 E4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfUgzWLbitF9qaGUNCmu1l6A97VMBe9r/QOhCM2woYA=;
 b=S4uGszSmwB8qjSakiAFtRHUKciqxTF7rZptr38EGt/5OZgFr789GTy6cYYBJXhrxGL
 CwULvdRV9V+S3+MFQw2u942Wh8aP29+/2y1jprU0wB8/mVB586UG0dEmrUknEuhhdvom
 8CnrBKZHl7FprSW0IXdnjSpbpvNQyKMino9JIaTxk49jdxzDXZReCb9kksbFBF+W3KRX
 CZUKqAIFz2QCQrpJoRdyQ+m8wUJl/JHPAV298V7hzr1Zfw1Q5+sgKimSMYPySu5CcKhR
 G9GHf0fs2LcRY8Bjcaep29HNnH26U0qAUqQRzuVSLlK9o8G6dwv0dJTVutzHfpqVPD8O
 2V1g==
X-Gm-Message-State: AGi0PuYZ6evb9OQZquWhVpLc9dhsk1+3tHPg9UVhWPoz4RRZXiRbRxVv
 AwOb3zvn8yqmoiXgRuyN2dTp9lvJ
X-Google-Smtp-Source: APiQypLw8xZU04Jhk7N8auUDqihWoVPLhPxghoaCTQ3D7JQbNnOq4XHx8jH0I1J0eEPcPUkLaeEAqQ==
X-Received: by 2002:a17:902:bd47:: with SMTP id b7mr608233plx.79.1588912473790; 
 Thu, 07 May 2020 21:34:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/16] powerpc/pseries/ras: fwnmi avoid modifying r3 in
 error case
Date: Fri,  8 May 2020 14:33:59 +1000
Message-Id: <20200508043408.886394-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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

If there is some error with the fwnmi save area, r3 has already been
modified which doesn't help with debugging.

Only update r3 when to restore the saved value.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index a5bd0f747bb1..fe14186a8cef 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -423,18 +423,19 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
  */
 static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
 {
+	unsigned long savep_ra;
 	unsigned long *savep;
 	struct rtas_error_log *h;
 
 	/* Mask top two bits */
-	regs->gpr[3] &= ~(0x3UL << 62);
+	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
 
-	if (!VALID_FWNMI_BUFFER(regs->gpr[3])) {
+	if (!VALID_FWNMI_BUFFER(savep_ra)) {
 		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
 		return NULL;
 	}
 
-	savep = __va(regs->gpr[3]);
+	savep = __va(savep_ra);
 	regs->gpr[3] = be64_to_cpu(savep[0]);	/* restore original r3 */
 
 	h = (struct rtas_error_log *)&savep[1];
-- 
2.23.0

