Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DF2C7C28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 01:46:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkmlM5QPVzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 11:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RKJLP50X; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckmjf2x12zDrNS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 11:45:25 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id s63so9037430pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 16:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DbXQyrkOihu74AGLoH+GcuKTUO3S+VRZtC7H/dCyrJU=;
 b=RKJLP50XdHkGwr3NtV1L89CHxssjvVQcR6eq267524Xzt0XodprmUz/uz42Oqsi7sx
 ShYmRAzw0O0fbyq7tw+cFJMCAQwniHe0GpqSK+plvMh62FLBx3koQam/N1PuwAJ5Fa5/
 GmhwzV+B2xHZADDpQoUYoqouaNbN3/nQ6jMod0AdYZOJvoUYUV18KGJAsJFDNjMtSL+x
 g2E1LKYhIcLa5RGNxdnyNHjPMXtxLUCMNZqnvXz35oERFIWZ8UPssxMAeG02QgtX+MmW
 kN4KLDQfWHdLpxiW11nmYDc8o7XXlPt5toouW6zRcBt2MI92i1HinQpNmMdN5PiQHWNT
 GAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DbXQyrkOihu74AGLoH+GcuKTUO3S+VRZtC7H/dCyrJU=;
 b=Tq6BJ25Um4OBAeqdeBbeWJt+dVMzgsMmZ6jUdnmF1Yj4KmIHNLl7M8S1a3ZdWsgv62
 LFCT5x+ze4a7pRczwXhXktlISu4x/7pshVUpATxBsQWo+QNeOPZ0wBIejmdYEzBu7owi
 JzbEXIcYEZcBwyq9EDVjRxLIFMGDAIAkjL2HmsJF3Mo6soRgU1/m9ZqEuuW+IkQMBMH5
 5GLNXnEY4A3X1fBKGaA99Lv+dnbn1plfPGVfJfWavaIktbmTrcvBjbjOha4kSzemLNI8
 jbuKFVXTZ6yhvXnG/thI5MuJqFYNqGXGzDKiKWO7MoXYYxlLhBqr8BoiCap7L5wwju6t
 B/GA==
X-Gm-Message-State: AOAM532ZUPHzQn12EcValaxkCBEXAOg5IOMhImwzyEF18I/UVAUDuuIB
 oPh/KzAvNlnx/M0t/tkbQR+2WOWDyU0=
X-Google-Smtp-Source: ABdhPJy7rnxE3Vsm/Q8oX2vSVlSvBKsz3On+fy/wf7RsZroxpGkIMEpbLnpfhFC1jlt9OW0Z6HIsPg==
X-Received: by 2002:a62:790f:0:b029:18a:ae57:353f with SMTP id
 u15-20020a62790f0000b029018aae57353fmr16046607pfc.78.1606697122026; 
 Sun, 29 Nov 2020 16:45:22 -0800 (PST)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id 144sm14192197pfb.71.2020.11.29.16.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 16:45:21 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
Date: Mon, 30 Nov 2020 11:44:04 +1100
Message-Id: <20201130004404.30953-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 63ce271b5e37 ("powerpc/prom: convert PROM_BUG() to standard
trap") added an EMIT_BUG_ENTRY for the trap after the branch to
start_kernel(). The EMIT_BUG_ENTRY was for the address "0b", however the
trap was not labeled with "0". Hence the address used for bug is in
relative_toc() where the previous "0" label is. Label the trap as "0" so
the correct address is used.

Fixes: 63ce271b5e37 ("powerpc/prom: convert PROM_BUG() to standard trap")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 3bae6286c17c..f63d01c78398 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -995,7 +995,7 @@ start_here_common:
 	bl	start_kernel
 
 	/* Not reached */
-	trap
+0:	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 	.previous
 
-- 
2.17.1

