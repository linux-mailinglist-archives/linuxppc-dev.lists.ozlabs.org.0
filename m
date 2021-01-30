Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5F3095D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:17:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbrT19khzDrSg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:17:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vn9wNA+5; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZM70TMRzDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:26 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id g15so7827361pjd.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5iFJn/kfkQSpg1w/GiE1Co8mx7fCauj/LpwyjzRdTQ=;
 b=Vn9wNA+59tvY3m74WITTf02EC2SOeaWRxo3mjZkQk4+h1olBCbGjra02clA1OqJmrH
 EASgofb+cJDRE5RHRHcFg82P1yugnfny/1cr8kWbtPEmLCvB8Iwd/Nm1WsCTnHyAShrk
 fpc3NvVZj3lCTB5hmuu5bqw8TChTW//7YWcPrJgojlFXhtOJq54TkiAO+VYEd4VDr9Sy
 HIMKkPoHJJWfbUVaur5MGe6GcgUCeyb0DJ3gCmGzb6GC3Y7vpPH3qq23T9KCfSFsbxP8
 ONBUV12oYBRpBcMqMTilqi5tfJbT94rkByuBSlxqG9Nf9J9nOpgleiEYfJ/T4ZFYSRpd
 tvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5iFJn/kfkQSpg1w/GiE1Co8mx7fCauj/LpwyjzRdTQ=;
 b=PTrCtN7ZYTgrv2++IGAWfIb0UKyaQyj0tzqdbET1O9PYNlIBPlKaRK3bLhVbOIfppz
 WrIzOI6AY81DfxxKNj6ugLSW3y47L0hHghnBT33t8eF3qlsWU7C7h5evAzJOAQ+nkPlu
 mkQ8xqUsUL98yE3Y/lSRmoKTfQ+E/h5LFWhHNQW9+Zd5Eysh6tiHr5ydkunv87uzw0I7
 Vaqyx8LosyeAY5MFZmqT5S3iob8uDetGdrJCgRWqk2Dw3U2whabVpREBxTcZkH9002a4
 GyZWNJeTqAU2xd6Ht69sj+d9LFAjcA0c6yH13fmVj1wOPz0eGtP8icsHmKGU0fWe1gqI
 Sedg==
X-Gm-Message-State: AOAM533tDOXVhi/LLrqLi0R107Uh8z+tGpVX3LOjSUs5RAydbphHwz2C
 cLoIUxrw3c7t9ufxNkC4uxZgN9/Ae9M=
X-Google-Smtp-Source: ABdhPJwADaztsizVnj6CEQ/8XA+68POihUr/5m2t5t8Db6rqub0HNuDWBvuUPgCiQD0vnbKYKt10YA==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr9201358pjc.143.1612012222850; 
 Sat, 30 Jan 2021 05:10:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 24/42] powerpc/mce: ensure machine check handler always
 tests RI
Date: Sat, 30 Jan 2021 23:08:34 +1000
Message-Id: <20210130130852.2952424-25-npiggin@gmail.com>
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

A machine check that is handled must still check MSR[RI] for
recoverability of the interrupted context. Without this patch
it's possible for a handled machine check to return to a
context where it has clobbered live registers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f9ef183a5454..3a8699995a77 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -846,11 +846,11 @@ void machine_check_exception(struct pt_regs *regs)
 
 	die_mce("Machine check", regs, SIGBUS);
 
+bail:
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
-bail:
 	if (nmi) nmi_exit();
 }
 NOKPROBE_SYMBOL(machine_check_exception);
-- 
2.23.0

