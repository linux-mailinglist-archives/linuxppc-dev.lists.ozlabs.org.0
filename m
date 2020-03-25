Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6A192614
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:47:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPw10PB8zDqLB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=njWxT1ig; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdQ2Sd8zDqmF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:06 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id w3so651996plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ozX9K4/nreRogiZx27UwFspN1xEDF6t8e+uqJsVVpUw=;
 b=njWxT1ig6ZyWla9ElTolVI2ugib/3wBSvUWPqRVimFNkMdx/FrRiEtk8VHug5S9R4i
 0435thi1wy9rfq01AfRGkjJ83SxpLLFuo1kW4tZfH7qPsWkEOQIfAmrueV36ICcTm0KP
 1EAQThprMrhPhx+oCFTZmrPJC2Zyo8Y5jdp3a5C1dWJTqr0xr/y6Uk8aaCgSIZiGdEK0
 b7jYylkgp7obKposHGveskKrY2amDukKSez0tyKLIKumj7zZy+L/Jv3SMDlgBa927JC6
 ZOKEGxsSKKW8mmAg5rz96mYRqwpX9CrEZI7b12qFUTXtFpYKG7C+xBPLZYknteByPaBk
 XT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ozX9K4/nreRogiZx27UwFspN1xEDF6t8e+uqJsVVpUw=;
 b=FxAiinBwkdkuhDkTZX4fQd6AIi/UXO+IPgf9XWtDZH8YS28fvsUyXydmGaZpky57kN
 9+NIOqa1o2gyznS7YDkj2VvnA2JsJdx69fp6R1+mZKT6pavt+sjzaEr4kTVQsqYSPRIt
 ZEMNOz/2AyN8LW+t/j3VuqZqPhLsHjO3/HkwTS4/A0SUjmC5yOGeXrfh71NIEYzM5h6o
 5Fio8n3lIAcLtmgXYvDKBcv8pVlt+GGDUt3oQFiG5t7lxrCibqT1iEu89/bdpweGERPA
 H3h4djKiopcghFksL6eeFHV8nIDWMNsO2hRH8RmCIIh57IPtCikwr503wgnECUobWiRa
 dNnQ==
X-Gm-Message-State: ANhLgQ09spVMWWgOq2bWsMDqy2yM1jB+GOZIQ8Ys6h2V4C09qmq0bQea
 52XWyeXw+3neeay/vcfn+bYBOAQ6
X-Google-Smtp-Source: ADFU+vuKcMx9Z2MtzcVSta74UKcGwVRdAYCM2LspyZ2tgcogErpjYrxvuoeD7ZKLHKydk1X3R3OEnw==
X-Received: by 2002:a17:902:ed03:: with SMTP id
 b3mr2480978pld.247.1585132503359; 
 Wed, 25 Mar 2020 03:35:03 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/12] powerpc/pseries/ras: FWNMI_VALID off by one
Date: Wed, 25 Mar 2020 20:34:03 +1000
Message-Id: <20200325103410.157573-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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

It's not a serious bug, and QEMU implementation has to retain a
workaround for old kernels, but it's good to tighten it.

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

