Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47D368B71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRK8s3msRz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=su7WFMcj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=su7WFMcj; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRK7Y2k97z2yyl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 13:11:20 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso512294pjn.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZsVNwKd6mmQBVRVWzAHbFHT2atr7kRthOt9m2x6uEI=;
 b=su7WFMcjJlCbyGlq4wCUW2fIMUMZjk0BF6mn0G2ywz+GK0vjhV4K7vZZwm9hEcPa0K
 U+XRvBRcPIwqOKqBXWnrE4HWN1IrJvZQiEwYMHsi3X5Ez/cHgwVUIDJMkKeqLfqxcu/9
 WxUyfAVrZDXE9GQn1mWFsHZ6lamQTnVTK9P/nFvTvVHhX2QGvgcPFBfTQhg6+NzgYjnX
 gLU06WwCTXhAWMNg2IluvwsSJo6Ll8njemI45vY3rQo7gyl29kjEgZVHq45+kr+HYdyM
 B+Bnk5sKTfJl4thCFTuz45o2m74HtbGpZkjsR5HYTp2M6B3+Jq+5F4ffdz/5tak0yDdl
 l6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZsVNwKd6mmQBVRVWzAHbFHT2atr7kRthOt9m2x6uEI=;
 b=SHdI8Tdy53bWYsxvldEFWGXYuwvXpZxh6q0LW+fzJTO0tD0RvrLN/tojqxOR2wj0qd
 GlZViK9GnDATJJa0vpqI05Gms+QG6YiYO1/WK170az+LAAbzyu7A0R+mnB/mpK9N9DnT
 xTg9BMMInecdP5TwhKUniFqt4gf46VaBGdWWWFucorvduO/ovZ5+5p3pD84ljHn66XN1
 ZKhvWSOV8iq1EGTTeHRgHtz4du0D9oqbLL5B9s2K1HxAY+e4hmMWMROy7VEqjZgB4G5e
 ALv4CEudriIEoGEvCfoJXtF7MORNdnRtrZCdIIjBK++PgA6HVyfZjDqAVg403ilbonnV
 D7Sw==
X-Gm-Message-State: AOAM530KUqROBSkrqBQGYwXuFAuVQTeDMwyQVcJOOLFJviE3fESTk8Kj
 YanBUMCjfnsItLIj1o8cVl58aP+AJFg=
X-Google-Smtp-Source: ABdhPJwWbdslr3Fdy9HTHmg1exRpFaZePs+C1bAGRDpfXEK0rrulmCJs8gRiz3gHQJ6RFC1TY2Xc7g==
X-Received: by 2002:a17:90b:d92:: with SMTP id
 bg18mr2071766pjb.155.1619147478930; 
 Thu, 22 Apr 2021 20:11:18 -0700 (PDT)
Received: from bobo.ibm.com ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id k1sm3511962pgk.9.2021.04.22.20.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:11:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/pseries: Don't trace hcall tracing wrapper
Date: Fri, 23 Apr 2021 13:11:06 +1000
Message-Id: <20210423031108.1046067-3-npiggin@gmail.com>
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

This doesn't seem very useful to trace before the recursion check, even
if the ftrace code has any recursion checks of its own. Be on the safe
side and don't trace the hcall trace wrappers.

Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6011b7b80946..0641779e5cde 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1834,7 +1834,7 @@ void hcall_tracepoint_unregfunc(void)
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
 
-void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
+notrace void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 {
 	unsigned long flags;
 	unsigned int *depth;
@@ -1862,7 +1862,7 @@ void __trace_hcall_entry(unsigned long opcode, unsigned long *args)
 	local_irq_restore(flags);
 }
 
-void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
+notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
 {
 	unsigned long flags;
 	unsigned int *depth;
-- 
2.23.0

