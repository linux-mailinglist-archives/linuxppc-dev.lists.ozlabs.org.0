Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7513172CC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 01:03:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T8s40R8zzDr76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 11:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=t2+6iqSv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T8mw4kDczDrCS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 11:00:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48T8mn5ft2z9v0ZS;
 Fri, 28 Feb 2020 01:00:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t2+6iqSv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xQKoi1d1ZwHW; Fri, 28 Feb 2020 01:00:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48T8mn2ccqz9v0NZ;
 Fri, 28 Feb 2020 01:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582848009; bh=sLqsvSM9XCrJS0OYZceg3bBqz91EDV+EXPvTYjGqa8I=;
 h=From:Subject:To:Cc:Date:From;
 b=t2+6iqSvvcu7efdV5EXAGKNs0sWWcbdur8nXk8Z0soId4qu/nFqxagTlQ1h+WAKo1
 3fMywaUd3Ld7qjAQaChnAifyVegw9OoYCck665uyk/gREYZAQysasMEe0F4/uE0SB2
 0TaovE4j0sfMNAzT4t9YMCLU7c3kxSx2n7X0gzuE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABEA88B881;
 Fri, 28 Feb 2020 01:00:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6OdaU9QEAVBx; Fri, 28 Feb 2020 01:00:09 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B9818B799;
 Fri, 28 Feb 2020 01:00:09 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EE9CB6540D; Fri, 28 Feb 2020 00:00:08 +0000 (UTC)
Message-Id: <966567c7dbaa26a06730d796354f8a086c0ee288.1582847778.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] selftests: pidfd: Add pidfd_fdinfo_test in .gitignore
To: Christian Kellner <christian@kellner.me>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>
Date: Fri, 28 Feb 2020 00:00:08 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit identified below added pidfd_fdinfo_test
but failed to add it to .gitignore

Fixes: 2def297ec7fb ("pidfd: add tests for NSpid info in fdinfo")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 tools/testing/selftests/pidfd/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pidfd/.gitignore b/tools/testing/selftests/pidfd/.gitignore
index 3a779c084d96..39559d723c41 100644
--- a/tools/testing/selftests/pidfd/.gitignore
+++ b/tools/testing/selftests/pidfd/.gitignore
@@ -2,4 +2,5 @@ pidfd_open_test
 pidfd_poll_test
 pidfd_test
 pidfd_wait
+pidfd_fdinfo_test
 pidfd_getfd_test
-- 
2.25.0

