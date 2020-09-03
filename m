Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46325BDF8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 10:57:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhvpT5fnGzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 18:57:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhvmk131SzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 18:56:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhvmX2Z1czB09b1;
 Thu,  3 Sep 2020 10:56:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IpxxRaqw7gdu; Thu,  3 Sep 2020 10:56:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhvmX0njbzB09b0;
 Thu,  3 Sep 2020 10:56:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 38FCA8B7B7;
 Thu,  3 Sep 2020 10:56:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p0dUuYBZyAAj; Thu,  3 Sep 2020 10:56:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DFDE8B7B1;
 Thu,  3 Sep 2020 10:56:12 +0200 (CEST)
Subject: Re: [PATCH 10/10] powerpc: remove address space overrides using
 set_fs()
To: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-11-hch@lst.de>
 <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
 <20200902123646.GA31184@lst.de>
 <d78cb4be-48a9-a7c5-d9d1-d04d2a02b4c6@csgroup.eu>
 <CAHk-=wiDCcxuHgENo3UtdFi2QW9B7yXvNpG5CtF=A6bc6PTTgA@mail.gmail.com>
 <20200903071144.GA19247@lst.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0f042edf-f277-7637-9913-850cbb7bf3a4@csgroup.eu>
Date: Thu, 3 Sep 2020 10:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903071144.GA19247@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2020 à 09:11, Christoph Hellwig a écrit :
> 
> Except that we do not actually have such a patch.  For normal user
> writes we only use ->write_iter if ->write is not present.  But what
> shows up in the profile is that /dev/zero only has a read_iter op and
> not a normal read.  I've added a patch below that implements a normal
> read which might help a tad with this workload, but should not be part
> of a regression.
> 

With that patch below, throughput is 113.5MB/s (instead of 99.9MB/s).
So a 14% improvement. That's not bad.

Christophe

> 
> ---
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index abd4ffdc8cdebc..1dc99ab158457a 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -726,6 +726,27 @@ static ssize_t read_iter_zero(struct kiocb *iocb, struct iov_iter *iter)
>   	return written;
>   }
>   
> +static ssize_t read_zero(struct file *file, char __user *buf,
> +			 size_t count, loff_t *ppos)
> +{
> +	size_t cleared = 0;
> +
> +	while (count) {
> +		size_t chunk = min_t(size_t, count, PAGE_SIZE);
> +
> +		if (clear_user(buf + cleared, chunk))
> +			return cleared ? cleared : -EFAULT;
> +		cleared += chunk;
> +		count -= chunk;
> +
> +		if (signal_pending(current))
> +			return cleared ? cleared : -ERESTARTSYS;
> +		cond_resched();
> +	}
> +
> +	return cleared;
> +}
> +
>   static int mmap_zero(struct file *file, struct vm_area_struct *vma)
>   {
>   #ifndef CONFIG_MMU
> @@ -921,6 +942,7 @@ static const struct file_operations zero_fops = {
>   	.llseek		= zero_lseek,
>   	.write		= write_zero,
>   	.read_iter	= read_iter_zero,
> +	.read		= read_zero,
>   	.write_iter	= write_iter_zero,
>   	.mmap		= mmap_zero,
>   	.get_unmapped_area = get_unmapped_area_zero,
> 
