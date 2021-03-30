Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4B34E066
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cb00XTGz3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:55:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GAvtOrZ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GAvtOrZ3; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cWC3wZ7z30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:23 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id a12so2442018pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bD2k3N8TtbJ/5mTogIWRF2QbxokniPZTNjK+oMQNzxk=;
 b=GAvtOrZ3PAGdWsIijpmRaA77NEjy58cG5/nuGDAPjRCU1Y1WUT24Pe7uKCAOcf7X3R
 sKpMmnuTlbWosOj6eBMsNtY+Z17qgem8/v6VCXwouTeh4GD0s8VVtJcNATQa3nUKAkc+
 eNFy5svys1crgd1t3CQiYe7Q8fYDrsQNrZo7KYw7JtXKjTflEdKee082jr5Y/XsJjDqG
 jVyHDhNdS6wtqfMEkjoCW3bhm2guBwcRkbU5MpBEBJ8Rtlk+0F4qyx7/45AFnV/k4GLR
 zu+ugH8RSpQTn9ag401LrwZWJnph4GJTqASS41EvpHa4RhKhz/Xu3bDMXcBIxu8aR2an
 B5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD2k3N8TtbJ/5mTogIWRF2QbxokniPZTNjK+oMQNzxk=;
 b=Q6Z8B91qtrFr96Zf8w9Qx0o3RIxSz3QSjanVDZ507zeHD7OeXuFE/6BjJQWwuMeRJu
 HnwLY8efdmdl4fT7kj5fvZvD8yjk3yG0/6n5k1Yj4z0Dyil2kQZh9Q2oN30LIEkzOOwE
 G5VBr1LFtkJTDwh4J32lc1WEvFnE6L7slkgKOotPGcFFesSeFoenhJVYpLSO1OND8iUe
 tSaTLyvEkFcJHqi25DmqGtlRcg246DSeI26VtdvJJaUHEAn7ji/uGibxeQQml5GPkj+a
 Emqr0St6rclYzjxWZTW8W6XMITl5xnI60Itc1mZIU1WCWxmPhAPNu9XMI3mslYBRbn1a
 qODA==
X-Gm-Message-State: AOAM533H7R0KI7gDDWu2TaFesC5HAY4yrd43kl2fZ/7iPNXnVGFGi3qE
 SPXqCLLJczvfPYATT1GzMubw/TTR40OWublr
X-Google-Smtp-Source: ABdhPJztkvx1djGGUan7e+lnucq1b9G0ArkYWVBMdBDvVbYYNM9pYnabghUsvP4yMudm79qh0cwMbQ==
X-Received: by 2002:a62:4e57:0:b029:203:93bc:3cb with SMTP id
 c84-20020a624e570000b029020393bc03cbmr27772906pfb.56.1617079941759; 
 Mon, 29 Mar 2021 21:52:21 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:21 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 08/10] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Tue, 30 Mar 2021 15:51:30 +1100
Message-Id: <20210330045132.722243-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, Joel Stanley <joel@joel.id.au>, cmr@codefail.de,
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

