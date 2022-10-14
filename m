Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11295FF583
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 23:38:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq0BS56lmz3dqq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 08:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=omp.ru (client-ip=90.154.21.10; helo=mx01.omp.ru; envelope-from=s.shtylyov@omp.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 908 seconds by postgrey-1.36 at boromir; Sat, 15 Oct 2022 08:38:08 AEDT
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq09r43Cyz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 08:38:07 +1100 (AEDT)
Received: from localhost.localdomain (178.176.75.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 15 Oct
 2022 00:22:41 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn
	<jonas@southpole.se>, Stefan Kristiansson
	<stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
	<deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
	"David S. Miller" <davem@davemloft.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hexagon@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<openrisc@lists.librecores.org>, <sparclinux@vger.kernel.org>
Subject: [PATCH 00/13] Make user_regset_copyin_ignore() *void*
Date: Sat, 15 Oct 2022 00:22:22 +0300
Message-ID: <20221014212235.10770-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.75.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/14/2022 21:00:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 173137 [Oct 14 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 500 500 6cc86d8f5638d79810308830d98d6b6279998c49
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: 	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.138
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2022 21:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/14/2022 3:23:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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
Cc: Andrew Morton <akpm@linux-foundation.org>, lvc-patches@linuxtesting.org, lvc-project@linuxtesting.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here are 13 patches against the 'next-20221014' tag of the 'linux-next.git'
repo.  I'm not sure how this cross-arch series should be merged -- perhaps
thru Andrew Morton's tree?

user_regset_copyin_ignore() apparently cannot fail and so always returns 0.
Let's first remove the result checks in several architectures that call this
function and then make user_regset_copyin_ignore() return *void* instead of
*int*...

Sergey Shtylyov (13):
  arc: ptrace: user_regset_copyin_ignore() always returns 0
  arm: ptrace: user_regset_copyin_ignore() always returns 0
  arm64: ptrace: user_regset_copyin_ignore() always returns 0
  hexagon: ptrace: user_regset_copyin_ignore() always returns 0
  ia64: ptrace: user_regset_copyin_ignore() always returns 0
  mips: ptrace: user_regset_copyin_ignore() always returns 0
  nios2: ptrace: user_regset_copyin_ignore() always returns 0
  openrisc: ptrace: user_regset_copyin_ignore() always returns 0
  parisc: ptrace: user_regset_copyin_ignore() always returns 0
  powerpc: ptrace: user_regset_copyin_ignore() always returns 0
  sh: ptrace: user_regset_copyin_ignore() always returns 0
  sparc: ptrace: user_regset_copyin_ignore() always returns 0
  regset: make user_regset_copyin_ignore() *void*

 arch/arc/kernel/ptrace.c                 |  2 +-
 arch/arm/kernel/ptrace.c                 |  8 +++-----
 arch/arm64/kernel/ptrace.c               | 16 ++++------------
 arch/hexagon/kernel/ptrace.c             |  7 +++----
 arch/ia64/kernel/ptrace.c                | 20 +++++++++-----------
 arch/mips/kernel/ptrace.c                |  9 +++++----
 arch/nios2/kernel/ptrace.c               |  6 +++---
 arch/openrisc/kernel/ptrace.c            |  8 +++-----
 arch/parisc/kernel/ptrace.c              | 15 +++++++++------
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 10 +++++-----
 arch/powerpc/kernel/ptrace/ptrace-view.c | 10 +++++-----
 arch/sh/kernel/ptrace_32.c               |  8 ++++----
 arch/sparc/kernel/ptrace_32.c            |  9 +++++----
 arch/sparc/kernel/ptrace_64.c            | 23 +++++++++++------------
 include/linux/regset.h                   | 15 +++++++--------
 15 files changed, 77 insertions(+), 89 deletions(-)

-- 
2.26.3

