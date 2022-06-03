Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E853C9B1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:09:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF1sc55qrz3c87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eEx/CXv9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eEx/CXv9;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF1ry4W1xz3blR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:09:20 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id s14so6700652plk.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DhV/bSEDMfWlEIgmxZfIXZk2f8EJJW/Clb9Xr6LaGQ=;
        b=eEx/CXv91F51gHGzlP7zjr9bT6WbxjasgQZstRm/f9Ke5zHlfqu2OS/yhdaAju55bb
         BalsuxJl0Y78g3SLsgX8pZznbSfrZYhG1ofOJDV9G1hW5ljIQ1vIPK2z/Z1Vf29/7ZWz
         Gt70+XKZVBu4Zj/oUWxNQ9CLYzPQWhL2L/D8YQB+JW4hCbFuoyPeSpRKa1j9iLbUpsvm
         UFLQSONOD3o0qyMBYhB8RM1ryy40J0050hObaakm1jGSyktzcDISJsLA8P5fqUUckmNy
         nAYWOcuL/lh3+1IMgWH06/XSCY1uDSarD7XsE5LTRaItxGkvs8MrpO7z3LGSY/SqDDPc
         vONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DhV/bSEDMfWlEIgmxZfIXZk2f8EJJW/Clb9Xr6LaGQ=;
        b=CqA1TyYrLqoH8a3qDyefE8YRq57iO5agGqj45fB19TEtP68lt4qDsbXv4fTyVhnKrQ
         lHieeI51+pngpJUGqgd78obG1AY5FsKtBn49KvbIEZpzgUggMWPyIrG79NgMPo57YtOO
         vbWzVigYJMUFE8JN42RiJ4D+eGZ8hqKsWUvrosrDyNm6pW6stfTBezuRJi+cq/Dcb1pI
         UXKF1l1R6+2fUsydmnz8bOxCfA529MxtYk4dXb+DcGmZxYIoEt9PsLJtxru8plPBNEN5
         c4m7/dcMDzQMZ1bef+Hvzb9P2IWj4TADGOaSUJeivcluaXjcwF+SN6JgAnod/Vf5IOxb
         pSUQ==
X-Gm-Message-State: AOAM532lrsCUD0hI7H/D+GoDNoDoOFEqaLh6Rh1E1sqgNnjCWePCOvjv
	Sb50YIT0iAxEdo6dvnlHzQ8=
X-Google-Smtp-Source: ABdhPJxL50NVd//ZW4zr/fI3E4mFR5M/jjEmELF8syGQR/bbikYMpaN4MnfTXHNT5RAt/SCYxeB1tg==
X-Received: by 2002:a17:902:ef50:b0:156:486f:b593 with SMTP id e16-20020a170902ef5000b00156486fb593mr9964208plx.104.1654258156469;
        Fri, 03 Jun 2022 05:09:16 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id e14-20020a170902ed8e00b0015edfccfdb5sm5312741plj.50.2022.06.03.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:09:15 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Nick Child <nick.child@ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miaoqian Lin <linmq006@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/85xx: Fix reference leak in xes_mpc85xx_setup_arch
Date: Fri,  3 Jun 2022 16:09:05 +0400
Message-Id: <20220603120907.19999-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_node_by_path() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: format:3038acf9091f ("powerpc/85xx: Add platform support for X-ES MPC85xx boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/85xx/xes_mpc85xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 5836e4ecb7a0..93f67b430714 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -130,6 +130,8 @@ static void __init xes_mpc85xx_setup_arch(void)
 	mpc85xx_smp_init();
 
 	fsl_pci_assign_primary();
+
+	of_node_put(root);
 }
 
 machine_arch_initcall(xes_mpc8572, mpc85xx_common_publish_devices);
-- 
2.25.1

