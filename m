Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F349D87CA90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 10:18:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LA77ZfFa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwzF85RCxz3vYp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 20:18:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LA77ZfFa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwzDR21rwz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 20:17:41 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-414008713beso2458195e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710494256; x=1711099056; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c268dTB1nt4ioX1PYxDiUB6jGnxnnZc8CAJCFV2Kn4k=;
        b=LA77ZfFaIDfQbpATQP4+jAQkrCe9MpFJpzUxOVedgsIgDb/Pb3rtIpQv2Z3IuUKtnW
         GmYlAIDvng42T+PUDXGr4uSYw3O4gF/eh9NZQwqMDvcBwyTIMGNOH4SOkUrxGlOugfcf
         jImpJv9cozlmPL5EpWbR/gFog9KR0wExVy1XZRTvyU23n9SvM+PdZx1mUnXazkDXhuz+
         7Iax/QI4taSaaWYckSMlblY+4st+/Xjjs6D9g0nyYtS5mMtf7HRbOiDwUXGRVbLtjgEy
         nPgN3v+pCop4B1XABf7deZFOnTJc3svm+KwihMpGdIPD6oLXcfWBC6p9boNyo7TkQhHj
         QJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710494256; x=1711099056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c268dTB1nt4ioX1PYxDiUB6jGnxnnZc8CAJCFV2Kn4k=;
        b=sEKLXWM9ZdChy/D2kH+7y884F4UicDOVG7dX5KRigfym7BhLWlxunBSKmVF2fO+Wk6
         er5r3xc2LQIGk02B9rm5gl8tNXJxCV8+/hPi0VtvIa4Ub0K6RSx1dCHu3oYwx5WY8XJw
         7+JbsOnGsdgvddGkBgh8A3PLazpCeflx/lwl3+U0Dq2fcx5i4OfPg7X35LfbOnGMfnQ0
         wJmLeezw02Pl2R6/PLvvMqVwvIqCtzzFqtX8IGdUJ25PS/zV9NvpKXB+e/eZLFebaWQB
         61di2CYbnaNAZHcFUrrqxKBbeaXY763Fdi0fBSvAd7p4B7rdZkN/RzHR8w3+gwYHm2Tb
         km6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEthVfXLJeRUXzZbsa1VgIvSpk0ccxomgkwBXvpfngiLpNdJchZSiUBZvrrKv/3OdKdW7BYxeY0UvWopdcXyg5t9OHtYJPSp+IyK8wTw==
X-Gm-Message-State: AOJu0YwWWth80yccZE4g35SVk8zNtXusXSkzz4yBmSkqDJTkDz4qDyXX
	8yJCXNsaKFg8+w28d3ijxbuyjUAM/OoTYLd8H9XF8F8EphS6QccV
X-Google-Smtp-Source: AGHT+IENWATxNF4oDreVWvt1hXlDdhhoO+9WNqt74/Tv6ejfOOWqm9MJnvUPCll3CHbAqVXALh2GHw==
X-Received: by 2002:a05:600c:3f90:b0:413:fff2:a7d1 with SMTP id fs16-20020a05600c3f9000b00413fff2a7d1mr1050979wmb.29.1710494255707;
        Fri, 15 Mar 2024 02:17:35 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bd7-20020a05600c1f0700b00413f3ca39easm4262167wmb.5.2024.03.15.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:17:35 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org
Subject: [PATCH][next] tty: hvc: Remove second semicolon
Date: Fri, 15 Mar 2024 09:17:34 +0000
Message-Id: <20240315091734.2430416-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a statement with two semicolons. Remove the second one, it
is redundant.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/tty/hvc/hvc_xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 0e497501f8e3..388a71afd6ef 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -558,7 +558,7 @@ static void xencons_backend_changed(struct xenbus_device *dev,
 			break;
 		fallthrough;	/* Missed the backend's CLOSING state */
 	case XenbusStateClosing: {
-		struct xencons_info *info = dev_get_drvdata(&dev->dev);;
+		struct xencons_info *info = dev_get_drvdata(&dev->dev);
 
 		/*
 		 * Don't tear down the evtchn and grant ref before the other
-- 
2.39.2

