Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776847CED4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 10:08:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJnY01w0Lz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 20:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NTGfEsaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NTGfEsaq; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJnXK2xjlz2xsx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 20:07:27 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id i130so684143qke.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82q23pf6F79CsGvvyr6VtDk1U+LrvvXzl1yTpgD2qXI=;
 b=NTGfEsaq/Z50NHpLlCHaPzI5WfxbxdMl0ct1kvlbHAL451PDYR5CLpPG8C/Yu0Q6XF
 4TY0pcnpLOSV2brWp2f6Cggcezl4B8gvYNu3WsNWH5CCd51YHXms+wssKTVPwQQt5ciJ
 Uf4YWJwSrCtAB3pD9SrIAWlBSkjz4C1hrP8834IJ6mBua1rks57alNLHh5oXRe9zdFMD
 r58CqFObroiFWZ6Dc9R/N0sSLaKdEAMHYvghxbhzntTnvkO3RClWSUdKvlqKoOdukxa0
 nJMcirQSpxl8vxc3LUTlRigA9UXuRMjVt3eXUwxxnRRIUSsF1IWVf7ylscxcBbZzCLCv
 vT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82q23pf6F79CsGvvyr6VtDk1U+LrvvXzl1yTpgD2qXI=;
 b=W9es1CKXoVgnIWVOWQ9dBGFTIhUzTyV4mBgxCXZBHBA5kdgY7DdzSiidN0bBAsUKmJ
 13JYnyuNQn6QsvV1KiWGl45UF4yv/ba1VBRdSsmu76U+D9Z/5AlI2nPl+cFdXCh3yk2p
 E4jcgMdkcrnXqASKkDi80mPsn88KTrOoozf8aMkdF7D2zFAa9GHB9UyU9jhZ6/m/KfZS
 h+inT9v88DTKNycooDOsFeFXxNrCwahdyhCp8uXwCs3pOLLW24NOPVlvJ3iYCoLGjw16
 S6HIvpJdMkGCeZ2pyV0C/eSTgWInV9PmTFxNAdOoidMmy26Pp3b8XPVaxtduNS+uzlDc
 IC/g==
X-Gm-Message-State: AOAM5303Xe8igcARSeTxPFBl3fEQ7vej2jKKc+F0agR9eRUWmuZSYzhM
 TJdoueJB0Q/l6yTnd+TRNMdisvnSb6U=
X-Google-Smtp-Source: ABdhPJyFLxncjijnVuS5KNcjwTO+lXy9IW1Mver2NIeQoTrkbrAtkoVh5HBoMTrpUH0StirNzNuaEA==
X-Received: by 2002:a05:620a:430e:: with SMTP id
 u14mr1372729qko.286.1640164033021; 
 Wed, 22 Dec 2021 01:07:13 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id bk25sm1371223qkb.13.2021.12.22.01.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:07:12 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/cell/axon_msi: replace DEFINE_SIMPLE_ATTRIBUTE
 with DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 22 Dec 2021 09:06:55 +0000
Message-Id: <20211222090655.484551-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87h7b1lcvt.fsf@mpe.ellerman.id.au>
References: <87h7b1lcvt.fsf@mpe.ellerman.id.au>
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
Cc: arnd@arndb.de, zealci@zte.com.cn, linux-kernel@vger.kernel.org,
 deng.changcheng@zte.com.cn, paulus@samba.org, cgel.zte@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck warning:
./arch/powerpc/platforms/cell/axon_msi.c: 456: 0-23: WARNING: fops_msic
should be defined with DEFINE_DEBUGFS_ATTRIBUTE

DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
imposes some significant overhead as compared to
DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 arch/powerpc/platforms/cell/axon_msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 354a58c1e6f2..362c1efe4180 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -453,7 +453,7 @@ static int msic_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");
 
 void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 {
@@ -474,6 +474,6 @@ void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 
 	snprintf(name, sizeof(name), "msic_%d", of_node_to_nid(dn));
 
-	debugfs_create_file(name, 0600, arch_debugfs_dir, msic, &fops_msic);
+	debugfs_create_file_unsafe(name, 0600, arch_debugfs_dir, msic, &fops_msic);
 }
 #endif /* DEBUG */
-- 
2.25.1

