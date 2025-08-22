Return-Path: <linuxppc-dev+bounces-11188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C847FB31AFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:15:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7hzw2FsLz3cgN;
	Sat, 23 Aug 2025 00:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755866634;
	cv=none; b=PEbtFDl85rrNAGd7vUiItq9Egds+JQsknKXJFbxTatBoQdyTT1zYradJBzx7Q0mi2ajcnqd7WM3Go2WvIvFHDI+HfeutJpXh++bIdVPY6VoZ+mdA97WasuuXQQoTcrgdyE+l9eX5tTtzCezt6P+ocYObUVaL/3nEmG3xUxnpkc+/4nOFDQprdc+0RuHmSxOC4YbIvvC2qf+Ad+ewWvQkrYZtPX3RKTfi/p2edgLc3uevw7GLynOwwNOdnMo+Vilwa7NrmAoQBBX8QLWrwEXWo69Ckbbu5YWbc9ufICn1E4cFom/3lnpVlPfUI2TiF4rBLgU7k/Ibknu7iEHlxqT4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755866634; c=relaxed/relaxed;
	bh=7esMtEw5QVw4oYW1X3ekJKoKg/sSv7ATs4TS+GU7jZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0YQIYVTvjFetG72d2zqOEvRHTA4ETtxQIhPpeJ5rkVYQSYIhzoxRizjyu96CEWRItrZW5oMDcLwWBWD7jraV/LOmJdSMdihg463Wp37IupYn0BQYRozrqw2v48HWd2PXiRJUKc3rSWoto0esIveALNXe3/EPZQPNzUyDmVrhJyLt052ADncdNj18wRU6zr7t87DhWtoVEd4qw49fggRrtNuzP292VUHgxGb8j63z1/K5SBM+AbNpdNYBNHw5ODnjN+6wH3qMQ2MXGwFIc+OUZbARTaPAkq+b0RPjSLa4esgMzVJEFizmJW/DthIgPZqZwSj1pN9AvgfVvhAkQTc+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nZM002A5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nZM002A5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7fy163KNz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 22:43:52 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-70d9f5bdeb4so2594756d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755866630; x=1756471430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7esMtEw5QVw4oYW1X3ekJKoKg/sSv7ATs4TS+GU7jZk=;
        b=nZM002A5lmjwcCj7/opcKgVzWPqPvQPKsDU2T6qZ9w2uCnPXnD5dI6Af/L62v39JpH
         wcFtMPoo/7p1Z+cSwGPgZGGFqKCdQtztMS0L/Pc7TCZMWys36TXUZ5hgmIERlaSfnDuH
         kQVaDPGpg0Bb0zEyK4n64+7Nj++qGtInZuVYh+be1tEkqCXekktKyBe3IGwc1TNlHciz
         byTnm4kJ61Yl1byQ0PAgXlB+LA6D+0B8abUf8lhCs/NSJLTp95csVvaS3UmFTN6Oir3m
         d3DHWy4g4ScE2ukx7aGoXIiDxH84jbTyzpbloUhLS7ab87b/vcdaUxTHDssra15AyeL2
         f21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755866630; x=1756471430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7esMtEw5QVw4oYW1X3ekJKoKg/sSv7ATs4TS+GU7jZk=;
        b=J5tL+5tktXld+lRm9u6gjp5L8V9K66FT2ZrtqtSe/oARcMoZsF79KaXpfYn/ulcBcw
         Fj/Ch8m5sd3C/ugjJCcfi8iBI/Tkm8tE0lOl+ORvX/RiB89qq/lnYxjWvJE54YUHwcg9
         3YyOMMmM0I+NAEz4ziOa4+ntEwe+cxjSHCkNyoliFORsBWGS633MEKflWuR3b3cNjykH
         anXt1/91EKcDu7bOiD+NB59Iv+gCtxuM1ndLLqoF9o4Lto0Yx5lYErtRkqiUnDDuraAE
         yUg6NmeFQFhawM5ScCZacWzOdWZ8A9No8PwAUlrOQzfGH+slAcGKCgDFNkd7NNHJhAPN
         Ar7w==
X-Gm-Message-State: AOJu0Yz+VvLWBXZD5dxOHitwdD0as+YwhCMfoBQX0tEEkmH32gPTREss
	obSKSgSmhJqk5O0aGErnqC8Ld6UeBtj//T1ibdfkX4/yXLvRzP+Q4ktBiUpR2cXj
X-Gm-Gg: ASbGnctvXqxNDREBL4tL/6zhO6E18BzYvPFccKMDT/Hg3scrFl3U2P7QEkIy1+zMYTP
	S/eqBi1M4L+FvMWRS+d7W0lU6XHAzh04Yb/7x55Bw5Uy2MkZOBSYeKEjt0Ml7Ith0569yyWmlMX
	NBm4rbx8L8Cwf6vF4NtRP7RRwH3fUhByA95Y81f6G/ERkTbosDF98T3GFqDfjL6+as6ShpmM3/B
	brH8cxnayx0dKyD8A/BYU7f5cY3Tk+9VA91NxmPuz+wU39wfYQVP9qsa3IRF7ekEVK77wrxlWHh
	U//AkEBO3xCU2xvlA7qMNHmv4IrcLip7/ATMNOYWiGTQUXMgxx2vC3xbI0iCAq2yvqmzhB0oq3J
	ZL970Hf4ZOMwk/WJgIgFtYGpbE0yuJdrIMSZ1IfyjtkPUJkKEraGouDP2UvtclE4D7czG
X-Google-Smtp-Source: AGHT+IFJvlSZLb/tgAdd91q76LLVRKtl204DpHq7u7KDDoCyrwGkQzx2iwb0ZjfCczYufx70JcLscA==
X-Received: by 2002:a05:6214:4c02:b0:70d:9819:8788 with SMTP id 6a1803df08f44-70d98198c37mr17724006d6.22.1755866630054;
        Fri, 22 Aug 2025 05:43:50 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba90b8dc7sm124756186d6.30.2025.08.22.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:43:49 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] bus: fsl-mc: Replace snprintf and sprintf with sysfs_emit in sysfs show functions
Date: Fri, 22 Aug 2025 05:43:39 -0700
Message-ID: <20250822124339.1739290-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Use sysfs_emit() instead of snprintf()/sprintf()  when writing
to sysfs buffers, as recommended by the kernel documentation.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2: 
 - replace sprintf() with sysfs_emit() in modalias_show()
 - change commit msg to include the change for sprintf

 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index c1c0a4759c7e..88fea34a55b9 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -176,8 +176,8 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 
-	return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
-		       mc_dev->obj_desc.type);
+	return sysfs_emit(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
+			mc_dev->obj_desc.type);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -203,7 +203,7 @@ static ssize_t driver_override_show(struct device *dev,
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
+	return sysfs_emit(buf, "%s\n", mc_dev->driver_override);
 }
 static DEVICE_ATTR_RW(driver_override);
 
-- 
2.47.3


