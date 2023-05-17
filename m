Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC12707589
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7ML14w9z3fLZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:39:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f7UYkofN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f7UYkofN;
	dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLwbc5Kbgz3fBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 00:34:20 +1000 (AEST)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-76c791e2d8dso63943739f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684334057; x=1686926057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xg5+64VwYu4jgIPdssL1KkUeDoxI9Z+GcnNgZYWkm3Q=;
        b=f7UYkofNs9JL4XDKdmmVxJ/FcOm5c66Vjo4sEzVNJyE+QNiDrsJAcOsggp0ry46ks5
         pC0ZEl/aJVWXPMDYYIqTgRkVW0CTWqrQ+m47hPfjJD1sUHnOkYcjJwInI9r2Cas5bwyk
         Aua+3xLxe0y93uSylEtAyy/SQCrXy3pu8EjWDQLqjDH9ZJfndfVuKp+AQ+2x+hmDX3CZ
         UqukqOATp6ip9bYcd7D94O/5mcfgeoZikKSahbzqvqYo9ZVI9AXlQw01Vs9ecDPagjDm
         ObObYN+/r8lDfrV7UZMd/9qWJEzIjlXTqJxInZK04mizR0Mt3KHXnwbWEZtG/Z7iSvnn
         hyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334057; x=1686926057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg5+64VwYu4jgIPdssL1KkUeDoxI9Z+GcnNgZYWkm3Q=;
        b=V/+lf3YmtuzwZo1nWQeoLuYHQ1BTWchZqLq+Cs31rRk65PkFEikUN65VINe/zazXTh
         Zarxej41Mlunsu5LAMZCPSGeSap27Cdy+YxjGP5+mA2nOS3qr+FS/bRvXP/bamSR49Fn
         bk/AekCZJWY+IT+dtT2wK3+vRoxqhF8NSOzsx+R+tYrqkd1NbVivlLOB6DOaGymC9vDB
         aSBQt34SBVy2sZKIPJT70WMifz0Rgf7R2Zfav9wtd7RIvJV4pfgaucgW72kPvFG1g0ts
         SJRtPKtqXygDktjAQZUOJJnaUkj/bw8LcSrFJCafqnVwopfeg1E1E6CLY46HCqGB+Ynd
         ueng==
X-Gm-Message-State: AC+VfDzMaSHy3znZkLOPzNdYZARID116h4aNieUpEy5U+MwL4NhEABfn
	ttwlC5ehEBTOXWntbufhLu4=
X-Google-Smtp-Source: ACHHUZ6/nzU7Vyvyb5FH1f/FdNchYPWuX2uGRdwnvozU3JU2C4g5sXFhidMNl8Ac9liRJBzkXOCIgg==
X-Received: by 2002:a6b:e910:0:b0:763:5cf8:65eb with SMTP id u16-20020a6be910000000b007635cf865ebmr4854888iof.9.1684334057611;
        Wed, 17 May 2023 07:34:17 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id n16-20020a027150000000b0040fa0f43777sm8491190jaf.161.2023.05.17.07.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:34:17 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH] scsi: ibmvscsi: Replace all non-returning strlcpy with strscpy
Date: Wed, 17 May 2023 14:34:09 +0000
Message-ID: <20230517143409.1520298-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 May 2023 08:37:55 +1000
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Azeem Shaikh <azeemshaikh38@gmail.com>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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
 drivers/scsi/ibmvscsi/ibmvscsi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 63f32f843e75..59599299615d 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -250,7 +250,7 @@ static void gather_partition_info(void)
 
 	ppartition_name = of_get_property(of_root, "ibm,partition-name", NULL);
 	if (ppartition_name)
-		strlcpy(partition_name, ppartition_name,
+		strscpy(partition_name, ppartition_name,
 				sizeof(partition_name));
 	p_number_ptr = of_get_property(of_root, "ibm,partition-no", NULL);
 	if (p_number_ptr)
@@ -1282,12 +1282,12 @@ static void send_mad_capabilities(struct ibmvscsi_host_data *hostdata)
 	if (hostdata->client_migrated)
 		hostdata->caps.flags |= cpu_to_be32(CLIENT_MIGRATED);
 
-	strlcpy(hostdata->caps.name, dev_name(&hostdata->host->shost_gendev),
+	strscpy(hostdata->caps.name, dev_name(&hostdata->host->shost_gendev),
 		sizeof(hostdata->caps.name));
 
 	location = of_get_property(of_node, "ibm,loc-code", NULL);
 	location = location ? location : dev_name(hostdata->dev);
-	strlcpy(hostdata->caps.loc, location, sizeof(hostdata->caps.loc));
+	strscpy(hostdata->caps.loc, location, sizeof(hostdata->caps.loc));
 
 	req->common.type = cpu_to_be32(VIOSRP_CAPABILITIES_TYPE);
 	req->buffer = cpu_to_be64(hostdata->caps_addr);

