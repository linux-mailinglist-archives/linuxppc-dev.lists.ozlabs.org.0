Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BC4D983E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHpl61p7Zz3bbD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 20:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHpkh3Ky2z2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 20:58:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHpkb2Q5cz9sSm;
 Tue, 15 Mar 2022 10:58:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiX07j7Fb2Py; Tue, 15 Mar 2022 10:58:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHpkb1MJQz9sSj;
 Tue, 15 Mar 2022 10:58:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECA078B770;
 Tue, 15 Mar 2022 10:58:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tC4XK945PlwD; Tue, 15 Mar 2022 10:58:14 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1342A8B763;
 Tue, 15 Mar 2022 10:58:14 +0100 (CET)
Message-ID: <1ee4d3e1-5d56-cb60-fb98-d8861e674c74@csgroup.eu>
Date: Tue, 15 Mar 2022 10:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] powerpc:entry_32: correct the path and function name in
 the comment
Content-Language: fr-FR
To: chenzefeng <chenzefeng2@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, christophe.leroy@c-s.fr,
 tglx@linutronix.de, bigeasy@linutronix.de, npiggin@gmail.com
References: <20200807101956.67454-1-chenzefeng2@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200807101956.67454-1-chenzefeng2@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 zengweilin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2020 à 12:19, chenzefeng a écrit :
> Update the comment for file's directory and function name changed.

The function name changed again with commit 714acdbd1c94 ("arch: rename 
copy_thread_tls() back to copy_thread()")

Please update the patch to just drop the file name. Users are able to 
find where the function is by themselves.

Thanks
Christophe

> 
> Fixes: facd04a904ff ("powerpc: convert to copy_thread_tls")
> Fixes: 14cf11af6cf6 ("powerpc: Merge enough to start building in arch/powerpc.")
> 
> Signed-off-by: chenzefeng <chenzefeng2@huawei.com>
> ---
>   arch/powerpc/kernel/entry_32.S | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 8420abd4ea1c..9937593d3a33 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -696,8 +696,8 @@ handle_dabr_fault:
>    * to the "_switch" path.  If you change this , you'll have to
>    * change the fork code also.
>    *
> - * The code which creates the new task context is in 'copy_thread'
> - * in arch/ppc/kernel/process.c
> + * The code which creates the new task context is in 'copy_thread_tls'
> + * in arch/powerpc/kernel/process.c
>    */
>   _GLOBAL(_switch)
>   	stwu	r1,-INT_FRAME_SIZE(r1)
