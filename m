Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09C4909B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 14:44:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JctSP030hz30M9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 00:44:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JM3OjL3s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JM3OjL3s; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JctRf6Pnzz2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 00:44:12 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 78so10242235pfu.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf+DgQdiFNr8Rdn+2dytNGkE5P8yof5aHA8sdbcT7v0=;
 b=JM3OjL3sebSF4pUprxpj8F0sRUQ08yFJV5Au/BwbFS+m6PM6kGVfdndQfr658lsvFw
 dIDvarIzIjQPP6l2CIbGUJYNKEbYfJYY0q75qGN/5/zBgimaOkJtl560lPS0Y+YsE4ko
 k8E/4vi2veNNAocPozuUwSvzuO+qQPzi7cjNS6vLGXzi/KZc5gchSN4U58c4a7vj0S8Z
 SFArb6lFh0ndr6qsXzUKCsiHUhDIbc7lWBcd24ZmKpS08sn8FQ9A3TIE2WSefUBwKmjp
 7tzcmVDQT93rh4jLeU5E2jFVNkQceXdiv5CUQ9Z2rnz2PLmxWDn2e6BBJ6xnleMY9Zwe
 gNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf+DgQdiFNr8Rdn+2dytNGkE5P8yof5aHA8sdbcT7v0=;
 b=psj8IopkQCgrjL0/71xtP7CdLNlRw0hXyhV+k7DzbXP54UdfXDRSoxD8A08wCfUWZs
 CGaxBfIhgH9C4qpMSBHAnPbQtb825rSB3oYmT2CiKiP9RCNFjLQOs5YxA55+z1btoCYI
 IRSSQlS2M7vq/TxEMJnVmLOJFjw6HoZPjiWXgAjYfYX9nwv4K5dgQ7LrpIJUDsZ3UjV1
 ovzZL9paPIkz1T2FftRURWh8INS2ggsZGna/mfvPE4A8yJl4XLAkecE9bW+LqcS17qXc
 FwFlJxv9Laefn+TWvmzXNDDyXOcV2bxOi2jpNGTwyHapkb/iUXgEdBwgDsPKXYPboV8b
 dzEQ==
X-Gm-Message-State: AOAM530M0WcIuV5c7bEIP4BBrIHjzR7da2xxVDFlqMbS+RsIKrR0gZN9
 OnlEAynhyDNUBliCM64Swq3hG4ZHe3g=
X-Google-Smtp-Source: ABdhPJx4GOkka7b/I7DZyfzLBm9ymE31Mqu08kIQ905N05ILW4X0HXQf75SYVbq3xglOH8/H4lxFFg==
X-Received: by 2002:a63:374f:: with SMTP id g15mr19245830pgn.469.1642427049826; 
 Mon, 17 Jan 2022 05:44:09 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id ip5sm19664371pjb.0.2022.01.17.05.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:44:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Mask SRR0 before checking against the masked NIP
Date: Mon, 17 Jan 2022 23:44:03 +1000
Message-Id: <20220117134403.2995059-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Commit 314f6c23dd8d ("powerpc/64s: Mask NIP before checking against
SRR0") masked off the low 2 bits of the NIP value in the interrupt
stack frame in case they are non-zero and mis-compare against a SRR0
register value of a CPU which always reads back 0 from the 2 low bits
which are reserved.

This now causes the opposite problem that an implementation which does
implement those bits in SRR0 will mis-compare against the masked NIP
value in which they have been cleared. QEMU is one such implementation,
and this is allowed by the architecture.

This can be triggered by sigfuz by setting low bits of PT_NIP in the
signal context.

Fix this for now by masking the SRR0 bits as well. Cleaner is probably
to sanitise these values before putting them in registers or stack, but
this is the quick and backportable fix.

Fixes: 314f6c23dd8d ("powerpc/64s: Mask NIP before checking against SRR0")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 92088f848266..7bab2d7de372 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -30,6 +30,7 @@ COMPAT_SYS_CALL_TABLE:
 	.ifc \srr,srr
 	mfspr	r11,SPRN_SRR0
 	ld	r12,_NIP(r1)
+	clrrdi  r11,r11,2
 	clrrdi  r12,r12,2
 100:	tdne	r11,r12
 	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
@@ -40,6 +41,7 @@ COMPAT_SYS_CALL_TABLE:
 	.else
 	mfspr	r11,SPRN_HSRR0
 	ld	r12,_NIP(r1)
+	clrrdi  r11,r11,2
 	clrrdi  r12,r12,2
 100:	tdne	r11,r12
 	EMIT_WARN_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
-- 
2.23.0

