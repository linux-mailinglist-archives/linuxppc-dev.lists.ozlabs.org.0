Return-Path: <linuxppc-dev+bounces-4826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08AA05756
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 10:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSjnw5M3fz30RS;
	Wed,  8 Jan 2025 20:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736329812;
	cv=none; b=WLDA018TKkpzepE91ZjuteJSv5p56kyDSsOQeVx0Y5Pzg0Da8Go5ImICS6RAwG/6ka2PbfFXpubXlVkT4VVzVWcDTsmK6bwWC4YTUfPB49nyXPMskpCTh2yUhl4mGagm/a8UiX1OdbQwXhkAPyIUvvpLVv6FB/ojdeRRy2+UIwc9qJVhgh3PLSODADssA6PyIHC/pDXnDX7ViGoYyMmqLusaDklA6+RqcxvSzjJMe68xzTrgky0m4xHK11HkT0VmCumUGA1ZM+4L/SKW078+hNC7Ko/XZRVSW2MgJ8Z1sUlqEl/6Lv1ZfiTDGKafo4E5/qVwDspakHO9xj61kdaN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736329812; c=relaxed/relaxed;
	bh=Me7zWJz8ybuDBVMUh8hJu6Zfmsu4PFcgrciLle2SOE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXrQjmw8hLb57xTMr+x61m4IzWwNippuQ6yAaM1sAKD4DbSA0weIbl11azySfr1YxUiCfW9WRpGJI6jyYpUSYZ5waDUTe8jcEcoED9kRc10pbke/kWNc/nI/GbsncdUV+zr4+qYEw55BXzKhb4U4kholXWder4C4B1ssXi1chvrPAF7FeFpFALp4FAaw/wp/TjsEvV0pVMwQN5tqNKAhkrVM1xwAEUrKk+bqVSlGG/sQbmX675eXZe/S88YwmD5JOIHP6lLkY+dB0jxsOf+KjawSak2TtgM5gsvRnl6Bk4qRdBovQxRrlRH+WrAEdM9yGReN7vO4efBak1Eenrd5qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSjnw0PL1z2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 20:50:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSj4k1Tlzz9sTD;
	Wed,  8 Jan 2025 10:17:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ev2o6ECynf8S; Wed,  8 Jan 2025 10:17:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSj4k0lh3z9sT7;
	Wed,  8 Jan 2025 10:17:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 073E98B768;
	Wed,  8 Jan 2025 10:17:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WA33TRlzg4jX; Wed,  8 Jan 2025 10:17:57 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 960068B767;
	Wed,  8 Jan 2025 10:17:57 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] kallsyms: Always include _edata
Date: Wed,  8 Jan 2025 10:17:54 +0100
Message-ID: <2fec8c50c271dff59f0177ff0884b6c374486ba5.1736327770.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736327874; l=901; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=zYAGE8QbxKeiF29HDF5A4cvzDluLkNIsa/y7/gNnmaE=; b=phUBcQMzGu5s2Any9DFi8D1iChFZ7vYkQDjKS53d6tiKMn4sMiQpDS5WHfeNw2d3Q3TM2ovXy s8XRIyMcqpUCNzZb+YM2+yRyzFNqLlJHQ14jecGoCbMR/pOF8CC1Yk2
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since commit 69a87a32f5cd ("perf machine: Include data symbols in the
kernel map"), perf needs _edata symbol.

Make sure it is always included in /proc/kallsyms and not only when
CONFIG_KALLSYMS_ALL is selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 69a87a32f5cd ("perf machine: Include data symbols in the kernel map")
---
 scripts/kallsyms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 03852da3d249..391ab7ebce7f 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -215,6 +215,8 @@ static int symbol_valid(const struct sym_entry *s)
 		if (string_starts_with(name, "__start_") ||
 		    string_starts_with(name, "__stop_"))
 			return 1;
+		if (!strcmp(name, "_edata"))
+			return 1;
 
 		if (symbol_in_range(s, text_ranges,
 				    ARRAY_SIZE(text_ranges)) == 0)
-- 
2.47.0


