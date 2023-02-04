Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DD68AB02
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 16:48:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8H3x3Smjz3f92
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 02:48:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TvEok09d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TvEok09d;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8H305b9pz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 02:47:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D5E560B3C;
	Sat,  4 Feb 2023 15:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D32C433D2;
	Sat,  4 Feb 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675525639;
	bh=4c3vnPf5GRh9YHWyKGNEsvavDpComXQ5lkh7VdPCeEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvEok09dWMynxhcYYPk+07t9ROiZNF00O/UsGFV997Tqj475XEsGkBCBn2XlSina1
	 z/8GzJIp7ENMilH7L1vMBCFJqDZbGxeMg0agWNsFIiGMD2BnQNcHnrIz4OqWlY/Q+U
	 /277jGk9YYz9EYodXtszMKahk4hf2g5IzsswDurn9Ih5q/tbCPpMyg96kL4hIUgIfO
	 HUHwRejkdgeKf9qIQHP9DOZpVEexvZSI5BT71V5cA2lQahlT/w6LHQC8Ne3MkjDCvU
	 pd8nClqrn2vWpEnYMK0MOldlBp5Tx5B/HQ2Sh+Fy9u1+3oawvrG1JAbfx23Xp42S5V
	 0infUhuw3NCeQ==
Date: Sat, 4 Feb 2023 07:47:17 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 15/16] objtool/powerpc: Enable objtool to be built on
 ppc
Message-ID: <20230204154717.w3gef6jbuhpyardp@treble>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-16-sv@linux.ibm.com>
 <33924523-5437-eb9a-116a-8e249ce99bd2@csgroup.eu>
 <b1079e99-c7ae-71f1-d578-80270adf44e7@infradead.org>
 <756321f5-9417-2d78-679a-1847fa18ff8a@infradead.org>
 <b212bec9-27c5-6be0-d33e-e23978a322a2@infradead.org>
 <20d2e88f-f543-2b46-8b2d-e6ac31462847@csgroup.eu>
 <98bda5ff-3249-fd2b-1a51-57c781aad56f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98bda5ff-3249-fd2b-1a51-57c781aad56f@csgroup.eu>
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Elliott, Robert \(Servers\)" <elliott@hpe.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 04, 2023 at 02:10:34PM +0100, Christophe Leroy wrote:
> Ok, got the same problem as you with next-20230203
> 
>   DESCEND objtool
> <stdin>:1:10: fatal error: libelf.h: No such file or directory
> compilation terminated.
>   HOSTCC  /home/chleroy/linux-powerpc/tools/objtool/fixdep.o
>   HOSTLD  /home/chleroy/linux-powerpc/tools/objtool/fixdep-in.o
>   LINK    /home/chleroy/linux-powerpc/tools/objtool/fixdep
>   CC      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/exec-cmd.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/help.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/pager.o
>   CC /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/parse-options.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/run-command.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/sigchain.o
>   CC /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/subcmd-config.o
>   LD /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/libsubcmd-in.o
>   AR      /home/chleroy/linux-powerpc/tools/objtool/libsubcmd/libsubcmd.a
>   INSTALL libsubcmd_headers
>   CC      /home/chleroy/linux-powerpc/tools/objtool/arch/powerpc/decode.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/arch/powerpc/special.o
>   LD /home/chleroy/linux-powerpc/tools/objtool/arch/powerpc/objtool-in.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/weak.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/check.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/special.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/builtin-check.o
>   CC      /home/chleroy/linux-powerpc/tools/objtool/elf.o
> elf.c: In function 'read_sections':
> elf.c:273:9: error: 'elf_getshnum' is deprecated
> [-Werror=deprecated-declarations]
>   273 |         if (elf_getshdrnum(elf->elf, &sections_nr)) {
>       |         ^~

This should be fixed with the latest tip/objtool/core which was rebased
today.  Here's the diff:

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 29a8cd7449bf..83b100c1e7f6 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -36,7 +36,7 @@ OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBE
 OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
 
 # Allow old libelf to be used:
-elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
+elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - | grep elf_getshdr)
 OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 
 # Always want host compilation.
