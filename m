Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B537712B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:16:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcjs538d9z3c2f
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:16:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r6XBNn4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r6XBNn4u; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcjqh6fCSz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:12 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id t1so301723pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 03:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=appeh6b/9mh2gzWfkNrzj3fZQMgZjGgyNb+/J8JxoHg=;
 b=r6XBNn4uCqEpgpUC/Wfp1FDTQSD6OBMByQFuIrCwRHZcioel05LBvzQxdU5cfkZ708
 jLgKiD6vcFhcr7cyDDu1r7WbpC18JpLaWy4FwhzSkRnav09s+f1oFW6Ik9CG9AZGrRZB
 B5OPWiJYf8j3Iyz0N/ub2xvy0JCM/u9uFjqqjmplYvwUBX9ezar2LVy+ZlGQg9Fesl30
 U/kxE684im9ugof2IefXJ+KT0LqAF3f2RC565fr2eiF8+xV/HiKTlBwlYRBX3zF/mbHg
 5sGohM0zmlFm/mhIjzFpPjakIECt2eCkKfHTEvjsiZ1/+07cjbGsYJ5ABwyDMhcJP7Lo
 SQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=appeh6b/9mh2gzWfkNrzj3fZQMgZjGgyNb+/J8JxoHg=;
 b=eU9Pl5xZLZMcfbUxIA+gg4ESEsytdqBeTyleTcPsA/zJ8+jLQMBgRmxmRi/O2NBPOR
 HXyRnuSfWKU2YYNN8YcDzt7Fd8amcDgzhcrt6GhfkvZaAfhxXd03NX6KcKexZ3wGaj8B
 kVti9oMgX7QRhZUlpkvC8NOZMWui1L3MRSWaqYjfWzzo6dLMP6N6Yp1T1xZIdbg1SlRy
 HodhDXZoKrwHQ7aDDWbjER7CqHuxb1iSq5U1GqAHzjlj/SAjwdbJmBS+jBNteizWFisy
 VmG7HJjakxbRyGc/gMEGwlogSLxc3If7I37UC+S5iZpotdqapRDO7CMdq2d7JBZjZlvr
 mUdg==
X-Gm-Message-State: AOAM531yPjcPogoxa+KeahobGtaoNHumdcNeUAQHOkw9iW9AbwN5c1eA
 bQr8y3rO1fhRujAgWgjVWlq1OedE5fcvMw==
X-Google-Smtp-Source: ABdhPJygLh+bZTLvJ8g8bBC8mLzI2xZjmRd8HZNxX7W4ZBRHPiljif+U68bf+wuzWDVy191QwbFDgA==
X-Received: by 2002:a63:ff25:: with SMTP id k37mr15063883pgi.360.1620468910606; 
 Sat, 08 May 2021 03:15:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id
 c13sm6608465pfl.212.2021.05.08.03.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 03:15:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/pseries: Don't trace hcall tracing wrapper
Date: Sat,  8 May 2021 20:14:53 +1000
Message-Id: <20210508101455.1578318-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210508101455.1578318-1-npiggin@gmail.com>
References: <20210508101455.1578318-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This doesn't seem very useful to trace before the recursion check, even
if the ftrace code has any recursion checks of its own. Be on the safe
side and don't trace the hcall trace wrappers.

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index b619568a4d04..d79d7410c320 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1835,7 +1835,7 @@ void hcall_tracepoint_unregfunc(void)
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
 
-void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
+notrace void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 {
 	unsigned long flags;
 	unsigned int *depth;
@@ -1863,7 +1863,7 @@ void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 	local_irq_restore(flags);
 }
 
-void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
+notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
 {
 	unsigned long flags;
 	unsigned int *depth;
-- 
2.23.0

