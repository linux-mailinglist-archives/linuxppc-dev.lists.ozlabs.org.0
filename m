Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1133477FE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRCQ6Nyvz3dsp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cV/DmMuj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cV/DmMuj; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzh75STz3cJm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:04 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id a11so303782qkh.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zwVV20JyZ7tzD2KFvN/thIii6fJmIVhEMKDPdNM4kM=;
 b=cV/DmMujWVO53+vPLEMoDAlBuT6bR0O6QXT+cj+Hq9XOIs9d6B1mm23lZ3hKsbxvrE
 EQHTXnrQNxNE7OFzIi3OEkDnRYEDD9wm89rdhqFKyT3lnKAxxj+//3CtGUuwx3GhLr2U
 rIhRBzeNG9loS08LaarN6DUngPgcXaJpOGqeLFqO+FWrO1yI1GbI58TSyt6x/aIHsYgj
 gwnzfajB3APdgI056Wh2do9hFnjYz1sBJcFwej5V8pjy7hfCHkZaJAsuy6wcsK6i8WSb
 oGcDN7gQT3vwg3Dg5sP8FsORA71IbogPNevjOIbblNsxy3DBZg1ijCJnLml5ngBj3fhh
 ZmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5zwVV20JyZ7tzD2KFvN/thIii6fJmIVhEMKDPdNM4kM=;
 b=E3ey1xBezGieMDlub0xkaFJtd7FCohiipx697qY0LXk2DXMOQD65n28PXF4xO+ZpyV
 LlAY4DGIqVDNmO8988OY9Hke1l9DWkD5ZYfKm3yqz6fNKb9Wt+r5EcgJT+YYKS0KhcP9
 K5//OnWqmAELsGD+9cBxihNZ4TyxYcYImnjpF5h/4Ekzf4+xq9g+QpURjilAqEq296fi
 LfzY5044LbBSyHLVz1PmEt3ZvN5nrZky5jAQ6fuRz9eRKktnIDkBNCfI/BtbW+9VYZms
 9Xe8aJuh31fVo+uQ2dXprbxHrtlN6YVGLm1juy8VJEFt3c6WK7MBCDhqvag6LL0pBmLK
 x2Cw==
X-Gm-Message-State: AOAM533qx0Zjn2aT8PSPDxD20IKhvhWN/UgOYT1iajgVvJsNH9wz0fYx
 X3ySsOCLug5fUCyGgXqOMgw3QZqfTVY=
X-Google-Smtp-Source: ABdhPJz4UWbDgTIZ1Dg2LroWIt9iuQFswPk0fpmox82YzgeWpCLRtQTY89T/qLMLzVYGmRAwLcC5fw==
X-Received: by 2002:a37:ac11:: with SMTP id e17mr39562qkm.557.1639692062261;
 Thu, 16 Dec 2021 14:01:02 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:01 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/20] powerpc/44x: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:30 -0500
Message-Id: <20211216220035.605465-16-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/44x/' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/44x/fsp2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index 823397c802de..af13a59d2f60 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -197,7 +197,7 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 	}
 }
 
-static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
+static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
 	struct device_node *np;
 	unsigned int irq;
@@ -222,7 +222,7 @@ static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
 	}
 }
 
-static void critical_irq_setup(void)
+static void __init critical_irq_setup(void)
 {
 	node_irq_request(FSP2_CMU_ERR, cmu_err_handler);
 	node_irq_request(FSP2_BUS_ERR, bus_err_handler);
-- 
2.25.1

