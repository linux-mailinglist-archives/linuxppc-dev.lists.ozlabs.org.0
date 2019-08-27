Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6E9F408
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:26:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J0kd1mWpzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:26:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J0dJ4spNzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 06:21:23 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0A9AB0E5;
 Tue, 27 Aug 2019 20:21:18 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] Disable compat cruft on ppc64le
Date: Tue, 27 Aug 2019 22:21:05 +0200
Message-Id: <cover.1566936688.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
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
Cc: David Hildenbrand <david@redhat.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Firoz Khan <firoz.khan@linaro.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With endian switch disabled by default the ppc64le compat supports
ppc32le only which is something next to nobody has binaries for.

Less code means less bugs so drop the compat stuff.

I am not particularly sure about the best way to resolve the llseek
situation. I don't see anything in the syscal tables making it
32bit-only so I suppose it should be available on 64bit as well.

This is tested on ppc64le top of

https://patchwork.ozlabs.org/cover/1141078/
https://patchwork.ozlabs.org/cover/1153556/
https://patchwork.ozlabs.org/cover/1150815/

Thanks

Michal

Michal Suchanek (4):
  fs: always build llseek.
  powerpc: move common register copy functions from signal_32.c to
    signal.c
  powerpc/64: make buildable without CONFIG_COMPAT
  powerpc/64: Disable COMPAT if littleendian.

 arch/powerpc/Kconfig               |   2 +-
 arch/powerpc/include/asm/syscall.h |   2 +
 arch/powerpc/kernel/Makefile       |  15 ++-
 arch/powerpc/kernel/entry_64.S     |   2 +
 arch/powerpc/kernel/signal.c       | 146 ++++++++++++++++++++++++++++-
 arch/powerpc/kernel/signal_32.c    | 140 ---------------------------
 arch/powerpc/kernel/syscall_64.c   |   5 +-
 arch/powerpc/kernel/vdso.c         |   4 +-
 arch/powerpc/perf/callchain.c      |  14 ++-
 fs/read_write.c                    |   2 -
 10 files changed, 177 insertions(+), 155 deletions(-)

-- 
2.22.0

