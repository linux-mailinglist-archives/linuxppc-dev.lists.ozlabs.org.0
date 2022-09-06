Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C15915AE0D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 09:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMGy85HM5z3bqn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 17:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lJqMcav9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lJqMcav9;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMGxV6pq8z2xGx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 17:20:12 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id f124so1582432pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=wUM9TG8n899TMK7xfOD3wSfej2b1DDNKD7A4zDy+X0w=;
        b=lJqMcav9akWTUkl7ucSdLf6fhDnUC5ApxPb2WzWhdE8mOEemfi5xDHa4gBZefQKSu2
         KutoepYo9e2ptjcPA9KPT11yWmCDSBUA6UIglTEopbsAtY9JzceZKdFd/NvUx3/o1qle
         EEzhCbi7PsNvp7Pjoq1ZPPi5EuB8FaU6yd2xd9k8Jhtka3VY2JMNDdFTxM0ZG6fBwN5Q
         Cvxc6MNnAILosSK/YBdgrCQVN2qRd2xpZoqVDwQQZ2/ICx/XL0Dt7JlhnTqP+syy2qkx
         4v0rzu13gsx1mOkaCtJNKUKb1dbg8Z4ZlBn+6H+AjZMyerrZXRgT+gDfnGHUj3jaDcGr
         g6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wUM9TG8n899TMK7xfOD3wSfej2b1DDNKD7A4zDy+X0w=;
        b=Slw/apgFoqMt6FPx+4HDOh56mWLZD2OnkkrgXB3M65ue9FW05DTXHeqZrxwqfCRHso
         CvM3PapvMyDqopXmayFuhpNUeRC/JD7/s2p9sHXbBs/yWaZfUxaDrtD8fAfQ4fcrJZM0
         4VVbq1oKYYDFqwCk4A0LIfoYRGBrpiogtCUAOaqSmaYIoJbYgkG5Aa4HCx36j2+drPvU
         4SadLgNUZHD11XX/vFjCXY2LlxgnHP7W1hNxiiB1OU27bXb0vNgBQXgC9ZXnfgbicR0r
         QOfi4WlGal5vLYm+IyN/V4ckeUP+1ax+QJt/qv3JL2LJWi/vfdWDmE14xcHRiIoOGLm6
         HCOA==
X-Gm-Message-State: ACgBeo3XK3Fuu0rjod3d6rBf5d0ZB8kSzdYIu4haS5FtpGAGaUw0CEJZ
	nXbzO20+bYyC76zkvWY68lU=
X-Google-Smtp-Source: AA6agR6rEeZiwwk75IIxtYGnPtBHMCn+4GvuoL7LTtv0PcnQlgqMGE+lBtFD1xCNUcEvDQOVQe3yWw==
X-Received: by 2002:a05:6a00:114f:b0:528:2c7a:634c with SMTP id b15-20020a056a00114f00b005282c7a634cmr53373587pfm.41.1662448810030;
        Tue, 06 Sep 2022 00:20:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id f28-20020a63511c000000b00422c003cf78sm1121918pgb.82.2022.09.06.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:20:09 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: fbarrat@linux.ibm.com
Subject: [PATCH linux-next] ocxl: Remove the unneeded result variable
Date: Tue,  6 Sep 2022 07:20:06 +0000
Message-Id: <20220906072006.337099-1-ye.xingchen@zte.com.cn>
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
Cc: ajd@linux.ibm.com, Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org, npiggin@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value opal_npu_spa_clear_cache() directly instead of storing
it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 arch/powerpc/platforms/powernv/ocxl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 27c936075031..629067781cec 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -478,10 +478,8 @@ EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
 int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
 {
 	struct spa_data *data = (struct spa_data *) platform_data;
-	int rc;
 
-	rc = opal_npu_spa_clear_cache(data->phb_opal_id, data->bdfn, pe_handle);
-	return rc;
+	return opal_npu_spa_clear_cache(data->phb_opal_id, data->bdfn, pe_handle);
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
 
-- 
2.25.1
