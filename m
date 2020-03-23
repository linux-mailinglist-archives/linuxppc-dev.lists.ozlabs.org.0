Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B518F8CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:39:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJTX19wHzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJK75tM1zDrGp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=MFyGwXIX; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mJK7289Zz8tF1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:32:11 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mJK718q5z9sR4; Tue, 24 Mar 2020 02:32:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=MFyGwXIX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mJK52tBjz9sRN
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 02:31:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mJJS6RqHz9vBmN;
 Mon, 23 Mar 2020 16:31:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MFyGwXIX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cwOvgf1huC1t; Mon, 23 Mar 2020 16:31:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mJJS5Q4bz9vBmK;
 Mon, 23 Mar 2020 16:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584977496; bh=qQbAIddkuRhuWdvMwLLKy/z08MBoMp0eukewax9102E=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MFyGwXIXtaQlW9sXddQ1+Dwf1hFTl4SFj4xXEf+eyMjOAr+XM/IBt03Uqmx28RzNJ
 DFSKviKjCzxIq3Sh5ag8gPuXre/gCMVGYL8tQDdNnewg3b3DXgiuK2cVfMrAcFXnIP
 dvcW11jtwjqaELrFeDCXmnmkkaM0c5mHO3k6WuPI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 715598B77C;
 Mon, 23 Mar 2020 16:31:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QOE5VtUwgOcj; Mon, 23 Mar 2020 16:31:41 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E2C4A8B779;
 Mon, 23 Mar 2020 16:31:40 +0100 (CET)
Subject: Re: hardcoded SIGSEGV in __die() ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <43a21b20-4214-1043-0919-1bd8078d14a6@c-s.fr>
Date: Mon, 23 Mar 2020 16:31:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2020 à 16:08, Joakim Tjernlund a écrit :
> On Mon, 2020-03-23 at 15:45 +0100, Christophe Leroy wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> Le 23/03/2020 à 15:43, Christophe Leroy a écrit :
>>>
>>> Le 23/03/2020 à 15:17, Joakim Tjernlund a écrit :
>>>> In __die(), see below, there is this call to notify_send() with
>>>> SIGSEGV hardcoded, this seems odd
>>>> to me as the variable "err" holds the true signal(in my case SIGBUS)
>>>> Should not SIGSEGV be replaced with the true signal no.?
>>>
>>> As far as I can see, comes from
>>> https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D66fcb1059&amp;data=02%7C01%7CJoakim.Tjernlund%40infinera.com%7C4291ac1b501e4296869a08d7cf38cdb4%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C637205715189366995&amp;sdata=Z2bFsmDlD2MKhLACQvayk9ejz0dqgMEOlBTlocAmtTg%3D&amp;reserved=0
>>>
>>
>> And
>> https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3Dae87221d3ce49d9de1e43756da834fd0bf05a2ad&amp;data=02%7C01%7CJoakim.Tjernlund%40infinera.com%7C4291ac1b501e4296869a08d7cf38cdb4%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C637205715189366995&amp;sdata=97kyz3Ur88BhDUUYzya5t%2FFQVhXYu6qiHoW8hsEg81s%3D&amp;reserved=0
>> shows it is (was?) similar on x86.
>>
> 
> I tried to follow that chain thinking it would end up sending a signal to user space but I cannot see
> that happens. Seems to be related to debugging.
> 
> In short, I cannot see any signal being delivered to user space. If so that would explain why
> our user space process never dies.
> Is there a signal hidden in machine_check handler for SIGBUS I cannot see?
> 

Isn't it done in do_exit(), called from oops_end() ?

Christophe
