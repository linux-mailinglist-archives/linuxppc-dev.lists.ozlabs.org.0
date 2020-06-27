Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4720BF89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 09:31:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v55b3ZtSzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:30:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3c141e6ecba9ad0677a1+6152+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=LnMGpzds; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49v51c1MpZzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 17:27:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=WF3lnu8Ab9pal8d+L5CJQSnF7YblfVXe9YB122JUEL8=; b=LnMGpzds0pKVb++Ll9qJeyPBlz
 bZLdBLNHbz+Z479r8nUV78+wnbcKgIp5Do++xHw8qv7SG4DBARi0P4MBiDZ9X6tSasRxUf+zEmYbc
 tZ3OHYrvlvIrwRAf5hb29Rwh8uD6Rv8E3Y6Lcrz/U5vlZbHRZLfhpp5iQS+POraJTB/yWxnOgrbrd
 fxJi2NPsxDTGPjozb+M7K41cPSxLW7V4OKc8by80DBew2jriADNi4Kb+AfnIVXpb4PONujdJWAfpB
 iz0eROiH1yRCN9g9pQyW7b53iCg4a0fH9msn4CpyIxpiDms1zVzkPhm64y7bwJGCQTjQ+uLWS74Kq
 0/cnXaDw==;
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp5Ew-0006W3-6i; Sat, 27 Jun 2020 07:27:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: properly support exec with kernel pointers v3
Date: Sat, 27 Jun 2020 09:26:59 +0200
Message-Id: <20200627072704.2447163-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series first cleans up the exec code and then adds proper
kernel_execveat and kernel_wait callers instead of relying on the fact
that the early init code and kernel threads implicitly run with
the address limit set to KERNEL_DS.

Note that the cleanup removes the compat execve(at) handlers entirely, as
we can handle the compat difference very nicely in a unified codebase.
x32 needs two hacky #defines for that for now, although those can go
away if the x32 syscall rework from Brian gets merged.

I think this is ready to get picked up.  What would the best tree be?
Most important a git tree would be good, as I have other work building
on top of it.


Changes since v2:
 - drop the kernel_wait addition, as this interacts with a series
   from Luis and should be merged together with that one

Changes since v1:
 - remove a pointless ifdef from get_user_arg_ptr
 - remove the need for a compat syscall handler for x32


Diffstat:
 arch/arm64/include/asm/unistd32.h                  |    4 
 arch/mips/kernel/syscalls/syscall_n32.tbl          |    4 
 arch/mips/kernel/syscalls/syscall_o32.tbl          |    4 
 arch/parisc/kernel/syscalls/syscall.tbl            |    4 
 arch/powerpc/kernel/syscalls/syscall.tbl           |    4 
 arch/s390/kernel/syscalls/syscall.tbl              |    4 
 arch/sparc/kernel/syscalls.S                       |    4 
 arch/x86/entry/syscall_x32.c                       |    7 
 arch/x86/entry/syscalls/syscall_32.tbl             |    4 
 arch/x86/entry/syscalls/syscall_64.tbl             |    4 
 fs/exec.c                                          |  248 ++++++++-------------
 include/linux/binfmts.h                            |   10 
 include/linux/compat.h                             |    7 
 include/uapi/asm-generic/unistd.h                  |    4 
 init/main.c                                        |    5 
 kernel/umh.c                                       |   14 -
 tools/include/uapi/asm-generic/unistd.h            |    4 
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |    4 
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |    4 
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |    4 
 20 files changed, 149 insertions(+), 198 deletions(-)
