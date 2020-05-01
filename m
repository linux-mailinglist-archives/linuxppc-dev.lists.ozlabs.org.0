Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B245A1C0D2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:23:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzdC1mkvzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=djVNchzB; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cys95ThMzDrHF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:48:29 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l20so4024624pgb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vnW01ixjTiBraB6xra4LgRE13uNev1zDY2pY3VZsejI=;
 b=djVNchzBorG3tkbq+W7oruopTJCI78pwkREnEjUrwNEOk4jvhNEGud2FIUIOLmT5xk
 ufo4gHVIO8PErhOHS4CXIdOluhubKzqQiCb+hYDYYJSKuchKawqG2cy3uffnhv5PDEQU
 e9RBatiXkhH9s7YzWX7jKsd6GFBwDT84NxzKR86k26ZTVnbJOpErYj9cP+gZqpIJhcGl
 eRacOYJFwaYf3+Ce9a3ajyFvi079jUAFUV0gcwnJF1ADOfdRRnrvCXR3DrHDiXeAmSxZ
 OWHAeMs6sKoVXQTHTWXj1Zeq+A6/B3AjXu4EjX9MkWWaT+NmtL1Zgw+u/bIeQL6b6lEN
 f5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vnW01ixjTiBraB6xra4LgRE13uNev1zDY2pY3VZsejI=;
 b=ENCcuzyXCqUanVQh0XS4ei8G/tFKiCrvqz7tw3w8RsSEpkPKgGblPOE6acAhTpDIGw
 NnLS2eBvIYT8WEbHuvaBL0f+BlPPj4tx0DXjWrdfG/2iMofuuyOH5KoroFBIXNAHO/j4
 qggGxN3n13eo1pE0+AP4zVTEPCS/9kOblLZe3mlWkl9dtZnCn9DChJfB0/kUXyal7wjK
 2qkkZoL7tMrDhLrNScbmWYs8EpWMkwEtdI1u9cFiPJKnSI7S0OU8VSFwdZs6cjdNpdeZ
 aUFUwUDaa+m+cXEhslVIp7xqok7fZLCjB/bBBR6NkYYCXeAPbg31+dRuDBek2BwHnzhn
 we8w==
X-Gm-Message-State: AGi0PuYDpvhmlxDYYvEUsho+hu0XQwCBvYaP96hIAxSzyo+xVo1DHwSo
 InT9P0NdUhgFYE1n7hE367K4lBsrt41MoQ==
X-Google-Smtp-Source: APiQypJGzek9H5a4rjfcVdZ3wfQQwU2Oi8QEfQ7IOKnGDIFKZsZkjFYD3PPu6bxNE5XciTUlIfn0hg==
X-Received: by 2002:a63:d80e:: with SMTP id b14mr2365431pgh.9.1588304905542;
 Thu, 30 Apr 2020 20:48:25 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:48:25 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 19/28] powerpc/xmon: Move insertion of breakpoint for
 xol'ing
Date: Fri,  1 May 2020 13:42:11 +1000
Message-Id: <20200501034220.8982-20-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a new breakpoint is created, the second instruction of that
breakpoint is patched with a trap instruction. This assumes the length
of the instruction is always the same. In preparation for prefixed
instructions, remove this assumption. Insert the trap instruction at the
same time the first instruction is inserted.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 1947821e425d..fb2563079046 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -878,7 +878,6 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
-			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
 			return bp;
 		}
 	}
@@ -910,6 +909,7 @@ static void insert_bpts(void)
 			continue;
 		}
 		patch_instruction(bp->instr, instr);
+		patch_instruction((void *)bp->instr + ppc_inst_len(instr), ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((struct ppc_inst *)bp->address,
-- 
2.17.1

