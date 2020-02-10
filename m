Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0F157038
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 09:07:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GJRd4G9szDqQF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 19:07:41 +1100 (AEDT)
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
 header.s=mail header.b=Q9PZ66ec; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GJPj51v4zDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 19:06:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GJPV6qZSz9v1WW;
 Mon, 10 Feb 2020 09:05:50 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q9PZ66ec; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VXrcAwCnm-QK; Mon, 10 Feb 2020 09:05:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GJPV5hbBz9v1WV;
 Mon, 10 Feb 2020 09:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581321950; bh=g5lELxiDPugJidKDMMRMUo7mvZxA3VLd9BiCzyPCPoo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Q9PZ66ecIR0CCXR8WUeTiCM3sTHzQtkVfOH89/VJNoS0GNYaomLxeUB+vaPA+4rMS
 +Usk8AaPJ9jbhpXT8SqIu7DtwTSA0AD5Ek3vFQoQbKfLVFMYC7uNLcRGoVUowJrG9K
 1tj8qq6bI9JZFxUDlf/oH+YJWmZUdoBs8VuJtgYM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E48B8B7A7;
 Mon, 10 Feb 2020 09:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zHAuZwC68M1o; Mon, 10 Feb 2020 09:05:55 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 482E38B798;
 Mon, 10 Feb 2020 09:05:55 +0100 (CET)
Subject: Re: [RESEND][PATCH] selftests/vm: Fix vm tests build and run
To: Harish <harish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200210073521.14117-1-harish@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fa68a829-b909-a743-68da-957c692f5c84@c-s.fr>
Date: Mon, 10 Feb 2020 09:05:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210073521.14117-1-harish@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/02/2020 à 08:35, Harish a écrit :
> A recent change overrides the ARCH env variable and hence runs
> using make fails with the following.
> 
> $ make -C vm/
> make: Entering directory '/home/harish/linux/tools/testing/selftests/vm'
> make --no-builtin-rules ARCH=ppc64le -C ../../../.. headers_install
> make[1]: Entering directory '/home/harish/linux'
> Makefile:652: arch/ppc64le/Makefile: No such file or directory
> make[1]: *** No rule to make target 'arch/ppc64le/Makefile'.  Stop.
> make[1]: Leaving directory '/home/harish/linux'
> make: *** [../lib.mk:50: khdr] Error 2
> make: Leaving directory '/home/harish/linux/tools/testing/selftests/vm'
> 
> Patch fixes this issue and also handles ppc64/ppc64le archs to enable
> few tests

Isn't it the same as 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=155975 ?

Christophe

> 
> Signed-off-by: Harish <harish@linux.ibm.com>
> ---
>   tools/testing/selftests/vm/Makefile    | 4 ++--
>   tools/testing/selftests/vm/run_vmtests | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index 7f9a8a8c31da..49bb15be1447 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for vm selftests
>   uname_M := $(shell uname -m 2>/dev/null || echo not)
> -ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/')
> +ARCH_USED ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/')
>   
>   CFLAGS = -Wall -I ../../../../usr/include $(EXTRA_CFLAGS)
>   LDLIBS = -lrt
> @@ -19,7 +19,7 @@ TEST_GEN_FILES += thuge-gen
>   TEST_GEN_FILES += transhuge-stress
>   TEST_GEN_FILES += userfaultfd
>   
> -ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64))
> +ifneq (,$(filter $(ARCH_USED),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64))
>   TEST_GEN_FILES += va_128TBswitch
>   TEST_GEN_FILES += virtual_address_range
>   endif
> diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
> index a692ea828317..da63dfb9713a 100755
> --- a/tools/testing/selftests/vm/run_vmtests
> +++ b/tools/testing/selftests/vm/run_vmtests
> @@ -61,7 +61,7 @@ fi
>   #filter 64bit architectures
>   ARCH64STR="arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64"
>   if [ -z $ARCH ]; then
> -  ARCH=`uname -m 2>/dev/null | sed -e 's/aarch64.*/arm64/'`
> +  ARCH=`uname -m 2>/dev/null | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/'`
>   fi
>   VADDR64=0
>   echo "$ARCH64STR" | grep $ARCH && VADDR64=1
> 
