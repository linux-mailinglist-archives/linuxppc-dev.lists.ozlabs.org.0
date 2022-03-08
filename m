Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309414D19E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcPd6bXYz3f4g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:59:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hx0IOrvJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hx0IOrvJ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDx2QYsz3bcl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:29 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id n2so7601634plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjswgDAjqtAsUXuv5xBgYvzCGg1cN6o7wtYucTF3CAU=;
 b=hx0IOrvJ0C7gZv9HUWxRBYOTfQ2kprBu0AqO8PSfEATt3X/5byXO/fkttEqynFFYsd
 60D/+Gq0Es6AWg2ga88gTFneqEGgSWApwTDXResuODI404s3StK7x5u3xd+sLMTMmrS9
 rQ4uaLyoemPptd4lvOMzRk92LbCSML28xKLJlCFzuqBcVb6WhOjy8558okWksGjvgYh2
 3aBSj/2Ewx1euzDs6W4NMpsoeLbmSS3SpUJGCPhfDTCJrDNCsJ48GsZvJng+K7EsRb90
 NN0zGLBxIvaqWo7c5UhNHQU2L87+NqfqynT6ic3ZHjOkAfwIWY5QEbyMLYlGkOmjdU9+
 5dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjswgDAjqtAsUXuv5xBgYvzCGg1cN6o7wtYucTF3CAU=;
 b=I6Y5K8Cig20pkDk3U5DmX6QzXSICz0Qjzkn1aZ5O/T6KDjY1RHuD6yfp9mRi9MpNZr
 PajjQhgrBlbHSZARR2mNWgMI9XfYSHdUh3MMS7Hqd5zoO7gdWUT+xNlV8Eg9xyAJ7WtG
 tuoXTvqhTewyJE/EC+jbVHP16vUQ+htvWOV7WkgRrqXm847gUcDerSF9hNIwYQvI83mp
 YpHBAPMjRDafxHz5o+yScdqSIdCxkhDEXhvjrhFoGt7vnPnSwMFBifzEfffZ+w7Qi2R5
 fyWhuLfV9+D3aa7P2jDK/AjP1rt9+EKf6gHgq5Zqp8r50ftLIsNsRrV5plmteiyqBQVd
 OCGw==
X-Gm-Message-State: AOAM532rM2YI4uHom2JXnC1Dym0evbrnBs24nX6pM1CZ3zUl+0KAJKMX
 bYgYHf3vXR1cpKOFfLRFihQf9ezZSxk=
X-Google-Smtp-Source: ABdhPJzLIIVm2zfUCMW4Y2886x1xqCQ/HHRDs8LGvQ3Bmiw2Bkx058Hcgmed6p5eYm7ngYZUi1+cnA==
X-Received: by 2002:a17:902:e54c:b0:151:e2f3:9ee7 with SMTP id
 n12-20020a170902e54c00b00151e2f39ee7mr12019295plf.61.1646747488192; 
 Tue, 08 Mar 2022 05:51:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/14] powerpc/rtas: Close theoretical memory leak
Date: Tue,  8 Mar 2022 23:50:45 +1000
Message-Id: <20220308135047.478297-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If buff_copy allocation failed then there was an error and the errbuf
allocation succeeded, it will not be logged or freed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index e047793cbb80..1fc22138e3ab 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1239,9 +1239,10 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	unlock_rtas(flags);
 
-	if (buff_copy) {
-		if (errbuf)
-			log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);
+	if (errbuf) {
+		log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);
+		kfree(errbuf);
+	} else if (buff_copy) {
 		kfree(buff_copy);
 	}
 
-- 
2.23.0

