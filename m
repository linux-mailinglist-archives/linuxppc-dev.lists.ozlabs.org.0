Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8181AE21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 05:48:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KU/z8HPw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwdH36WmXz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 15:48:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KU/z8HPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=haokexin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwdCw3W3Rz3cRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 15:45:48 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-67f5c0be04cso2389416d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 20:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703133945; x=1703738745; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDbvXqjKpu9jOEJyZCSpkgRzMyYzFDZk80pdFn2FvQ0=;
        b=KU/z8HPweP0UD6sWs+vErMbu1v2ECw2iShZ5lS+AqC1lb+TgkFhyc+P7GdcKF4OaPf
         ebwXukbBAw3V66zUNc1lxMZJ3Vm6Rg9qCym9eR8uT7cbBmobMINAecS8zrsFamd0eUC0
         QBljiQA8zS9mGImsqliZVc+4m4h4wJeAS1sFcpSt29n+LEhD1Bgbn6cevLIEKk6VgpE8
         zhT4/1NNsCg2pR2YdcS6ASjfY6G/IkYDh8xGWcU7DViLJWMDg2CJXWKFIKp0XyhsVq5k
         KZjma4VB3D7XqaGzoKF+wOq63L97SDnGBIOK4Jo5Tnn5LhvkY6gE/BJ/JCHvv568lVLm
         Z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703133945; x=1703738745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDbvXqjKpu9jOEJyZCSpkgRzMyYzFDZk80pdFn2FvQ0=;
        b=E7RdxvnRkW9o9iVpbgu8jhZ9qyIapFhRDEwomDO8fC4guJkqYXHKwCgoob+NTSl72E
         g+obb5sm/Q6ErssN+w2LH/9r91lIKc5rOCao/g/dxyMc+wG74xGrdnAN5lJp+pY4Kr6k
         otxZz21AzdCGMSGJl/MVDsmYLBOpe3hB8pmuive79ipaqAnfcrJ0/A5ZtI+azCxbfnWH
         /flkI235EIP4dOSEijBkbMOm9bvzlay/nJDhvsUPW73NPlLLb8y/Xgl32wYgs8HNaV+Q
         4pn37dDUSZisqvQ387eoxmtlIEfv+fTz7XT3BacbNb99ywQ2/ziY7k+G0waWbmnzzRub
         R0bg==
X-Gm-Message-State: AOJu0Yxv730r0lI9qTgXbf3SStr2pz5r2CYVZan5F6Vg/wyTSuNSCGgm
	7X+6LASb0VeCu50XUz7v+v8=
X-Google-Smtp-Source: AGHT+IFINFJHWis+uHctWMcmPOO+C0/kRDSgnSS6JisZOvvJwl2MAYZozqB4C5bCboK+A4/MG7GMCA==
X-Received: by 2002:a05:6214:48c:b0:67f:4bd6:ccdd with SMTP id pt12-20020a056214048c00b0067f4bd6ccddmr7418503qvb.64.1703133945355;
        Wed, 20 Dec 2023 20:45:45 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id ct15-20020a056214178f00b0067f3f3d8e8asm374459qvb.111.2023.12.20.20.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 20:45:44 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc: ps3: Add missing set_freezable() for ps3_probe_thread()
Date: Thu, 21 Dec 2023 12:45:10 +0800
Message-Id: <20231221044510.1802429-4-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221044510.1802429-1-haokexin@gmail.com>
References: <20231221044510.1802429-1-haokexin@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Geoff Levand <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Pavel Machek <pavel@ucw.cz>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel thread function ps3_probe_thread() invokes the try_to_freeze()
in its loop. But all the kernel threads are non-freezable by default.
So if we want to make a kernel thread to be freezable, we have to invoke
set_freezable() explicitly.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/powerpc/platforms/ps3/device-init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index e87360a0fb40..878bc160246e 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -827,6 +827,7 @@ static int ps3_probe_thread(void *data)
 	if (res)
 		goto fail_free_irq;
 
+	set_freezable();
 	/* Loop here processing the requested notification events. */
 	do {
 		try_to_freeze();
-- 
2.39.2

