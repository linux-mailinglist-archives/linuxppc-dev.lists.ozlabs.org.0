Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C41911BE202
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:07:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C21161QdzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 01:07:01 +1000 (AEST)
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
 header.s=mail header.b=R1gpKknJ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C1s8048WzDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 01:00:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49C1s00TSJzB09Zf;
 Wed, 29 Apr 2020 17:00:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=R1gpKknJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qEZ6IpkYv7RA; Wed, 29 Apr 2020 17:00:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49C1rz6R7mzB09Zb;
 Wed, 29 Apr 2020 17:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588172403; bh=F+sNiTIykqGmm6l5lTLo5AcMwP+r0tFfPrvDS+VAV7o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=R1gpKknJNGE49Auwyj32BqySU4DEsGIpXwqf18ECTdFoCPISEPPOOj+t89N7+IbjK
 c3lcz+s0SF7pHZ7je7WawlyweOYLWbSjPTIMqtRPGdp7P4UMJ/jvhfFhGCQ1ZcdLZe
 HfUhTvPtL8KYN1m3MoDztBf/c4qkaFH4jRQ5cvwk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DA2F8B771;
 Wed, 29 Apr 2020 17:00:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Vg160UHd5b6v; Wed, 29 Apr 2020 17:00:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4D7D8B879;
 Wed, 29 Apr 2020 17:00:04 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/spufs: stop using access_ok
To: Jeremy Kerr <jk@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
References: <20200429070303.17599-1-jk@ozlabs.org>
 <20200429070303.17599-2-jk@ozlabs.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ebc47890-649e-71c7-02b1-179db964db37@c-s.fr>
Date: Wed, 29 Apr 2020 17:00:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429070303.17599-2-jk@ozlabs.org>
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
Cc: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/04/2020 à 09:03, Jeremy Kerr a écrit :
> From: Christoph Hellwig <hch@lst.de>
> 
> Just use the proper non __-prefixed get/put_user variants where that is
> not done yet.

But it means you are doing the access_ok() check everytime, which is 
what is to be avoided by doing the access_ok() once then using the 
__-prefixed variant.

Christophe

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   arch/powerpc/platforms/cell/spufs/file.c | 42 +++++-------------------
>   1 file changed, 8 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
> index b4e1ef650b40..cd7d10f27fad 100644
> --- a/arch/powerpc/platforms/cell/spufs/file.c
> +++ b/arch/powerpc/platforms/cell/spufs/file.c
> @@ -590,17 +590,12 @@ static ssize_t spufs_mbox_read(struct file *file, char __user *buf,
>   			size_t len, loff_t *pos)
>   {
>   	struct spu_context *ctx = file->private_data;
> -	u32 mbox_data, __user *udata;
> +	u32 mbox_data, __user *udata = (void __user *)buf;
>   	ssize_t count;
>   
>   	if (len < 4)
>   		return -EINVAL;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
> -	udata = (void __user *)buf;
> -
>   	count = spu_acquire(ctx);
>   	if (count)
>   		return count;
> @@ -616,7 +611,7 @@ static ssize_t spufs_mbox_read(struct file *file, char __user *buf,
>   		 * but still need to return the data we have
>   		 * read successfully so far.
>   		 */
> -		ret = __put_user(mbox_data, udata);
> +		ret = put_user(mbox_data, udata);
>   		if (ret) {
>   			if (!count)
>   				count = -EFAULT;
> @@ -698,17 +693,12 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
>   			size_t len, loff_t *pos)
>   {
>   	struct spu_context *ctx = file->private_data;
> -	u32 ibox_data, __user *udata;
> +	u32 ibox_data, __user *udata = (void __user *)buf;
>   	ssize_t count;
>   
>   	if (len < 4)
>   		return -EINVAL;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
> -	udata = (void __user *)buf;
> -
>   	count = spu_acquire(ctx);
>   	if (count)
>   		goto out;
> @@ -727,7 +717,7 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
>   	}
>   
>   	/* if we can't write at all, return -EFAULT */
> -	count = __put_user(ibox_data, udata);
> +	count = put_user(ibox_data, udata);
>   	if (count)
>   		goto out_unlock;
>   
> @@ -741,7 +731,7 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
>   		 * but still need to return the data we have
>   		 * read successfully so far.
>   		 */
> -		ret = __put_user(ibox_data, udata);
> +		ret = put_user(ibox_data, udata);
>   		if (ret)
>   			break;
>   	}
> @@ -836,17 +826,13 @@ static ssize_t spufs_wbox_write(struct file *file, const char __user *buf,
>   			size_t len, loff_t *pos)
>   {
>   	struct spu_context *ctx = file->private_data;
> -	u32 wbox_data, __user *udata;
> +	u32 wbox_data, __user *udata = (void __user *)buf;
>   	ssize_t count;
>   
>   	if (len < 4)
>   		return -EINVAL;
>   
> -	udata = (void __user *)buf;
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
> -	if (__get_user(wbox_data, udata))
> +	if (get_user(wbox_data, udata))
>   		return -EFAULT;
>   
>   	count = spu_acquire(ctx);
> @@ -873,7 +859,7 @@ static ssize_t spufs_wbox_write(struct file *file, const char __user *buf,
>   	/* write as much as possible */
>   	for (count = 4, udata++; (count + 4) <= len; count += 4, udata++) {
>   		int ret;
> -		ret = __get_user(wbox_data, udata);
> +		ret = get_user(wbox_data, udata);
>   		if (ret)
>   			break;
>   
> @@ -1982,9 +1968,6 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
>   	u32 stat, data;
>   	int ret;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
>   	ret = spu_acquire_saved(ctx);
>   	if (ret)
>   		return ret;
> @@ -2028,9 +2011,6 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
>   	u32 stat, data;
>   	int ret;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
>   	ret = spu_acquire_saved(ctx);
>   	if (ret)
>   		return ret;
> @@ -2082,9 +2062,6 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
>   	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
>   	int ret, count;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
>   	ret = spu_acquire_saved(ctx);
>   	if (ret)
>   		return ret;
> @@ -2143,9 +2120,6 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
>   	struct spu_dma_info info;
>   	int ret;
>   
> -	if (!access_ok(buf, len))
> -		return -EFAULT;
> -
>   	ret = spu_acquire_saved(ctx);
>   	if (ret)
>   		return ret;
> 
