Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C634405E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 13:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3tSp3VTQz30BK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 23:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D9avA8ij;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D9avA8ij; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3tSN55TKz2yjP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 23:03:31 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id a11so12058538qto.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQK01wmcF8jPX8e5PCzrQrsEyQrec41JbEyt6M3+vg4=;
 b=D9avA8ij3mUbrTDCl8zy8/B34jsX+dh/SBXjQpM8bcCjfgHFhtuZ/mfmv664IH7SiW
 CmkBTti9xjZ4kQBCO3j3rDxxXAWonh+RG/VT/e1G7lxpTwE8aQDbwIuVOZyfsjxgqOfM
 j/kCyzbAFkhvM+7dhB6kZSyGPaHSDgcHW9ET36f1DJds5aTti+gUS6SjaG81n/ZyskDH
 Rr3H9IT7Lm7Ya9SiCx8GifpD6GbWdjVFmD2gbyND0veMTG3Gt5aa3KAo5iqxL8oe7NXB
 IiFwXXQcHCfv24l8ARlDC3nqRSkA9uGCO2BorvSWZ3nrwWuAxIi0AjRAhIBnd+oyyn3P
 etEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQK01wmcF8jPX8e5PCzrQrsEyQrec41JbEyt6M3+vg4=;
 b=Tl0g3t0X+uHZohqxEPBGvV0JxazffLeC5VeOSbRPK3sXJqWpuZErI7nQFgjvfT4qYT
 g/Ms0sHDZVxXQgNbDtP5ncWiOQRXqa9wzzrSnBvjU7Rl0u5TmWkXWTQPB44FAlyFuENR
 8QsB3M8X2HgN8oXozGDZJnKeYpn9rRjZmzh5xMUcfHullSXWng/DNrggZmtlR2txgRGs
 5GXgh1vuQRmNxPruKkXRH33U5iV7BOT5j7FZ8zz/oX5mLFQQeNx5HaHS11s+6+Nl6YaB
 doT4N016FTn2yJqknpAyFuLrDdhQ0/LP0gP3mmjIqJXxcm6iFZ1hpcXQPJxq+5f4Ll9k
 2NcA==
X-Gm-Message-State: AOAM533S9n9U3+PygtBx2pAu172JEe780nSxecIMj9SWWqz85y2SMRjX
 o6/L3/uCDoU7qkPSEwx/BY4=
X-Google-Smtp-Source: ABdhPJxDCg1+OAL3V5EU4KW1n/507Ijkz7OJJQy43gygVfsFk84CIg2ZOhnfD7K8Mj7dJSOzoADL0Q==
X-Received: by 2002:a05:622a:4d0:: with SMTP id
 q16mr9121780qtx.303.1616414608119; 
 Mon, 22 Mar 2021 05:03:28 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id z7sm10556601qkf.136.2021.03.22.05.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:03:27 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu, rppt@kernel.org, npiggin@gmail.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/8xx: Fix a typo
Date: Mon, 22 Mar 2021 17:33:14 +0530
Message-Id: <20210322120314.2085782-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/poiners/pointers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/kernel/head_8xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 46dff3f9c31f..8a85a984609a 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -819,7 +819,7 @@ EXPORT_SYMBOL(empty_zero_page)
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE

-/* Room for two PTE table poiners, usually the kernel and current user
+/* Room for two PTE table pointers, usually the kernel and current user
  * pointer to their respective root page table (pgdir).
  */
 	.globl	abatron_pteptrs
--
2.31.0

