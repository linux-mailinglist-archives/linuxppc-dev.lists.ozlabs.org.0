Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6802C6FDF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 17:18:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjxWW1cjdzDrgk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 03:18:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O2SH7PLZ; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cjx8n0G36zDrR8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 03:02:32 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id k5so4119523plt.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 08:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ryYzZTfuMdMQoDGnZ6qQm92nrELT0Bznsq8pS5zNkE=;
 b=O2SH7PLZYn9x9yrSkPvaAZdWZ4Hk1Nz9o1vpICXBIyIIgIdy8d9QFKV+1r92+5zuOs
 gYKTram4WPDCSdl+hhVkmF9+vrkTQECccC9p+zkSVnyHnydt6RZsEWjgzXbamDwz8Ryf
 WwRcOCDkLf2yHoNmiO4MHVOErhGamyhGZEu/rYwWW8NOV9V/N1bEFCnSnAJQkVeT5lqs
 dhR5ybbQNLsLTLCFZze+EY6rm27mttggd2bAwJ7eXS3YKnz/bnqJ0GT0EmjvtORGnwS+
 17SXi5CsTI/P47c8OyIr30m3TcLjy6wRktbukjqqdEaVGzvGIE/erk1qflt4sxiTfF0m
 Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ryYzZTfuMdMQoDGnZ6qQm92nrELT0Bznsq8pS5zNkE=;
 b=bOhWiHPLYay2YDGRJjc6BrkSZYMmAtXfUMHzggeBHNiq/9tF2nbr8G2cuZEML7NkT/
 4j3skHko5sy/9rXpI+TIGJLbfmqGcudDHOgGZVvrOyUn19RSpZWqMbMfC+7dayOa9KrD
 YB+KQICJ4Y2dfW2+TpdxA5JID5t0g0w11nkRsVl1lKyfaw9UNJ5Vl88WnsKpSoN2HOLa
 P8XcH2AjAbO4YhyJVQBRc0zgPL5wbYOg38lylFa8ETJP1VhNRIc9veZDSQfMFahm7Klo
 +Jh+psnR+ZuiMIBHW16G7k3pYypGPhDYdf1qhwVJitBpdkYP72fSV7UdsdR0f8wo81vR
 T6AA==
X-Gm-Message-State: AOAM532vRrSJGr2yaP4XmdE9hnUWNALF03fzIB2f0qCF1MQpJprXV7Z1
 teXyEmvfd1q25Mls9FqID1k=
X-Google-Smtp-Source: ABdhPJxOmOSo7yBdZGFr5Ee5U/YJuP5XMrKl+Nl3YUOkuajp7hYak8NpHsUyWSygIXkb6jTi/aUZeA==
X-Received: by 2002:a17:902:ee53:b029:da:4c68:2795 with SMTP id
 19-20020a170902ee53b02900da4c682795mr8244122plo.7.1606579347904; 
 Sat, 28 Nov 2020 08:02:27 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d4sm9762607pjz.28.2020.11.28.08.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:02:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Sun, 29 Nov 2020 02:01:41 +1000
Message-Id: <20201128160141.1003903-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128160141.1003903-1-npiggin@gmail.com>
References: <20201128160141.1003903-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second. After this patch it goes up to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..d4793c0229d2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -231,6 +231,7 @@ config PPC
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
-- 
2.23.0

