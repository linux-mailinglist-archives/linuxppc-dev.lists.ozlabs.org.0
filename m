Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4FE30D1F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:10:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmrq2rRTzDwnG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TywQ7cLI; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVl9v4QQszDrgw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 12:54:57 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t29so15618537pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 17:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=52wnESMUBv8mP6ywU/q2qM80qIUYWpmW1Db10Wm46VQ=;
 b=TywQ7cLIRgH2WNfJw8ntQZ0xAPwKyaMQ6Ln0aK7EJX8lGiuXXq9fw1zTD+pwsBsNa3
 09Dwxts51AWRk4wADQajrwQDLtC/ri4Mg6YNLyWd0HAzJZ8dYNoQITc72Mg6Axn8w7Oi
 uqh95tXBJOPPxYI8objEubNPoVMQhtVLQCYaZ4l18yF+g8smVQzvVCBVZVaSFWE1T6vE
 An5qD5M5eh409Db6+BY39uLmSKc2zgvAAlyKq/DqgIlT0oexlvHMEuoGWyfpdolDx8pt
 0faorIse14yw/fMr6ipRBm9F92PyaZ6oUB6GiGg8xuKXpBm127o6c8A/yTE9fgeMem5F
 NvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=52wnESMUBv8mP6ywU/q2qM80qIUYWpmW1Db10Wm46VQ=;
 b=fuRIbr+OKUGF5lU3LIkqRXs40ADL9dnrDE/EPZm/Dk66kPr5kkgocZjD9pyZUsqj+I
 kKPV6X9Nar0JEt6Zbp6ogW672EjbB58GiQua94F7LfUNJuBlJBr7ngB2wVBDp1OG6qps
 TjFApXhHIZNRURbT6FI4vjfhxsjiTE87JIT+FXlHfQZeJRqAbfJJY1hYbLhMzKSjIHaw
 343n9sMBIBotbIcfKbR+nUUY7YZHJMOc77DxOQdOO2XhvgzDoyd2ogWqua8ERwVcbC9y
 ZsEmmvNIXJidQdTgwwc2tCtCQiuS6ue7NPUs4omfoiob6DAvmjaa1kcz1GkIwSg4jKGp
 x6Mw==
X-Gm-Message-State: AOAM533qLEXGop0CP3Y1GtLSEIkB4pHo3JUGqpVJCWAWtnVuSbnKWYCO
 r7JNTL9yOCGLnnvLky4EAG+ipiWpHUs=
X-Google-Smtp-Source: ABdhPJyGOLPzsnR49Mf+408eAC6Tt5k3EcwLjNtJGTw1rRTJ8evCjTLN6Vi5R45Zq5sKtdQzvvg85Q==
X-Received: by 2002:a62:1ad5:0:b029:1c5:111b:91cf with SMTP id
 a204-20020a621ad50000b02901c5111b91cfmr820232pfa.13.1612317293939; 
 Tue, 02 Feb 2021 17:54:53 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id c19sm235717pfc.122.2021.02.02.17.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 17:54:53 -0800 (PST)
Date: Wed, 03 Feb 2021 11:54:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 28/42] powerpc: convert interrupt handlers to use
 wrappers
To: linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-29-npiggin@gmail.com>
In-Reply-To: <20210130130852.2952424-29-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1612317180.3sqh02nwaa.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of January 30, 2021 11:08 pm:
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

powerpc: fix tau6xxx compile error in convert interrupt handlers to use wra=
ppers

This should fix the missing declaration compile error although it=20
doesn't show up with my toolchain.

---
 arch/powerpc/kernel/tau_6xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 46b2e5de4ef5..3f300eccc09e 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -22,6 +22,7 @@
 #include <linux/delay.h>
 #include <linux/workqueue.h>
=20
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/reg.h>
 #include <asm/nvram.h>
--=20
2.23.0

