Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482F23B1FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 02:58:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGb814gDzDqTG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 10:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lmg5KNBh; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVb03FtzDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:28 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh1so8829661plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhRszzNffNS2N5YEjFrKjiwUkb5NorLpAyngZmSaRIE=;
 b=lmg5KNBh0sEd71gQqlpGgtBMnnYEiMVnMLre46MeOTJAAeNa6jm0FoKGiI9xR+sQ9f
 wgI13puTCApFRpSNMQ3QcTnfERWe9G8SCJ7NdSZ2LY2XwsnpUNJ4AsOxs1tMcq/in8xz
 GJiplZlO33GJtchWVj+IfkKyVYEBhPBAXUesnKyfV7E2DvCrBfjOUGPNbRz5s14TXabu
 Pe3fmqXaaKj8ZTeG9mNzSoaw/junOXqDtW8gioRYFaarBXQ3FYTom5UoYqtKQfnhiRS/
 WNnuYgOLwywxAGJFpO0ucrmyVOHqJOMuNzmk8ftveU+JeSWtvYOCjplKAYQUTsbcGjvK
 EG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhRszzNffNS2N5YEjFrKjiwUkb5NorLpAyngZmSaRIE=;
 b=Is3eBA9v3khrDuLsnv9cPB4WCYH0qJQtJzrs2wX63GacyZDDmI8FpVElSWBAzK9z4i
 /dYT4X4dtsCpn6Lt2umNkI+ZbLlJtsjzu6vxNHcBznjag1uNSRpDlmv7/J83P469I5P9
 5nzNIqRI73W82xKlZv5n2Tzch6SHNwCSkF/pqTGamxnwGa6qctDHRh19XgyoTkwNvJJt
 UU5Ar/E7+TvotfH/40fQ761Ott0qhVQ9LuuIkdhndMvby/9aB4/0Sjs60se6l5bTaCeK
 zqvWpI45ERzJ51Rn8w8UTqDMzThTFA9swBhNYNI/CilUR7PuBdfR3GjSxCeNmKsv6C5n
 kexg==
X-Gm-Message-State: AOAM530oFgs9daqefWAziiYTgLL2ViJch1j1Xxsm6wuaJaxS8FrpwR6K
 0fIca4nS3wicAsCOh6dIJB5Zgsj3
X-Google-Smtp-Source: ABdhPJzc0yGnjAhydhNSkwHHPPaiFkGtOTMzRtfNgLKHEzp8TJohmcUSLqMPUhvxZSUUmazfKqxmBw==
X-Received: by 2002:a17:902:b603:: with SMTP id
 b3mr17300055pls.285.1596502466261; 
 Mon, 03 Aug 2020 17:54:26 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:25 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/powernv/smp: Fix spurious DBG() warning
Date: Tue,  4 Aug 2020 10:54:05 +1000
Message-Id: <20200804005410.146094-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with W=1 we get the following warning:

 arch/powerpc/platforms/powernv/smp.c: In function ‘pnv_smp_cpu_kill_self’:
 arch/powerpc/platforms/powernv/smp.c:276:16: error: suggest braces around
 	empty body in an ‘if’ statement [-Werror=empty-body]
   276 |      cpu, srr1);
       |                ^
 cc1: all warnings being treated as errors

The full context is this block:

 if (srr1 && !generic_check_cpu_restart(cpu))
 	DBG("CPU%d Unexpected exit while offline srr1=%lx!\n",
 			cpu, srr1);

When building with DEBUG undefined DBG() expands to nothing and GCC emits
the warning due to the lack of braces around an empty statement.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
We could add the braces too. That might even be better since it's a multi-line
if block even though it's only a single statement.
---
 arch/powerpc/platforms/powernv/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index b2ba3e95bda7..bbf361f23ae8 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -43,7 +43,7 @@
 #include <asm/udbg.h>
 #define DBG(fmt...) udbg_printf(fmt)
 #else
-#define DBG(fmt...)
+#define DBG(fmt...) do { } while (0)
 #endif
 
 static void pnv_smp_setup_cpu(int cpu)
-- 
2.26.2

