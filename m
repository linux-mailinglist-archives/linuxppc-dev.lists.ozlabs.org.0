Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A37F5C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:10:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PbR4CH0zDqc1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PvD1TMdG"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PLw4ThjzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:52 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r1so35852149pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XdGy2i8bk4Bqf0fGYwGlXi8P8nJz3KLNviVMeWvHUdE=;
 b=PvD1TMdG6h8rm+ALOmULszyhvpi16UCoLWJqfLuYFi4ata8XoFe39Eba4IiXPdx4i3
 aZIa58XJTV7bideXDXn2NcfA86/IsmUQE0Zx9mUfpSv8ZDji1SyiPunUOrljIn2N4Fl8
 LTBhwO2zlUC/dldritqRktL39P8yH07B5CT/7rg9gbZ0mpoFQPLJK3JYYlYcqqDrCOU+
 QFnuSefo/ItmEymgHU9EYpwf5/fizGQERvl64p2sYCqdIlMYKSPnfzwglyYtkZKA6VDu
 wjeDtA0l/0SprJlhmbuGHkUkPQ5ukQzemsJobI8QVAWfXYOLeU5xZOit6dya0dXOkNKj
 LaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XdGy2i8bk4Bqf0fGYwGlXi8P8nJz3KLNviVMeWvHUdE=;
 b=W3uFQ9ctBTDAZMWDy2rUXMgXraYpJVWDskc1rFIczbg+VTcpCtU78boVvp0VZorLGh
 2ouFVI4Kw3G/smUJAPhP/wbFF6Ekca5S61BYwWxShm7G3a3O6zf1ZDWzjC6upGJbueIx
 YgJcTlMAR57i9z/WqT5Njm3DRs9+0d21ElWiTxPfY7CTHqtu6Y03Nti4DOvGvHhEW+YA
 q1jpGHehqFMX/z00NimNHRaDMUe7bbWU6UW71mRxcSws7UNQqa9ySSuvJz7rUZ4n9+ni
 Quc0XVXPN6eWSl5xts9ENw8gzbUKu+xEDmgxK9QSvQJmrAnTgqSze2gkrJdY8CoOTcNP
 hBRQ==
X-Gm-Message-State: APjAAAVVQ3AQGzfa26aEDxRnrmbfkOOD2xkiwiLMqm/Vu1vhrhWYc5rb
 yRxojkzBU5e3TL8p4UYcoZrfK5DYay0=
X-Google-Smtp-Source: APXvYqzZVichpWUHjVjMIUWxv0J59X870nLZEsIEGwgCJMnok2y6Be9umr7mjkpnwbV3jzKuaYlQVg==
X-Received: by 2002:a63:fe52:: with SMTP id
 x18mr123885561pgj.344.1564743590707; 
 Fri, 02 Aug 2019 03:59:50 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/44] powerpc/64s/exception: machine check adjust RFI
 target
Date: Fri,  2 Aug 2019 20:56:29 +1000
Message-Id: <20190802105709.27696-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

The host kernel delivery case for powernv does RFI_TO_USER_OR_KERNEL,
but should just use RFI_TO_KERNEL which makes it clear this is not a
user case.

This is not a bug because RFI_TO_USER_OR_KERNEL deals with kernel
returns just fine.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e00cffb25517..dbd1a8c68636 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1184,7 +1184,7 @@ BEGIN_FTR_SECTION
 	 */
 	bl	machine_check_queue_event
 	MACHINE_CHECK_HANDLER_WINDUP
-	RFI_TO_USER_OR_KERNEL
+	RFI_TO_KERNEL
 FTR_SECTION_ELSE
 	/*
 	 * pSeries: Return from MC interrupt. Before that stay on emergency
-- 
2.22.0

