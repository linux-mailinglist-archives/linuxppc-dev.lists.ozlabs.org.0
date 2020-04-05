Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8D319E9E0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 10:21:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48w68C2TsHzDrMQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 18:21:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=psSUHWRl; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48w5Tk2vm2zDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 17:51:34 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id z3so5071667pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fXHW1b6fO1FXiuIvfxLCGqRbJU/6omAN7vseOtHgP2o=;
 b=psSUHWRluSuqiIOUXhePdO1uO71WyIsrMBA8Bwpc1s1/RHSbWS9NGikzTh9SWUQ4lB
 vKbwIyi85w0j1k5NIMcV9Evw65Jjf5JSXV1lGJfVPqMTnbF7Cor/MSocRiCc7MFvIQgR
 Wrb89k6Sw3LROe5XzNSM5KBgv4X77DaRxPY+At9qMWjUZ1/dmsGZKDLf/hPQBLanE4X/
 scYLCRz7i8S2l9bGdRRSJyWo8xCaZMe8pNUCktkTErivMoBAIH8I6JpoZ5t7a9ki9/GE
 l0Dv1gx0PXHgwDuWdq7IG+wYS/i5MUSGa5Gsgq81JocvMw++a5H2Tj8IWmL60DyBV2QF
 cbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fXHW1b6fO1FXiuIvfxLCGqRbJU/6omAN7vseOtHgP2o=;
 b=lrUCG4fo2uqeDJ9/jsuFS/mluXmKJZT7NpqboqxTKUzbtYr+yfrxRFvkXC4WZakK9f
 jzhUO/OACGRF5fKPOFUdRyEoKZVzqdJWnY3BWUVsQ7Hx1IfVHDgSQQPuy9jILv314GQD
 u/cI1x3bpTJMWK4DYawRYpvqiP/PhTSaeT0AeqJ907bEZ+//kdrvgncBHJ4KkLZdXwRX
 EsVUZvUzWhHpdK40uFze/v0IBvHpbKwaEIaFRpKPWLl/bSAEPMlPSCzutJU9npHASkq2
 6kTRppJh6YjodMasp/Evp9FkxgNtwteJBsoo6VFfNLmNmOD7zbFUgnN8XC0wVt73KMk+
 Ax4w==
X-Gm-Message-State: AGi0PuZOmoAQQTw74z2RgQkAhOucwEFMCYsr9hM85QE6bJ65o6HYpn0L
 du84n+lfFzV/1G9aYRrwblc=
X-Google-Smtp-Source: APiQypJiJTlVByPufukl1A/Ta9MCm98+QEENycaUO/SHTl0iIBzlmJGdGPiwPVcwtddpuhVs9zZfpw==
X-Received: by 2002:a17:90a:faa:: with SMTP id
 39mr20560705pjz.190.1586073091494; 
 Sun, 05 Apr 2020 00:51:31 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id p7sm9510970pjp.1.2020.04.05.00.51.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 00:51:30 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.a,
 tglx@linutronix.de
Subject: [PATCH] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
Date: Sun,  5 Apr 2020 15:51:23 +0800
Message-Id: <20200405075123.28756-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 05 Apr 2020 18:19:46 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here needs a NULL check.

Issue found by coccinelle.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..09443ae3a86e 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -811,6 +811,11 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
 		goto out;
 
 	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
 	name = kstrdup(export_name, GFP_KERNEL);
 	if (!name) {
 		rc = -ENOMEM;
-- 
2.17.1

