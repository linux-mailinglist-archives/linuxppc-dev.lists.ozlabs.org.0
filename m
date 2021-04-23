Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621F368B73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRK9w4047z3byW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gryCmY69;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gryCmY69; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRK7d3zm8z302V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 13:11:25 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id z16so34255017pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhop9pDwWty2XcrNOVfdptoqUgIF/vnX7jWaqPxG9b8=;
 b=gryCmY69gyl/Km2SPeGb12j7+/nTjneAA7nE/EaVNiKgVK0v3hI1TQ8NPkRIp2foU0
 pazPBkBPBZhXgxslj/5neNEUQxaT0Ws3YTvi5GuZxP8EOZ0xouXt//bMEuYMJUhsbKID
 3L+ocwYLhG5clNJl+3DNXUROi8pOtYbclTVqwCd7bH3Ygy9ac/91BSQDNgN+rmne0gzi
 Od+YDUxbzkGfD7R9QomH/QUojdCDlqhu4AQBWdk3DMc3GhfFX6s44xzT5gyRGfxY07ZB
 D3u3iVhg4j4CQtHvMHNhR7GvlMFHZcR9trjfuYk/djMZy6Lg+glVzfKc6hF1l3jrMlnV
 +WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhop9pDwWty2XcrNOVfdptoqUgIF/vnX7jWaqPxG9b8=;
 b=Ly0ZhIJiuAe04c7RvKH0ABceZLuAbNSCRXlTcsWfF5yXPzgxOYM4l8mklhcZ2fbxPa
 farzLIwZlQMilCHRtm8i70mpFDqZMTSuTXQtPYDBdikKGbrxejg/t6lsw/4LWWHtAsNm
 ESHCAclCeidcY8BZ231U0hYGXJY8JfUGwAI2n5SFJoB0ckS46zRSKA5S9vP/KW5OrGUK
 ysTn9EOzw+E3C8IbFPWAi0cUVqbUXR5LF5+OoHxU35rc2nkP1imSNU+sMOamWqo4UvpF
 9wdIhJ83nepYJ8S/U1wb5kDhOFPOiIM2uzIZfUZ13Cn5V2VMt7zubixxQHhwWcmrY/Z5
 qHWg==
X-Gm-Message-State: AOAM532cWhJPH7RxKdjfj/tUuGkKKTcvB67c1QXl5IZYABPnXQWb20qs
 eM/HQ64f8e6GeZ8xTiXIdIGl/SvV1V4=
X-Google-Smtp-Source: ABdhPJytArTZKc+tVAgHcYy4lNWoArRKCOImonRtWk6QtUgmApr97YP24lRPQfl7hxvtOqEP58RQwA==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr1631133pfr.76.1619147483370; 
 Thu, 22 Apr 2021 20:11:23 -0700 (PDT)
Received: from bobo.ibm.com ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id k1sm3511962pgk.9.2021.04.22.20.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:11:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall tracing
 code
Date: Fri, 23 Apr 2021 13:11:08 +1000
Message-Id: <20210423031108.1046067-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210423031108.1046067-1-npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

---
 arch/powerpc/platforms/pseries/lpar.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 835e7f661a05..a961a7ebeab3 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1828,8 +1828,11 @@ void hcall_tracepoint_unregfunc(void)
 
 /*
  * Since the tracing code might execute hcalls we need to guard against
- * recursion. H_CONFER from spin locks must be treated separately though
- * and use _notrace plpar_hcall variants, see yield_to_preempted().
+ * recursion, but this always seems risky -- __trace_hcall_entry might be
+ * ftraced, for example. So warn in this case.
+ *
+ * H_CONFER from spin locks must be treated separately though and use _notrace
+ * plpar_hcall variants, see yield_to_preempted().
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
@@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
 
-	if (*depth)
+	if (WARN_ON_ONCE(*depth))
 		goto out;
 
 	(*depth)++;
@@ -1864,7 +1867,7 @@ notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
 
 	depth = this_cpu_ptr(&hcall_trace_depth);
 
-	if (*depth)
+	if (*depth) /* Don't warning again on the way out */
 		goto out;
 
 	(*depth)++;
-- 
2.23.0

