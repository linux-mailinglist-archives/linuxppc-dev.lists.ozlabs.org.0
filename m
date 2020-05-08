Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 354901CA27E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 07:04:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JJCz5XfFzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 15:04:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=izouC8Dv; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYT5lNvzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:53 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id b8so172718plm.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcmEeA3fCrsZoSWvVFAC6IiBl187rnRwDL1XbREihk4=;
 b=izouC8DvODgqbCivAFemrpfaBh4ofYZ6ix0KFgpYiqNtmEt9+nRjrd1qRx7AgQiGl1
 UIJh9X+jRKS/3+2MkaEJ6+HFH3o7b960jf/gX7E3X07FM3U+DvkJkOq3lctzugPkkby1
 G2mXkG6XhYcC3eDLoMEclbLmxzHZMjVsi0znzpjNH48cjOeDrDGtwrUqAb4wBRRsE3Mg
 oNpT2Y88VqzfVwfoxKTRfNA3ur/C8o39gUI8OTeQKPLygw4X2Z2Ku5E9ztuoTURY5vz+
 58L9B9o35Y/KLazkUW4MFOQj+sFivFnH07zd2sNgy2PA4MD0aht8VQdQ2a2g5HMIY0Gm
 sY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcmEeA3fCrsZoSWvVFAC6IiBl187rnRwDL1XbREihk4=;
 b=k96oA6RIxYaBo++TBgmXEOypA1YDL8ARzv+bsRIm0LsZosVwOvOSbeZsnmBxcmTMDP
 oNF50JT44fEl1cuoAOqGdihGdGlz6X/Tuoh6VS8Vb1l5AQ0U9iUr+BGkzBlKSbSJJhEb
 3xr0MWyM4YHPvvacvgHO7LYD9nLJVyvCUIvQ5f4ejVqbQrELuhI6JUxDwvPL7THDumaP
 6TpALDXOOB7j2JT0z1LcgXmM5jkqeZ4YpWEKb/kHV380EWXUkF2KtU7wjsv4XjscZxDv
 A7AEUulkKDVqsvFE/vSAh0/sDHlcgkvQ7ddSlbuVPRBELziA3TftZC6nT4CKFK41rdIt
 XFPg==
X-Gm-Message-State: AGi0PuaAQvsICq4PGJo+iwkmo/uUVWlcWm7skucF9cMExjhA8ylnSEvN
 BL0nIZobCp2zrfAUIjzSSd4YOaMk
X-Google-Smtp-Source: APiQypIHIxJxTgN7lbzMBgYC/eNUgI1nk4Nq3em3C98ljOKzHVvW8yo7Wgs8hHj1L2XqDGSKK3my0A==
X-Received: by 2002:a17:90a:5287:: with SMTP id
 w7mr4043765pjh.66.1588912490963; 
 Thu, 07 May 2020 21:34:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/16] powerpc/traps: system reset do not trace
Date: Fri,  8 May 2020 14:34:06 +1000
Message-Id: <20200508043408.886394-15-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similarly to the previous patch, do not trace system reset. This code
is used when there is a crash or hang, and tracing disturbs the system
more and has been known to crash in the crash handling path.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9f6852322e59..ee209c5a1ad7 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
 	unsigned long hsrr0, hsrr1;
 	bool nested = in_nmi();
 	bool saved_hsrrs = false;
+	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
+
+	this_cpu_set_ftrace_enabled(0);
 
 	/*
 	 * Avoid crashes in case of nested NMI exceptions. Recoverability
@@ -524,6 +527,8 @@ void system_reset_exception(struct pt_regs *regs)
 	if (!nested)
 		nmi_exit();
 
+	this_cpu_set_ftrace_enabled(ftrace_enabled);
+
 	/* What should we do here? We could issue a shutdown or hard reset. */
 }
 
-- 
2.23.0

