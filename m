Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D414A3E19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 21:02:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kpkb0ZXbzDqwM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 05:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kpds3FHJzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 04:58:09 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3993ABE9;
 Fri, 30 Aug 2019 18:58:05 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/6] powerpc: make llseek 32bit-only.
Date: Fri, 30 Aug 2019 20:57:52 +0200
Message-Id: <bb6d25c6baae315d05b571d8c508f0e8fa90027c.1567188299.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567188299.git.msuchanek@suse.de>
References: <cover.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Allison Randal <allison@lohutok.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 Firoz Khan <firoz.khan@linaro.org>, Michal Suchanek <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The llseek syscall is not built in fs/read_write.c when !64bit && !COMPAT
With the syscall marked as common in syscall.tbl build fails in this
case.

The llseek interface does not make sense on 64bit and it is explicitly
described as 32bit interface. Use on 64bit is not well-defined so just
drop it for 64bit.

Fixes: caf6f9c8a326 ("asm-generic: Remove unneeded __ARCH_WANT_SYS_LLSEEK macro")
Link: https://lore.kernel.org/lkml/20190828151552.GA16855@infradead.org/
Link: https://lore.kernel.org/lkml/20190829214319.498c7de2@naga/

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v5: update commit message.
---
 arch/powerpc/kernel/syscalls/syscall.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 010b9f445586..53e427606f6c 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -188,7 +188,7 @@
 137	common	afs_syscall			sys_ni_syscall
 138	common	setfsuid			sys_setfsuid
 139	common	setfsgid			sys_setfsgid
-140	common	_llseek				sys_llseek
+140	32	_llseek				sys_llseek
 141	common	getdents			sys_getdents			compat_sys_getdents
 142	common	_newselect			sys_select			compat_sys_select
 143	common	flock				sys_flock
-- 
2.22.0

