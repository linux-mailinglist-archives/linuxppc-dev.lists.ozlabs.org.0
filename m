Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAB15D21D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 07:28:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jk3m3JsqzDqVd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 17:28:52 +1100 (AEDT)
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
 header.s=mail header.b=AAmMMOsg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jk210sqFzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 17:27:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Jk1w3jrRzB09ZX;
 Fri, 14 Feb 2020 07:27:16 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AAmMMOsg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MifSIpyiCvsp; Fri, 14 Feb 2020 07:27:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Jk1w2bs2zB09ZV;
 Fri, 14 Feb 2020 07:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581661636; bh=diH9kuS50d2uOBYZwIHDWqEbnrON/+GYep/snUnx6ss=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=AAmMMOsg1zQUiu90YFOJnJXVCiwkKKf46COAFAFT2oBcpkcsX6a1+JETih/DDRhDv
 7f+P0RbXWzQKCoWm69xxfzxLDv3BJOG6pBMfqkD4+ds5h2xEdboXuwZlF80tpowinq
 PD6Hbe66L0s2pObHeFK9c5oQ8qxhPCb9XVNOacGo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31E2F8B878;
 Fri, 14 Feb 2020 07:27:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MCz8mh-5upQa; Fri, 14 Feb 2020 07:27:17 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E0828B874;
 Fri, 14 Feb 2020 07:27:17 +0100 (CET)
Subject: Re: [PATCH v2] powerpc/32s: Fix DSI and ISI exceptions for
 CONFIG_VMAP_STACK
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: linuxppc-dev@lists.ozlabs.org
References: <6981d1be4504fc25b893f7127611e74c224887eb.1581588239.git.christophe.leroy@c-s.fr>
Message-ID: <6ce4945a-a053-d1fd-a540-b42be7c459ba@c-s.fr>
Date: Fri, 14 Feb 2020 07:27:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6981d1be4504fc25b893f7127611e74c224887eb.1581588239.git.christophe.leroy@c-s.fr>
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
Cc: "Erhard F." <erhard_f@mailbox.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/02/2020 à 11:04, Christophe Leroy a écrit :
> hash_page() needs to read page tables from kernel memory. When entire
> kernel memory is mapped by BATs, which is normally the case when
> CONFIG_STRICT_KERNEL_RWX is not set, it works even if the page hosting
> the page table is not referenced in the MMU hash table.
> 
> However, if the page where the page table resides is not covered by
> a BAT, a DSI fault can be encountered from hash_page(), and it loops
> forever. This can happen when CONFIG_STRICT_KERNEL_RWX is selected
> and the alignment of the different regions is too small to allow
> covering the entire memory with BATs. This also happens when
> CONFIG_DEBUG_PAGEALLOC is selected or when booting with 'nobats'
> flag.
> 
> Also, if the page containing the kernel stack is not present in the
> MMU hash table, registers cannot be saved and a recursive DSI fault
> is encountered.
> 
> To allow hash_page() to properly do its job at all time and load the
> MMU hash table whenever needed, it must run with data MMU disabled.
> This means it must be called before re-enabling data MMU. To allow
> this, registers clobbered by hash_page() and create_hpte() have to
> be saved in the thread struct together with SRR0, SSR1, DAR and DSISR.
> It is also necessary to ensure that DSI prolog doesn't overwrite
> regs saved by prolog of the current running exception. That means:
> - DSI can only use SPRN_SPRG_SCRATCH0
> - Exceptions must free SPRN_SPRG_SCRATCH0 before writing to the stack.
> 
> This also fixes the Oops reported by Erhard when create_hpte() is
> called by add_hash_page().
> 
> Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206501
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Tested-by: Erhard F. <erhard_f@mailbox.org>

