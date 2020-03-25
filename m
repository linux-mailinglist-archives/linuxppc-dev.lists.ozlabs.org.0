Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B97192677
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:01:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQD540TFzDq8X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 22:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O/zAOFAx; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdq1f5kzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:27 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 142so946589pgf.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yX6dw6oXoJ+J/ovOsRA2OGQTH1cSyzq/EYb3+8vFOM=;
 b=O/zAOFAxnuGZB8bTj9DGPwfjS+Pu7UoVym+SoxV3OXF6MDCYnw0Ty7ZCDMgUyZZuo2
 2cTzyWbi3F++8UU4wDY20o0+3FId+SNKvN9A/8hy0p31ypTGW8FlqAUR/A8T0nFALFLj
 +sQcarOWDtik6g6XFnGjafKw8ocIcPTRoC3bF4Jgl6/l2OQXmNjNGsULSUEWbKvuzw+J
 i7Gn5SE74fSoSf1+/98rnJiBRsadTGbYKpTRQUcK09tLuh9DL4MhvBQ5UiWI01IYiavt
 zg7eSN2Tsq5f50A3JR4pLAU9HctAicFp1uvk+vHlsIpGrLYJaUSbvqMLsN75lJYENZiw
 dWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yX6dw6oXoJ+J/ovOsRA2OGQTH1cSyzq/EYb3+8vFOM=;
 b=q7xj9FCnXs4UZX353t/4CCd/VO5nLlfA5etsFNxkHHQRx2UGSQDqRwAb63UXiMBLIG
 8lc3TGgyd2AX5MGCQrlo/kalqDg3l6M/eNW4dwz6Lxdjd1jEeg0gUceL/bXJNhqxru6j
 SgVotlOV6I0MzKLbPj7B4mBmpBjbdA1z9mjHmforXryEfEh/+F+j08GTcT2iwWgK1G38
 3+37Iw1taJwi0cJvjgxNcf3/EknE9d9Iwill3J1B8hICh/6Pd+DIhA4T6oSXcZOc5RV3
 R6VfkTjJk7eoyJtTQ8ba4o6YeuaykHVmRb2LXUp3tNWrINjuYNuE5bKvN5I3BhVt04HO
 J6Tw==
X-Gm-Message-State: ANhLgQ3sy2hGJKWKXTaX51wcf1RUjMPSOlRxPd6SeqzLjL77Vpp0L2JP
 PzbUHUocacD/Ll4W2gMIMd0HpjLZ
X-Google-Smtp-Source: ADFU+vu7thGd8sl/Gg12IObwLvsghDGuAQW1Qng9Nmlb8KhofAh98D/RbigEBmOEBBd7HTyQ0mfa5w==
X-Received: by 2002:a63:7f09:: with SMTP id a9mr2411510pgd.375.1585132525294; 
 Wed, 25 Mar 2020 03:35:25 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/12] powerpc/64s: system reset do not trace
Date: Wed, 25 Mar 2020 20:34:10 +1000
Message-Id: <20200325103410.157573-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similarly to the previous patch, do not trace system reset. This code
is used when there is a crash or hang, and tracing disturbs the system
more and has been known to crash in the crash handling path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1845fd7e161a..ed7b7a6e2dc0 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
 	unsigned long hsrr0, hsrr1;
 	bool nested = in_nmi();
 	bool saved_hsrrs = false;
+	u8 ftrace_enabled = local_paca->ftrace_enabled;
+
+	local_paca->ftrace_enabled = 0;
 
 	/*
 	 * Avoid crashes in case of nested NMI exceptions. Recoverability
@@ -524,6 +527,8 @@ void system_reset_exception(struct pt_regs *regs)
 	if (!nested)
 		nmi_exit();
 
+	local_paca->ftrace_enabled = ftrace_enabled;
+
 	/* What should we do here? We could issue a shutdown or hard reset. */
 }
 
-- 
2.23.0

