Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A8189777
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 09:58:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j3q01yRbzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 19:58:20 +1100 (AEDT)
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
 header.s=mail header.b=qfioq/o2; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j3nT3FPDzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 19:56:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48j3nJ1xJdz9v3FT;
 Wed, 18 Mar 2020 09:56:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qfioq/o2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jkE56YeCrxXm; Wed, 18 Mar 2020 09:56:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48j3nJ0r7yz9v3FS;
 Wed, 18 Mar 2020 09:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584521812; bh=TTKZhsZFwGWKIzyh7cjl+exKyfzWXw6/Oq2wOs8T6ho=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qfioq/o22DjMq3HuuebXzIl1NT172uX70zXt9nvbsy+PZssJqdqNLfN7fBM+MihMn
 2XMt/ib1niqofGYwBavKZZQZw2JwDgSAeVcj5oa4nhfHn9VBsPSgEHAXoQkyikd4pR
 EZJnkuJewEVlN2hgVypxzzXK+cgbkUH17EEdGmGc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24A108B776;
 Wed, 18 Mar 2020 09:56:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I-Mbg_A4jZho; Wed, 18 Mar 2020 09:56:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 412F18B75B;
 Wed, 18 Mar 2020 09:56:52 +0100 (CET)
Subject: Re: [PATCH 09/15] powerpc/watchpoint: Convert thread_struct->hw_brk
 to an array
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-10-ravi.bangoria@linux.ibm.com>
 <0fc9489d-9955-f649-9007-ce6f5da345be@c-s.fr>
 <5efe2f41-2bf3-6927-aa6a-dcedb672c69d@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a1794506-ada3-7b1e-2fa7-bcebf6ec9d68@c-s.fr>
Date: Wed, 18 Mar 2020 09:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5efe2f41-2bf3-6927-aa6a-dcedb672c69d@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, mikey@neuling.org, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/03/2020 à 09:36, Ravi Bangoria a écrit :
> 
> 
> On 3/17/20 4:07 PM, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
>>> So far powerpc hw supported only one watchpoint. But Future Power
>>> architecture is introducing 2nd DAWR. Convert thread_struct->hw_brk
>>> into an array.
>>
>> Looks like you are doing a lot more than that in this patch.
>>
>> Should this patch be splitted in two parts ?
> 
> So far thread_struct->hw_brk was a normal variable so accessing it was 
> simple.
> Once it gets converted into an array, loop needs to be used to access 
> it. So
> all misc changes are basically converting simple access into loops.
> 
> I don't see how this can be splitted.
> 

You could first change all thread_struct->hw_brk to 
thread_struct->hw_brk[0] or thread_struct->hw_brk[i] when you know that 
i can only be 0 for now. Then add the loops and new functions in a 
second patch.

Christophe
