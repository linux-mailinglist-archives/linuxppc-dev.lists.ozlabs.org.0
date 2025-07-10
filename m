Return-Path: <linuxppc-dev+bounces-10170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005DAFFAC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 09:24:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd5vG1Zk1z30VV;
	Thu, 10 Jul 2025 17:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752131915;
	cv=none; b=O27eE1UXqZV9tb/U2Z3f7qyall90VrbQzxTdIy3spf9EXTvgqzlYHwzng1/mHyzyOZdfqRQ6mDV0sqCOpEFcAFKS8/gHL36TgtdOmtCGRmk0RWLMDZCAn5Iw3Dfhiv/fAQMSQd5p4xmYOIGtoXGNJb/WSNQNFZF1EWMRvDKxl1mwunqikaSAzI7S/W2YJBpj8RpqcDA53pN43llqYr9xfCI1CHffCKbmZ19EyT/NAfzppQDyAcuzEklTuEPmlEZjH6h+LcRIQmIn550SELue+ZR3Y86zIFzhv8r6wHOMvMe6wvBBw+iS6rv8qEngM7mB/4Q3Ae1vLabK7PQ8haccwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752131915; c=relaxed/relaxed;
	bh=6g1IiPrFyHwJRTaDBspibWxL1+SD9wnK3iKsVFGEiqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbJ4o5QB8dQFgWN5lTVXWg5i70pct0oSiw+YLDesNgS3UgRl+DVFu07uadGVk47h/5wRHCNcR0T2vZ/pjy2LDwUwfciGqxmw2i7/z5h0s8YMPI3qXUVT2c2epajFz3msUZj4OsxkQeKf/SwQY6jfVyZ0al5xq4VDo4DqNHUZbGEWSqiOyt5pWrdFoVLqN5LbMJ+RJUKNSbMaDK26FabTAQx7y5u8yXYwQFkLEBoTqAw8BU6wdwS1nwCf0KkdYCaTt1v1Ecnrc8UMOc3TtOobvDT3vXePRFexsnudftPtUb8mDqYNczP/cfRs9kt4mKXD7dVpoMlfEqeSLrsIEIInMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hnWjwX6x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=seokwoo.chung130@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hnWjwX6x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=seokwoo.chung130@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd5mV0rtVz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 17:18:33 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23c8a505177so6606915ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752131909; x=1752736709; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6g1IiPrFyHwJRTaDBspibWxL1+SD9wnK3iKsVFGEiqY=;
        b=hnWjwX6xL1MeXzYr+xFNB3hEOxFmy8CFEXcxERppWBA6PZmVWiWSeoDKqPy+bGZBck
         4N6Z/jnCr0OVXgNvWqGfU0VVFvYLXbhLQ8/oDqPNsKdD6YWF0fFYexzSYMxeFPB48dq0
         slSTtgdreyLzG3hfI/BCktWopiW6OTJQ04SFcMqhyb2d3/92LCLPJsJwaTysVtRZjlL+
         USnhYvRl1Sy9RR3mfd1e/dn39tk5H6driGb0lD4F/cLiMfV4AbOpofth7sMFdSDyC+6Z
         wW/XRzfVcCYnuRgKJtPijHBX55dfO5zpn0EFwb1j1QaNIeTKTH0LVYFxEE5sHNtkg7GH
         EqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752131909; x=1752736709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g1IiPrFyHwJRTaDBspibWxL1+SD9wnK3iKsVFGEiqY=;
        b=ipMRPNLr6uZtXtixY4/Rv46dBIoyOJWJjvWF94rlvxs+tVJevkxY9joAsmZWq1mr7V
         1X2XVR/Zwo0SeeiZobpn1OlD1EqYpQksbglTkYR89lOWFWpSpC1mKBdtQBgklV3mBDqu
         4ntJ5GT1oSaXsn2qNPaJUxqck+Vax62ZNqW9wn3Uk8CKETKt2vlIV6q1PUItj4iLLjiq
         dPmzo7911GVItF+TjfkLjQMfzVI1Zv0166P2j323U6BSOrfVNVfE2h5FzlM39nH33JY7
         FWXfQffb9O+inXgEX+P1OKenxZhj3SpiTfOyzYIV/fx5yn7oT0c9mxBKT7tK3LKx9PF1
         Zo+w==
X-Gm-Message-State: AOJu0YzLUw9gs6UN86HI09qREgRwpDJXh2zqwGQe1V6R4GiZWAtb3z+l
	SOkr+NcgNKBPMoKJhW63fSEQdZ03t37Mt3t9mopG26Sos5ygHG32OsqZ
X-Gm-Gg: ASbGnctldLBw97lX9TNnxWZyxoL3MJT0QH1X23F8cG1XfboloT3p4FBDyurCMmdaTnZ
	rBXLHNdTn2ukcQk84FCzlyq6qu8UbzjnjzM2hPEk4Wkwh/HT8IxF1mYL5//He0cH3bq5ANs2fbf
	fqljp0+XEeWLTHDvXJm3efVu4Us6oia5eBOeRwUZ02xtfUMwEWFezdTDg4Eq2vz83RU7vWGoFN2
	fLPc5Jv7/+w3KJjq7bkktAnaR52eXeoebWh8hKGgFAglf2T4mw+ybujTe2K7P1NIavcxwuCruo+
	e8m+AZwzsiUTs8Z+zz621Cg9yyMjDl0MU4oMbUhFnNBsNujzq+bM1/0fdHhiDT+F95t0AmCkMHg
	5NmaPQuvE
X-Google-Smtp-Source: AGHT+IFVGyOnm1nwsQ+ze1erHvM2Rxv0pNSLgjOlw0v0EXpaUJJf5eUudFsAasW06wcKg1niVA8W2A==
X-Received: by 2002:a17:902:ef07:b0:235:ef79:2997 with SMTP id d9443c01a7336-23de2510c87mr46529115ad.47.1752131908813;
        Thu, 10 Jul 2025 00:18:28 -0700 (PDT)
Received: from localhost.localdomain ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb45c7csm1331530a91.25.2025.07.10.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:18:28 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH] ocxl: sysfs.c: Replace scnprintf() with sysfs_emit()
Date: Thu, 10 Jul 2025 16:18:15 +0900
Message-ID: <20250710071815.351069-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This change uses sysfs_emit() API usage for sysfs 'show'
functions as recommended from Documentation/filesystems/sysfs.rst.
Intended for safety and consistency.

No functional change intended.

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/misc/ocxl/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index e849641687a0..f194c159a778 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -16,7 +16,7 @@ static ssize_t global_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.global_mmio_size);
 }
 
@@ -26,7 +26,7 @@ static ssize_t pp_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.pp_mmio_stride);
 }
 
@@ -36,7 +36,7 @@ static ssize_t afu_version_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%hhu:%hhu\n",
+	return sysfs_emit(buf, "%hhu:%hhu\n",
 			afu->config.version_major,
 			afu->config.version_minor);
 }
@@ -47,7 +47,7 @@ static ssize_t contexts_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d/%d\n",
+	return sysfs_emit(buf, "%d/%d\n",
 			afu->pasid_count, afu->pasid_max);
 }
 
@@ -61,9 +61,9 @@ static ssize_t reload_on_reset_show(struct device *device,
 	int val;
 
 	if (ocxl_config_get_reset_reload(pci_dev, &val))
-		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
+		return sysfs_emit(buf, "unavailable\n");
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t reload_on_reset_store(struct device *device,
-- 
2.43.0


