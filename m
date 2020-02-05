Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7C15264B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 07:27:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CBSM6ZXczDqK9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 17:27:31 +1100 (AEDT)
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
 header.s=mail header.b=Hmjs+NJp; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CBQl0tNnzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 17:26:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48CBQb2lTQz9v9Cl;
 Wed,  5 Feb 2020 07:25:59 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Hmjs+NJp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id djzf2NcZP0j6; Wed,  5 Feb 2020 07:25:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48CBQb1TnSz9v9Ck;
 Wed,  5 Feb 2020 07:25:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580883959; bh=arjyGSAsMm0Nw/MEg/HGvPVCQztAhca2h8pfvGO7wGE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Hmjs+NJpMGkA+Ee2fGqfMl3SCjZu9+GCPa3wGWJc7wxoIgzYVeN2jhvL23n25B30d
 NHCWMIWfW4VHsOQF3Bt0rJ7ofbK+qot1ySSNV99RkUGa4V9dHmKbRYXe2q3H9WFX0n
 V0YLQ+h2/2Yekf2izKm81liQC22q9kqACXqDWOAM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0273C8B820;
 Wed,  5 Feb 2020 07:26:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ue-_DaLfAi1p; Wed,  5 Feb 2020 07:25:59 +0100 (CET)
Received: from [172.25.230.107] (unknown [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9A9A8B778;
 Wed,  5 Feb 2020 07:25:59 +0100 (CET)
Subject: Re: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as
 STV_PROTECTED
To: Fangrui Song <maskray@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200205005054.k72fuikf6rwrgfe4@google.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <10e3d362-ec29-3816-88ff-8415d5c78e3b@c-s.fr>
Date: Wed, 5 Feb 2020 07:25:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205005054.k72fuikf6rwrgfe4@google.com>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/02/2020 à 01:50, Fangrui Song a écrit :
> A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
> preemptible symbol in a -shared link is not allowed.  GNU ld's powerpc
> port is permissive and allows it [1], but lld will report an error after
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ec0895f08f99515194e9fcfe1338becf6f759d38

Note that there is a series whose first two patches aim at dropping 
__kernel_datapage_offset . See 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=156045 
and especially patches https://patchwork.ozlabs.org/patch/1231467/ and 
https://patchwork.ozlabs.org/patch/1231461/

Those patches can be applied independentely of the rest.

Christophe

> 
> Make the symbol protected so that it is non-preemptible but still
> exported.
> 
> [1]: https://sourceware.org/bugzilla/show_bug.cgi?id=25500
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/851
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>   arch/powerpc/kernel/vdso32/datapage.S | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
> index 217bb630f8f9..2831a8676365 100644
> --- a/arch/powerpc/kernel/vdso32/datapage.S
> +++ b/arch/powerpc/kernel/vdso32/datapage.S
> @@ -13,7 +13,8 @@
>   #include <asm/vdso_datapage.h>
>   
>   	.text
> -	.global	__kernel_datapage_offset;
> +	.global	__kernel_datapage_offset
> +	.protected	__kernel_datapage_offset
>   __kernel_datapage_offset:
>   	.long	0
>   
> 
