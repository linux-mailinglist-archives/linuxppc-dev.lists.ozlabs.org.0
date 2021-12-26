Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24F47F879
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 19:18:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMTZZ4NMfz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 05:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qJ6HhOM4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=ammarfaizi2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qJ6HhOM4; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMMkW148lz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 00:55:12 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso15939379pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 05:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIaMoqUxFiiUxyBq+wPrrTf5jUX6jSpbT47dWykk9D4=;
 b=qJ6HhOM4nEJ/vAU/1zGVzSteIJoAvH03kPWHDMScA1AICLZ39COnqKlVw0RwqyBrSS
 4+e6UjeI3Wrcxzj9l29/E6nUg0+7mlwWTvqVfG3FDMVT6FI/r4c6mGtatHgZOTIaPgq+
 E4hVzXW15DXnUbzt48aOaQ4uV2OuU7fS8VXxo3o7pxtzEZxF4jRtJ4VM0AehhMK42ey+
 rZsgjuq1pz+8biwPv77Wk3loETZLclimL/jd2ITaoEFm8sYtObscYD0gyhgd1pNPX3tI
 csDDJGC5RySaePXjmOnS5vldfpjJqjdzPLTzDR9DXwRh6NgUrcJRFYASe7TC5/8H2eSu
 gOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIaMoqUxFiiUxyBq+wPrrTf5jUX6jSpbT47dWykk9D4=;
 b=mme+BQnRnlLPMiI/Y7FMWhiufGLx6lNZiKvU1INLRAVaXfFhygO8RpZ7RUYzIMZW1a
 1i7wenYowwJg1E1Ef6y45PL7ykUlrf3ik79BzfQYRpcRtYGvQwL+xgL6crrVGgciYNRt
 DM1k24yShNmSdoDrejs+vgrhPxzAlq2xKY2j/umJbcQpVp0+JvqIb1f+XstHr+Xo2Zet
 PLPnAhNVz3gUm9oRoJHXimoZm7e9ahQ9ObHdbhqkYGvEr+T4g+j6sw7egg7gMBwYuOpm
 30X3NScE/c8hXfZZ/s76+1g1d+JCKa+AXAKqMaZ8mmq2zlOGzK29VMC5qdHCsBmSaxxv
 2bcA==
X-Gm-Message-State: AOAM530jmrM1dtTH3Qw3Z3qAGl3rck4KSez7cLL9HgyXN83tCg5o5OEw
 ANpdHik/a97fS4Rci4eoEq4=
X-Google-Smtp-Source: ABdhPJwMORIXN8+a6PzVjBGzReSTLE1RuvvPpjPEObsJQH2lATNuMEfeIi6FWpmaf7Zz3nLWt7cipw==
X-Received: by 2002:a17:90b:3551:: with SMTP id
 lt17mr16844169pjb.1.1640526909797; 
 Sun, 26 Dec 2021 05:55:09 -0800 (PST)
Received: from integral2.. ([180.254.126.2])
 by smtp.gmail.com with ESMTPSA id y65sm11990625pgd.79.2021.12.26.05.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 05:55:09 -0800 (PST)
From: Ammar Faizi <ammarfaizi2@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xive: Add missing null check after calling kmalloc
Date: Sun, 26 Dec 2021 20:54:02 +0700
Message-Id: <20211226135314.251221-1-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Dec 2021 05:18:13 +1100
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
Cc: Ammar Faizi <ammarfaizi2@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 930914b7d528fc ("powerpc/xive: Add a debugfs file to dump
internal XIVE state") forgot to add a null check.

Add it.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Fixes: 930914b7d528fc6b0249bffc00564100bcf6ef75 ("powerpc/xive: Add a debugfs file to dump internal XIVE state")
Signed-off-by: Ammar Faizi <ammarfaizi2@gmail.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index f143b6f111ac..1179632560b8 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -653,6 +653,9 @@ static int xive_spapr_debug_show(struct seq_file *m, void *private)
 	struct xive_irq_bitmap *xibm;
 	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);

+	if (!buf)
+		return -ENOMEM;
+
 	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
 		memset(buf, 0, PAGE_SIZE);
 		bitmap_print_to_pagebuf(true, buf, xibm->bitmap, xibm->count);
--
2.32.0

