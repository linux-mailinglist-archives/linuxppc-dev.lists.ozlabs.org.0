Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF73095B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:04:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbY63ZkbzDrQh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iBNsGv+a; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLl2nxfzDrVV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:07 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id g3so7103890plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuTKtNEnNWygCzz3nD5iUHYH6UXorimSwM5ckddA6Og=;
 b=iBNsGv+a2ugCFsdyT7oejuIJgsUdmslgh/eLPzjcumYkLhTJuxO3TckRtmTQJQifT2
 90pF5G2QWXEGNJ4I5zR8IOeEJ8SjhhpeHGzTJZkW8FpO6r4/mROgXbPNcYPNP9fuo109
 /HyfoMIQC64Rgh3vjU/iJp1EMKtEtM5yoRoIjm/qoBtKlxF0/38dKupS8ZqdOeyeEmfx
 N1ZDhTteKbp7koRkv1JBmd4mMFDIRl9lCYdr1UxsX9Y5hsQ0QXS6/atr7Fzf2DOu8DnR
 IXAJjUVXRFsYlXaouJIxGVGkTxZH8Fi7aCd7uI5eLFEz8FedX95YzdDGeNZH0A8RnGcG
 98CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuTKtNEnNWygCzz3nD5iUHYH6UXorimSwM5ckddA6Og=;
 b=dTFy4+bcr96XCOfKLKwNhUcRQlfnvHQ7V7ItmWcMnseQW7/4z7F4OSUWqQzs/4F6mo
 vG8qfUBnpZgSxEoFZr/P5dqxszhEmlOAKnsCjmCNMvlVVKygM0z0G5GYtXRZUuHXd6bO
 MOIvoWm/e/y/9bdU2jj6bUsZdAIW6v9yeoSFJYzVKTk7VYOi9DJrY8ZXz0YOYbhqrfKL
 cum9jmWUPyG/6jTZof7AaiVGKYeNv2jNb4HKD2xuGjRqavC5sA5Xs6cbYcd4m4l4Twdx
 v67xOhG0noOSGTyBC9L9BthEGBJtmZutSnJTN6HYhlRJF6Kik1u8243eG/iZ2CkyEI8s
 bO0A==
X-Gm-Message-State: AOAM532oCir6MCUInJ/MkWCmBjV8V5Kc8HtVvETmg6FdBNCPxKfnoF0n
 xDR/eCVNZxC/xHkDAtzP2+dnWQByDxY=
X-Google-Smtp-Source: ABdhPJzj/5gnh9wsanHiGskJlvZTQn4QYVjupnb8X2aZ1of78DaYcsOR+GJPNbXtw0ryuY6TXNtfow==
X-Received: by 2002:a17:902:fe08:b029:de:36a1:9f12 with SMTP id
 g8-20020a170902fe08b02900de36a19f12mr9802058plj.30.1612012204526; 
 Sat, 30 Jan 2021 05:10:04 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 18/42] powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
Date: Sat, 30 Jan 2021 23:08:28 +1000
Message-Id: <20210130130852.2952424-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These NMIs could fire any time including inside kprobe code, so
exclude them from kprobes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f7370145be19..4349b25807cf 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -517,6 +517,7 @@ void system_reset_exception(struct pt_regs *regs)
 
 	/* What should we do here? We could issue a shutdown or hard reset. */
 }
+NOKPROBE_SYMBOL(system_reset_exception);
 
 /*
  * I/O accesses can cause machine checks on powermacs.
@@ -843,6 +844,7 @@ void machine_check_exception(struct pt_regs *regs)
 bail:
 	if (nmi) nmi_exit();
 }
+NOKPROBE_SYMBOL(machine_check_exception);
 
 void SMIException(struct pt_regs *regs)
 {
-- 
2.23.0

