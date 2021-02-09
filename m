Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC06314F7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 13:50:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZjRr67p4zDsmW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 23:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lFDI3MjO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZjMq0cyszDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 23:47:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FB9964EBA;
 Tue,  9 Feb 2021 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612874835;
 bh=hs6p11+mgDJWDUaPSSxzU5XMfAOrNZY8p8o0cozLHvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFDI3MjOKT+tAWP6ucm5418Wbr+GikdH0qGrQnbnX1rbBEx5DrKG40X9WV8Pmmssm
 72t9cqbOG6ZTKuyI7losZoPRNRSajm6S0KpG91WINC7MkdPt7pZSgB0ftkOaNqmyjl
 boljB8VHi2u6qhZIizGD+EhRNHDbhdck/bKv+WLMCrAH0/EAcdpogeBP6vOx+J8C0o
 wI2BLcZiMCOstS1KVbuOP0BXNSlq3Tn0UGKreoD+sHrJvftRAhQ4hIqKzJUybk/yNs
 doqk8roxhC9Il14drYz4/Qat5V8I4XbWW9h0EklyOZKUAeEvHBQePBfVcOv4PnR3Y1
 wHc73PfiV6t+g==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 0627F40513; Tue,  9 Feb 2021 09:47:13 -0300 (-03)
Date: Tue, 9 Feb 2021 09:47:12 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and
 module start
Message-ID: <20210209124712.GC1018564@kernel.org>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
 <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
 <1D564116-5FAC-4775-BEB2-4D5B837080D6@linux.vnet.ibm.com>
 <20210203153148.GC854763@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203153148.GC854763@kernel.org>
X-Url: http://acmel.wordpress.com
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@redhat.com>,
 Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Feb 03, 2021 at 12:31:48PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Tue, Feb 02, 2021 at 04:02:36PM +0530, Athira Rajeev escreveu:
> > 
> > 
> >     On 18-Jan-2021, at 3:51 PM, kajoljain <kjain@linux.ibm.com> wrote:
> > 
> > 
> > 
> >     On 1/12/21 3:08 PM, Jiri Olsa wrote:
> > 
> >         On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev wrote:
> > 
> >         SNIP
> > 
> > 
> >             c000000002799370 b backtrace_flag
> >             c000000002799378 B radix_tree_node_cachep
> >             c000000002799380 B __bss_stop
> >             c0000000027a0000 B _end
> >             c008000003890000 t icmp_checkentry      [ip_tables]
> >             c008000003890038 t ipt_alloc_initial_table      [ip_tables]
> >             c008000003890468 T ipt_do_table [ip_tables]
> >             c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
> >             ...
> > 
> >             Perf calls function symbols__fixup_end() which sets the end of
> >             symbol
> >             to 0xc008000003890000, which is the next address and this is the
> >             start
> >             address of first module (icmp_checkentry in above) which will make
> >             the
> >             huge symbol size of 0x80000010f0000.
> > 
> >             After symbols__fixup_end:
> >             symbols__fixup_end: sym->name: _end, sym->start:
> >             0xc0000000027a0000,
> >             sym->end: 0xc008000003890000
> > 
> >             On powerpc, kernel text segment is located at 0xc000000000000000
> >             whereas the modules are located at very high memory addresses,
> >             0xc00800000xxxxxxx. Since the gap between end of kernel text
> >             segment
> >             and beginning of first module's address is high, histogram
> >             allocation
> >             using calloc fails.
> > 
> >             Fix this by detecting the kernel's last symbol and limiting
> >             the range of last kernel symbol to pagesize.
> > 
> > 
> >     Patch looks good to me.
> > 
> >     Tested-By: Kajol Jain<kjain@linux.ibm.com>
> > 
> >     Thanks,
> >     Kajol Jain
> > 
> > 
> >             Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> > 
> > 
> >         I can't test, but since the same approach works for arm and s390,
> >         this also looks ok
> > 
> >         Acked-by: Jiri Olsa <jolsa@redhat.com>
> > 
> >         thanks,
> >         jirka
> > 
> > 
> > Hi Arnaldo,
> > 
> > Can you please help review this patch and merge if this looks good..
> 
> Thanks, collected the Tested-by from Kajol and the Acked-by from Jiri
> and applied to my local tree for testing, then up to my perf/core
> branch.

Had to apply this on top.

- Arnaldo

commit 0f000f9c89182950cd3500226729977251529364
Author: Arnaldo Carvalho de Melo <acme@redhat.com>
Date:   Tue Feb 9 09:41:21 2021 -0300

    perf powerpc: Fix printf conversion specifier for IP addresses
    
    We need to use "%#" PRIx64 for u64 values, not "%lx", fixing this build
    problem on powerpc 32-bit:
    
      72    13.69 ubuntu:18.04-x-powerpc        : FAIL powerpc-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
        arch/powerpc/util/machine.c: In function 'arch__symbols__fixup_end':
        arch/powerpc/util/machine.c:23:12: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'u64 {aka long long unsigned int}' [-Werror=format=]
          pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
                    ^
        /git/linux/tools/perf/util/debug.h:18:21: note: in definition of macro 'pr_fmt'
         #define pr_fmt(fmt) fmt
                             ^~~
        /git/linux/tools/perf/util/debug.h:33:29: note: in expansion of macro 'pr_debugN'
         #define pr_debug4(fmt, ...) pr_debugN(4, pr_fmt(fmt), ##__VA_ARGS__)
                                     ^~~~~~~~~
        /git/linux/tools/perf/util/debug.h:33:42: note: in expansion of macro 'pr_fmt'
         #define pr_debug4(fmt, ...) pr_debugN(4, pr_fmt(fmt), ##__VA_ARGS__)
                                                  ^~~~~~
        arch/powerpc/util/machine.c:23:2: note: in expansion of macro 'pr_debug4'
          pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
          ^~~~~~~~~
        cc1: all warnings being treated as errors
        /git/linux/tools/build/Makefile.build:139: recipe for target 'util' failed
        make[5]: *** [util] Error 2
        /git/linux/tools/build/Makefile.build:139: recipe for target 'powerpc' failed
        make[4]: *** [powerpc] Error 2
        /git/linux/tools/build/Makefile.build:139: recipe for target 'arch' failed
        make[3]: *** [arch] Error 2
      73    30.47 ubuntu:18.04-x-powerpc64      : Ok   powerpc64-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
    
    Fixes: 557c3eadb7712741 ("perf powerpc: Fix gap between kernel end and module start")
    Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
    Cc: Jiri Olsa <jolsa@redhat.com>
    Cc: Kajol Jain <kjain@linux.ibm.com>
    Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

diff --git a/tools/perf/arch/powerpc/util/machine.c b/tools/perf/arch/powerpc/util/machine.c
index c30e5cc88c1673d6..e652a1aa8132274f 100644
--- a/tools/perf/arch/powerpc/util/machine.c
+++ b/tools/perf/arch/powerpc/util/machine.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <inttypes.h>
 #include <stdio.h>
 #include <string.h>
 #include <internal/lib.h> // page_size
@@ -20,5 +21,5 @@ void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
 		p->end += page_size;
 	else
 		p->end = c->start;
-	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
+	pr_debug4("%s sym:%s end:%#" PRIx64 "\n", __func__, p->name, p->end);
 }
