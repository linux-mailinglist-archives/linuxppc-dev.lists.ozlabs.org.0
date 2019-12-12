Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484311D26B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 17:36:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YfZh6zzfzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 03:36:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mUaC9PzR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YfXb2y3bzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 03:34:55 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47YfXP2gjMzB09Zb;
 Thu, 12 Dec 2019 17:34:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mUaC9PzR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9WuTQ52ZLv0o; Thu, 12 Dec 2019 17:34:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47YfXP0ZwbzB09Zd;
 Thu, 12 Dec 2019 17:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576168485; bh=5ayd9PjJRgNmK3O5j33o8jKyMdGb9Kf50uNZGSjc28I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mUaC9PzRHUQgIKKPVsLlwj3RKssxuq6EeDV67OR9T/w6yH9ybBbXdRE0UC8mNYv6b
 iwCt44e25EqPI1h0UB4DarcGj1W790CZBg6CZI+atejs26GN/5qiD8nmGIFiGkCzXI
 9E2CYb9yDOhLKkxGHZQYxRtNjf8H4GjjTX1RWNdc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A93118B877;
 Thu, 12 Dec 2019 17:34:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hamxpM4AZs8F; Thu, 12 Dec 2019 17:34:46 +0100 (CET)
Received: from [172.25.230.112] (po15451.idsi0.si.c-s.fr [172.25.230.112])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8493D8B872;
 Thu, 12 Dec 2019 17:34:46 +0100 (CET)
Subject: Re: [PATCH v5] powerpc/irq: inline call_do_irq() and
 call_do_softirq() on PPC32
To: Christoph Hellwig <hch@infradead.org>
References: <72a6cd86137b2a7ab835213cf5c74df6ed2f6ea7.1575739197.git.christophe.leroy@c-s.fr>
 <20191212125222.GB3381@infradead.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <878e4ac8-9bfa-394d-8bca-f09a78f54904@c-s.fr>
Date: Thu, 12 Dec 2019 17:34:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212125222.GB3381@infradead.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/12/2019 à 13:52, Christoph Hellwig a écrit :
> On Sat, Dec 07, 2019 at 05:20:04PM +0000, Christophe Leroy wrote:
>> call_do_irq() and call_do_softirq() are simple enough to be
>> worth inlining.
>>
>> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.
>> It also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
>>
>> This is inspired from S390 arch. Several other arches do more or
>> less the same. The way sparc arch does seems odd thought.
> 
> Any reason you only do this for 32-bit and not 64-bit as well?
> 

Yes ... There has been a long discussion on this in v4, see 
https://patchwork.ozlabs.org/patch/1174288/

The problem is that on PPC64, r2 register is used as TOC pointer and it 
is apparently not straithforward to make sure the caller and the callee 
are using the same TOC.

On PPC32 it's more simple, r2 is current task_struct at all time, it 
never changes.

Christophe
