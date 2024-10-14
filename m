Return-Path: <linuxppc-dev+bounces-2177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8999BD31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 03:12:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRfNf1x9wz2y66;
	Mon, 14 Oct 2024 12:12:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728865446;
	cv=none; b=W/AzHprOlgXcnmhl3TqZLWIGjcONGqOSt0D1aQnrXsG2J2RCBuSHHlwZqXcRZnN2b9BGsHJ9iDsWKgYcjfaWdnvY+H4NVTRIMFyUq0IwZnNb3whPsoJvIqzuBxKzCglTfrOk1oRBNNy3C4H7O+8nlnrHokTNM68Im3ctHGQ/TqkbVgTm7lZtt6I0TLFpSZqrIcVIjhXfFC4muJl3ssGq+q3csq27IOGsLGuAyAMTHOChUm7DUZEaelFd1SlMDzyfduwLlWHfV10r3EpfM46I3ybWhj0cjw9JQ5+HZjwE2XJvnO1y5KwcTCoSIqB4VRL44Hfefd/w5wuLEA5gDBnu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728865446; c=relaxed/relaxed;
	bh=Z/MxXjMSH88EZCOWOzzY8j2jbI6T2RRiM4Ay0W0TfrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AL2jnaszZk/hR2o9TDQZqMmz/fMtjSWG9wfIabRblzD1wsDLImwOBDiUID67OitId/G4Crd0PtSiO13BChokY6i0QenaY+UOh0kYwGIPHBsewcYDo3A8puVlh6KHqvgEaq/25vJG7MXtIYmq013VwggTtG8pXIy18M4+aOe+t5OF2byhswDm1rLNlijD+ptMi19fomZPW013zNufqb/SfKQTisFlOEWsqjZKx4ZjMbs3smUgvSHaOZue7dkTSxGCD0ae75k7SYRF6Bc94X1yasp1MQROOCROvpUXYWZRWlSuktONhn7qNOqekF3/M2v69FUyFf3bhCNwzl8/5VzFfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZOhFITt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jszhang@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZOhFITt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jszhang@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRdJP6l6vz2y83
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 11:24:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B74AEA400C3;
	Mon, 14 Oct 2024 00:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB7FC4CEC5;
	Mon, 14 Oct 2024 00:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728865441;
	bh=XBA2lRucLBPpWkMjO2VOWMYeRT+1cy4biQFRbLH41Yo=;
	h=From:To:Cc:Subject:Date:From;
	b=pZOhFITtIdwiQajF702TjukbYHq5I+EqHaLsOmmhzdw7G4XUtV2L/c1Oa65JRv44e
	 PHrWCLlxGEOUsXCWynkPynV3XYx+tiDbn0X97w4YzGaJhlVBpbfBWQ4mEIvyNw/qYb
	 jD6/lDef1qhFdw0oo48CEQktfq7DaxSTxBc/QDM29+xclZWT6wR+QjcMCsXoptLQKc
	 ppwEdTduJuIACNKFv1pDLojBPGT7dpK1ItuvzT2NYZKi9brg12ocJ3vudhKxXyC5Qu
	 FsHm0xqgjrm5w2NQbI/+I5lsfwUAwvRBVg5owkQ/+6VyrbOOY1wk2Pdaw5bKZk16Tv
	 mDfhkzxA2h1Xg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] tty: hvc: riscv_sbi: instantiate the legcay console earlier
Date: Mon, 14 Oct 2024 08:08:57 +0800
Message-ID: <20241014000857.3032-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The hvc_instantiate() is an early console discovery mechanism, it is
usually called before allocating hvc terminal devices. In fact, if
we check hvc_riscv_sbi's hvc_instantiate() return value, we'll find
that it's -1. So the calling hvc_instantiate() is too late.

We can remove the hvc_instantiate() to only rely on the hvc_alloc() to
register the kernel console. We can also move its calling earlier so
the kernel console is registered earlier, so that we can get kernel
console msg earlier. We take the 2nd choice in this patch.

Before the patch:
[    0.367440] printk: legacy console [hvc0] enabled
[    0.401397] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled

After the patch:

[    0.004665] printk: legacy console [hvc0] enabled
[    0.050183] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)

As can be seen, now the kernel console is registered much earlier before
the BogoMIPS calibrating.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index cede8a572594..d2ecfbf7c84a 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -68,12 +68,10 @@ static int __init hvc_sbi_init(void)
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
 		if (err)
 			return err;
-		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
 	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
 		if (err)
 			return err;
-		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
 	} else {
 		return -ENODEV;
 	}
@@ -81,3 +79,18 @@ static int __init hvc_sbi_init(void)
 	return 0;
 }
 device_initcall(hvc_sbi_init);
+
+static int __init hvc_sbi_console_init(void)
+{
+	int err;
+
+	if (sbi_debug_console_available)
+		err = hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+		err = hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+	else
+		return -ENODEV;
+
+	return err < 0 ? -ENODEV : 0;
+}
+console_initcall(hvc_sbi_console_init);
-- 
2.45.2


