Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D843E42877
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:11:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P81g61nvzDqkc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 00:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ex0XtZdJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P7w63K26zDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 00:06:45 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id r7so3852652pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJRJvDGs+SYX6gnssKjr/R4V03h6R8rFXBvNGB/Px7c=;
 b=Ex0XtZdJ0WwJmKGOyjFToqBf1/Tb3VMWVX5iknK/O2KNw4RApBbQKo0VwylA9XCyDH
 LDvpSsuqaEcZKyA2cgx1FQY49u1+AnZV1wyqGxZBLCQShCSgZjWyaALC4w6v6EyLoGS6
 9VITahzv7g82sYQ0qAochAElJuNUinRbgBHmQFJ55pGsD2tOJcXHAcYIH9JCY0cytifZ
 gZ4dbxDeXa2BqqHU7BMGSrU+pEBjmmz5uuWLZvOMdkQ+drPOaxjIBiltf6kbLAIz7Btu
 58j5GCVixJNYTAh7a66wqSakHX2XJMW1ZPFOSMWHDw4UjeJ5Ra+hzBEleJeIn/EU5jGd
 ziuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJRJvDGs+SYX6gnssKjr/R4V03h6R8rFXBvNGB/Px7c=;
 b=UGmM8xxrgKXFv/VnFs/e3iMnTZDY9FmQl9tTy6z3vA5bw3lGTR97XS8LIdpDQtfsyL
 wQMcL8tDaQaLywe3G01rT+Y0qVA6hxzkJyDFq4SdSLFUqB7dumE0y7OS/pK0K8NG8QFq
 fxMoJo2/jj7RrluNHhiFtN3EZzvNDFwOo5q7bVY3Eled/hld07ylYU10QHUBi+y8BhOA
 tuylcpJaXgShEItGIA7SH1ZZAcM0xILueV0wROSNneESA2Dj4Bc5pNeyJuHu7SKVChSv
 7j9aZMxtVZfxCdcezsavuh1Jj22kQs4AArS32a9Tk62cpxcOm/XPnAQlSx6aPKMwTqjV
 9jPg==
X-Gm-Message-State: APjAAAXOUVm4fQAeNg8tDKYmVM6L4cpQXh0cFQtMMtgTyf8sNFyS1B3m
 gvAFstQhdQ56FSvYzhblan5jVvGJ
X-Google-Smtp-Source: APXvYqy1zcuzuReMm+Nfmfx+6V8NfMWFkN3numk9qoIk2YlRlMSobHgSlndj2C51hGSY6BjE0qhYWA==
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr32531612pjp.51.1560348401875; 
 Wed, 12 Jun 2019 07:06:41 -0700 (PDT)
Received: from bobo.local0.net (193-116-86-57.tpgi.com.au. [193.116.86.57])
 by smtp.gmail.com with ESMTPSA id z186sm17923553pfz.7.2019.06.12.07.06.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 07:06:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: allow compiler to cache 'current'
Date: Thu, 13 Jun 2019 00:03:17 +1000
Message-Id: <20190612140317.24490-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

current may be cached by the compiler, so remove the volatile asm
restriction. This results in better generated code, as well as being
smaller and fewer dependent loads, it can avoid store-hit-load flushes
like this one that shows up in irq_exit():

    preempt_count_sub(HARDIRQ_OFFSET);
    if (!in_interrupt() && ...)

Which ends up as:

    ((struct thread_info *)current)->preempt_count -= HARDIRQ_OFFSET;
    if (((struct thread_info *)current)->preempt_count ...

Evaluating current twice presently means it has to be loaded twice, and
here gcc happens to pick a different register each time, then
preempt_count is accessed via that base register:

    1058:       ld      r10,2392(r13)     <-- current
    105c:       lwz     r9,0(r10)         <-- preempt_count
    1060:       addis   r9,r9,-1
    1064:       stw     r9,0(r10)         <-- preempt_count
    1068:       ld      r9,2392(r13)      <-- current
    106c:       lwz     r9,0(r9)          <-- preempt_count
    1070:       rlwinm. r9,r9,0,11,23
    1074:       bne     1090 <irq_exit+0x60>

This can frustrate store-hit-load detection heuristics and cause
flushes. Allowing the compiler to cache current in a reigster with this
patch results in the same base register being used for all accesses,
which is more likely to be detected as an alias:

    1058:       ld      r31,2392(r13)
    ...
    1070:       lwz     r9,0(r31)
    1074:       addis   r9,r9,-1
    1078:       stw     r9,0(r31)
    107c:       lwz     r9,0(r31)
    1080:       rlwinm. r9,r9,0,11,23
    1084:       bne     10a0 <irq_exit+0x60>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/current.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/current.h b/arch/powerpc/include/asm/current.h
index 297827b76169..bbfb94800415 100644
--- a/arch/powerpc/include/asm/current.h
+++ b/arch/powerpc/include/asm/current.h
@@ -16,7 +16,8 @@ static inline struct task_struct *get_current(void)
 {
 	struct task_struct *task;
 
-	__asm__ __volatile__("ld %0,%1(13)"
+	/* get_current can be cached by the compiler, so no volatile */
+	asm ("ld %0,%1(13)"
 	: "=r" (task)
 	: "i" (offsetof(struct paca_struct, __current)));
 
-- 
2.20.1

