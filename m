Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA51098F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:46:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXw26d31zDqPl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G8f4ct7a"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNX2xyJzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:52 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b10so8373750pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGs05e6IUOa8DyP/qJGurtDtkp0tVR6dvYlT7XrDe/c=;
 b=G8f4ct7anFJqn/yEpoJOIISWHtUBChpUDNeU6t/4oV/BPV/Et38Rk8Wo3m5V06+ylZ
 aY7SPf+ocbsub40DUBnMjtb5Yv4YGwdZPegm8DMxg0vTWlyz5B1iNPC0+cbp0YNNtaTs
 MkXWlo5WIFV72KldLhUvt+qhFG72EAl2ftjmj63Kj/01l7Ma97+e3n+lG0BRJXp6k82h
 5BH+Zl61DNJsfCxSr7Vhc+hVs83FbHHunXRXbfcmOS37dWB9+iqCX3575MzKLqrbjbKn
 iXW9KFkzFGjF+UfVI65blRdne5NmAhQ8GABcJqfD6G8GxpfGGqXEEW4/5mHH3+S73gkk
 kwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGs05e6IUOa8DyP/qJGurtDtkp0tVR6dvYlT7XrDe/c=;
 b=kzWxQoy24uaki5nYU1SP1r9578mYLR1y3tV17u8HPkk7+ztB31gkzfnSkRxV6Dh7BY
 WKQOzt7800gZxrRS4F834y1KFlIp1yxCXWLeq8X6a0uU50eFmjagwfcyqGtpPrY0chLa
 /47H/cPLgxQXJqtn1BlI0ahYTKU3xs/hepjknrtIh+mdmOfuxUG9ZO9enp/SVA7JGOOw
 uj/rckGHlEdD1+hCH0YLprmesGT/wQk1tZ5xzKhjrxd7yrqPXywrvcbC6bo0NphZjvm5
 n5R3THtvzCM0OCb+yjoQ/U+5ycmPNu1d4mjCOjgSNqelgVfY4YBNqe2rkvRRD7bCjKqQ
 toOQ==
X-Gm-Message-State: APjAAAW/8Fxh24JJxI83vDl2nNRo1d4hk5qBnbYY4fJ9crIHqUkrV3rV
 mm7X6oTDHZjH19WEBWdBnmpeHc6c
X-Google-Smtp-Source: APXvYqyJRv1AoRK7LIpwSMCcjAC55fBq8ATw5GHdnlgdaTtMu+CZpVF9+6nVDvN7/S1mSuqYsTMw1g==
X-Received: by 2002:a63:b502:: with SMTP id y2mr37430014pge.317.1574745770287; 
 Mon, 25 Nov 2019 21:22:50 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:49 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/18] powerpc/traps: Check for prefixed instructions in
 facility_unavailable_exception()
Date: Tue, 26 Nov 2019 16:21:34 +1100
Message-Id: <20191126052141.28009-12-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
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
index 8e262222f464..92057830b9b6 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1726,6 +1726,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 		[FSCR_TAR_LG] = "TAR",
 		[FSCR_MSGP_LG] = "MSGP",
 		[FSCR_SCV_LG] = "SCV",
+		[FSCR_PREFIX_LG] = "PREFIX",
 	};
 	char *facility = "unknown";
 	u64 value;
-- 
2.20.1

