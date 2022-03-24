Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8C4E657A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSZK1NvVz3dtL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSX950zzz3fkP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:38:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSX62HjWz9sTc;
 Thu, 24 Mar 2022 15:38:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOd6mjyXr49c; Thu, 24 Mar 2022 15:38:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSX558LRz9sTd;
 Thu, 24 Mar 2022 15:38:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99F338B780;
 Thu, 24 Mar 2022 15:38:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R1rS3cN8Kx5q; Thu, 24 Mar 2022 15:38:45 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6177B8B763;
 Thu, 24 Mar 2022 15:38:45 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEcaV21812193
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:38:36 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEcZLo1812192;
 Thu, 24 Mar 2022 15:38:35 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: [PATCH] MAINTAINERS: Add arch/powerpc/kernel/trace to TRACING
Date: Thu, 24 Mar 2022 15:38:28 +0100
Message-Id: <8e2f707e2efa1fc1d1ffd2f9f6758e8c4a82c83e.1648132613.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132705; l=702; s=20211009;
 h=from:subject:message-id; bh=VEiHejukkD6EZJAo8+kChtTLQI9cl6qtorMrMMgbRi0=;
 b=q6/wjhgxZixX3J8tO3a8TY6mz7jgRoalpOIdoOKiSnDOoAKScLU7RrrNca8BY4YVhvs3YugCV9s+
 DVDflFk5CgCoqJSvyC87h115ECB/jS5eO0JrL4CKq4V7EOAiTAqO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most architectures have ftrace related stuff in arch/*/kernel/ftrace.c
but powerpc has spread in multiple files located in
arch/powerpc/kernel/trace/

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e127c2fb08a7..3b5943f34568 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19592,6 +19592,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
 F:	Documentation/trace/ftrace.rst
 F:	arch/*/*/*/ftrace.h
 F:	arch/*/kernel/ftrace.c
+F:	arch/powerpc/kernel/trace/
 F:	fs/tracefs/
 F:	include/*/ftrace.h
 F:	include/linux/trace*.h
-- 
2.35.1

