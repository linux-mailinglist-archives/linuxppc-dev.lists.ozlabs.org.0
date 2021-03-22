Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A723436AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 03:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3dpy1Cn0z304T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 13:33:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BgMjtwc0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BgMjtwc0; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3dpW6nRWz2yR5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 13:33:22 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id cx5so7974729qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 19:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mc1N3GtZ1bTFeJ11aXl2/W65kfbaBX9thn6otmVgR90=;
 b=BgMjtwc054TbqFkhEF8nmK+g4+BTge2Md+mjcddUPsW1bCZ7smtPL5Vhh1Ya5FCEyG
 SrIdQOONSssBoTjcpmXWLiBwHG97qlKUFn1YeV4mABuA1CAPWbIrnCk2tepNCyFaN4h7
 25bKg/1FwigNN37HwubMehutew45kl/1lz2L6FXJ6kmBdudSsf9DxLrRCcGbyujzrf+2
 oXbsMxjjdD9PIHOGDhnxQi87vOZKD24z4dVMNC/TnkgYkf9RCbDAR3xpTiM0UT2Mluh9
 8ibxoQr9HiCgz3yqn6OBCMHmp5kIGA3eU7I7Y4Vy3A0uUkRDpW0W9JvD66gOSYreq5v6
 qkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mc1N3GtZ1bTFeJ11aXl2/W65kfbaBX9thn6otmVgR90=;
 b=c4rAuNwyZSCAhNPJN7K7Bj2CVP6woo1kOkqsazuFRPS1qMTG9AMC7psSK6Ud4KG32S
 oqsK8uTcF6G98TBOVpOlpxciH8Y2K5Ht/PV31pEpGR5Z00SA5qkrAyMhZj8tTBGuIeFj
 KnImvpyrqFxuiEX4D/M+S0EfUU1a8fQneFKEMD3IACJZPmNuOLy897jHn+I76npeST6+
 3XJHNiBQsZUvwZ9hn5w3/NqVuhpV/2Qo33t9MjQsA7ed92P605ge0lA/UxTJ9vwgtaVO
 CFUch6uUf2DVeNLyjEsTrkZ+Dg6BsrqpYgF4wqODpdv2UKOkQj3vKlL/1OKTLZvQ0Jcl
 WIZw==
X-Gm-Message-State: AOAM532nsBeOjMHSwG7cezSeh24uQSC6dMU9FjLPnas35LASpCDjz7BF
 dYB1ZIKOUfNunl9ch730Y5c=
X-Google-Smtp-Source: ABdhPJwnwqqrcZY6jMNWHf4bis+/45QG9/GksAxj3Ld3jKCRUquKvDERF4B71eVqw3wU5Sp/VtWiUQ==
X-Received: by 2002:a0c:c345:: with SMTP id j5mr8059007qvi.52.1616380399358;
 Sun, 21 Mar 2021 19:33:19 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.190])
 by smtp.gmail.com with ESMTPSA id 77sm10139906qko.48.2021.03.21.19.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 19:33:18 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] cxl: Fix couple of spellings
Date: Mon, 22 Mar 2021 08:03:07 +0530
Message-Id: <20210322023307.168754-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/filesytem/filesystem/
s/symantics/semantics/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/misc/cxl/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
index fb2eff69e449..e627b4056623 100644
--- a/drivers/misc/cxl/context.c
+++ b/drivers/misc/cxl/context.c
@@ -52,7 +52,7 @@ int cxl_context_init(struct cxl_context *ctx, struct cxl_afu *afu, bool master)
 		 * can always access it when dereferenced from IDR. For the same
 		 * reason, the segment table is only destroyed after the context is
 		 * removed from the IDR.  Access to this in the IOCTL is protected by
-		 * Linux filesytem symantics (can't IOCTL until open is complete).
+		 * Linux filesystem semantics (can't IOCTL until open is complete).
 		 */
 		i = cxl_alloc_sst(ctx);
 		if (i)
--
2.31.0

