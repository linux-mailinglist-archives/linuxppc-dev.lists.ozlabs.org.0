Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD981AE1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 05:46:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GKV7dyCV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwdDQ2lVJz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 15:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GKV7dyCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=haokexin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwdCZ58FYz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 15:45:29 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-67ee17ab697so2394666d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 20:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703133924; x=1703738724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLAmrrDrxYlzwS00lVo+41uGLwOgNGDzKEKMosiNWnA=;
        b=GKV7dyCVFNxe3dlRAiqaUKt7bpYesvfb0rJspAFg/IFIdELIFFykG9S4Fswzuo7IPN
         XNzr6kznW1B+AzNKzcAp2ewvXsmPx0WvlFp9+jP/vAe/fO8gWEU7Ws+tnKnlxnbtdjNb
         MW1RFdvxD+kIdZC3YTsWjAdZgW861M6juT1nBeV5L+aIt6vS1t9v2p7e/APdRfwDq51n
         VAx97W8TEvo8UHh/M8afj7HLBOKs+cL2vC2ICjnhPG4EdJrdHQNSlCJZ11PrhR0Z73Tk
         CPwxLj320+Feaowq9Y4Xc/fNR8UryVXwwalx1hWF+juWJXZP2m1G3+Ec6HP6H5iJDv8o
         ZaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703133924; x=1703738724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLAmrrDrxYlzwS00lVo+41uGLwOgNGDzKEKMosiNWnA=;
        b=NUCmC7I5lIK5gnFfg1kkKYQer5Hlf8PaIFD+JsOAjHObSz3eqcUbwDLvrIHEh8ONOW
         +ztHebPYXFiz80q5MZUHQh2QP53XaoQa7s39cjJNhCuDI0jZj6OFr/t5vFPIS55cSg3v
         yp4cE7cNSNPXrNHIAxElbzi4uuaFgEF1XXT55gtsjz7yKClk57cSpheCJ3VAWL2reqkI
         1GdAx/nAKR8KElyu04OL4BtZwp3eeg5N8m8dqHds3v0obxXM87zdY85qWIPIAFIm488g
         ojrj4rDuA6fSnYj2grtjxNIVqotHg4eDSvrEK5dqpARUeO3TJESfAg1s8JMWf2ye2SVO
         BCmA==
X-Gm-Message-State: AOJu0Ywwn5xXvTbsbTkx4qFQBrF44/mrdO7Ij/6Evx87JHCkSak/ySMU
	NLnn/7/5oNQm+e9HJ+ViGxA=
X-Google-Smtp-Source: AGHT+IGYI//bWRb6//RVAWC17CPyLcaLgCPVHS83lMtt5mn+rJFMcwGr+EVaqmJGotBbE1Gzrtd+8A==
X-Received: by 2002:a05:6214:e8e:b0:67f:63a5:b37f with SMTP id hf14-20020a0562140e8e00b0067f63a5b37fmr4707433qvb.21.1703133923836;
        Wed, 20 Dec 2023 20:45:23 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id ct15-20020a056214178f00b0067f3f3d8e8asm374459qvb.111.2023.12.20.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 20:45:23 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] powerpc: Fixes and optimization for the freezable kthread
Date: Thu, 21 Dec 2023 12:45:07 +0800
Message-Id: <20231221044510.1802429-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
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

Hi,

The main changes include:
  - Invoke set_freezable() for the kthread which could be frozen
  - Drop redundant try_to_freeze() invocation

Kevin Hao (3):
  powerpc: mpc83xx: Add the missing set_freezable() for
    agent_thread_fn()
  powerpc: mpc83xx: Use wait_event_freezable() for freezable kthread
  powerpc: ps3: Add missing set_freezable() for ps3_probe_thread()

 arch/powerpc/platforms/83xx/suspend.c    | 5 +++--
 arch/powerpc/platforms/ps3/device-init.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.2

