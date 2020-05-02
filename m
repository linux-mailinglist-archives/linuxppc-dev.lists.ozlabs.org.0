Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EA1C24CC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:46:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnPk4dfLzDrQg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:46:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hzSFxZm6; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqn4XL4zDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:05 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w3so4689368plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFIEcWv4OxwP8HNyyHauKSUTNIdHQYF4oqYOfWG+scQ=;
 b=hzSFxZm6Ct+Sy2xteiKoQBwzPYGaiEfaPEkPOBy2zDCnFXOLESLYS3z6XbK37Z6Zbk
 PpW7Dt2ESfXv3BGI+jHttEFFfAEFZfaaRWu9u5vd4t+6z/06FRqUpriIKW+2hXkD5mcD
 AObQAErGOBzSvMzrS713zAOgqWISQpySfiyU/x5LSMt3u+kMRO8IbcfiLiFcj9m8GjvB
 cDoobtWiZYhkeb5YG+hvA3XgNyLVlmS6RzQ13N1G1H806BdIETwKa27O4h4drqLrmCDH
 6NEwENLuzsUQrwf5Q0Jrpxe7+PzHrcMVeQnV9fewfNFUgFRqrvkDczoiYb3QWQSHSwe4
 wg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFIEcWv4OxwP8HNyyHauKSUTNIdHQYF4oqYOfWG+scQ=;
 b=k10YWOVe5Z2W1Qofo40qv/40q4+yDlx14CrC1IOiHTnUhdmrmF6uNHOdWS9lczo6P6
 8S/0I82m89sA92AikpirjboMbcvZf2mF5fgJAgYok852x03PuT5mp6VN5vIlz14e0C+V
 CZC60eCpTXYJFiXg1VqKLY0H85YDz8YYpTMptoGc1obchovhmOx8ie8rJEi7xHm/MNm+
 d70ONT8gcymiNGqMJUiobXkTmCj9xzyZVXMONj73hPyQU+RayUAL4Vp/oTfJTXM+C5wd
 bsso5jb1h9Ot8+UFkj8m+AF4dEt2M/H2jmu1bn3LjcHm9HfZIUXSUHQS6kOGAOvu7+Kr
 eG2g==
X-Gm-Message-State: AGi0PuYg4UoJsR3b4TgsRSE7AQLIEhZPGUJwX5EArW3qc+P9a3wcpbGD
 nYvOS9N1GPb363GHJDgwbugxZeKG
X-Google-Smtp-Source: APiQypI5Nc3qcM8cQ9+9T11cs+xUkSDojnqyTRTdEyHrVFLmdyS9dXk4REqfIlvReWcj09qpc9LKHQ==
X-Received: by 2002:a17:90a:2450:: with SMTP id
 h74mr5192031pje.57.1588418402153; 
 Sat, 02 May 2020 04:20:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 04/10] powerpc/powernv: avoid polling in opal_get_chars
Date: Sat,  2 May 2020 21:19:08 +1000
Message-Id: <20200502111914.166578-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OPAL console IO should avoid locks and complexity where possible, to
maximise the chance of it working if there are crashes or bugs. This
poll is not necessary, opal_console_read can handle no input.

In a future patch, Linux will provide a console service to OPAL via the
OPAL console, so it must avoid using any other OPAL calls in this path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 1bf2e0b31ecf..e8eba210a92d 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -467,13 +467,10 @@ static int __init opal_message_init(struct device_node *opal_node)
 int opal_get_chars(uint32_t vtermno, char *buf, int count)
 {
 	s64 rc;
-	__be64 evt, len;
+	__be64 len;
 
 	if (!opal.entry)
 		return -ENODEV;
-	opal_poll_events(&evt);
-	if ((be64_to_cpu(evt) & OPAL_EVENT_CONSOLE_INPUT) == 0)
-		return 0;
 	len = cpu_to_be64(count);
 	rc = opal_console_read(vtermno, &len, buf);
 	if (rc == OPAL_SUCCESS)
-- 
2.23.0

