Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD350D704
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 04:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kmq6z09B5z3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 12:42:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fmJQnQsX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fmJQnQsX; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kmq6L4dysz2xDN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 12:42:01 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id hf18so9530674qtb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 19:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gImJskEZbUGQq/yGIUbA5C1222sfBMsWHD6+YF3THPg=;
 b=fmJQnQsXpPKz5cvRtNW5sdyaLchbq1R/zwtRKKM/0+eh+reY//gd4nzYNYVIauTvAo
 EY8Bh2mSzv9R//p+s87rqTuvX+awWpeUMMcZjN2mMkUxta/uJYZDh5kI4devsG0jRXTt
 T+16Z0i2ekWA8v1qiqyzIIOZsu/XSBrTkOGmUBgEuE9L5fs9vYQQEflyeBD4L61q0FhL
 GU4XmdC7+5RV671ujlZYnQowYylmd5CCgmGVI2lUW7JDu2v0ZmNDhFYZgwaijXL1dDc+
 xoQDqq1jC1jWVSJ4VIBZ/lXd5hFuX4Yhk33K9WNoi5y4RFzFafc5VVSyrDqfuGF6Hkpj
 1omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gImJskEZbUGQq/yGIUbA5C1222sfBMsWHD6+YF3THPg=;
 b=kAnFE/TUuI7nXlnO3xNG1+fwQdi7KXxBKmwWZWdVsAwK4TrrttyaRf/vz/ohLXLoUn
 Hdwe88LP8xEc7hvgPsHbZBXTiekkIN07ZVJlg0rtPOhzk8qXz5XuU8UYI6LhfYSJ25WG
 tOeoUWozUBTayHeMlHGM12LWfmvcvj0bpJl/3ak2klufEXu31sxzgUgD7eBRag8aymrd
 U0ZAYbakF5Q5nRN/ibjKGIg9W8L5EHBa16t5lRytrNNl4UDQ9Xixf6S/vfDfMwnd5pi0
 yI1f4SktLM/F4TPgFnKgnV4Nk3VtVTREG6B7CxclerfQ652JmTawyth0poUtNfaeahMo
 rjOw==
X-Gm-Message-State: AOAM531SEyPT1TXDDhfZjxD9YEHYTClr4VSav3tyf/lYjcdGbuFV6d4p
 ausISBh3gX7qdfX/eO/eB5k=
X-Google-Smtp-Source: ABdhPJwcntiUs7bpeBa07P0pFsaSM8L/5aS0IxSHCE8hk5PK/PHMtzYCO9tfOug8sAfJ0Y1MIyZ5pg==
X-Received: by 2002:a05:622a:19a1:b0:2f3:6a7b:25ff with SMTP id
 u33-20020a05622a19a100b002f36a7b25ffmr1102318qtc.13.1650854516591; 
 Sun, 24 Apr 2022 19:41:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05620a15e300b0069e5b556f75sm4298227qkm.5.2022.04.24.19.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 19:41:55 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org
Subject: [PATCH] powerpc/fsl_msi: fix return error value in error handing path
Date: Mon, 25 Apr 2022 02:41:49 +0000
Message-Id: <20220425024149.3437751-1-lv.ruyi@zte.com.cn>
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
Cc: maz@kernel.org, lv.ruyi@zte.com.cn, linux-kernel@vger.kernel.org,
 jgg@ziepe.ca, paulus@samba.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

This function fsl_msi_setup_hwirq() seems to return zero on success and
non-zero on failure, but it returns zero in error handing path.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 arch/powerpc/sysdev/fsl_msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index b3475ae9f236..10f974cfa2f3 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -353,7 +353,7 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
 	if (!virt_msir) {
 		dev_err(&dev->dev, "%s: Cannot translate IRQ index %d\n",
 			__func__, irq_index);
-		return 0;
+		return -EINVAL;
 	}
 
 	cascade_data = kzalloc(sizeof(struct fsl_msi_cascade_data), GFP_KERNEL);
-- 
2.25.1

