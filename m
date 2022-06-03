Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AEE53C9CF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF21B19HRz3c1g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:16:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cFOF6qQS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cFOF6qQS;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF20W33f7z307n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:15:54 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id bo5so7066138pfb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9U3qsBSVaLdxBGwysRPnWNY0hSOW5bqS3fMTtRWlOU=;
        b=cFOF6qQSycOAg+gIAm34Ht6pACgpcLc5A505loomEOpN92Mvqy9AKHANFvo1LeIseH
         TQV7gpyd2J8BkQT/qSveitZGLV5UoZXMPoR3f0aJArnGeB4ufeVzCN1yvq8bsGUxonD1
         YdcYdCWfxufluBuZzcb3L3MqHcpEKqr7RdDUHnWDumNGdghvFLJtvJJI56Z3s0lxFxvu
         T2VF48gcILXr+DG8X1OhDunUj1p87J8vaLHFtOmGKRkrB+CltTsjFwleOHXYtNlvCYcI
         bq+nLcz+m98PqzqkNqMD54IGMTy3SmbfqZQwxitiKUw3fG60dgqLfbk48eCf5EDMTrgp
         qCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9U3qsBSVaLdxBGwysRPnWNY0hSOW5bqS3fMTtRWlOU=;
        b=oLXM4aQRKZNvzQphyQQoQSa55J3/1q+YbzzxO1lvfbNRBbHaS/LiMwhR6D4z5hcmc1
         6VttkWKzj3vDKVQ+HMbKmFf2ixFcKbdCgQvt9tnYUbUFbULLKebam9u8u2IHmNE6fsUE
         7nUCNX0+woTPpwkrOBIYm7tNXU1FlcnOFwDe3plgYKd6mssSGtXgIoVSQOjlW2Ten4tg
         e8r3gHzXSCDD6tijZzoT4Go4ATCfgHW6quOvV2UMD+3uHihasDh/YtlO27dX7XvPjjsn
         c5bsWGIekMBg8CzMoeU/p88Jx315EcxC3Vi2gik5axR3MXlNPtFPmAh71cMnWwBt191C
         NfDQ==
X-Gm-Message-State: AOAM532ql2oBo0QC6TCIKk5vTp/WEIs434TXOoTDhJ4DsaJp+PshZsbo
	K7urh4THStTgoiZXCDo5AyQ=
X-Google-Smtp-Source: ABdhPJxsP/J9XGCwUjJcprDJ7lbiUGLbMFq/EQv37a5Rd/1TTPKJOGhRPLSO9Vu4n7hyI2qVikFmFQ==
X-Received: by 2002:a65:63d1:0:b0:3c6:25b2:22ba with SMTP id n17-20020a6563d1000000b003c625b222bamr8702993pgv.360.1654258551714;
        Fri, 03 Jun 2022 05:15:51 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id bg13-20020a17090b0d8d00b001e08461ceaesm7545215pjb.37.2022.06.03.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:15:51 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
Date: Fri,  3 Jun 2022 16:15:42 +0400
Message-Id: <20220603121543.22884-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_node_by_path() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 0afacde3df4c ("[POWERPC] spufs: allow isolated mode apps by starting the SPE loader")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 34334c32b7f5..320008528edd 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -660,6 +660,7 @@ spufs_init_isolated_loader(void)
 		return;
 
 	loader = of_get_property(dn, "loader", &size);
+	of_node_put(dn);
 	if (!loader)
 		return;
 
-- 
2.25.1

