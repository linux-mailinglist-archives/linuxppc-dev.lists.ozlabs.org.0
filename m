Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014C3F6FB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 08:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvbwH2XhMz2ynp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Us1MInW9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Us1MInW9; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvbvc65Rfz2yJS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 16:40:27 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id x5so18957004qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s+1Pm6GoIhQceWNhCI9LO3NE+Toba8IeAI2BMLaHxuM=;
 b=Us1MInW98oKxOH8bV11xiVyMZ4T5ZHvMN5m+8Zh8oopFSAYQ6y0r5TQeG+jEc2yZH+
 b+QfTF0uU7qjBBDTz7LH5LxGWMP2GcOB/q6JyLhP2KUsH3KpyNd9K1+PIELMYSE3H/Ee
 M3W4xAS7QAJGCVgGALmqzkTCP7FCtOgnMaWWuKRy2KSm70/hxmL+3V0loYblhu43CBHA
 64vLm1tKnKkNRWqtx5Kn+QYCTPVNcPB8Tl4vlak5nDsAgy2ce8n2LoNoAFbXRtgZVmRI
 ZITZ70A7KEF1kSLQXKF8dRR8eqSugjW6+ogIf0x5548circRImMA5lgVdwCqSFk4Pn27
 yblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s+1Pm6GoIhQceWNhCI9LO3NE+Toba8IeAI2BMLaHxuM=;
 b=A7RvovNuG9DBcypSN0Oxl3cNaEzVv+pLw+7V6Zj5c8koclTem1fD7U+OP3zo5UQHmo
 FJpJMFjCAggUsM7Dj/2Kftn4asXKttLPL6EoDe2RcmEA/2hLYF9NwDAp4QgNkNDutB09
 h7hkrLXNdBcNVyvigqfFMXNaDJTUAcQc3hHXoIhPnm8QKUoKJrMYhebPz1sLZmDx8rO6
 SspNPPQOfxNIFII14k0sICA1GcRBaS9oeKBUISmsiO3RDLbCtAWyXlSiVW5ebRLC39k+
 wH8qrjxOOR6Yw1T0QaoV6lp0fZHiIT/1MvURUqXFknaQgcxXXuSqwqCQl7zjE4I+pHCY
 I3IQ==
X-Gm-Message-State: AOAM5331I3Ba10NGjnoNzttOWdcbUWhZe8tTLBOmm0ArKTPVx2mJFjLG
 6WsSEqrpKRf98n/bZ/NKIRs=
X-Google-Smtp-Source: ABdhPJwCb2xXlpRzi1OcVV6/ti9aKo3w6uzHD/CgjJZO1QX99pr6gXQK280IzDJOxppHrSpDAGEl+Q==
X-Received: by 2002:ac8:5dd1:: with SMTP id e17mr38737440qtx.270.1629873624650; 
 Tue, 24 Aug 2021 23:40:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id x21sm12248728qkf.76.2021.08.24.23.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:40:24 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH linux-next] powerpc:security: replace DEFINE_SIMPLE_ATTRIBUTE
 with DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 24 Aug 2021 23:40:16 -0700
Message-Id: <20210825064016.70421-1-deng.changcheng@zte.com.cn>
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
Cc: Jing Yangyang <jing.yangyang@zte.com.cn>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Zeal Robot <zealci@zte.com.cn>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Li Huafei <lihuafei1@huawei.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./arch/powerpc/kernel/security.c:807:0-23: WARNING:
 fops_entry_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/kernel/security.c:781:0-23:WARNING:
fops_rfi_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/kernel/security.c:833:0-23:WARNING:
fops_uaccess_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 arch/powerpc/kernel/security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 1a99849..cf8ce24 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -778,7 +778,7 @@ static int rfi_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
 
 static int entry_flush_set(void *data, u64 val)
 {
@@ -804,7 +804,7 @@ static int entry_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
 
 static int uaccess_flush_set(void *data, u64 val)
 {
@@ -830,7 +830,7 @@ static int uaccess_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
 
 static __init int rfi_flush_debugfs_init(void)
 {
-- 
1.8.3.1


