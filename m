Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C819D813
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:57:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1hM6KVdzDr4d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:57:07 +1100 (AEDT)
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
 header.s=20161025 header.b=Z09pscQq; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11g5JMMzDrRQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:03 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id kx8so2926837pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WDncZnlZg6rDaJzlRq5SiuO9+j4VbSPaOBkQCZVSSU=;
 b=Z09pscQqkv5LLSItpW7t7KPlRsvliyB0C7m94SWWx3pBtMvIvlRo7CsnCG7RPFNJaP
 ZTzyTpo5+esN/uQ3ELqrDKgqTCGL9abWbxd9JkLQFjdTYn6fIaOhB7W/Xqje+EhIYUHQ
 G3OXmeIQb+SuXiYaxGLYooOP/g2cs5k3rGE5IMP5Ng6kg19ksoFLQFQQwUYRgpfzRIu4
 dQB8U099RtMkyJIex4e0tbFTz3aHyi8hdYpDdhfmTe8HRDp/7Pn+hBMz3Eq8+42ENDMq
 YQwkf4NEzADdhpK+PIDEvDxBV1H+GCZ63wV4yolm9uwwSQ8P9irNkiSlwgaXGhUimn3L
 zgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4WDncZnlZg6rDaJzlRq5SiuO9+j4VbSPaOBkQCZVSSU=;
 b=m0y3g1HJKVncOeklZU/30NXBZOmW7CsJQyFSKDmB93Bn+Yfmj3xzZXd/uv5YOl6uAO
 KIaUFQUzpInqP7K57+25dOGAPpEdQhvQRK/395fdDT+hxSNr57gdyaeAFYccBix8OtlE
 oXoN1b5jJPFjT4K6MOSR5fVVjM+C+9CAPustAj6venktZOHvf6eqrL4fVYvBNOF/HyyE
 jrXeUR/yuN02+xzqzBSEMoIE2Wto/y5tIMoPoJEYeivkoDDyAptxFtSOxFQWpdtI2i6G
 9BLctbtOw3w9NnO/7J6dIV+vaVYJ1gTg1WfG79YhDb6b/7G8e+yeQzAbTndMbsNh5iha
 GzuQ==
X-Gm-Message-State: AGi0PubY8P9hPFz1NL7QY2vUz6cD+gVE7PUpWDrJ2YeaM51T/VdBKv1b
 mxn04w+9Fi8lb8/PAWwd6KTU88hL
X-Google-Smtp-Source: APiQypL7KTRUEsffOTyw9qODAqRfBuseQJXF2qNzInmCxWkARVpSasB7NsXIUA4zNO5J1PhEazu4wQ==
X-Received: by 2002:a17:902:7c97:: with SMTP id
 y23mr925838pll.146.1585920420907; 
 Fri, 03 Apr 2020 06:27:00 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/14] powerpc/pseries/ras: FWNMI_VALID off by one
Date: Fri,  3 Apr 2020 23:26:14 +1000
Message-Id: <20200403132622.130394-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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

