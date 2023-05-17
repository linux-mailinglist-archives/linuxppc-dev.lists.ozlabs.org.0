Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D57069BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLv2M5K2Qz3fp6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:23:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sUL++CNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sUL++CNi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtpJ2GBpz3fK7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:13:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A47C163E73;
	Wed, 17 May 2023 13:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19EFC433A0;
	Wed, 17 May 2023 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329206;
	bh=JGGRsTfqJlmibWTBDdmhkqjrT8ru+5vGeLr90vAqN7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sUL++CNilYTKBfXlj2dPw8lmLxduHSA+47PUjO45sLxz4n2hEzFLajiqXD05oRvI8
	 26qxQpUDKHthdA9YwLEN/YHntIwAjq5IVk/J7nX75CJFm0yAiW/fp8Unf6Rbj8LRNG
	 UuAyk54JKmTtRzRbemmz9tzUGfiyIgAB+TQe5EXHbuj+wPEfM/oRJtkiWyMRQrpic3
	 qOjN6jBo+fGjO/IUX/iF6ln8D5N66od5Gncx4RdpQj8+TWomVhhGXJRHHJK3AEjfup
	 2fvc0cvn3xNc2dtggIu38wLBvRDjizWLgiEZ0mpy6+j/cgELWKA2rntPrjWLUxoYaK
	 TbULgVLN3CPyA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 14/14] time_namespace: always provide arch_get_vdso_data() prototype for vdso
Date: Wed, 17 May 2023 15:11:02 +0200
Message-Id: <20230517131102.934196-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The arch_get_vdso_data() function is defined separately on each architecture,
but only called when CONFIG_TIME_NS is set. If the definition is a global
function, this causes a W=1 warning without TIME_NS:

arch/x86/entry/vdso/vma.c:35:19: error: no previous prototype for 'arch_get_vdso_data' [-Werror=missing-prototypes]

Move the prototype out of the #ifdef block to reliably turn off that
warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/time_namespace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index bb9d3f5542f8..03d9c5ac01d1 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -44,7 +44,6 @@ struct time_namespace *copy_time_ns(unsigned long flags,
 				    struct time_namespace *old_ns);
 void free_time_ns(struct time_namespace *ns);
 void timens_on_fork(struct nsproxy *nsproxy, struct task_struct *tsk);
-struct vdso_data *arch_get_vdso_data(void *vvar_page);
 struct page *find_timens_vvar_page(struct vm_area_struct *vma);
 
 static inline void put_time_ns(struct time_namespace *ns)
@@ -163,4 +162,6 @@ static inline ktime_t timens_ktime_to_host(clockid_t clockid, ktime_t tim)
 }
 #endif
 
+struct vdso_data *arch_get_vdso_data(void *vvar_page);
+
 #endif /* _LINUX_TIMENS_H */
-- 
2.39.2

