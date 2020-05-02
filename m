Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A61C24F2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:52:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnXp1wd4zDqpR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:52:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lg9Go0uU; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqx4RkBzDr74
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:13 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id y6so1163468pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0wEJ5HZ8r+nRVrRsZHlmhZc+GWjXfB9g8N+4FHcUtA=;
 b=Lg9Go0uUTM0zYUvHq0fhRIPjYQoHcTVTPLGp5ZQsNBUkoLybEVVZwwUtu8O7wIMMQN
 jGeOjrDSlhvT5ao+rUdGb/M6E/sggR0tP4NkkhQSCwpau/cwb0CDAHANwA0zK+KqMw7x
 rWjLQfVwcLrnAjU1AhGNoV2il3KqQz2iDbOfJKuxADoHQEeuCUCCEV30y9b+a7pfPxwj
 NPFkAxwnCIRVqqZ9EZUf70TQEXgnc/slKFr7eqlNg0ZI9rpQzbs+Su+DfmsbTbnoeGMP
 33BDlFddONcnILQJHAxVkyrhtbxWNS/SfP6uQ+garVUiaZMuqI9nGAus5EyEWrsSfSSR
 LvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L0wEJ5HZ8r+nRVrRsZHlmhZc+GWjXfB9g8N+4FHcUtA=;
 b=FhtLZ+dDZYY7SZLQiGDo5GxjS5j+G3l+GWuHGQ+X/ZzNYZpafM72uqov5UY7eXsZId
 9qqwswQV8MWDbPbwSWE/oFyJm11nkZYrz9zahI0uyhUUPzygEzQkarPIptS5z7cQ/n5O
 Z/MXF0AayJRgVPu/w36wZpqhUy63O7alCsEbne7ONd8343P+oZE1g+Wn3cd35WRnW5ol
 +5PDSY1vHKlqGLtDAEMgckYCkv8S6h8BC73lu6KfTDCKOBzWnlyV2y6QnWnyo8LZjGBP
 Duamct4R3Mb6LVuLNGxuQoZS64iZyhbC0Zu1XcDRFiaUuYGFTJdeLRvQtEFl3fUT6dvT
 WgPw==
X-Gm-Message-State: AGi0PuZlQ0dv5UcOzT3n747aY3oiTPodg3cJouWS4K3W3kAMAVo1EwoK
 noWOhzCJvgNuZe2XSMeOxRvBto6z
X-Google-Smtp-Source: APiQypKByZ7XJEQWyJg/EXBQqC+/j5ld2sdrdZ3EwO5WANV0aSE4ZmN/OY/dwVRm6nkyzXkK3ASoHQ==
X-Received: by 2002:a17:902:ac97:: with SMTP id
 h23mr8682855plr.89.1588418411026; 
 Sat, 02 May 2020 04:20:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 07/10] powerpc/powernv: Add OPAL_FIND_VM_AREA API
Date: Sat,  2 May 2020 21:19:11 +1000
Message-Id: <20200502111914.166578-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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

This will be used in the next patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/opal-api.h        | 15 ++++++++++++++-
 arch/powerpc/include/asm/opal.h            |  2 ++
 arch/powerpc/platforms/powernv/opal-call.c |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 018d4734c323..0be5ff4e51b5 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -217,7 +217,8 @@
 #define OPAL_ADDR_TO_SYM			181
 #define OPAL_SYM_TO_ADDR			182
 #define OPAL_REPORT_TRAP			183
-#define OPAL_LAST				183
+#define OPAL_FIND_VM_AREA			184
+#define OPAL_LAST				184
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1189,6 +1190,18 @@ struct opal_mpipl_fadump {
 #define OPAL_TRAP_WARN	2
 #define OPAL_TRAP_PANIC	3
 
+#define OS_VM_FLAG_READ		0x1
+#define OS_VM_FLAG_WRITE	0x2
+#define OS_VM_FLAG_EXECUTE	0x4
+#define OS_VM_FLAG_CI		0x8
+
+struct opal_vm_area {
+	__be64  address;
+	__be64  length;
+	__be64  pa;
+	__be64  vm_flags;
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index dc77c2d5e036..199b5582b700 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -405,6 +405,8 @@ void opal_powercap_init(void);
 void opal_psr_init(void);
 void opal_sensor_groups_init(void);
 
+int64_t opal_find_vm_area(uint64_t addr, struct opal_vm_area *opal_vm_area);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_OPAL_H */
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 32857254d268..e62a74dfb3d0 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -332,3 +332,4 @@ OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
 OPAL_CALL(opal_addr_to_sym,			OPAL_ADDR_TO_SYM);
 OPAL_CALL(opal_sym_to_addr,			OPAL_SYM_TO_ADDR);
 OPAL_CALL(opal_report_trap,			OPAL_REPORT_TRAP);
+OPAL_CALL(opal_find_vm_area,			OPAL_FIND_VM_AREA);
-- 
2.23.0

