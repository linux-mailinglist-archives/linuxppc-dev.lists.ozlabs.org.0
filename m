Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2047527C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:05:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDPqb1bbdz307B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:05:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j66aG4va;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j66aG4va; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDPpt0lSzz301k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:04:52 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id bu11so19467049qvb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 22:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2R5OeRRbE3oFvfnQ6EkZyxFAy5mgz3HVPN8knpgRZ+4=;
 b=j66aG4va2AEf5a1Tg6TnnySxzXSk/TojXjsiXYw/cLsBi9ppRIfHI8dkr4sfgZq0gP
 FnYFLdYXXaICFTm+/BRikIVOPfie847o0a895FY71HhfKMfMt3nxCh6DgjPMw5hDhZCO
 8j7bfg9SYEfSIPzm1HtzGHrrSJtRMNvXNJB49hUOnUJf6pHyh60aR+BNW3w/Iw/81fua
 qmJg04DcI5IjnUNcRRDfBWbOFUAQJ8ePKTpDaQYzaOz3fDO06mrn7u7AM0Ym5I+Wwrpn
 na7f7CQDeuERZpkW6BQu4GU1hN/RyLLcS4DG95SeK4lMQS5Z6BrvQiHa4SDltuytfyaG
 qyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2R5OeRRbE3oFvfnQ6EkZyxFAy5mgz3HVPN8knpgRZ+4=;
 b=CXNy9Opu1uFTLtBvZTvo3cpLjCn5DfYJc+pM22nreIIHAu4uLERhDOmzBRjUqdcxKt
 R72V3+CtFPBv9ZtyoKKTxHgyOWSktk2ijT7+k/pzYn7rC/a+tNW8GlhL+u6/uYvuhbGF
 lPfnlD+Rsv0xITZrXY52DYp1Gv6wsTpLgFlOMcoGBByIXTP7uEfTduV6U8AWuLxIwVTg
 RsmYW/C4GyI142xTIw3sZmPpwua5iydH/j2TyItKVpk5awJ9AAfrsKDD+6XdbJCMtXDI
 BcKDd5/oepRAGCX1jLlEE4PsadxoN0kd8IqoyMrjFQY3uumtcm4LpYaTc6+g3zrJjrJZ
 6eFw==
X-Gm-Message-State: AOAM531QFdvPZIrAGciiCEYp1z67YCajd3yQb9XkjoAD/2I6hr82skWb
 JtBjI3sx86W13A/aGZZh33E=
X-Google-Smtp-Source: ABdhPJysi/QemswnOvlwmBX+VdVLw9Xg1SigpRarxG7fxAwRCV2cUswrZ/m+trtWu/kkApevLcjCgA==
X-Received: by 2002:a0c:c710:: with SMTP id w16mr9508506qvi.114.1639548283626; 
 Tue, 14 Dec 2021 22:04:43 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id y16sm17017qkj.69.2021.12.14.22.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 22:04:43 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: fbarrat@linux.ibm.com
Subject: [PATCH misc-next] drivers/misc: remove redundant rc variable
Date: Wed, 15 Dec 2021 06:04:38 +0000
Message-Id: <20211215060438.441918-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from ocxl_context_attach() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/misc/ocxl/file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index e70525eedaae..d881f5e40ad9 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -74,7 +74,6 @@ static long afu_ioctl_attach(struct ocxl_context *ctx,
 {
 	struct ocxl_ioctl_attach arg;
 	u64 amr = 0;
-	int rc;
 
 	pr_debug("%s for context %d\n", __func__, ctx->pasid);
 
@@ -86,8 +85,7 @@ static long afu_ioctl_attach(struct ocxl_context *ctx,
 		return -EINVAL;
 
 	amr = arg.amr & mfspr(SPRN_UAMOR);
-	rc = ocxl_context_attach(ctx, amr, current->mm);
-	return rc;
+	return ocxl_context_attach(ctx, amr, current->mm);
 }
 
 static long afu_ioctl_get_metadata(struct ocxl_context *ctx,
-- 
2.25.1

