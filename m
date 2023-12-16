Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3D815994
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:51:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LeXTBpZy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnYl5MHJz3vjl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:51:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LeXTBpZy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnP86HYWz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:56 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35f3e4ce411so11428145ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734235; x=1703339035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MYz5+++UNHk8JuT6NkzYqZbnD7njBUOAwzQa6uCUHU=;
        b=LeXTBpZySflWvbzBUJdTQGc4MSH91QhrmYoQ6j3lb62vVGGzfz4RKJwnQiv48gxnDb
         WDR16Z0dn3HxhWgsuhtNhL4lgWF4WOk6oPExEyfpCWrkoeTHG2yYBa1xSSM/VrDr05jf
         95cd0j4uzBH3rDcbzv+iQpO77WLD5nCmbm65rNI5YZ1UOBQElcOKlWTHVUkNlsAhxk/i
         nS8iO4QSOzHuj9AuUfBXxvVYkLsB9wYnF3ISyyJMqmyNUQNLPxjtsKpDrj2FlLYO5eP1
         51TzOKEJ85UsjEV4SXkX99PAf1s0/MrQod5M7vRZI/dEhKYZ3tIpAKi/6SSRGDkZYOMh
         hxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734235; x=1703339035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MYz5+++UNHk8JuT6NkzYqZbnD7njBUOAwzQa6uCUHU=;
        b=AdowlWeb2X+vkoenItO6V929F3x152CMX7jtW3JXB0qGwWNfnnjNLSIvItYsMAQXYE
         VsJAAXJhdZleb1Xx/jCvzBlPNmiwnmGzdSf6765ffSZi0vJzBRNTdFDDNUTvd3wsqHNE
         80ehs4oCD6pf2BlM7s55FZYJYrx8Q+FaODOLc7jLd1Y/6k0sFDcGRbCv+hX4zI7EraGF
         BJu2AVY5xVN5D/S911swWu8uowmroeW8z78IwumUcUZUQXchqpOL4IFLrPLriEHrMYnQ
         7jGMxggaaVmDZP5IH+rsKzZ6WmzTwGKTJiA8SUaO6MDcBq0OlBxDGkudPF4ncY4Drh/M
         tZBw==
X-Gm-Message-State: AOJu0Yy+q96RNTgRR+FrTl5CYCaDHeU3sGT611N+d10RPjQLCaSe4344
	VxNH4vOiLA4JEP/Yrl5HdFk=
X-Google-Smtp-Source: AGHT+IEPrGjIGT5jrkjhBZTxwAQfWv371FWVrlYl7wV2CfXjcUfMNPWI0OqNqcFmILfPaMrcHs74Vw==
X-Received: by 2002:a05:6e02:320f:b0:35f:847c:1e4c with SMTP id cd15-20020a056e02320f00b0035f847c1e4cmr6037968ilb.89.1702734234953;
        Sat, 16 Dec 2023 05:43:54 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 09/29] powerpc: Fix interrupt stack alignment
Date: Sat, 16 Dec 2023 23:42:36 +1000
Message-ID: <20231216134257.1743345-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc64 requires the stack to be 16-byte aligned but the interrupt
stack frame has 8-byte aligned size. Add padding to fix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/setup.c    | 3 +++
 lib/ppc64/asm/ptrace.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 1be4c030..d98f66fa 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -18,6 +18,7 @@
 #include <argv.h>
 #include <asm/setup.h>
 #include <asm/page.h>
+#include <asm/ptrace.h>
 #include <asm/hcall.h>
 #include "io.h"
 
@@ -195,6 +196,8 @@ void setup(const void *fdt)
 		freemem += initrd_size;
 	}
 
+	assert(STACK_INT_FRAME_SIZE % 16 == 0);
+
 	/* call init functions */
 	cpu_init();
 
diff --git a/lib/ppc64/asm/ptrace.h b/lib/ppc64/asm/ptrace.h
index 076c9d9c..12de7499 100644
--- a/lib/ppc64/asm/ptrace.h
+++ b/lib/ppc64/asm/ptrace.h
@@ -14,6 +14,7 @@ struct pt_regs {
 	unsigned long xer;
 	unsigned long ccr;
 	unsigned long trap;
+	unsigned long _pad; /* stack must be 16-byte aligned */
 };
 
 #define STACK_INT_FRAME_SIZE    (sizeof(struct pt_regs) + \
-- 
2.42.0

