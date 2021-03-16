Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021CF33CC06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz8P6xrfz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:21:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Tom2esHg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tom2esHg; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5l4Dn9z30FT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:51 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id x29so21684231pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bD2k3N8TtbJ/5mTogIWRF2QbxokniPZTNjK+oMQNzxk=;
 b=Tom2esHgHLHXDPPFtXcZ+klkQqtKfHzGJHneW1HACLQZPvAIjpI7KZe4F2ssDzgvNh
 bLHXn8YBDkKEKUFVtrfhyp+SipLasmwKXh3EvzyXVMhb0DkfEbcaBpT5ZCka+LvodEaU
 PE4oFxqxBA7t20q6WU9JNj1mHO+speKDkyaODITLfhy4Otaam+nyFnVAVuLBf7rDEhf4
 +BgemXMebsnk8QB9W8zsc22tSqC+Uv4ll4ZlBEFBeuOPMFOlavlvDLddxnCImw6McJuQ
 xjyTSV7f8HfzMUvPd/tZDyDp9kfRpFZ9q4D7fp2AcMgJ42XKGfVNqVb6El2CYuKVeMWZ
 OQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD2k3N8TtbJ/5mTogIWRF2QbxokniPZTNjK+oMQNzxk=;
 b=UmqW0Dt/ikcqbNKNqceNu8dbuisXM8gJptSSqshSGVWEkln/6ito6JFxvBZjgQTyN3
 b9/6tIG7925BNmlQjFzqYtQjtjAQ9EzADT5Njip2clm7Y93CCajlyjlgsGw+xiJOnfoM
 oCSChEZWzD7uQyqG5NQ4kV4N2D7EJAy+oUbkbN+E5dY/hn7w2zWoR8+vD6U7H4CRxzD1
 TglQbAPBDcp1wuTGbzEAJSdc8UnSTk89X6CIb52GCzsut44fmYuMXtO3sPf5tq1mUVt5
 uBuEQtwhuI5WqYw1YWB1y2Ay+ZCNlodpyFTAdL6hv3YjVaJeMFwJG1x2idfRtnkywNX5
 DacQ==
X-Gm-Message-State: AOAM531XMSoXnoq5mCP9Sb8VO+mnzHhwZSfOpYOPlFlkH47wYaLd6i26
 VexSxlyhKUBU14D/U/g0dQ4t2DGT5jRayw==
X-Google-Smtp-Source: ABdhPJwkpgbHt+1x6XK8+vQUUFrctSggl/7W+CuzK00IbGTWzaKEFGAe1+SB9TC82MVL1Ztx901dHQ==
X-Received: by 2002:a63:df43:: with SMTP id h3mr1989699pgj.276.1615864729029; 
 Mon, 15 Mar 2021 20:18:49 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:48 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 6/8] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Tue, 16 Mar 2021 14:17:39 +1100
Message-Id: <20210316031741.1004850-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, Joel Stanley <joel@joel.id.au>,
 npiggin@gmail.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
enabled, and if you want memory protection for kernel text you'd want it
for modules too, so enable STRICT_MODULE_RWX there.

Acked-by: Joel Stanley <joel@joel.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index b806a5d3a695..50fe06cb3a31 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -50,6 +50,7 @@ CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_PPC_MEM_KEYS is not set
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG_FORCE=y
-- 
2.25.1

