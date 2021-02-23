Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF14322F6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 18:16:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlQgZ18bgz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 04:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlQgF0s9bz30Hg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 04:15:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DlQg72QPvz9ty2f;
 Tue, 23 Feb 2021 18:15:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x65n1z6oI_-G; Tue, 23 Feb 2021 18:15:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DlQg70YTwz9ty2c;
 Tue, 23 Feb 2021 18:15:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE49B8B832;
 Tue, 23 Feb 2021 18:15:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NsqJzjAyImrH; Tue, 23 Feb 2021 18:15:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 67B008B825;
 Tue, 23 Feb 2021 18:15:48 +0100 (CET)
Subject: Re: [PATCH v6 01/10] powerpc/uaccess: Add unsafe_copy_from_user
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20210221012401.22328-1-cmr@codefail.de>
 <20210221012401.22328-2-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3393c40b-6f5f-3683-d03b-aa19bd25d655@csgroup.eu>
Date: Tue, 23 Feb 2021 18:15:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221012401.22328-2-cmr@codefail.de>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2021 à 02:23, Christopher M. Riedl a écrit :
> Just wrap __copy_tofrom_user() for the usual 'unsafe' pattern which
> accepts a label to goto on error.
> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> ---
>   arch/powerpc/include/asm/uaccess.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 78e2a3990eab..33b2de642120 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -487,6 +487,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
>   #define unsafe_put_user(x, p, e) \
>   	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>   
> +#define unsafe_copy_from_user(d, s, l, e) \
> +	unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
> +

Could we perform same as unsafe_copy_to_user() instead of calling an external function which is 
banned in principle inside uaccess blocks ?


>   #define unsafe_copy_to_user(d, s, l, e) \
>   do {									\
>   	u8 __user *_dst = (u8 __user *)(d);				\
> 
