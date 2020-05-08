Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D281CA27C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 07:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JJ834V7rzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 15:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f0ckAY02; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYM6hr5zDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:47 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id h12so4716501pjz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97tVG3Nrr/SUF+KvqYgAkkXmjtBloRod9FRCzx7QFhc=;
 b=f0ckAY02IWBf3eTwO9U2DdrgT1PQjNQOy1jt7Nr1ySCukpNJuDDhM4jIldQxDH2dlr
 z3AMtSGo3dGyfHXfWMZiTmi1cMOpq1XEaxCsWvgrHs4qv9mm90Ir6fa33G2FRc7BVb94
 /pFpAshIMdgFtNETOYF4OeV/ro1yRYks7TCUgd0IXu0jsdOqfhfnkCsVuPmhVJ3gSrT1
 L50uNEEg3gy9u09wr1h/01Ryd6LPkX82tuCuxXGEfj/PGdQRaCk6+MFHLOsbQIlilT6p
 ErVij7OewwtifsmLK6Ii85szAlw9D8+AYR16Tt6HNM4zusvHvmkow3/Ic8778kGwSXuI
 Uv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97tVG3Nrr/SUF+KvqYgAkkXmjtBloRod9FRCzx7QFhc=;
 b=jJIhuMGL2JXmJvlUq9QGSDMsiNMqzi5hQ/17EagNGFVvOZYusHLU8t++Ezsn2qc0YI
 Y59rUs0LRcMQ0wz1R6V22Cx6GK7xNFBkzpW+1UrYLIBzDZpnogxRL2x9mOtwcEIkuaRP
 lznynE5jYQm2v/C80dKifYmHqzVRxDIZeaXRH4ut0v/Knz8UTvX4se2fyqrDUwwMQqOK
 107n1graA32iVGKIziqXc1TvZb/9FzrJTJHCXt26tCz9ylMSG2YH6jXMdIdLHljEg75F
 I5UmhJlHRBWVeHRBEvJ9tnzLuMMfSD8zRrY6Ult41gvEX7gHpzs/aU03qQRWYKFPXkAM
 1q+w==
X-Gm-Message-State: AGi0PubXrApsYo3/o6afpiymPMBJgPI10OnrYPZMrB4hDdqm1YkWtXLN
 1AnJoFbYkklQtqn7IrBNJbHLjiIh
X-Google-Smtp-Source: APiQypINc6Uhwrr/OXeqEvbDDnhN1AIoSwghNqZCJf2UAe2Gvd+kagyH1WbCCyZgJ1354QlC6P5xgA==
X-Received: by 2002:a17:90a:a00a:: with SMTP id
 q10mr3852388pjp.103.1588912485372; 
 Thu, 07 May 2020 21:34:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/16] powerpc: implement ftrace_enabled helper
Date: Fri,  8 May 2020 14:34:04 +1000
Message-Id: <20200508043408.886394-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/ftrace.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index f54a08a2cd70..bc76970b6ee5 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -108,9 +108,23 @@ static inline void this_cpu_enable_ftrace(void)
 {
 	get_paca()->ftrace_enabled = 1;
 }
+
+/* Disable ftrace on this CPU if possible (may not be implemented) */
+static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled)
+{
+	get_paca()->ftrace_enabled = ftrace_enabled;
+}
+
+static inline u8 this_cpu_get_ftrace_enabled(void)
+{
+	return get_paca()->ftrace_enabled;
+}
+
 #else /* CONFIG_PPC64 */
 static inline void this_cpu_disable_ftrace(void) { }
 static inline void this_cpu_enable_ftrace(void) { }
+static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
+static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
 #endif /* CONFIG_PPC64 */
 #endif /* !__ASSEMBLY__ */
 
-- 
2.23.0

