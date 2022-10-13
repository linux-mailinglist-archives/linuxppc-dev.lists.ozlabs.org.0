Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B15FDCFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpCqY4ZKkz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:19:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OY2aaJVH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OY2aaJVH;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpCmd6rtVz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:17:05 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso5782978pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deX+wmImIBYOHGRiPuvUe5tN8ZJhF2Nu1cYTTJDWBw4=;
        b=OY2aaJVH1l3+g3PR3+S/g4RcbQnAeaR3EyoWTywS31eDflhlxWxgAY28CYcx/YxEyv
         kA9WhN+bzjr8eoknVgn6ZWVtYyfVbhkMVCvxq+BchH+Sq/u1wXQsGMaZEZpgwkwXNaae
         SPjrikvWkEK1Q+duZ/iolNki66dmY/Bvyh2YYi8xesepQnP1NVVwxePbLVobqeLMY9bb
         mQMz0MwBM7708bOV7XKKNFr5+fkuu4kyitD1E7OSJ05Ut9Q0boE0yYuqmjhiQOZlHb6s
         ka8qiufeTjgdPyzobXKUBRhq6iTOJzWP+Ynuql98RPbwnki2qwUztcc6+M6wBmaxbwML
         EsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deX+wmImIBYOHGRiPuvUe5tN8ZJhF2Nu1cYTTJDWBw4=;
        b=gGTv2+fn/fdYnaSaS82QrS/NN8OhmkKP1VdFHX1O6F3UBGBmnCBJ2JNIjUoxHczEOO
         se/m5zELMIDrmRrYdcCpC/wb3u8AU4243EJaM1F7oRdxDCM7GfCYCUjfu42eRAgokpSI
         r+2l8mmNIRI7nfQsgfApmQwvs1Rqpvv+So/t4Q2sHYLtY5TZJpRME/+XwkhsUT2bG3NR
         x94F3qrE6470J16+VOChPhV+5emePNi4jzvMEDnzeb3AdRtvYQNi2BJilMz7+4Vda7sh
         C1I0soCifvr1fUKYV0s/i0V+u9QmI8dH0iLRpJMoA7lsz6JvC7v3E4oqi+qIqulFhUx1
         cdeg==
X-Gm-Message-State: ACrzQf2ZtLnxqcJb7mFJC9pmlPe9mgnUHJAW+sl+eQrVo/y8Vp8Tgt1/
	pIhUAXvZTd5+6E6txa7d/3hpTbxB8oU=
X-Google-Smtp-Source: AMsMyM422bkNLnRHYfh91FNPHiil3Jpk76CgszhJ8xSPVgzSpQd3bOzypIPCfflVfeh7RndN+fTlAA==
X-Received: by 2002:a17:902:c7c3:b0:182:7a62:4fa with SMTP id r3-20020a170902c7c300b001827a6204famr244373pla.122.1665674223030;
        Thu, 13 Oct 2022 08:17:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i15-20020a056a00224f00b00543a098a6ffsm2070977pfu.212.2022.10.13.08.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:17:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc: fix reschedule bug in KUAP-unlocked user copy
Date: Fri, 14 Oct 2022 01:16:47 +1000
Message-Id: <20221013151647.1857994-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013151647.1857994-1-npiggin@gmail.com>
References: <20221013151647.1857994-1-npiggin@gmail.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

schedule must not be explicitly called while KUAP is unlocked, because
the AMR register will not be saved across the context switch on 64s
(preemption is allowed because that is driven by interrupts which do
save the AMR).

exit_vmx_usercopy() runs inside an unlocked user access region, and it
calls preempt_enable() which will call schedule() if need_resched() was
set while non-preemptible. This can cause tasks to run unprotected when
the should not, and can cause the user copy to be improperly blocked
when scheduling back to it.

Fix this by avoiding the explicit resched for preempt kernels by
generating an interrupt to reschedule the context if need_resched() got
set.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/vmx-helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index f76a50291fd7..d491da8d1838 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -36,7 +36,17 @@ int exit_vmx_usercopy(void)
 {
 	disable_kernel_altivec();
 	pagefault_enable();
-	preempt_enable();
+	preempt_enable_no_resched();
+	/*
+	 * Must never explicitly call schedule (including preempt_enable())
+	 * while in a kuap-unlocked user copy, because the AMR register will
+	 * not be saved and restored across context switch. However preempt
+	 * kernels need to be preempted as soon as possible if need_resched is
+	 * set and we are preemptible. The hack here is to schedule a
+	 * decrementer to fire here and reschedule for us if necessary.
+	 */
+	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
+		set_dec(1);
 	return 0;
 }
 
-- 
2.37.2

