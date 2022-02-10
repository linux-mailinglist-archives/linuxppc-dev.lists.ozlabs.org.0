Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53654B16F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvpKY2Mh0z3cmp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:30:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IxkmG76b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IxkmG76b; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvpGs4nVcz3bW9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 07:28:20 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id o9so4826805ljq.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 12:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+PCp8VzJ36gwuUuZGOgQHhyJLFNLNE5NPa+Wd4bAXE=;
 b=IxkmG76bFLc42upQAfX2viuaO+Zvq3ggpHoSw+8vGvIebuVzIO6ZrfDobBHGTLCz/0
 XxSVDXbvnnPdX3AHIcnKxds+3eXeP98U5QwwlsvBgxzCuJ3xghhmj7P86XOeZInnm2kW
 67PWvKh7LRd5qrbmweNMQYdV0+luLt0NEUzLnF4niDSeBadknLCZ3GpsON+l75M/58Ht
 1yRKzdRE4XmQETPnFD8jjo594ks3Xl9ftEIqDM1GTyhEjB5nDjZPonp4G0gEFFV0ydNM
 eINwZkxY/ZrWyOHBSgTUWbnOkBoGzuezMESL9NHSo+GuU/Akj2EKuJo32/wyI1sFGeR2
 Jfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+PCp8VzJ36gwuUuZGOgQHhyJLFNLNE5NPa+Wd4bAXE=;
 b=pvhAK8ng9tNijX0BBK+g7RuJ5hfxhc+LcjJ3kDJvwX9wjwW5ssjjZb40E5x/R7MJLv
 96K41SV9SBSysEf8aCMN1WMl6sI995qNSVOHR+EhnZkTqHQt81pjRM/+Yf7mVvYIxnu6
 Enw207JgOOncC256uxxiQy4mReIOIKl6X6yl0YWYCV0yk1/b5b7v2dkEA/YC4mJbcFt7
 KQECudycSn7Y+88nrICRzJXV9EF+zQJzf2q8LM1/mpRCaSHEzX/gY/JnAaow6kPhwhFp
 zetfLyH+8anKhBxrtep2lDujSHZgyAUY2GfRB/7sKpO7LTfY+q2N+YSBkQyYrqAR80pB
 Mq4Q==
X-Gm-Message-State: AOAM530C4ObboJrBgBDiQw0B4+GXKn8eOE1QtKONltzMEuyMuoBVWXyx
 J71kYtvyBAr8h2gp81/jBU4pWkV1qzo=
X-Google-Smtp-Source: ABdhPJxnkMhH+WCNQmT2YfTiDN+Fw9oTWgT0Xe73gy81YT+zJxyQZKdlb9nW6RBG26W2nxeMV9nUfQ==
X-Received: by 2002:a2e:bc20:: with SMTP id b32mr5976744ljf.214.1644524896908; 
 Thu, 10 Feb 2022 12:28:16 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d19sm1223881lfg.108.2022.02.10.12.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 12:28:16 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 3/3] crypto/nx: Constify static attribute_group structs
Date: Thu, 10 Feb 2022 21:28:05 +0100
Message-Id: <20220210202805.7750-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
References: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only usage of these is to pass their address to
sysfs_{create,remove}_group(), which takes pointers to const struct
attribute_group. Make them const to allow the compiler to put them in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 4e304f6081e4..7584a34ba88c 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -962,7 +962,7 @@ static struct attribute *nx842_sysfs_entries[] = {
 	NULL,
 };
 
-static struct attribute_group nx842_attribute_group = {
+static const struct attribute_group nx842_attribute_group = {
 	.name = NULL,		/* put in device directory */
 	.attrs = nx842_sysfs_entries,
 };
@@ -992,7 +992,7 @@ static struct attribute *nxcop_caps_sysfs_entries[] = {
 	NULL,
 };
 
-static struct attribute_group nxcop_caps_attr_group = {
+static const struct attribute_group nxcop_caps_attr_group = {
 	.name	=	"nx_gzip_caps",
 	.attrs	=	nxcop_caps_sysfs_entries,
 };
-- 
2.35.1

