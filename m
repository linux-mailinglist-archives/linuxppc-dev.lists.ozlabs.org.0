Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF02A3B8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:55:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHXZ6k6NzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:55:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cHjSsYmQ; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH674cx9zDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:59 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id w4so2466554pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aL7nf5HtJg3suEXS4YOkIp0Q0gZ4/3ZocZ8b4EhkTCU=;
 b=cHjSsYmQ/MBh9G0f9uARXaVWQo+8St3i0wmu/e0d7Ia65160YPnVtkpg8nbR9Xz623
 nSd+VSldI9znwAJiOPVcVIHvuXw7tzS6PRKX4NiIhuaz2YqMwDxYW9bgVs/4lmjsAjsS
 8RqQkkmWcEdgr7za0J2TvmOpUIDJcGQn2/82Fj+ot//gS1n0lNq77v9jqg/k+KUyRm0Q
 HcfapK715MRjJgtSR1GeU8FqFt4frC7bi7QUhD+WlroKnO7Cd7Ab5zRHZBAzXmtyaD1s
 /rv3yOxsyGSxaMhnJT5XJNy8PwEMw3CimPcGmGwJ1sjPMYfjH4dExWbMjruL/s78aoq2
 7ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aL7nf5HtJg3suEXS4YOkIp0Q0gZ4/3ZocZ8b4EhkTCU=;
 b=AcQiqw3anQjcCTde3JZaj5JOXRyE93sM0DuO048xUGEBVXEL14RqanfNtI0NGyF1Y3
 AqaRpl45uAvLkwO52SOdwK0P2dc/YLjwDOAu07qfne4wllYT05fJ00WRjmKD/u1fInAO
 rsv2FHKelutt3tVVMJrdTiw+pI0e3N0MdmZnEEPXBGDWsfcbTGHigahf/Trbv6aJas8e
 crsmfZ2HTTgjYhNn62X/8gp2arcCjFYZ+5xdJk7WVBIiIqQFflx2SxrwNXxnzX6S2G5C
 CN9+WFX5BuXeHM0DWWEZdYpfP+xxDHNLRshw8j6SqlKjuBFi8pzCb8OqMLZDsxJH+I6u
 SX/w==
X-Gm-Message-State: AOAM530jrZJIIW691n4FwjrV+bQLbEP6FA2PQ7UCS+q8oKkculCPTU4M
 xAx8UAFhHFrJJaGlqiF2Qxofl4qsjLQ=
X-Google-Smtp-Source: ABdhPJw7P/6SoGM1uKywgMGgdl403hwqWRuvrVQvpVZer9+DT9qeakVY6iMRmXHLCr7d4iodBsNIwg==
X-Received: by 2002:a05:6a00:228a:b029:18b:212a:1af7 with SMTP id
 f10-20020a056a00228ab029018b212a1af7mr3787687pfe.55.1604378156571; 
 Mon, 02 Nov 2020 20:35:56 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:56 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/18] powerpc/amigaone: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:16 +1100
Message-Id: <20201103043523.916109-11-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with amigaone_defconfig
---
 arch/powerpc/platforms/amigaone/setup.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index f5d0bf999759..b25ddf39dd43 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -65,6 +65,12 @@ static int __init amigaone_add_bridge(struct device_node *dev)
 }
 
 void __init amigaone_setup_arch(void)
+{
+	if (ppc_md.progress)
+		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
+}
+
+void __init amigaone_discover_phbs(void)
 {
 	struct device_node *np;
 	int phb = -ENODEV;
@@ -74,9 +80,6 @@ void __init amigaone_setup_arch(void)
 		phb = amigaone_add_bridge(np);
 
 	BUG_ON(phb != 0);
-
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
 }
 
 void __init amigaone_init_IRQ(void)
@@ -159,6 +162,7 @@ define_machine(amigaone) {
 	.name			= "AmigaOne",
 	.probe			= amigaone_probe,
 	.setup_arch		= amigaone_setup_arch,
+	.discover_phbs		= amigaone_discover_phbs,
 	.show_cpuinfo		= amigaone_show_cpuinfo,
 	.init_IRQ		= amigaone_init_IRQ,
 	.restart		= amigaone_restart,
-- 
2.26.2

