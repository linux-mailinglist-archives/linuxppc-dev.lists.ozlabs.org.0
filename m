Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2764535ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 16:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htqw41mKgz2yNv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 02:38:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htqvd1fMKz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 02:38:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HtqvW5Cmlz9sSD;
 Tue, 16 Nov 2021 16:37:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiR91h4zTLoc; Tue, 16 Nov 2021 16:37:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HtqvW4RMMz9sSC;
 Tue, 16 Nov 2021 16:37:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 851488B77A;
 Tue, 16 Nov 2021 16:37:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qmwnqwMIr0Z4; Tue, 16 Nov 2021 16:37:59 +0100 (CET)
Received: from [192.168.234.8] (unknown [192.168.234.8])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 153298B763;
 Tue, 16 Nov 2021 16:37:59 +0100 (CET)
Message-ID: <0cdd39b2-73f8-e0c1-bfa2-7940d4b788f0@csgroup.eu>
Date: Tue, 16 Nov 2021 16:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: clean vdso32 and vdso64 directories
Content-Language: fr-FR
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
References: <20211109185015.615517-1-masahiroy@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211109185015.615517-1-masahiroy@kernel.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

Le 09/11/2021 à 19:50, Masahiro Yamada a écrit :
> Since commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
> vgettimeofday.o"), "make ARCH=powerpc clean" does not clean up the
> arch/powerpc/kernel/{vdso32,vdso64} directories.
> 
> Use the subdir- trick to let "make clean" descend into them.
> 
> Fixes: bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of vgettimeofday.o")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/powerpc/kernel/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 0e3640e14eb1..5fa68c2ef1f8 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -196,3 +196,6 @@ clean-files := vmlinux.lds
>   # Force dependency (incbin is bad)
>   $(obj)/vdso32_wrapper.o : $(obj)/vdso32/vdso32.so.dbg
>   $(obj)/vdso64_wrapper.o : $(obj)/vdso64/vdso64.so.dbg
> +
> +# for cleaning
> +subdir- += vdso32 vdso64
> 

This patch make me think about one thing I would have liked to do, but I 
don't know Makefiles well enough to be able to do it. You could probably 
help me with it.

vdso32 and vdso64 contain a lot of redundant sources. I would like to 
merge them into a new single directory, let say 'vdso', and use the 
files in that directory to build both vdso32.so and vdso64.so. I have a 
feeling that x86 is doing it that way, but I've not been able to figure 
out how to build two objects using the same C/S files.

Thanks
Christophe
