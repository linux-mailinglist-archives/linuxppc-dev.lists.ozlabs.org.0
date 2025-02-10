Return-Path: <linuxppc-dev+bounces-6034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E8A2ED69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 14:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys4tx2NvDz303d;
	Tue, 11 Feb 2025 00:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739193609;
	cv=none; b=i4OoHHkGkQvFO7O8gJ3g4rXOVxPuPuRGwdRsc7PdObdz1Z2F3EQfMjHyds6vg4y1HgjQ6hZs9SrbWeDk1O/WYXp7204R2v3OBf2y2AmFPyFGrzvKhSNWbM47nDxFJNEl1rDWDt4+2BgqT7ROmkA+d8YmTmrD2uP3jwmYp/PRe+Bau9mmJIIPquImZt2CFNqeJ7KuiZAF0KJ5AVDOHgEYGTC4MsQiPMLDnYSv4qOQcUTc6kPub1kv4kkm2qOKagaOzTtsu8wDskJbIK/MJIDPx+S4X0jNEYpAqgEBk8S9MRW8UA3Gv99vVPO8ARVRojuS1PMTpZLESr//i4kaA4pOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739193609; c=relaxed/relaxed;
	bh=7v1bS6l7HuqPsFc4+vF6qro9AEHTBB8ESqmvFeVN9j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SF3L+kFUSp3hQTgDeM83yYKyeyCDlxr5/IfV587RG+wt4jOFwUGbUSpyMeGvHAFvlbAWdWuE0ntR9VNrPcZniP/1zBDelINSWrPGIFt5nhIeh5TCDj1cK7pIgTCPUO58Et8juvsLjnu7faZcZ2mkr86p2oIEfk/RTq0xlYeUrNTIkfvIcJ8ZdJ7CR5vKSGfACwYUsouPDvGXTcpKvwP3ez8V/bigHkbdBYz9J1sX0GnAVDQD3moIVA6pQay4RQbmvtA7VZcXntSMo1uh7ek2Xggqa+YXiB+/N2uRvZO9auqqGu7C/vgeB/9hLQs6hxK5iANUTAjzyqaNe9eVhgQkZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys4tw2BZKz3039
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 00:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ys4Jb2024z9sPd;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWWcMCNTIkz5; Mon, 10 Feb 2025 13:53:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ys4Jb1B4cz9rvV;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DF058B768;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XRV61BvPDzm7; Mon, 10 Feb 2025 13:53:50 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D06718B763;
	Mon, 10 Feb 2025 13:53:50 +0100 (CET)
Message-ID: <8ddc01a2-80b1-4283-a402-7f7c58c075c8@csgroup.eu>
Date: Mon, 10 Feb 2025 13:53:48 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm/fault: Use str_write_read() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250210100648.1440-2-thorsten.blum@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250210100648.1440-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 10/02/2025 à 11:06, Thorsten Blum a écrit :
> Remove hard-coded strings by using the str_write_read() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


Not sure you saw it, there's also one in:

linus/master:arch/powerpc/platforms/ps3/device-init.c:727:  const char 
*op = write ? "write" : "read";

> ---
>   arch/powerpc/mm/fault.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index c156fe0d53c3..806c74e0d5ab 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -17,6 +17,7 @@
>   #include <linux/kernel.h>
>   #include <linux/errno.h>
>   #include <linux/string.h>
> +#include <linux/string_choices.h>
>   #include <linux/types.h>
>   #include <linux/pagemap.h>
>   #include <linux/ptrace.h>
> @@ -218,7 +219,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>   	// Read/write fault blocked by KUAP is bad, it can never succeed.
>   	if (bad_kuap_fault(regs, address, is_write)) {
>   		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
> -				    is_write ? "write" : "read", address,
> +				    str_write_read(is_write), address,
>   				    from_kuid(&init_user_ns, current_uid()));
>   
>   		// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
> @@ -625,7 +626,7 @@ static void __bad_page_fault(struct pt_regs *regs, int sig)
>   	case INTERRUPT_DATA_STORAGE:
>   	case INTERRUPT_H_DATA_STORAGE:
>   		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
> -			 is_write ? "write" : "read", regs->dar);
> +			 str_write_read(is_write), regs->dar);
>   		break;
>   	case INTERRUPT_DATA_SEGMENT:
>   		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);


