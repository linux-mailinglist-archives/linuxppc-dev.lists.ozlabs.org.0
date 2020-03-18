Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED93189D15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 14:35:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j9yT1CV2zDqT5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 00:35:13 +1100 (AEDT)
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
 header.s=mail header.b=XYtuqdKJ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j9t46Cm2zDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 00:31:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48j9sx40glz9v1vc;
 Wed, 18 Mar 2020 14:31:17 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XYtuqdKJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gQE5nnNjFsjF; Wed, 18 Mar 2020 14:31:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48j9sx2wRxz9v1vY;
 Wed, 18 Mar 2020 14:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584538277; bh=G84lL0LtzEaL0veVBFRjgIHIWAwVKkwsmezTFwoIHwc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XYtuqdKJfkDzgOIYvHzljLu5MuAZuNLqYbq/2GyY4aFFvNS3/PYaHG3Hn92Yd4hty
 daB23nJXA5GEbk8J3vAS/pKkGE/8ZaQ1E2wCiSBk8BCoyoWnubsQCpeJAyBASccwDl
 XEw+boI+iSQSpSuY3REOY4mBwjroCqcZzFM9txgM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AFE0F8B78A;
 Wed, 18 Mar 2020 14:31:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LmKV_rQvLy0e; Wed, 18 Mar 2020 14:31:18 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B97EE8B75B;
 Wed, 18 Mar 2020 14:31:17 +0100 (CET)
Subject: Re: [PATCH 14/15] powerpc/watchpoint/xmon: Don't allow breakpoint
 overwriting
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-15-ravi.bangoria@linux.ibm.com>
 <b6892b22-c521-207e-e5fd-ca66c774b314@c-s.fr>
 <56ee9190-2363-efbe-fd94-0b42194e6586@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <79b77ffc-afac-b8ff-20d8-35a48860e526@c-s.fr>
Date: Wed, 18 Mar 2020 14:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <56ee9190-2363-efbe-fd94-0b42194e6586@linux.ibm.com>
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



Le 18/03/2020 à 13:37, Ravi Bangoria a écrit :
> 
> 
> On 3/17/20 4:40 PM, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
>>> Xmon allows overwriting breakpoints because it's supported by only
>>> one dawr. But with multiple dawrs, overwriting becomes ambiguous
>>> or unnecessary complicated. So let's not allow it.
>>
>> Could we drop this completely (I mean the functionnality, not the patch).
> 
> Not sure I follow. Isn't the same thing I'm doing?
> 

Yes, I think I misunderstood the patch. That seems ok.

Christophe
