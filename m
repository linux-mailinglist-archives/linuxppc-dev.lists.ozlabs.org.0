Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904470D0F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 04:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQHw726SVz3cdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 12:15:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OaujpSZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OaujpSZZ;
	dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQHvF5JzVz3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 12:14:31 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-76c5a225388so109187039f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684808068; x=1687400068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zX10SJBU8S1HDBYkbi8trIiB7376uD4rHt1agT0RgVE=;
        b=OaujpSZZUqwVOx9NEQ6g6toA8bjHdiLSGCHF/k5eKXl3ABo1UGNtVSzhTAX0SAhrbE
         cgx3x15bwXRGHk0+mEh2cffCJ3is4InYof0oCRfm9gT0XYCNJhUQfjzpIy2jthkLRpWM
         eciWFP26qbGuLXO1Uf8zUXuD7HRpsvF5evYPF53lpz4UerC6UOC1F9lTMdeaI5n+EyjI
         v9sQUBd0qgmEdzEd6Mkc6G0G9WXl0LXrI9LSILXFeM7ET6fhdiX33OYpZ4kZlp1IQ5ht
         /oyvczEGS9vnKPLX8VcTgthDs3kdmKuTyRuPnCsCfTrKVKndpPrAS2GOUJHqCQig1F8k
         QFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684808068; x=1687400068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zX10SJBU8S1HDBYkbi8trIiB7376uD4rHt1agT0RgVE=;
        b=VhHh19FdXZCrHFcUc3JbBTXQDegyErQNpzmKiEcARbmsb9YYtDbbU1+8KEjEF8Th5f
         pzVhU98yWqhSLcZZY9q2T8qzFQg82+jNCUWlY/56XJVUuFLzzcBFqfJx76LcwKcEII1G
         p4fpfVDoXkzK7+cxG6i8pjC63WxisWfgiVkTfXQBidjklGF/pryDN8WO6C73hc5qdixl
         nudHUy2WZrezV/BsYHWvekdNw4obrFFvFNibTWW7vCZ58cRamtCkzYbThKmSGuoawQ+t
         cj2vrujN79gCnEts+zMl89AM05QL2Jykuupnbd1FhpfcJcmcVEdU5TAtNM4P+90aKh8w
         Rvgw==
X-Gm-Message-State: AC+VfDyxbM06rWjH2fWyAJBRgEBYiQi1JHX1VkvlA601YPBeua9jczXX
	1RgGU3emUV8j/mV0UFvRjCY=
X-Google-Smtp-Source: ACHHUZ5F/Ce0ACQDapyA4JTnP2JZCUo2WThK1XKG2+ZKLbNVrxkTbmV0t/7CPbKthDMx/RVENWD5nQ==
X-Received: by 2002:a92:de46:0:b0:335:1ed:359b with SMTP id e6-20020a92de46000000b0033501ed359bmr8482325ilr.15.1684808068359;
        Mon, 22 May 2023 19:14:28 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id i1-20020a056638380100b00418647d4279sm2223488jav.69.2023.05.22.19.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 19:14:27 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Qiang Zhao <qiang.zhao@nxp.com>
Subject: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
Date: Tue, 23 May 2023 02:14:25 +0000
Message-ID: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
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
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-hardening@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/soc/fsl/qe/qe.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index b3c226eb5292..58746e570d14 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -524,7 +524,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
 	 * saved microcode information and put in the new.
 	 */
 	memset(&qe_firmware_info, 0, sizeof(qe_firmware_info));
-	strlcpy(qe_firmware_info.id, firmware->id, sizeof(qe_firmware_info.id));
+	strscpy(qe_firmware_info.id, firmware->id, sizeof(qe_firmware_info.id));
 	qe_firmware_info.extended_modes = be64_to_cpu(firmware->extended_modes);
 	memcpy(qe_firmware_info.vtraps, firmware->vtraps,
 		sizeof(firmware->vtraps));
@@ -599,7 +599,7 @@ struct qe_firmware_info *qe_get_firmware_info(void)
 	/* Copy the data into qe_firmware_info*/
 	sprop = of_get_property(fw, "id", NULL);
 	if (sprop)
-		strlcpy(qe_firmware_info.id, sprop,
+		strscpy(qe_firmware_info.id, sprop,
 			sizeof(qe_firmware_info.id));
 
 	of_property_read_u64(fw, "extended-modes",

