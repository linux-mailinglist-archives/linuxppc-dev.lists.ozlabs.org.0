Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 339AD71686F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 18:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVxwD66S4z3fDN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 02:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=T6kwuwNO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=T6kwuwNO;
	dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVxvG0f1lz3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 02:00:40 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-76c5db6a5cfso337535139f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685462436; x=1688054436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zX10SJBU8S1HDBYkbi8trIiB7376uD4rHt1agT0RgVE=;
        b=T6kwuwNOMP7SpNBuj9ulB7wtBDWLgkSuq5HTmKEa5CuYtWLEVwQNJmgxnv+xiuEE0B
         2rku+K4GXdjh+DlwdYc8eirLyEiOPsBAMctGxjT5iHZ04TBMqoKZjNUbSVqLgXtgU/AY
         uIqH6Hz+yPtRarj8PvB6p42hNDUXz2yC3EjsLUjbFZlQKnzw5G7613CyK0oimxB+Llxh
         gVYjawUUecbgmkn74c7SvBAIw6y3w9a25jdxXF4uoJoPSCqI7Mj6TPZObK+XUgqIakYx
         iW8JW9dLDsdAdykEY7ARdusn6bbkgDwmmjvAaoiVj6JqvddlunlIU3PhGJ1THnj1/4bu
         f2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462436; x=1688054436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zX10SJBU8S1HDBYkbi8trIiB7376uD4rHt1agT0RgVE=;
        b=XNKk/kcndFI8AxKCOBzTz4ne/7xWtJYjEHX0jO5H5VHTYgY59JcUNCNBazDNObNRrU
         YQCb3ahbkFhaAIXBxEUF592Hy190xPUTqcSPRjeT6+cKnOLtm001LgbHEpe9gmjAbuLI
         IUXqAb7VE4SC2nWjg6+3qWOB8jA74SwSyZUGvCTprGz+gWdzkCRvjXVPvpNoF1IHiU3W
         4x8ApTqljkgCNSv7TQJU5JBuDv9N1OsmgAO4CsSbq8XOlZi96dSpQOeBuaTjL5zxhgnE
         WSEnvDFyj5wYzhCveklKQOJ9r2oD+tMq1lDIy3D+nOYZ9t+FQoLGrVLfPI+BC+K0eNB8
         OFtg==
X-Gm-Message-State: AC+VfDwsGQFjGNp2s8NQ0IBbAnApTNKda5LHV+xZi8/rEk2LiHCZy9ps
	In87KHnIwHRG1+H4fv2aqbg=
X-Google-Smtp-Source: ACHHUZ4Y7vaByrfhYL39lnBvPFfAEKvFNbSJFnHyf/l553ue3parkMv7sOH7zAptCsOe6CzI2RFFWQ==
X-Received: by 2002:a5e:8914:0:b0:73a:6c7f:c476 with SMTP id k20-20020a5e8914000000b0073a6c7fc476mr2352086ioj.16.1685462436590;
        Tue, 30 May 2023 09:00:36 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id q22-20020a5ea616000000b007767a221ea0sm3238153ioi.11.2023.05.30.09.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 09:00:36 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Qiang Zhao <qiang.zhao@nxp.com>
Subject: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
Date: Tue, 30 May 2023 16:00:33 +0000
Message-ID: <20230530160033.411441-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
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

