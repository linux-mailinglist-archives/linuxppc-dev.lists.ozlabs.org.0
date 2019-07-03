Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9A5DF49
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:06:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dtww6Lq0zDqKK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:06:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XsqxA+Ax"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthW5hD2zDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:55:55 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i8so769377pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+jjIAIMslx172lTxJVoXHhGXL+fIcfc+rKiQb14IpE=;
 b=XsqxA+AxSxb+gc3v9rxi1g3CAeFEyFmfavtaw1oZ1PrDsfqUM5squDr6THXvD0SgrR
 4k6ujXrbz3g0TVDAe37VwM10dAKCPbozvBxiRxT14yxQm1jm4b6p+d/3eziKX/AmCJJ4
 lN3Ag+Kyk7+vUVVwMeYnA031yTE1WjOFU7Q8bHFFhu8007TM6umq3O9LJyl8WBGXkV0L
 xm/IS08k/IXIdBLr6xIVgfpNb6YL96hA2GCcVPdP5vzJ3LQh+fN44aLt/B57tZKqwU8M
 VOCFSquyG668Ouspr8jReZEYi2h/ACIxU9VefXfOEfkKchpsVCt3kt/WsrbkkqSoawJz
 p4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p+jjIAIMslx172lTxJVoXHhGXL+fIcfc+rKiQb14IpE=;
 b=tT7S8OWu0tsEC0kK++Bom7H8mkKub5Kkzp6FYcI5fdibP6wtdJm+S9LT2hLy7AQ6h7
 OaBQJdn5MVAbtgrwRV3DFhw6iGJWw/5znq3IkgF6JHY828I4U9zsGIZ3u8X3J9qlvJIA
 HlcHMHoGQ/Pi/uClrPXDYTadpzjU3wY6MFP3xt7MvEnk4Ue/PNvi7b6Fd4m7lx1sZ6oX
 g7hAWK+sfQGquVghgaMTZS8p4Ceha+JF3YWQRp6OQ2CBXDTKTHmGCAoUWBoz3fwMGgw5
 cv0yY1vWo/LPqhh+KDEGJUf3PenNQGnn6F/N33EkHSnblPjuzBveOP/8/1ct9Dme9E3P
 GyUw==
X-Gm-Message-State: APjAAAVezqU/pZ5t7yvHFZK5iz6ABwAzEPLjHSm9YDG+jpTT2pJUID6L
 hB1OWyok4op3PuMBU+XSRiU1eDzJ
X-Google-Smtp-Source: APXvYqwAFMSzKzGb2l6VySMBkSqmSHu6QCZ+KgQZAjFHt7adkoO7NUZYO5WG2vN/OBUmwgfTKwiVyA==
X-Received: by 2002:a17:90a:2506:: with SMTP id
 j6mr11381803pje.129.1562140553529; 
 Wed, 03 Jul 2019 00:55:53 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/14] powerpc/64s/exception: machine check pseries should
 always run the early handler
Date: Wed,  3 Jul 2019 17:54:35 +1000
Message-Id: <20190703075444.19005-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that pseries with fwnmi registered runs the early machine check
handler, there is no good reason to special case the non-fwnmi case
and skip the early handler. Reducing the code and number of paths is
a top priority for asm code, it's better to handle this in C where
possible (and the pseries early handler is a no-op if fwnmi is not
registered).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0186a44bb981..a69ceb28cf4c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -934,11 +934,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXMC
-BEGIN_FTR_SECTION
 	b	machine_check_common_early
-FTR_SECTION_ELSE
-	b	machine_check_pSeries_0
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-- 
2.20.1

