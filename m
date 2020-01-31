Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53714E8EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 07:46:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48876s6wLtzDqdr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 17:46:45 +1100 (AEDT)
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
 header.s=mail header.b=tsg4lMRF; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48874K0XY4zDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 17:44:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48874956hnz9vCRl;
 Fri, 31 Jan 2020 07:44:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tsg4lMRF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EIcP0bne_ziW; Fri, 31 Jan 2020 07:44:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48874942hLz9vCRj;
 Fri, 31 Jan 2020 07:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580453065; bh=gN9mH4xRhjR/wIE778JRs1PqDrleGT+yzJx5pXGJcHE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tsg4lMRFaCATCJvjbzjaIx4gXKQgcbe+U4bqozqfnFsmYNtj1EjfZtN7ulHsIj619
 RH2aVi1yXHC4c+RIVFIxoB8ug/ryd6VOgBl5xBrg3Nkcg62nramSfU7HbRjAJ5TIps
 XSslTDr2XCmb8v9A55k6kUe8VsporoAE7oZE0dqg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 688108B889;
 Fri, 31 Jan 2020 07:44:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vgirdEoRJhzn; Fri, 31 Jan 2020 07:44:26 +0100 (CET)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A66F8B884;
 Fri, 31 Jan 2020 07:44:26 +0100 (CET)
Subject: Re: [PATCH] lkdtm: Test KUAP directional user access unlocks on
 powerpc
To: Russell Currey <ruscur@russell.cc>, keescook@chromium.org,
 mpe@ellerman.id.au
References: <20200131053157.22463-1-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
Date: Fri, 31 Jan 2020 07:44:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131053157.22463-1-ruscur@russell.cc>
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
Cc: kernel-hardening@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/01/2020 à 06:31, Russell Currey a écrit :
> Kernel Userspace Access Prevention (KUAP) on powerpc supports
> allowing only one access direction (Read or Write) when allowing access
> to or from user memory.
> 
> A bug was recently found that showed that these one-way unlocks never
> worked, and allowing Read *or* Write would actually unlock Read *and*
> Write.  We should have a test case for this so we can make sure this
> doesn't happen again.
> 
> Like ACCESS_USERSPACE, the correct result is for the test to fault.
> 
> At the time of writing this, the upstream kernel still has this bug
> present, so the test will allow both accesses whereas ACCESS_USERSPACE
> will correctly fault.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   drivers/misc/lkdtm/core.c  |  3 +++
>   drivers/misc/lkdtm/lkdtm.h |  3 +++
>   drivers/misc/lkdtm/perms.c | 43 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index ee0d6e721441..baef3c6f48d6 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -137,6 +137,9 @@ static const struct crashtype crashtypes[] = {
>   	CRASHTYPE(EXEC_USERSPACE),
>   	CRASHTYPE(EXEC_NULL),
>   	CRASHTYPE(ACCESS_USERSPACE),
> +#ifdef CONFIG_PPC_KUAP
> +	CRASHTYPE(ACCESS_USERSPACE_KUAP),
> +#endif

I'm not sure it is a good idea to build this test as a specific test for 
powerpc, more comments below.

>   	CRASHTYPE(ACCESS_NULL),
>   	CRASHTYPE(WRITE_RO),
>   	CRASHTYPE(WRITE_RO_AFTER_INIT),
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index c56d23e37643..406a3fb32e6f 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -57,6 +57,9 @@ void lkdtm_EXEC_RODATA(void);
>   void lkdtm_EXEC_USERSPACE(void);
>   void lkdtm_EXEC_NULL(void);
>   void lkdtm_ACCESS_USERSPACE(void);
> +#ifdef CONFIG_PPC_KUAP
> +void lkdtm_ACCESS_USERSPACE_KUAP(void);
> +#endif
>   void lkdtm_ACCESS_NULL(void);
>   
>   /* lkdtm_refcount.c */
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 62f76d506f04..2c9aa0114333 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -10,6 +10,9 @@
>   #include <linux/mman.h>
>   #include <linux/uaccess.h>
>   #include <asm/cacheflush.h>
> +#ifdef CONFIG_PPC_KUAP
> +#include <asm/uaccess.h>
> +#endif

asm/uaccess.h is already included by linux/uaccess.h

>   
>   /* Whether or not to fill the target memory area with do_nothing(). */
>   #define CODE_WRITE	true
> @@ -200,6 +203,46 @@ void lkdtm_ACCESS_USERSPACE(void)
>   	vm_munmap(user_addr, PAGE_SIZE);
>   }
>   
> +/* Test that KUAP's directional user access unlocks work as intended */
> +#ifdef CONFIG_PPC_KUAP
> +void lkdtm_ACCESS_USERSPACE_KUAP(void)
> +{
> +	unsigned long user_addr, tmp = 0;
> +	unsigned long *ptr;

Should be a __user ptr because allow_write_to_user() and friends takes 
__user pointers.

> +
> +	user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
> +			    PROT_READ | PROT_WRITE | PROT_EXEC,
> +			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
> +	if (user_addr >= TASK_SIZE) {

Should use IS_ERR_VALUE() here.

> +		pr_warn("Failed to allocate user memory\n");
> +		return;
> +	}
> +
> +	if (copy_to_user((void __user *)user_addr, &tmp, sizeof(tmp))) {

Should use ptr instead of casted user_addr.

Why using copy_to_user() for writing an unsigned long ? put_user() 
should be enough.

> +		pr_warn("copy_to_user failed\n");
> +		vm_munmap(user_addr, PAGE_SIZE);
> +		return;
> +	}
> +
> +	ptr = (unsigned long *)user_addr;

move before copy_to_user() and use there.

> +
> +	/* Allowing "write to" should not allow "read from" */
> +	allow_write_to_user(ptr, sizeof(unsigned long));

This is powerpc specific. I think we should build this around the 
user_access_begin()/user_access_end() generic fonctions.

I'm about to propose an enhancement to this in order to allow unlocking 
only read or write. See discussion at 
https://patchwork.ozlabs.org/patch/1227926/.

My plan is to propose my enhancement once powerpc implementation of 
user_access_begin stuff is merged. I don't know if Michael is still 
planning to merge the series for 5.6 
(https://patchwork.ozlabs.org/patch/1228801/ - patch 1 of the series has 
already been merged by Linus in 5.5)


> +	pr_info("attempting bad read at %px with write allowed\n", ptr);
> +	tmp = *ptr;
> +	tmp += 0xc0dec0de;
> +	prevent_write_to_user(ptr, sizeof(unsigned long));

Does it work ? I would have thought that if the read fails the process 
will die and the following test won't be performed.

> +
> +	/* Allowing "read from" should not allow "write to" */
> +	allow_read_from_user(ptr, sizeof(unsigned long));
> +	pr_info("attempting bad write at %px with read allowed\n", ptr);
> +	*ptr = tmp;
> +	prevent_read_from_user(ptr, sizeof(unsigned long));
> +
> +	vm_munmap(user_addr, PAGE_SIZE);
> +}
> +#endif
> +
>   void lkdtm_ACCESS_NULL(void)
>   {
>   	unsigned long tmp;
> 


Christophe
