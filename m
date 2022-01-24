Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF0498288
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 15:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjCMl250kz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 01:40:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D61N7jn+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D61N7jn+; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjCLQ6j77z30N0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 01:39:42 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id q75so15573909pgq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 06:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G0a5OoRfjvn4retKMpcQQcdxSBRwvpndVWNz0dW1Gm0=;
 b=D61N7jn+7Bas8QmT1jBsiCkE8qHjHJN8aIF2NNfu9EsS95+0x6cHaZzhL1/RzXrkKE
 eFEef029/jSlo7958bhdbAt+iqhhxJQVFEbTQzZ+JZRqjs7k9uQ9YzL8HVvxAs1BGpL1
 MBq00QhNANI2rgAqPfMwaUCApKIr+vXn95rXoWMQ0QnkLYdcugqyBHIUetD4UiEH03p+
 qtvFp4QzPeYbnr1h1dEQhVgLGoqUx1UP1CSAd5096ZRXIo1XoclphvuWFVu7vstD9T39
 E00b3Y3N4uKA0LANso6IadZPT+P+KJHQEFbR/t03W3btaGhSe9eNpZrve6OB4o4fk/ZR
 /t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G0a5OoRfjvn4retKMpcQQcdxSBRwvpndVWNz0dW1Gm0=;
 b=ApQZZdWk4E9FacEmyYfW/YKsAw5QEvrhlvuLX3FtzTwj9Odn7ShqvkSvqNYxntgaaC
 0XOt5lbIpP3scZo3mT+F0QL7uKSKFxOFfLTq3n6xWf4jiFaKGg/Cz0LC33aI1R6BAHYX
 pC00GnQ5XZt6fOV6aXHqRX0n5FzK6p+Ax5lzm9fvHG50wL5pGGqQJlNIQSzGh/2dsQ27
 AcAi0daf5A9indv5BuRGb39r9e2jrMbydcDjJ7l1yjAqc1vKrURHf9ZR2jMIkraGPpUZ
 h9XGXduggYRNsPf5cMnBB1YoZQ0IbZRU503FGHqIlXNBKzSBF2vhitwwPr6GefJjE6mv
 /rSw==
X-Gm-Message-State: AOAM530yQ91DUtSyYrZsU+q44XFL3hgZ8FddTDAq9UHEOiz4WiNvDUbt
 p7aoohEz3vCNLnoj/vx3wO3vzBwW4c4=
X-Google-Smtp-Source: ABdhPJyJPVfBMka/FstsQv1SnYgHq50X19RMRVRL6bMCy8WkNW+jJzkmqWhba3EweIvJvfqNTIaLcw==
X-Received: by 2002:a63:6a41:: with SMTP id f62mr11813242pgc.364.1643035178830; 
 Mon, 24 Jan 2022 06:39:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id k16sm12748001pgm.26.2022.01.24.06.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 06:39:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/time: Fix KVM host re-arming a timer beyond
 decrementer range
Date: Tue, 25 Jan 2022 00:39:29 +1000
Message-Id: <20220124143930.3923442-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124143930.3923442-1-npiggin@gmail.com>
References: <20220124143930.3923442-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the next host timer is beyond decrementer range, timer_rearm_host_dec
will leave decrementer not programmed. This will not cause a problem for
the host it will just set the decrementer correctly when the decrementer
interrupt hits, it seems safer not to leave the next host decrementer
interrupt timing able to be influenced by a guest.

This code is only used in the P9 KVM paths so it's unlikely to be hit
practically unless large decrementer is force disabled in the host.

Fixes: 25aa145856cd ("powerpc/time: add API for KVM to re-arm the host timer/decrementer")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/time.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cd0b8b71ecdd..384f58a3f373 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -582,8 +582,9 @@ void timer_rearm_host_dec(u64 now)
 		local_paca->irq_happened |= PACA_IRQ_DEC;
 	} else {
 		now = *next_tb - now;
-		if (now <= decrementer_max)
-			set_dec_or_work(now);
+		if (now > decrementer_max)
+			now = decrementer_max;
+		set_dec_or_work(now);
 	}
 }
 EXPORT_SYMBOL_GPL(timer_rearm_host_dec);
-- 
2.23.0

