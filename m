Return-Path: <linuxppc-dev+bounces-4825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D3CA05754
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 10:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSjnr4Zqlz2yK7;
	Wed,  8 Jan 2025 20:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736329808;
	cv=none; b=c5d4byI8G674xIDqhOD88Ey3SgU/Qsibhutvxpf3AGOaBy1dXNbhs5Ak3U8eqjRnF1HzUvN/Yo+9sfWpw2dUQfH/pEIfPhDg6HUYfS/i2AKui8IAL5LCLEuBtcLfYtDh7uTr6mwoEicjtn5txGFCDRr20wc7hRufYk7tRU/zEpfApEdVeUWU95BRV0v/bVP2+gOrwaO1o2AqWl361QvDa0evsuw7OgMVrQG647/WUOZy9j0E8YN0GbhMt2SIYJRZwerpfJOvh8iS7J+0hQfqNN5hpsuPXfcgnn9EtV3xluauhjIJgDigPwTrKu5xNBSylTRMAUfGd+q/VeYqSTfb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736329808; c=relaxed/relaxed;
	bh=Z0uiC23m2K2ZICev/VFZZAijQhYVn4n/1prjEYzsuKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUDepFtZoapcUU/I1aYvHZgVwGk9yl2UoRxuW8wstpQg9PKstrq7Tmkrq/SF5qN6LeNMaBqQO8IcM9gvDBok28CHUPUizSyfMJ0bMIyXM7BbtlciWYh6aD8yo/vDEESv9cE/HHM9rLm7vtgCpc4+l0aarMgt09tehHpvoxGB0IwDY4iQw2kP2zqts/N/UiF4sd31h/bg3hsPmMRIjKMk9iTCtT/gsFEyT0/6eUfVMONDnEuoe086S95xhPv8X2hTf9WHm4V/bAj5IjNzyIzAPjqNJIAJOjRf38oSDX/EUDiJPujvybA5I/5BQLkANQ1lJyUi1GH7K+PcsE7ycuMcGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSjnp46vYz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 20:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSj1z29jRz9sTK;
	Wed,  8 Jan 2025 10:15:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXqH98mUMs-g; Wed,  8 Jan 2025 10:15:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSj1v6vHVz9sT8;
	Wed,  8 Jan 2025 10:15:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D9C028B768;
	Wed,  8 Jan 2025 10:15:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id W3lE1VrnDTXq; Wed,  8 Jan 2025 10:15:31 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F0D38B767;
	Wed,  8 Jan 2025 10:15:31 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Song Liu <songliubraving@fb.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] perf machine: Don't ignore _etext when not a text symbol
Date: Wed,  8 Jan 2025 10:15:24 +0100
Message-ID: <b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736327725; l=940; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=fMnywm9bnkqVZTTf5svtwtKIV+4/C0KaR/yTLNTWiVo=; b=s9cyyvTfb0vXSaQrRB5BruTpr5EI+jmIh8y1bJ2ybVcZt3u3PtHv36xGPGd4sUysOlNIOSKAG 2yZTi7DoS9wCVspFcZ8zuWY0khKJccyXtpURJmZyTlXrIkXf90B8nig
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Depending on how vmlinux.lds is written, _etext might be the very
first data symbol instead of the very last text symbol.

Don't require it to be a text symbol, accept any symbol type.

Fixes: ed9adb2035b5 ("perf machine: Read also the end of the kernel")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/perf/util/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 27d5345d2b30..9be2f4479f52 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1003,7 +1003,7 @@ static int machine__get_running_kernel_start(struct machine *machine,
 
 	err = kallsyms__get_symbol_start(filename, "_edata", &addr);
 	if (err)
-		err = kallsyms__get_function_start(filename, "_etext", &addr);
+		err = kallsyms__get_symbol_start(filename, "_etext", &addr);
 	if (!err)
 		*end = addr;
 
-- 
2.47.0


