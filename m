Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09C2CA917
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 18:00:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClpHj0JjBzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 04:00:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClpCs49G3zDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:56:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4ClpCl6dGbz9v3p7;
 Tue,  1 Dec 2020 17:56:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aAkh48jFRr4H; Tue,  1 Dec 2020 17:56:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4ClpCl58BYz9v3nc;
 Tue,  1 Dec 2020 17:56:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8E668B7C1;
 Tue,  1 Dec 2020 17:56:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ItWmq8r7Upbe; Tue,  1 Dec 2020 17:56:35 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97D2C8B7B9;
 Tue,  1 Dec 2020 17:56:33 +0100 (CET)
Subject: Re: [PATCH v9 4/6] kasan: Document support on 32-bit powerpc
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20201201161632.1234753-1-dja@axtens.net>
 <20201201161632.1234753-5-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <421d8685-afef-eaa8-5207-280d951be594@csgroup.eu>
Date: Tue, 1 Dec 2020 17:56:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201161632.1234753-5-dja@axtens.net>
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



Le 01/12/2020 à 17:16, Daniel Axtens a écrit :
> KASAN is supported on 32-bit powerpc and the docs should reflect this.
> 
> Document s390 support while we're at it.
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

My new address is <christophe.leroy@csgroup.eu>

> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   Documentation/dev-tools/kasan.rst |  7 +++++--
>   Documentation/powerpc/kasan.txt   | 12 ++++++++++++
>   2 files changed, 17 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/powerpc/kasan.txt
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 2b68addaadcd..eaf868094a8e 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -19,7 +19,8 @@ out-of-bounds accesses for global variables is only supported since Clang 11.
>   Tag-based KASAN is only supported in Clang.
>   
>   Currently generic KASAN is supported for the x86_64, arm64, xtensa, s390 and
> -riscv architectures, and tag-based KASAN is supported only for arm64.
> +riscv architectures. It is also supported on 32-bit powerpc kernels. Tag-based
> +KASAN is supported only on arm64.
>   
>   Usage
>   -----
> @@ -255,7 +256,9 @@ CONFIG_KASAN_VMALLOC
>   ~~~~~~~~~~~~~~~~~~~~
>   
>   With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
> -cost of greater memory usage. Currently this is only supported on x86.
> +cost of greater memory usage. Currently this supported on x86, s390
> +and 32-bit powerpc. It is optional, except on 32-bit powerpc kernels
> +with module support, where it is required.
>   
>   This works by hooking into vmalloc and vmap, and dynamically
>   allocating real shadow memory to back the mappings.
> diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
> new file mode 100644
> index 000000000000..26bb0e8bb18c
> --- /dev/null
> +++ b/Documentation/powerpc/kasan.txt
> @@ -0,0 +1,12 @@
> +KASAN is supported on powerpc on 32-bit only.
> +
> +32 bit support
> +==============
> +
> +KASAN is supported on both hash and nohash MMUs on 32-bit.
> +
> +The shadow area sits at the top of the kernel virtual memory space above the
> +fixmap area and occupies one eighth of the total kernel virtual memory space.
> +
> +Instrumentation of the vmalloc area is optional, unless built with modules,
> +in which case it is required.
> 
