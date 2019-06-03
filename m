Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159232B11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 10:46:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HTF05q12zDqRm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 18:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="WPHhyKe+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HTCY3tmLzDqQ6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 18:45:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HTCL5n0hz9v0D9;
 Mon,  3 Jun 2019 10:45:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WPHhyKe+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EQ8AzAKtaaNi; Mon,  3 Jun 2019 10:45:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HTCL4d8Zz9v0D6;
 Mon,  3 Jun 2019 10:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559551518; bh=EIz0NOWAX/uobIhHG6/is2QasF1BW3QEbpzGLpjwL20=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WPHhyKe+I1HWbWe98+E4FhOSpt26176vUn6v3/2lkFHz1L1LOr2Xmj8wZWUmsR+eC
 3tVRjZfv5eBf/GrTrixBbDrhI47OrRfp2EBRUMapPoOGlfOTohOZeXLD8bvmkraJO3
 3pl2dBzGIRRSLmUhQvogdilTN1N6QHLR58kQqz/8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 555348B7B1;
 Mon,  3 Jun 2019 10:45:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oJf0fEAn0lyt; Mon,  3 Jun 2019 10:45:23 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECC778B7B8;
 Mon,  3 Jun 2019 10:45:22 +0200 (CEST)
Subject: Re: [PATCH] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
To: Nathan Chancellor <natechancellor@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20190531185306.41290-1-natechancellor@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d932b755-606e-6847-a460-da463411c562@c-s.fr>
Date: Mon, 3 Jun 2019 10:45:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531185306.41290-1-natechancellor@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/05/2019 à 20:53, Nathan Chancellor a écrit :
> clang warns:
> 
> drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
> uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>          case IBMVSCSI_HOST_ACTION_NONE:
>               ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
> here
>          if (rc) {
>              ^~
> 
> Initialize rc to zero so that the atomic_set and dev_err statement don't
> trigger for the cases that just break.
> 
> Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
> Link: https://github.com/ClangBuiltLinux/linux/issues/502
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>   drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index 727c31dc11a0..6714d8043e62 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -2118,7 +2118,7 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
>   static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>   {
>   	unsigned long flags;
> -	int rc;
> +	int rc = 0;

I don't think the above is the best solution, as it hides the warning 
instead of really fixing it.

Your problem is that some legs of the switch are missing setting the 
value of rc, it would therefore be better to fix the legs instead of 
setting a default value which may not be correct for every case, 
allthough it may be at the time being.

Christophe


>   	char *action = "reset";
>   
>   	spin_lock_irqsave(hostdata->host->host_lock, flags);
> 
