Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70BE81AE1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 05:47:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=chqOL0hp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwdFJ1Pr2z3cYy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 15:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=chqOL0hp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=haokexin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwdCf1DB8z2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 15:45:33 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67aa9a99915so2632786d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 20:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703133931; x=1703738731; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfbvY8xgC0H67/Jam3SB2bIz3SE7rqOaVsdN0L229MM=;
        b=chqOL0hpzCGzVvxAo/b0gjWFVCMRD6h6tlMbS7IBVnZHP4IaFcn2qeD4q3bS8vsxpS
         cnIs7QiL/6334CYrqY5MLp1jIqszBLvJSzxM3CtyyH/nzwGWEhB3HZbnCAqZASBSRGjj
         UkS4sxMFmwxDXhTE5M6Sv/TIzkLd1vnMpUhf40jIrjnOtIruCgYf1lL4bvIR2DYv85Y6
         fZtnCcaLxknceYb1c43DjnWjRpxwSNtW7bClSq58W16u7y+LB+9L91623Z93BMHM0hMx
         k8XY+b2Z2wsg0AOV13KzDEaiMBUth4FBujRcsA7S5CzTK82o964J7NbSmmjlt0Cr59ZO
         GCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703133931; x=1703738731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfbvY8xgC0H67/Jam3SB2bIz3SE7rqOaVsdN0L229MM=;
        b=IuPLbd2hbdVwRRjpykYCzbS2LUiFXhud7hZO50/YEDpogVvlW3OuSypTS9dwwHh9NT
         DUDKAAk3LEskxmMfQUoVZ+eFFTpco63skY9noCK4fC6xE0lmdQOexfesp+iDhqv5toeM
         eyMBx/PpfiK2v+EevgyxsBY2q0SOj7yBwm23IlFZyuJ3wHUAVlEgEaZajzgTnRevDFtX
         kjxqULcgyurJ72yrTEt1OxmbKvo1BS7AprTP2CHomYqZoylMKT2gCo5Co6TlUcL1PAtH
         obWg9KnUDxZtYmIhDCcwJWH1mMhWgqj1hkChddIbxrIeLS5Mq1ver6SQonrlec/2REor
         gFkQ==
X-Gm-Message-State: AOJu0Yz0C42usP/3MfgLMOiWNlcgfr+/10wKwI4jAYbOf2NXff5aShSI
	73zT47qs8eWoGjyK9aBzRgg=
X-Google-Smtp-Source: AGHT+IEX4+IglUWk99ezR919ZjGHQwbqRmbNFAB8BywpXrbQUfp1qEOhvmFQvX+2lmz0asGmj1y07Q==
X-Received: by 2002:a05:6214:483:b0:67f:5701:c03e with SMTP id pt3-20020a056214048300b0067f5701c03emr7552913qvb.84.1703133930932;
        Wed, 20 Dec 2023 20:45:30 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id ct15-20020a056214178f00b0067f3f3d8e8asm374459qvb.111.2023.12.20.20.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 20:45:30 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc: mpc83xx: Add the missing set_freezable() for agent_thread_fn()
Date: Thu, 21 Dec 2023 12:45:08 +0800
Message-Id: <20231221044510.1802429-2-haokexin@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Pavel Machek <pavel@ucw.cz>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel thread function agent_thread_fn() invokes the try_to_freeze()
in its loop. But all the kernel threads are non-freezable by default.
So if we want to make a kernel thread to be freezable, we have to invoke
set_freezable() explicitly.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/powerpc/platforms/83xx/suspend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 9833c36bda83..eed325ed08cc 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -261,6 +261,8 @@ static int mpc83xx_suspend_begin(suspend_state_t state)
 
 static int agent_thread_fn(void *data)
 {
+	set_freezable();
+
 	while (1) {
 		wait_event_interruptible(agent_wq, pci_pm_state >= 2);
 		try_to_freeze();
-- 
2.39.2

