Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15E1AF913
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 11:46:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494lMp0s4KzDrCj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 19:46:30 +1000 (AEST)
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
 header.s=mail header.b=GTxrWi+1; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494lKL24xWzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 19:44:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 494lK70l80z9tyDn;
 Sun, 19 Apr 2020 11:44:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GTxrWi+1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id agMTeFgwJHef; Sun, 19 Apr 2020 11:44:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 494lK66bZKz9tyDm;
 Sun, 19 Apr 2020 11:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587289450; bh=SAV0xGuQ9VZ7E187cmvKPxd3AgnPYrEdvKnWeiHAfaQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GTxrWi+19O2fSCk7JG/AeNxZChGPXLbHyoUL587A2HuZmmYIqZVaDYFi70A0eA3Bo
 wSL9nGPptXJxbHyosjGozMIIID+C6oJhwdn/2p29mXTdlsgeQzr0L75Bm4B8plck9b
 ObV+mOQOW2qWcJsuB3cAMswzJyItwO5WAqbhsyAo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30B6E8B76F;
 Sun, 19 Apr 2020 11:44:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 026YLU_0W1Wh; Sun, 19 Apr 2020 11:44:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4FF48B752;
 Sun, 19 Apr 2020 11:44:12 +0200 (CEST)
Subject: Re: [PATCH 8/8] exec: open code copy_string_kernel
To: Christoph Hellwig <hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-9-hch@lst.de>
 <ffea91ee-f386-9d19-0bc9-ab59eb7b9a41@c-s.fr> <20200419080646.GE12222@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5f96e86a-b084-4330-b7d1-08b78416994c@c-s.fr>
Date: Sun, 19 Apr 2020 11:44:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200419080646.GE12222@lst.de>
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
Cc: "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/04/2020 à 10:06, Christoph Hellwig a écrit :
> On Sat, Apr 18, 2020 at 10:15:42AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 14/04/2020 à 09:01, Christoph Hellwig a écrit :
>>> Currently copy_string_kernel is just a wrapper around copy_strings that
>>> simplifies the calling conventions and uses set_fs to allow passing a
>>> kernel pointer.  But due to the fact the we only need to handle a single
>>> kernel argument pointer, the logic can be sigificantly simplified while
>>> getting rid of the set_fs.
>>
>>
>> Instead of duplicating almost identical code, can you write a function that
>> takes whether the source is from user or from kernel, then you just do
>> things like:
>>
>> 	if (from_user)
>> 		len = strnlen_user(str, MAX_ARG_STRLEN);
>> 	else
>> 		len = strnlen(str, MAX_ARG_STRLEN);
>>
>>
>> 	if (from_user)
>> 		copy_from_user(kaddr+offset, str, bytes_to_copy);
>> 	else
>> 		memcpy(kaddr+offset, str, bytes_to_copy);
> 
> We'll need two different str variables then with and without __user
> annotations to keep type safety.  And introduce a branch-y and unreadable
> mess in the exec fast path instead of adding a simple and well understood
> function for the kernel case that just deals with the much simpler case
> of just copying a single arg vector from a kernel address.
> 

About the branch, I was expecting GCC to inline and eliminate the unused 
branch.
