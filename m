Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ECD19D901
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:23:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2Gp6DXvzDrPP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:23:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=enx9EmEr; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v12373GqzDrcG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:23 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id g9so2946653pjp.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rfv8aS37WvAiJAvyja2FjoH+ZBaigwRoBPfYA/VSYVo=;
 b=enx9EmErGdwMkZy+VeQczpdgD8hS0TKT59HLcV6KoOP5qe/X80qOHd9YHa/eAhyn52
 91Q0SqOd820eT7CZkZergEVVCHbZBg9PL5m7AkQNuMemPbdUXnPel+rDgzWTWfg2+gM4
 C3N++tEE/FyzpOAJh1kCrdaA9dIEfOsr7bXd4f7mL+CSMtyZrjhnoiMMHjyvWpIXkPRC
 FRktIqMCD7uE1/TJXrnlyDRClRNinJ26kuXWQXYZvNoslr7p8QiRfcW/Gj/ffD/1iVaY
 sI+MXI8Vrc99UocGgkbCBXfGtOhYFULBTE1LCDckG26Rw2luj4fEntG1dNwXFXL+SO4T
 2GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfv8aS37WvAiJAvyja2FjoH+ZBaigwRoBPfYA/VSYVo=;
 b=CjDLrYfPNarIPWGwCI4tnFgoVUV7Xt3epfTYvrNQVXZhFVuSv4xYCeYliLVpdriALD
 CwhYtUC/46qlRlkYziHcQDQq/rIwcnu+cHbWAVl9FWmo8N6NM/+N1lJiKcMkbx7Q9+03
 vu0kRXCSuxw/y5v3eXVlo6wFxi4ajx2Hg3lvuf4FPtmEGp+PA2AsS56aS8CRFQz8rV+p
 RrFMS152QnpBe4NwS1pL0gcWXKP6AElqACfSf6OYJ6O/foCbWlb43S34hd9u9FI44HQs
 7VyAKqsuuG+G/xK1VNR5raH7GNZc6C7lUiBIdn/+yRVnljsfJWzn/MljRVsGzG5pVyFU
 K9nw==
X-Gm-Message-State: AGi0PuaPd+a/buIuttk6orSJTiAZ1IjO3gbCnOcIZqI/GSgiv5MYNuz1
 1AKQJdexkIoTuf9RU2Qit5peRV14
X-Google-Smtp-Source: APiQypLN5vVjmStkdwqX/UkDI2vgPTKIqTKPTjpSpKrbfmBIxQS9DP6UtCXTKzjGgl/w7fTkYs+irA==
X-Received: by 2002:a17:902:9308:: with SMTP id
 bc8mr8067749plb.278.1585920441078; 
 Fri, 03 Apr 2020 06:27:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/14] powerpc/64s: machine check do not trace real-mode
 handler
Date: Fri,  3 Apr 2020 23:26:20 +1000
Message-Id: <20200403132622.130394-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than notrace annotations throughout a significant part of the
machine check code across kernel/ pseries/ and powernv/ which can
easily be broken and is infrequently tested, use paca->ftrace_enabled
to blanket-disable tracing of the real-mode non-maskable handler.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index c1684be0d8b7..36e99adb8710 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -557,10 +557,13 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
  *
  * regs->nip and regs->msr contains srr0 and ssr1.
  */
-long machine_check_early(struct pt_regs *regs)
+long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
 	bool nested = in_nmi();
+	u8 ftrace_enabled = local_paca->ftrace_enabled;
+
+	local_paca->ftrace_enabled = 0;
 	if (!nested)
 		nmi_enter();
 
@@ -574,6 +577,7 @@ long machine_check_early(struct pt_regs *regs)
 
 	if (!nested)
 		nmi_exit();
+	local_paca->ftrace_enabled = ftrace_enabled;
 
 	return handled;
 }
-- 
2.23.0

