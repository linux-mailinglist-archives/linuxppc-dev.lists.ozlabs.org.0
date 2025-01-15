Return-Path: <linuxppc-dev+bounces-5318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B37A12EAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnV1Y0fz3dBs;
	Thu, 16 Jan 2025 09:50:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981454;
	cv=none; b=PjkwrSXe/RDaHMeKdb29XFEiMXk5GJPtwmqLWGDUKCaFImm5xdHSvTZfU2N6ardwiestbu3deESAscvnirjq06Cm8t+rs6DlNAP7NC8IOwK9+WPYynOsnPLBXrjm28SJYb0lkM6mpJZLtqpKWSD8cCQM/2TeMZ/Y/BuRWRD+v2+7X7OvOMCBKwXLe8ZvJWmHt7RCn5Mr7VPsvuXZ++v+WXCP+xO3wMNTzyOMbFxvHlv+tkX561WND4Uc3yMVCQLMdigfgdmbVrjVT7BRfavidpRuSnADoh28cS+EniZfC6lp4ugILTtnUI2CriVT05BvxgkpBnFxLa1tBDF7bwf7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981454; c=relaxed/relaxed;
	bh=qfTp/UWLxQhb4kdvwD7PUGEWhGfvXUBEuWKEojvgNXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFWCw5RiEjqBs3uBzJ26v+a4BPM45bDTI/rIHJfFNdEU/o+1ghYlx9TO4lY7aqxQ2BgXNCnvBMGkZPDqaSVEbJ/hRcMZkVTejxIywTaa+3vE1bb+FLr9IXUvLUiCLoSvJmTOjx3zdIpTQWS+c14TbP7ySWl0UYRI6EVrL5XgYtVoIQHp3YRdpQCXu5SsHXhfaz5rdpVV/3VHg+/6TrzU9VAlIPSif2TCZhF/bAhGR5XKmTcAo7jpuulNNhNNscbtQtztW4mOGUB/5Q0Git0HwS5omRWA5LwcGRNE99tK+nyQcar3Ls8tovlVBJNCeE7wzivRAct40WbU0XhL7m+SRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnT4RQVz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLck6gxXz9sSf;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dr5Ps3RQ53L0; Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLck5yY5z9sSd;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BCD238B77A;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id o-cH9_aqzb1D; Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A04948B774;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 11/15] objtool: .rodata.cst{2/4/8/16} are not switch tables
Date: Wed, 15 Jan 2025 23:42:51 +0100
Message-ID: <c7449575c94672ec0ba5091e03007e0b052c15dc.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=775; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ZbF92lKn/a2BcO+/Rt9A3tjdZfwn64sAKLypVaGo9hw=; b=HVqgwXZ3/EXy0sYgLk6n8xkh8j2Gln6sKIw9R/abzTvIv6inqVrwnFsumz+MkEEFrqio6tXGN 941QxuIDnGhBaJaHHI9M6hFbpY2HnvgcT9nhxdDO96zQyP/U1c+Ixib
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Exclude sections named
  .rodata.cst2
  .rodata.cst4
  .rodata.cst8
  .rodata.cst16
as they won't contain switch tables.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 87b81d8e01c0..91436f4b3622 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2506,7 +2506,8 @@ static void mark_rodata(struct objtool_file *file)
 	 */
 	for_each_sec(file, sec) {
 		if (!strncmp(sec->name, ".rodata", 7) &&
-		    !strstr(sec->name, ".str1.")) {
+		    !strstr(sec->name, ".str1.") &&
+		    !strstr(sec->name, ".cst")) {
 			sec->rodata = true;
 			found = true;
 		}
-- 
2.47.0


