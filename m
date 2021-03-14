Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CC33A3EB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 10:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DyvVr3WqXz3cm0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 20:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YHpdGNvW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YHpdGNvW; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DyvVR0Sf1z3cGW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:33:02 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DyvVQ4YH2z9sVt; Sun, 14 Mar 2021 20:33:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615714382;
 bh=E/M29pYJDYvi2Ktr3u4IAIZD3aOlKPRHAA7xy1ST3zY=;
 h=From:To:Subject:Date:From;
 b=YHpdGNvWPNvWPbYWeqhu0JuxlVbHN03G5qTPaomR4g/uhoMU/7eFx9FKhPZQPgNjH
 XxGRaDBt4wav4ImoHlz421gLXmxJ+qcFFW5f7Y1OAN8y6wUWu0HkEFSVoEGOoF1Ay7
 6SjHw4zLytbbtVWWvTWBKZ3TWzuoLv5dB2nKm07hTDe5c5eOFIZFrGqN5KTLwvSMUA
 2SqUsYaKbB4P/5/GDWm6s6ihawNBi8L3rNffIygq1PV0x2+Npy9GgpcDq2rSzHsVwB
 WjyDqWVuep8zZcGmFo2/M0XCSVIRBvIRN2YB6HqAhYCMF2b/eRq1YoFt/qWF4DMh6Y
 SqmtUwvYIa34g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/eeh: Fix build failure with CONFIG_PROC_FS=n
Date: Sun, 14 Mar 2021 20:33:00 +1100
Message-Id: <20210314093300.131998-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The build fails with CONFIG_PROC_FS=n:

  arch/powerpc/kernel/eeh.c:1571:12: error: ‘proc_eeh_show’ defined but not used
   1571 | static int proc_eeh_show(struct seq_file *m, void *v)

Wrap proc_eeh_show() in an ifdef to avoid it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/eeh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index cd60bc1c8701..01dbb44a0fe3 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1568,6 +1568,7 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 }
 EXPORT_SYMBOL_GPL(eeh_pe_inject_err);
 
+#ifdef CONFIG_PROC_FS
 static int proc_eeh_show(struct seq_file *m, void *v)
 {
 	if (!eeh_enabled()) {
@@ -1594,6 +1595,7 @@ static int proc_eeh_show(struct seq_file *m, void *v)
 
 	return 0;
 }
+#endif /* CONFIG_PROC_FS */
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.25.1

