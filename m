Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21425ED18
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 09:03:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bkj7C4Y3rzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 17:03:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bkj5X4Jd1zDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 17:02:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bkj5N0dkTz9v277;
 Sun,  6 Sep 2020 09:02:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 32ZSfig6NQFG; Sun,  6 Sep 2020 09:02:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bkj5M63jPz9v276;
 Sun,  6 Sep 2020 09:01:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D69238B770;
 Sun,  6 Sep 2020 09:02:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lMkaToUqP5GL; Sun,  6 Sep 2020 09:02:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D41C8B75B;
 Sun,  6 Sep 2020 09:02:02 +0200 (CEST)
Subject: Re: [PATCH -next] powerpc/eeh: fix compile warning with
 CONFIG_PROC_FS=n
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
References: <20200905111749.3198998-1-yangyingliang@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a3cda4fd-6d63-a03b-d3d0-ad0e61f72c65@csgroup.eu>
Date: Sun, 6 Sep 2020 09:01:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200905111749.3198998-1-yangyingliang@huawei.com>
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
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/09/2020 à 13:17, Yang Yingliang a écrit :
> Fix the compile warning:
> 
> arch/powerpc/kernel/eeh.c:1639:12: error: 'proc_eeh_show' defined but not used [-Werror=unused-function]
>   static int proc_eeh_show(struct seq_file *m, void *v)
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   arch/powerpc/kernel/eeh.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 94682382fc8c..420c3c25c6e7 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1636,6 +1636,7 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>   }
>   EXPORT_SYMBOL_GPL(eeh_pe_inject_err);
>   
> +#ifdef CONFIG_PROC_FS

I don't like this way of fixing the issue, because you'll get an 
unbalanced source code: proc_eeh_show() is apparently referenced all the 
time in eeh_init_proc(), but because proc_create_single() is a NULL 
macro when CONFIG_PROC_FS is not selected, you get the 'unused function' 
error.

I think the right fix should be to rewrite proc_create_single() as a 
static inline function that calls proc_create_single_data() when 
CONFIG_PROC_FS is selected and just returns NULL otherwise.

>   static int proc_eeh_show(struct seq_file *m, void *v)
>   {
>   	if (!eeh_enabled()) {
> @@ -1662,6 +1663,7 @@ static int proc_eeh_show(struct seq_file *m, void *v)
>   
>   	return 0;
>   }
> +#endif
>   
>   #ifdef CONFIG_DEBUG_FS
>   static int eeh_enable_dbgfs_set(void *data, u64 val)
> 

Christophe
