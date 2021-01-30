Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A10CB3095B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:08:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbfF65xZzDrRH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:08:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a5F9aabn; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLr2fTbzDrS4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:12 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id u11so7067153plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMdoj0wQ9tAdaFDLpkWxZpb7QCzY+FwQMv5Ch1ewqTw=;
 b=a5F9aabn90Y7vVlP/VYJO+9ykGlXlxxY6v3PUuNrzbwUFwOGr2VOMnCDUDKT6O40rT
 i2VmcDTR1rq7wIavS+Sqkb3B90g5Uk89t7CWYmkUoe9eqbv5YrNfmXzAzG8ymEAqBUux
 26Bkddd05u9NW4Cz0DgOQx8HaO477D+WhRLtulPcoGoyLo2I+uIB3yY4h2DsGEnEJ2aJ
 e2JvT6rXaZCwV8wofCEAUvvb7CFnKlW3oPaTc1StWzo3eGpfTSW8lVzUMXBNMlL2jJ6x
 mmRcpVycxl0NFiSxsEXos14WfMyghAHTRCB07aKQnqKG913ScK6Euk9pSc0IsT9ajXUW
 5TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMdoj0wQ9tAdaFDLpkWxZpb7QCzY+FwQMv5Ch1ewqTw=;
 b=PfjEOTup08HVVkGWIrbcICU6EBZg8KEGETbK4iakSbWncYfCirIQzQoSl1/hiqXkCF
 /SRB/3GHO/HOBuV6vi9pUIKyyuQuoB5do0F8N387Bbs6d8CCpfYFv1+xDlhDeQFrn5Zh
 f7KSTdTZkYVgETNo4KxdhRdxr9G96hmFPcXtrvacc2YcdkQN6ISx1ChgFJanGOKxZMcw
 4dfWmLy1T/SflX1JlUW2d64gtBttmkFq3FBul8BO7exdxREymp68G/0wSqGeIz+VAQTE
 OgovfwLKpYUjCn1gVfqMpcCI8m6MSwOAD/x6vTCYC0yTTCUYT+YaLvloM8Zk5GXGFeI/
 5lDA==
X-Gm-Message-State: AOAM533MEze/WBr9VgNLAhlGmTIOXcaS1FsOrrH8a+MedCxW6IMeh0EO
 hK9XFZ79nxSCLBQOkoajFSfzQlEAGbc=
X-Google-Smtp-Source: ABdhPJw8T709veEgNtBp3GV441Iy+VdZJbgia+pDBJs1QSbtBdcV0a5t4FWEhxgxNMDgxytr22rxNQ==
X-Received: by 2002:a17:902:ed94:b029:de:8844:a650 with SMTP id
 e20-20020a170902ed94b02900de8844a650mr9820203plj.56.1612012210389; 
 Sat, 30 Jan 2021 05:10:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 20/42] powerpc/time: move timer_broadcast_interrupt
 prototype to asm/time.h
Date: Sat, 30 Jan 2021 23:08:30 +1000
Message-Id: <20210130130852.2952424-21-npiggin@gmail.com>
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

Interrupt handler prototypes are going to be rearranged in a
future patch, so tidy this out of the way first.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 1 -
 arch/powerpc/include/asm/time.h   | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 0363734ff56e..e5def36212cf 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -54,7 +54,6 @@ extern void replay_system_reset(void);
 extern void replay_soft_interrupts(void);
 
 extern void timer_interrupt(struct pt_regs *);
-extern void timer_broadcast_interrupt(void);
 extern void performance_monitor_exception(struct pt_regs *regs);
 extern void WatchdogException(struct pt_regs *regs);
 extern void unknown_exception(struct pt_regs *regs);
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8f789b597bae..8dd3cdb25338 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -102,6 +102,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
+void timer_broadcast_interrupt(void);
+
 /* SPLPAR */
 void accumulate_stolen_time(void);
 
-- 
2.23.0

