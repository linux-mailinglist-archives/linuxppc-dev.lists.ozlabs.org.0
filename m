Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF243B260
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 14:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdrf923Glz2yMs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 23:26:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jeZtHWL0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jeZtHWL0; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdrdR5dtjz2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 23:25:45 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id v193so7497344pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r88a/cNPYpHqRYfkuBujE8gOg6VEkUHklHSltAN0yHI=;
 b=jeZtHWL0xQAEmjJl5Pc41TvtG6x7IGxk8F0AGDb16jMfd6a4h/PAfeRcPX69l4T9xo
 Z3QnaVWNXDAQUqBy3JYzPul8vjpNrQkulzrEXhEn/8bDVTyfYiMf1xcoZouwRvOTTSAR
 7boco4mzbLmsr2nwTpZ17TGEyHqbQ1PdSJH+OM8OKuYjeVetnuLEanA9wvrKwLemQm+y
 sbpskQ/qXTY0yN722PmKkxhJv4RFKVW46lfP9OnN+7XyR1ggaAulxmRLJWV17fSa0sdx
 A3KpcxaoiLlOGurDW7Yp5oLkPagXh8YYFq3tGsMZ1s61J9DwAWCS+xHWJ06ciV8gJXSb
 QryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r88a/cNPYpHqRYfkuBujE8gOg6VEkUHklHSltAN0yHI=;
 b=QWsKzwFOb47PYZg/4ze+nnMf07lWfutLG+OCSYhh7Mngc2KsPDdnZAxbOM7MqUrz2O
 HeEJZuEJMZJfx4AjhE05Hv+SPiRXU/emAq19tbEcnqigV5cPOEsNQ3uMSr2fEvJJ7kME
 CqLkldGOTOAV+cZOg2jNxG0e7Ak7sNMePQKPBFWJmxHgPmQQOTbT+jen4Xyyjq2VJXgO
 GAVP5HGfoLx+1nTmXv9xF3nMfPPPPuupYqCpMrYxOmzQ7rWWvMHmJ+2p3ZZmZMnH70Pj
 tvwgJ+nCvjb3ShqOcdNZSuHV1SpUxW/6MvegKSURIxxaSMFX726Oplr05xCiyOfN0EtW
 0i3Q==
X-Gm-Message-State: AOAM531RseDqIe3DMz6w2dlltnN9LjWihaUJLL/yZzdJVgodpBMm7810
 XuU8CDIcS2GU2MqJDxEKPxfLrHRx6+k=
X-Google-Smtp-Source: ABdhPJxdRCUe8VBgCUA6OWNztJpDils/65tCw+qSdCVpNH8SlhtrkRFq2sAQfp9x2w7uEH6oxEjEaQ==
X-Received: by 2002:aa7:90d0:0:b0:44d:b8a:8837 with SMTP id
 k16-20020aa790d0000000b0044d0b8a8837mr25601395pfk.47.1635251140621; 
 Tue, 26 Oct 2021 05:25:40 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id u4sm666155pjg.54.2021.10.26.05.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 05:25:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/64s/interrupt: Fix check_return_regs_valid false
 positive
Date: Tue, 26 Oct 2021 22:25:31 +1000
Message-Id: <20211026122531.3599918-1-npiggin@gmail.com>
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

The check_return_regs_valid can cause a false positive if the return
regs are marked as norestart and they are an HSRR type interrupt,
because the low bit in the bottom of regs->trap causes interrupt
type matching to fail.

This can occcur for example on bare metal with a HV privileged doorbell
interrupt that causes a signal, but do_signal returns early because
get_signal() fails, and takes the "No signal to deliver" path. In this
case no signal was delivered so the return location is not changed so
return SRRs are not invalidated, yet set_trap_norestart is called, which
messes up the match. Building go-1.16.6 is known to reproduce this.

Fix it by using the TRAP() accessor which masks out the low bit.

Fixes: 6eaaf9de3599 ("powerpc/64s/interrupt: Check and fix srr_valid without crashing")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index de10a2697258..835b626cd476 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -266,7 +266,7 @@ static void check_return_regs_valid(struct pt_regs *regs)
 	if (trap_is_scv(regs))
 		return;
 
-	trap = regs->trap;
+	trap = TRAP(regs);
 	// EE in HV mode sets HSRRs like 0xea0
 	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
 		trap = 0xea0;
-- 
2.23.0

