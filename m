Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1211CA269
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:48:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHs76swMzDr32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qLaBywgF; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHY642N7zDqvy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:34 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id u22so170597plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/s1DkIdowWfjKcw+iJWd79HmRXUIXMVvtGa1kgANv1U=;
 b=qLaBywgFj7qK04vuLUTyaEoToKAwhvBf2me5Cc5eWzifV2hNWQu98oAetfPSL8kogg
 N3gd7RnQOskMG5A7FvUs3BarPLw7GFJCfCslKPMfpohAxilBaCGg7ZJYYxfgRQMP2ZoN
 X5RCU8Ey+kvrn+J2U4K5RWY8diUIak6hC4WXw/HoGRB3jQWIbY7SvXwQD9TcuOEB+nBr
 inT3RLm4Kgxsbk+sojk1ew2eAK8HelOPy09De+E//Tb0aYQfzwp21ZRNJ6brDRWb3Dqa
 WhlFBLgn6UmKtgHnQoXCscPsH5e6/RZ4QBdeFv9f+BzsT/tKjd7sm4WFjfIGMC9/OMzl
 PT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/s1DkIdowWfjKcw+iJWd79HmRXUIXMVvtGa1kgANv1U=;
 b=c+ENN79t13wdx3vTe9p7CjFGyJDVaAKqhx4cn8TYCcCO2IGGwZp6N2q5rA5DkFFmeR
 IWEgE5SVU1EirJsfgOqMVIySjTG2oDIXIa0eMea7zRIDumt29QB5fLb9tZ80XVyQnsCO
 C8sLppxRU9rAMVOArTNtPRyFfVtEYay9pmnciXEtQVBlz+HlZ4yDtYBkS19yQUfX/Mkk
 DLguCtaOh4cztBgtuskgWam3q/7cAKg1GCl6R8WNLm0ZHi26cJ2J2k6lT/XatPuryTMD
 5qUqdBhIfkNxOW4hSVjaf7/anvQfJlu7vsZ8/uawpMCUYQ4ZJT9yoCUIm7JOa0sQ4xPN
 9RXA==
X-Gm-Message-State: AGi0PuaxS5ucVAICs9qsblMx5BDGLTilzmpTLB866tSRtNsTIFefTnmj
 Mg8Dpdp/7gsQFdaGSbK+vu/XiR5D
X-Google-Smtp-Source: APiQypIlMeIkKnTOHQPfQ7iO+xWrZThFIPtt5s8dmjgJVYUKGJLKkhKg/OwFFULdGAAhLMkBbykipg==
X-Received: by 2002:a17:902:9a43:: with SMTP id
 x3mr589690plv.332.1588912471665; 
 Thu, 07 May 2020 21:34:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/16] powerpc/pseries/ras: FWNMI_VALID off by one
Date: Fri,  8 May 2020 14:33:58 +1000
Message-Id: <20200508043408.886394-7-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was discovered developing qemu fwnmi sreset support. This
off-by-one bug means the last 16 bytes of the rtas area can not
be used for a 16 byte save area.

It's not a serious bug, and QEMU implementation has to retain a
workaround for old kernels, but it's good to tighten it.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index ac92f8687ea3..a5bd0f747bb1 100644
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

