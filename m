Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85DE1589C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:50:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsMF4l41zDqNw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zm4gFi1c; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs2L14zWzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:36:09 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so3793009plj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f3EId3jMgeXmLg/m1MUXwlRZoUMxmv84+0RbLeDKFr8=;
 b=Zm4gFi1cLtKFLcbHaNr9zK4I7D6ExP7Gdt2zxDqbWH/N/hL5Rsxl0DNw3phJcWpEG0
 8jEZ6qDwtAoIkUaXGSMyexkrnQ1EMUFKUrFcAUGtudCUOCpzPja4eyWMZ71607XDHKWf
 EFVO6oSdKipfaG8J+RTBpMFZ9mI7H1hrONu2CwtlBhxfFiyznyimgz3pQUKwWHLptkXr
 AXz2VGpiiOepwLHBi4gARwGkJqTo1WP/5B+YKZSvPy3MtBESrmJ2u7xRzwvmk5XAqz88
 4wKNhqH2c2o6G7LPD4dxdwGeZajS/T5br3KSl21WG80Ta5OKBY/ROL8ts1BP4kmOhFUf
 05/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f3EId3jMgeXmLg/m1MUXwlRZoUMxmv84+0RbLeDKFr8=;
 b=ALustHWccoKc4ZE0CccTk16NKyrV0BE1G7JX5ZgFSVnSRN3Ti+VCpTripkiat9Axoy
 JZVJalR+mHFK9G7S90p2DcI97v3UPXmdlEGFWCeHcdLVKger1x+pgChRhIU/Spxrv7HD
 5MCnxGNI23tcwKcp7NWFbBP8clINAzRUC2R4tfxr1NwBwtWRYesGFWSUrUACH+CgR2vu
 DbGRO9z3j/hG1d3ab7dII2y5rhB3Q/Jrc2aIOR2KPkRgGqXx5Hy3488jvxN8SVbC6B0D
 ItjoNRbbRUo5RaWLM8uvybKwPLdq75L/0zGV8r8JEcUqHZpEqqdPIU2jiV5AQ61InG/y
 sTvg==
X-Gm-Message-State: APjAAAWFoJPP+tuVOVjVnd+nmR9o6Ad4+9/5QdyNqh5jabQTgquetaQv
 jeL/+tW1T809mFD+g8ccDTSVVQRwfrdfsQ==
X-Google-Smtp-Source: APXvYqxsqntd6gVgyzEboqDYU6XBA80neiL9wY/Urgl4dsfeFhsP5ZBcC4cKBF6ZiqyzyXg55Ai1+Q==
X-Received: by 2002:a17:90a:aa83:: with SMTP id l3mr1758347pjq.5.1581399365804; 
 Mon, 10 Feb 2020 21:36:05 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:36:05 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/13] powerpc/traps: Check for prefixed instructions in
 facility_unavailable_exception()
Date: Tue, 11 Feb 2020 16:33:49 +1100
Message-Id: <20200211053355.21574-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If prefixed instructions are made unavailable by the [H]FSCR, attempting
to use them will cause a facility unavailable exception. Add "PREFIX" to
the facility_strings[].

Currently there are no prefixed instructions that are actually emulated
by emulate_instruction() within facility_unavailable_exception().
However, when caused by a prefixed instructions the SRR1 PREFIXED bit is
set. Prepare for dealing with emulated prefixed instructions by checking
for this bit.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d80b82fc1ae3..cd8b3043c268 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1739,6 +1739,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 		[FSCR_TAR_LG] = "TAR",
 		[FSCR_MSGP_LG] = "MSGP",
 		[FSCR_SCV_LG] = "SCV",
+		[FSCR_PREFIX_LG] = "PREFIX",
 	};
 	char *facility = "unknown";
 	u64 value;
-- 
2.17.1

