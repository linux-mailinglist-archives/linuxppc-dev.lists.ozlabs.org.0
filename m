Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657D13456C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:31:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4JNP6bxZz3bd3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 15:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.35; helo=mail-m17635.qiye.163.com;
 envelope-from=zhouchuangao@vivo.com; receiver=<UNKNOWN>)
X-Greylist: delayed 531 seconds by postgrey-1.36 at boromir;
 Tue, 23 Mar 2021 13:07:47 AEDT
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4FBW3V34z2xfZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:07:44 +1100 (AEDT)
Received: from ubuntu.localdomain (unknown [36.152.145.182])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 9DDE8400208;
 Tue, 23 Mar 2021 09:58:33 +0800 (CST)
From: zhouchuangao <zhouchuangao@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Suchanek <msuchanek@suse.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arch/powerpc/kernel: Duplicate include asm/interrupt.h
Date: Mon, 22 Mar 2021 18:57:25 -0700
Message-Id: <1616464656-59372-1-git-send-email-zhouchuangao@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSEseQh9ISUNKSk9KVkpNSk1PTU9MSk9KS0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6Eww*KD8PEjpJEDQ8FjMI
 Nz5PFClVSlVKTUpNT01PTEpPQkxJVTMWGhIXVQETFA4YEw4aFRwaFDsNEg0UVRgUFkVZV1kSC1lB
 WUhNVUpOSVVKT05VSkNJWVdZCAFZQUpDTE43Bg++
X-HM-Tid: 0a785cce185fd991kuws9dde8400208
X-Mailman-Approved-At: Tue, 23 Mar 2021 15:31:17 +1100
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
Cc: zhouchuangao <zhouchuangao@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

asm/interrupt.h is repeatedly in the file interrupt.c.

Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
---
 arch/powerpc/kernel/interrupt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c475a22..6deaccc 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -9,7 +9,6 @@
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
 #include <asm/hw_irq.h>
-#include <asm/interrupt.h>
 #include <asm/kprobes.h>
 #include <asm/paca.h>
 #include <asm/ptrace.h>
-- 
2.7.4

