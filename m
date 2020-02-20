Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C859166040
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 15:59:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nd6X3WXwzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 01:59:48 +1100 (AEDT)
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
 header.s=mail header.b=B/NYU5Ng; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nd4h69tlzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 01:58:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Nd4Z0WPBz9v9FJ;
 Thu, 20 Feb 2020 15:58:06 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=B/NYU5Ng; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ffPZ90ywUBqr; Thu, 20 Feb 2020 15:58:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Nd4Y6LMNz9v9FH;
 Thu, 20 Feb 2020 15:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582210685; bh=YKl2BkM+ZMJcivZiVdzoWT2DSPFZst5+HRjZAemkQK8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=B/NYU5Ng+BidPgcdvM4af+d8Q+nkSCxcADtdLQtQnl/ZRujEK5hQyZkz2Hoi/OfHY
 mMGVDeentj8+7wntw6mmohRzphBRTj+IFwEiG1AxQndtNbFEtH1OtBk8JieIAvBXg6
 ntmtujtaLN5/171/lJnuEE56I/2o2ekHo4XHZLss=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CC518B866;
 Thu, 20 Feb 2020 15:58:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6Isdy_XdtjpC; Thu, 20 Feb 2020 15:58:07 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6A8C8B876;
 Thu, 20 Feb 2020 15:58:06 +0100 (CET)
Subject: Re: [PATCH] selftest/lkdtm: Don't pollute 'git status'
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <668b6ff463849ceee01f726fbf3e7110687575ec.1580976576.git.christophe.leroy@c-s.fr>
Message-ID: <ca71e490-b4fa-bf53-7a60-b6954b9dd33e@c-s.fr>
Date: Thu, 20 Feb 2020 14:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <668b6ff463849ceee01f726fbf3e7110687575ec.1580976576.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ping

On 02/06/2020 08:11 AM, Christophe Leroy wrote:
> Commit 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> added generation of lkdtm test scripts.
> 
> Ignore those generated scripts when performing 'git status'
> 
> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Without this, 'git status' now reports the following crap and real 
problems are drowned in the middle, that's annoying.

On branch saf3000-5.6
Untracked files:
   (use "git add <file>..." to include in what will be committed)
	tools/testing/selftests/lkdtm/ACCESS_NULL.sh
	tools/testing/selftests/lkdtm/ACCESS_USERSPACE.sh
	tools/testing/selftests/lkdtm/ATOMIC_TIMING.sh
	tools/testing/selftests/lkdtm/BUG.sh
	tools/testing/selftests/lkdtm/CFI_FORWARD_PROTO.sh
	tools/testing/selftests/lkdtm/CORRUPT_LIST_ADD.sh
	tools/testing/selftests/lkdtm/CORRUPT_LIST_DEL.sh
	tools/testing/selftests/lkdtm/CORRUPT_STACK.sh
	tools/testing/selftests/lkdtm/CORRUPT_STACK_STRONG.sh
	tools/testing/selftests/lkdtm/CORRUPT_USER_DS.sh
	tools/testing/selftests/lkdtm/DOUBLE_FAULT.sh
	tools/testing/selftests/lkdtm/EXCEPTION.sh
	tools/testing/selftests/lkdtm/EXEC_DATA.sh
	tools/testing/selftests/lkdtm/EXEC_KMALLOC.sh
	tools/testing/selftests/lkdtm/EXEC_NULL.sh
	tools/testing/selftests/lkdtm/EXEC_RODATA.sh
	tools/testing/selftests/lkdtm/EXEC_STACK.sh
	tools/testing/selftests/lkdtm/EXEC_USERSPACE.sh
	tools/testing/selftests/lkdtm/EXEC_VMALLOC.sh
	tools/testing/selftests/lkdtm/EXHAUST_STACK.sh
	tools/testing/selftests/lkdtm/HARDLOCKUP.sh
	tools/testing/selftests/lkdtm/HUNG_TASK.sh
	tools/testing/selftests/lkdtm/LOOP.sh
	tools/testing/selftests/lkdtm/OVERWRITE_ALLOCATION.sh
	tools/testing/selftests/lkdtm/PANIC.sh
	tools/testing/selftests/lkdtm/READ_AFTER_FREE.sh
	tools/testing/selftests/lkdtm/READ_BUDDY_AFTER_FREE.sh
	tools/testing/selftests/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh
	tools/testing/selftests/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_ADD_OVERFLOW.sh
	tools/testing/selftests/lkdtm/REFCOUNT_ADD_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_ADD_ZERO.sh
	tools/testing/selftests/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh
	tools/testing/selftests/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_DEC_NEGATIVE.sh
	tools/testing/selftests/lkdtm/REFCOUNT_DEC_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_DEC_ZERO.sh
	tools/testing/selftests/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh
	tools/testing/selftests/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_INC_OVERFLOW.sh
	tools/testing/selftests/lkdtm/REFCOUNT_INC_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_INC_ZERO.sh
	tools/testing/selftests/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh
	tools/testing/selftests/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh
	tools/testing/selftests/lkdtm/REFCOUNT_TIMING.sh
	tools/testing/selftests/lkdtm/SLAB_FREE_CROSS.sh
	tools/testing/selftests/lkdtm/SLAB_FREE_DOUBLE.sh
	tools/testing/selftests/lkdtm/SLAB_FREE_PAGE.sh
	tools/testing/selftests/lkdtm/SOFTLOCKUP.sh
	tools/testing/selftests/lkdtm/SPINLOCKUP.sh
	tools/testing/selftests/lkdtm/STACKLEAK_ERASING.sh
	tools/testing/selftests/lkdtm/STACK_GUARD_PAGE_LEADING.sh
	tools/testing/selftests/lkdtm/STACK_GUARD_PAGE_TRAILING.sh
	tools/testing/selftests/lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh
	tools/testing/selftests/lkdtm/UNSET_SMEP.sh
	tools/testing/selftests/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh
	tools/testing/selftests/lkdtm/USERCOPY_HEAP_SIZE_TO.sh
	tools/testing/selftests/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh
	tools/testing/selftests/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh
	tools/testing/selftests/lkdtm/USERCOPY_KERNEL.sh
	tools/testing/selftests/lkdtm/USERCOPY_KERNEL_DS.sh
	tools/testing/selftests/lkdtm/USERCOPY_STACK_BEYOND.sh
	tools/testing/selftests/lkdtm/USERCOPY_STACK_FRAME_FROM.sh
	tools/testing/selftests/lkdtm/USERCOPY_STACK_FRAME_TO.sh
	tools/testing/selftests/lkdtm/WARNING.sh
	tools/testing/selftests/lkdtm/WARNING_MESSAGE.sh
	tools/testing/selftests/lkdtm/WRITE_AFTER_FREE.sh
	tools/testing/selftests/lkdtm/WRITE_BUDDY_AFTER_FREE.sh
	tools/testing/selftests/lkdtm/WRITE_KERN.sh
	tools/testing/selftests/lkdtm/WRITE_RO.sh
	tools/testing/selftests/lkdtm/WRITE_RO_AFTER_INIT.sh

nothing added to commit but untracked files present (use "git add" to track)


Thanks
Christophe


> ---
>   .gitignore | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index b849a72d69d5..bb05dce58f8e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -100,6 +100,10 @@ modules.order
>   /include/ksym/
>   /arch/*/include/generated/
>   
> +# Generated lkdtm tests
> +/tools/testing/selftests/lkdtm/*.sh
> +!/tools/testing/selftests/lkdtm/run.sh
> +
>   # stgit generated dirs
>   patches-*
>   
> 
