Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D732E4D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 10:31:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsMtc2xBjz3dCN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 20:31:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.52; helo=mail-lf1-f52.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsMtH45xxz30JR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 20:31:00 +1100 (AEDT)
Received: by mail-lf1-f52.google.com with SMTP id k9so2440582lfo.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 01:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sij05VFpJgeqCqXYg4ZQk/H8ai0dlbHB0/ggBdsdDto=;
 b=PExTkVRnO+9zi0Xfh02Ra89oCZ5lZb9Q97QhKytL/GZMr0grKyv/DpY99TGtou5TF5
 Kbtq2bPShpMXGzN8my+I1/D7Nk54zBeBFYJ7+bRu6+wt+hgIOD/XOfCRKiiqyvGIBLo7
 KMisnECHmcIaxT5wz03yzqyhxNQH2QFKw/VkvDC6S5XHTaSXA1WrRlOk0aI7jJKoUE1/
 ORbZOh9M+UG+CnZ2Aduo4MU1n9QMUphAENZMmETwrC5yxYfZRVDMBlNxgzvv70hFq542
 xK5lm+MXAWI/XPEkYMhw4QNvCnUwWUOgA8Cxzwg7zwLhe2Kb6hBGM6ie1hXpqOpYgID+
 XcqQ==
X-Gm-Message-State: AOAM532eWmnSKlfG+RO7/vV5ch16gBNM+RKCp3uSgtyNL0vXevtOsMuM
 IIGjt03yoRmEOyqMuf3zIAQ=
X-Google-Smtp-Source: ABdhPJzIIwckwhz4dez/Qa5mirOLbysEmtBCHhNNNvoffsjQZdYCneb7i3/07I1Gv98gVTrUJ/xllQ==
X-Received: by 2002:a19:ed8:: with SMTP id 207mr4748995lfo.164.1614936655904; 
 Fri, 05 Mar 2021 01:30:55 -0800 (PST)
Received: from localhost.. (broadband-188-32-236-56.ip.moscow.rt.ru.
 [188.32.236.56])
 by smtp.googlemail.com with ESMTPSA id w13sm239454ljw.2.2021.03.05.01.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:30:55 -0800 (PST)
From: Denis Efremov <efremov@linux.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] powerpc/ptrace: Remove duplicate check from pt_regs_check()
Date: Fri,  5 Mar 2021 14:28:07 +0300
Message-Id: <20210305112807.26299-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"offsetof(struct pt_regs, msr) == offsetof(struct user_pt_regs, msr)"
checked in pt_regs_check() twice in a row. Remove the second check.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 4f3d4ff3728c..51801777906c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -354,8 +354,6 @@ void __init pt_regs_check(void)
 		     offsetof(struct user_pt_regs, nip));
 	BUILD_BUG_ON(offsetof(struct pt_regs, msr) !=
 		     offsetof(struct user_pt_regs, msr));
-	BUILD_BUG_ON(offsetof(struct pt_regs, msr) !=
-		     offsetof(struct user_pt_regs, msr));
 	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
 		     offsetof(struct user_pt_regs, orig_gpr3));
 	BUILD_BUG_ON(offsetof(struct pt_regs, ctr) !=
-- 
2.26.2

