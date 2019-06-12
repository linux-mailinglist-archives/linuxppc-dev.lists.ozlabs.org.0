Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9FA420C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:30:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P1mz4smzzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 19:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qKAUB47d"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P1kx4yp5zDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 19:28:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45P1kq1jrCz9tyxL;
 Wed, 12 Jun 2019 11:28:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qKAUB47d; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w5hEkopi_otQ; Wed, 12 Jun 2019 11:28:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45P1kq0fYNz9tyxB;
 Wed, 12 Jun 2019 11:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560331699; bh=u1viSaPUUxOjsSZ9V5EDn1rE0f7E3CmjxksFHFR5kNY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qKAUB47dqwX5aL/2w5oLslUFoRCOLsXm2I/58gCCEIwGmjtNqn3dxFfQPykr/EolP
 UEP4mtY4ETP2xwxlGcnLvdr+1sVDsLLWs3oU6yJ4DgBTavRwO+FrwyMydi4wiPURrQ
 Mnrl6lattGIuWp3KqOpr/JSIk8sOZgMwvxp7dmoI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35C268B80B;
 Wed, 12 Jun 2019 11:28:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0kIDxB-Gjzxk; Wed, 12 Jun 2019 11:28:20 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15A958B804;
 Wed, 12 Jun 2019 11:28:20 +0200 (CEST)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
To: Paul Mackerras <paulus@ozlabs.org>
References: <20190612072229.15832-1-mikey@neuling.org>
 <1ee1cc67-d342-6610-4865-8c52a85e67c1@c-s.fr>
 <20190612092342.GA18684@blackberry>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <322d6697-fb56-96a0-c903-ddf1270fbb45@c-s.fr>
Date: Wed, 12 Jun 2019 11:28:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612092342.GA18684@blackberry>
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/06/2019 à 11:23, Paul Mackerras a écrit :
> On Wed, Jun 12, 2019 at 09:42:52AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 12/06/2019 à 09:22, Michael Neuling a écrit :
>>> In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
>>> option") I screwed up some assembler and corrupted a pointer in
>>> r3. This resulted in crashes like the below from Cédric:
>>
>> Iaw Documentation/process/submitting-patches.rst:
>>
>> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
>> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>> to do frotz", as if you are giving orders to the codebase to change
>> its behaviour.
>>
>> So you could rephrase as follows for instance:
>>
>> Commit XXXX ("") screwed up some assembler ....
> 
> That advice in submitting-patches.rst is certainly appropriate when
> talking about the actual change that the patch makes.  However, it is
> also appropriate to give descriptive background material that helps
> the reader to understand why the change is necessary -- in this case,
> where and how the bug was introduced.  So I'm going to support Mikey
> as regards his first few paragraphs.

Does it really matter knowing that it is Mikey who screwed up the 
assembler ? For me what's important is to know which commit introduced 
the error, not who made the error, isn't it ?

Christophe

> 
> I agree that the last paragraph that says "This fixes the bug by ..."
> could be reworded as "Fix the bug by ...".
> 
> Paul.
> 
