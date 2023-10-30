Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F27DC15F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 21:41:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DCZNTtqz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK4tp6dnrz3cVZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 07:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DCZNTtqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=30hrazqskdc0sdbcrwbcrccpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK4sz1WCLz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 07:40:53 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ae5b12227fso51473697b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698698450; x=1699303250; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+L7D0X/8UFbDxxszxyMbdHdPxX3IfKefskLSxNpM7js=;
        b=DCZNTtqzECDkPixlKarZNnIzhBQ8JrqU4TyzYZaaQ2CYGa4OPvI39VyD8yBg2k7frQ
         bW+WUuN7VrnNtl4bDPouDqAnJbY9dA3zYvgQKD+icJLIix3V2OINopEQy6ft60UXAoHN
         kBllAj8cDMN4XCt7NJAm6QbCwxlRblfR2wXc5Qc8M8m+ywN2hDaVxljQOfV81YT6lDfS
         AFArjY2FZF8PxvHSUygHBzwm2wSsxYet9SuW+7eiBJU9C1jpLFaGqXGq6gYn4/6nKp+u
         4rVZZZo+IrWciXYSaq8/9meHoP3wecKwZQdf112uK16A9hPTrOX2Ff2SyuLMrhWIcgqW
         6Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698698450; x=1699303250;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+L7D0X/8UFbDxxszxyMbdHdPxX3IfKefskLSxNpM7js=;
        b=NFMLaKmzfcy7CSKuqY1VyqlPW31ZBiukYXx5h70ceFIREMnNtO1mSK5ITZnXVKcu3n
         /3rRNA4B62RK+DGG23wOoI+hr/Erx2FOnKkUBE290RWdzG2epooL6wvvUDB9P0YzlfQ2
         zwmTb42JxrCRut3t2+j4dtdMSk6jbW+w4rdflgVtfKnJzyAysds2cNelhYXZe/m2SCL5
         p5+HD1BtJkQEdJ5GTfcdWZNFx1CRg+MENMO6Lq9DtqfOejbbY6CRFcmjTWgYYqKm3xu7
         rSrQiM5ubu0XHHUc2//X+Cvju07tWytRoThEsKdBDwSK9/S+aYBR9SaFAiJJyn9h4HY3
         pPvw==
X-Gm-Message-State: AOJu0YwpaI9XhQ5Q3vQnAepLCieZnErXcxRaf0hQCVfXY4Y95eSGUWO+
	4DhEEvIRAwDtQsYNCaf/m/PVII+vnFNqeJ2F8A==
X-Google-Smtp-Source: AGHT+IFMwgpHnQc+ZprATG+9xkN/YQLqGDr23c9NaiAHsaOO+EK9sMO0RJNh4rCFVzgL3jJHRVsodsSz8UC842FQaQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:8494:0:b0:5a8:6162:b69 with SMTP
 id u142-20020a818494000000b005a861620b69mr223809ywf.3.1698698450488; Mon, 30
 Oct 2023 13:40:50 -0700 (PDT)
Date: Mon, 30 Oct 2023 20:40:48 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM8UQGUC/1WNMQ6DMAwAv4I8Y8khYihfQR3AcVsPBGRXERXi7
 43Y2O6WuwNcTMVhaA4wKeq65iqhbYA/U34LaqoOHXUxUCT0r2XefphMi5ijsyvqvJQ7MMa5p/B g6WlKUHObyUv3azU+z/MPq6nGinoAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698698449; l=2516;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=gC2v5Pe9R9loyw+Pgy7T7l7m2TvAbA4wi3ehG1YRi0M=; b=W3M+JdyCyQGlb9fJmaBzQFKyHdjqWqWHavOQpR+qFwi3gIjoNLdwqlFCE5x4QCeRE1qFOjDV/
 sdKApW7tbo9DiqLojPnw03mfZ+Pl1LUprSvDY4g8Uc12B3oz4FkevI6
X-Mailer: b4 0.12.3
Message-ID: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvscsi-c-v1-1-f8b06ae9e3d5@google.com>
Subject: [PATCH] scsi: ibmvscsi: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We expect partition_name to be NUL-terminated based on its usage with
format strings:
|       dev_info(hostdata->dev, "host srp version: %s, "
|                "host partition %s (%d), OS %d, max io %u\n",
|                hostdata->madapter_info.srp_version,
|                hostdata->madapter_info.partition_name,
|                be32_to_cpu(hostdata->madapter_info.partition_number),
|                be32_to_cpu(hostdata->madapter_info.os_type),
|                be32_to_cpu(hostdata->madapter_info.port_max_txu[0]));
...
|       len = snprintf(buf, PAGE_SIZE, "%s\n",
|                hostdata->madapter_info.partition_name);

Moreover, NUL-padding is not required as madapter_info is explicitly
memset to 0:
|       memset(&hostdata->madapter_info, 0x00,
|                       sizeof(hostdata->madapter_info));

Considering the above, a suitable replacement is `strscpy` [2] due to
the fact that it guarantees NUL-termination on the destination buffer
without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 59599299615d..71f3e9563520 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -266,7 +266,7 @@ static void set_adapter_info(struct ibmvscsi_host_data *hostdata)
 	dev_info(hostdata->dev, "SRP_VERSION: %s\n", SRP_VERSION);
 	strcpy(hostdata->madapter_info.srp_version, SRP_VERSION);
 
-	strncpy(hostdata->madapter_info.partition_name, partition_name,
+	strscpy(hostdata->madapter_info.partition_name, partition_name,
 			sizeof(hostdata->madapter_info.partition_name));
 
 	hostdata->madapter_info.partition_number =

---
base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
change-id: 20231030-strncpy-drivers-scsi-ibmvscsi-ibmvscsi-c-3b5019ce50ad

Best regards,
--
Justin Stitt <justinstitt@google.com>

