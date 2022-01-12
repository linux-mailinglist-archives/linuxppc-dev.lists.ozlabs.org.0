Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3E48C313
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 12:27:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYlfF6zZFz30LD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 22:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qchohL2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=troglobit@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qchohL2w; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYlbg684Fz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 22:25:17 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id k21so7137915lfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 03:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=S/2qvW0xbWUNa+oQ156XsN0z42IWX/Qvd1EEymHQdKQ=;
 b=qchohL2w9nPqVM/GsKEmiRWAPMGXd9jcIqXWc7JZmRU0IG9L1WCuKlxYquJ5kkebRH
 y5x3PuIQz1sbvfCSWhPuxlYYfDjP3zcelz4PSltYSNuT+TQ6A5Vkl1o99wSbiOzRHWD1
 /QxCMGwY6eUCjxS2Fggs5F47+TENeObAVYs0X+aAGj1R8WjlB8Q5CeaCUsVI0yP/nxTF
 A4pYLC2/1QU9MJ/vXEsJ0CN4Yi3m9uhSgWxikaXsApZ7rTjRB6PkChyahcE7G9uWzSHq
 h6585tcUQpfer224HHFdFBl+GYHTTcblwFh/ktL2K1Et+7ycPiixSpyk6RmB12EYkJQ5
 K/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=S/2qvW0xbWUNa+oQ156XsN0z42IWX/Qvd1EEymHQdKQ=;
 b=fkaY//m21a8wba+64eHypQzhuS8nzrhUUpINbWopPCYqhDPPJ4/+scf73vW7SmZp3G
 G1Lzlk89LUbHz49ICNsvZYTvWz9W+CjIQymoBgbn9TItX2jzcX/2Gmjsqm9D0xXA7umV
 wJf1gWAg+YYNQkvVy2YAfpJQkACspKvRBqazduTQF4QB3p2SFOCPH7s5SbH40nq3RyRa
 aevOMXBf0P5UY5OPSn+XP7IJHd6dMSf0gVDcb/i90LQz63mupfD9alntgZ4Qv3gMguBK
 82vBeCAG5LzKGO4jJdsyZwRYHasqyRZ4Yn87PWZ7kW6mUiJYjIYFXk+sfheNqf2QHjbz
 yHrQ==
X-Gm-Message-State: AOAM533xVq1UOnarDMg56xEeShPZnX7AdJQueKuZicAkIgcIhHqNnxom
 cIsCaBqVgDnRcEaCXO+On7SErCzdbzg=
X-Google-Smtp-Source: ABdhPJw6JZoPv6qrZti9DLaYOfRITzhzq+d+8UsWg2m3AFz8DOcs94AMWFmp+TGLYHD3DjtbTMt0GA==
X-Received: by 2002:a05:6512:1684:: with SMTP id
 bu4mr6626774lfb.293.1641986711325; 
 Wed, 12 Jan 2022 03:25:11 -0800 (PST)
Received: from wbg.labs.westermo.se (h-155-4-221-110.NA.cust.bahnhof.se.
 [155.4.221.110])
 by smtp.gmail.com with ESMTPSA id d20sm1160963lfj.224.2022.01.12.03.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:25:10 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 1/1] powerpc/e500/qemu-e500: allow core to idle without waiting
Date: Wed, 12 Jan 2022 12:24:59 +0100
Message-Id: <20220112112459.1033754-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 22:27:01 +1100
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tobias Waldekranz <tobias@waldekranz.com>

This means an idle guest won't needlessly consume an entire core on
the host, waiting for work to show up.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 arch/powerpc/platforms/85xx/qemu_e500.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index a4127b0b161f..4c4d577effd9 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -67,4 +67,9 @@ define_machine(qemu_e500) {
 	.get_irq		= mpic_get_coreint_irq,
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
+#ifdef CONFIG_PPC64
+	.power_save		= book3e_idle,
+#else
+	.power_save		= e500_idle,
+#endif
 };
-- 
2.25.1

