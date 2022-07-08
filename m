Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF456BD01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 17:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lfcxt5trmz3cCF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 01:43:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfcxQ1KPjz306r
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 01:43:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LfcxF5Z83z9tLy;
	Fri,  8 Jul 2022 17:42:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrLG8Zz7NbHn; Fri,  8 Jul 2022 17:42:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LfcxF4gdYz9tLp;
	Fri,  8 Jul 2022 17:42:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E83F8B76E;
	Fri,  8 Jul 2022 17:42:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GlkeXLTRQmNg; Fri,  8 Jul 2022 17:42:57 +0200 (CEST)
Received: from [192.168.233.202] (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD89C8B763;
	Fri,  8 Jul 2022 17:42:56 +0200 (CEST)
Message-ID: <e5bee04b-f246-ab24-f019-b26011f32c32@csgroup.eu>
Date: Fri, 8 Jul 2022 17:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v3 00/12] objtool: Enable and implement --mcount
 option on powerpc
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <ae669ab4-681b-1a0d-3bbc-4fdf13b501a0@csgroup.eu>
In-Reply-To: <ae669ab4-681b-1a0d-3bbc-4fdf13b501a0@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, aik@ozlabs.ru, mingo@redhat.com, paulus@samba.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/07/2022 à 17:06, Christophe Leroy a écrit :
> 
> 
> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
>> These patches are rebased on top of objtool/core
>> branch of the tip tree, and are tested on
>> ppc64le with ppc64le_defconfig.
> 
> Seems like objtool/core has been merged in 5.19. I was able to apply 
> your series on top of powerpc/merge branch. Only a small conflict with 
> patch "objtool: Add --mnop as an option to --mcount" because of commit 
> b42d23065024 ("kbuild: factor out the common objtool arguments")


In order to build, you will also need the following new file:

diff --git a/arch/powerpc/include/asm/asm.h b/arch/powerpc/include/asm/asm.h
new file mode 100644
index 000000000000..86f46b604e9a
--- /dev/null
+++ b/arch/powerpc/include/asm/asm.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_ASM_H
+#define _ASM_POWERPC_ASM_H
+
+#define _ASM_PTR	" .long "
+
+#endif /* _ASM_POWERPC_ASM_H */



> 
>>
>> Christophe Leroy (3):
>>    objtool: Fix SEGFAULT
>>    objtool: Use target file endianness instead of a compiled constant
>>    objtool: Use target file class size instead of a compiled constant
>>
>> Sathvika Vasireddy(9):
>>    objtool: Add --mnop as an option to --mcount
>>    powerpc: Skip objtool from running on VDSO files
>>    objtool: Read special sections with alts only when specific options 
>> are selected
>>    objtool: Use macros to define arch specific reloc types
>>    objtool: Add arch specific function arch_ftrace_match()
>>    objtool/powerpc: Enable objtool to be built on ppc
>>    objtool/powerpc: Add --mcount specific implementation
>>    powerpc: Remove unreachable() from WARN_ON()
>>    objtool/powerpc: Fix unannotated intra-function call warnings
>>
>>   Makefile                                      |  4 +-
>>   arch/powerpc/Kconfig                          |  2 +
>>   arch/powerpc/include/asm/bug.h                |  1 -
>>   arch/powerpc/kernel/entry_64.S                |  2 +
>>   arch/powerpc/kernel/exceptions-64s.S          |  7 +-
>>   arch/powerpc/kernel/head_64.S                 |  7 +-
>>   arch/powerpc/kernel/misc_64.S                 |  4 +-
>>   arch/powerpc/kernel/vdso/Makefile             |  2 +
>>   arch/powerpc/kernel/vector.S                  |  4 +-
>>   arch/powerpc/kvm/book3s_hv_interrupts.S       |  4 +-
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S       | 25 +++--
>>   arch/x86/Kconfig                              |  1 +
>>   scripts/Makefile.build                        |  1 +
>>   tools/objtool/arch/powerpc/Build              |  2 +
>>   tools/objtool/arch/powerpc/decode.c           | 96 +++++++++++++++++++
>>   .../arch/powerpc/include/arch/cfi_regs.h      | 11 +++
>>   tools/objtool/arch/powerpc/include/arch/elf.h | 10 ++
>>   .../arch/powerpc/include/arch/special.h       | 21 ++++
>>   tools/objtool/arch/powerpc/special.c          | 19 ++++
>>   tools/objtool/arch/x86/decode.c               |  8 ++
>>   tools/objtool/arch/x86/include/arch/elf.h     |  2 +
>>   .../arch/x86/include/arch/endianness.h        |  9 --
>>   tools/objtool/builtin-check.c                 | 14 +++
>>   tools/objtool/check.c                         | 51 +++++-----
>>   tools/objtool/elf.c                           |  8 +-
>>   tools/objtool/include/objtool/arch.h          |  2 +
>>   tools/objtool/include/objtool/builtin.h       |  1 +
>>   tools/objtool/include/objtool/elf.h           |  8 ++
>>   tools/objtool/include/objtool/endianness.h    | 32 +++----
>>   tools/objtool/orc_dump.c                      | 11 ++-
>>   tools/objtool/orc_gen.c                       |  4 +-
>>   tools/objtool/special.c                       |  3 +-
>>   32 files changed, 305 insertions(+), 71 deletions(-)
>>   create mode 100644 tools/objtool/arch/powerpc/Build
>>   create mode 100644 tools/objtool/arch/powerpc/decode.c
>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
>>   create mode 100644 tools/objtool/arch/powerpc/special.c
>>   delete mode 100644 tools/objtool/arch/x86/include/arch/endianness.h
>>
