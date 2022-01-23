Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB1497167
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWwM6mGXz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:03:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fcDDhjXm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fcDDhjXm; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsl4Tscz30L9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:00:59 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so14865727pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4xR3TS91zgcBZ85aXBYhNtHQB+CZdym7DTGkw0qUy4=;
 b=fcDDhjXm4sEo8A3AV+fFPZ/JMgaAuox6cZhzIOyeBcIQ//Xxof/IXRf5tXDNSa4QKQ
 S0H8v2EVCFiBGz0A/YKOfoKvhX8A4cZZiDIayz5mQlPL+ElJ4TM5uaq6h4WYoAJLdhaE
 BbMnZvIMKzKj+T8QfVR30KvDzLYJPY334IWPmopJXWKX1gQngvcFBqna9CYgv/hiLv5N
 Jd9l6ITgoGuZIB3st+/wH+HaKhgivN01G1VkQsO7gZto8bqbnBs93nOo8U5d2hR4euJG
 xzDzmQ6LOgdJJK/5uV+YKTQlzIXLHWEvmqu+A7vzq/FYHoT44NU+pFYYs0y5XnclKCDu
 8few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4xR3TS91zgcBZ85aXBYhNtHQB+CZdym7DTGkw0qUy4=;
 b=lbAPB+z1vU8ZfTM4yPGLSqLCb9qWy0qnmTr9YAonYobgvCTr6fEv6SDtUIeBGh/5wT
 guoDKu9coUp+1HC6GhZ9Dnqn4u5wMxpqZmzde+KBdRqGAeUSP94+jzu7urPH+0Jr+hhE
 KIaiEyRsoah9Ls3y992redIb5YrBA4ISU1gY1rTx67qDmovF1EtRkSsVRs+esKjg69Bu
 BUpyVMmSzlJtoRce3Jx2avJ/mO7/HuW5u3SqqjD8o8SswR+l4eNyGazmhiCiBYEjoBhF
 OsnGLf7Wx8B8NRLdXNPjl/Ti65/WVFATQYHUCQ1oVnOdT+24E+xJMNQZDfEcFp8rJvKa
 Jbvg==
X-Gm-Message-State: AOAM531vwk4xicC/wAwPc3H3WLlGOeaQKej4zfcgYIzt3sbWysMWdFtZ
 bVn1BkDJ37e7EkTdLasuJz4a0B5lZMk=
X-Google-Smtp-Source: ABdhPJwKww+AlEjADIpc2gysXP+M4QHKXmJnQRyWEIlQHDSrcmBT9m0Gb1zoG1vj4H2rBMQ1wLl3cg==
X-Received: by 2002:a17:90b:3906:: with SMTP id
 ob6mr1040568pjb.5.1642939257548; 
 Sun, 23 Jan 2022 04:00:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:00:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] KVM: PPC: Book3S HV: Use IDA allocator for LPID allocator
Date: Sun, 23 Jan 2022 22:00:40 +1000
Message-Id: <20220123120043.3586018-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220123120043.3586018-1-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes the fixed-size lpid_inuse array.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 102993462872..c527a5751b46 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2453,20 +2453,22 @@ long kvm_arch_vm_ioctl(struct file *filp,
 	return r;
 }
 
-static unsigned long lpid_inuse[BITS_TO_LONGS(KVMPPC_NR_LPIDS)];
+static DEFINE_IDA(lpid_inuse);
 static unsigned long nr_lpids;
 
 long kvmppc_alloc_lpid(void)
 {
-	long lpid;
+	int lpid;
 
-	do {
-		lpid = find_first_zero_bit(lpid_inuse, KVMPPC_NR_LPIDS);
-		if (lpid >= nr_lpids) {
+	/* The host LPID must always be 0 (allocation starts at 1) */
+	lpid = ida_alloc_range(&lpid_inuse, 1, nr_lpids - 1, GFP_KERNEL);
+	if (lpid < 0) {
+		if (lpid == -ENOMEM)
+			pr_err("%s: Out of memory\n", __func__);
+		else
 			pr_err("%s: No LPIDs free\n", __func__);
-			return -ENOMEM;
-		}
-	} while (test_and_set_bit(lpid, lpid_inuse));
+		return -ENOMEM;
+	}
 
 	return lpid;
 }
@@ -2474,15 +2476,14 @@ EXPORT_SYMBOL_GPL(kvmppc_alloc_lpid);
 
 void kvmppc_free_lpid(long lpid)
 {
-	clear_bit(lpid, lpid_inuse);
+	ida_free(&lpid_inuse, lpid);
 }
 EXPORT_SYMBOL_GPL(kvmppc_free_lpid);
 
+/* nr_lpids_param includes the host LPID */
 void kvmppc_init_lpid(unsigned long nr_lpids_param)
 {
-	nr_lpids = min_t(unsigned long, KVMPPC_NR_LPIDS, nr_lpids_param);
-	memset(lpid_inuse, 0, sizeof(lpid_inuse));
-	set_bit(0, lpid_inuse); /* The host LPID must always be 0 */
+	nr_lpids = nr_lpids_param;
 }
 EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
 
-- 
2.23.0

