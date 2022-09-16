Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2465BA5A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLHz58hpz3f9s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:12:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T2fU/dY0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T2fU/dY0;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCZ04mmz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:25 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id b23so20025466pfp.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UKC/IzsPnIQkIn2U1AVRO3JOd6E9HJwIL20GIQ2shWo=;
        b=T2fU/dY0Vz5dMlOkffbcBx9hGanADDhJHw1vP65B4q2GnneK7czw5kJ+miwiuarJ/c
         UULpYNbKFsYdslONiazChwKgx/9h/k7xezyVlVg+bOAQq7CRgeNJEu73+wpqMWak9l7S
         I+3tMTcwQs3dZsOuKG9c0WpNlRpOAWmUWpD6Kl5tkAOj0BSx4YPxDQYVreYgkdEYD9bP
         IL+rNhXpzV9OKwdkXKeZvwBxDYwIPzTVLDPMNQbiMPBOzyNViWVwE8L77a63P/y+q1iF
         VmOjU4zOygTPMpTia2HKCwfPL6lKIXFVnB3TvLBAhJjUgtcp1ofDsFbpIjn4jLVknsL2
         T+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UKC/IzsPnIQkIn2U1AVRO3JOd6E9HJwIL20GIQ2shWo=;
        b=A7wCRFfHzaM/+CzuDbxUFqwQu315I6/4cMzApWWDXwkLd9jBvjX6AdwkTyy1v6oDKF
         Zbd6/fKmzHZ/xB65Q61DruRURbQ0XWNjgXmmXkKOaGcU3vZx6vC2GDUufNkAeJsw154+
         USe9L1X+VCQM1qF+b4sQbYX25mi83cmKTbsVLqvyBfses//lYQecQTyL0hlMqS+oBH5I
         mOrC7qL3ZCMQqnKgQ6MGxEEd8WRw/oIId/diipfH5SuOcFkb5bAD/6pyDT+wEaXs0PS2
         looSM6/CGFY7zUmRPVUXt5bX5PfN7CDALGMMn1KTDMkk1RNu6WOzQPg6uDFOCyq5lPCE
         3T1A==
X-Gm-Message-State: ACrzQf1frTYxp0AZ8qb4/2fHIf0YT/CmrPVMTx9OCSVufP43+4ANyp4X
	eEs6or2XRxqCWvE1CROppUFSu1azAtg=
X-Google-Smtp-Source: AMsMyM4tmqB5LGcBlZOoFlnQhF0RcA9/1MOm9YlZ8BDmqeud2k48GaOXlLC+fNk+Kn9ir2fzQB/nSQ==
X-Received: by 2002:a63:e205:0:b0:435:c80:ecd0 with SMTP id q5-20020a63e205000000b004350c80ecd0mr2785943pgh.174.1663301303331;
        Thu, 15 Sep 2022 21:08:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 6/7] powerpc/64/build: merge .got and .toc input sections
Date: Fri, 16 Sep 2022 14:07:54 +1000
Message-Id: <20220916040755.2398112-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Follow the binutils ld internal linker script and merge .got and .toc
input sections in the .got output section.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 737825ae2ae0..3d96d51c8a5f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -169,13 +169,12 @@ SECTIONS
 	}
 
 	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
-		*(.got)
+		*(.got .toc)
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
 		arch/powerpc/kernel/prom_init.o*(.toc)
 		__prom_init_toc_end = .;
 #endif
-		*(.toc)
 	}
 
 	SOFT_MASK_TABLE(8)
-- 
2.37.2

