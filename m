Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9F406A23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 12:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5XBM3RfRz2ywK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 20:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5X9s55bjz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 20:27:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H5X9j2q1rz9sVM;
 Fri, 10 Sep 2021 12:27:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88gl3r46r1PN; Fri, 10 Sep 2021 12:27:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H5X9j1NDRz9sV6;
 Fri, 10 Sep 2021 12:27:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 140988B781;
 Fri, 10 Sep 2021 12:27:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ECM4fsn4G9tT; Fri, 10 Sep 2021 12:27:05 +0200 (CEST)
Received: from localhost.localdomain (po22017.idsi0.si.c-s.fr [192.168.7.20])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AACA18B763;
 Fri, 10 Sep 2021 12:27:04 +0200 (CEST)
Subject: Re: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
 <87mtoux1hi.fsf@disp2133> <2715792c-eb10-eeb8-3d49-24486abe953b@csgroup.eu>
 <877dfrrkxo.fsf@disp2133>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7caf5127-36fc-7c77-00f1-7be82d6f26e0@csgroup.eu>
Date: Fri, 10 Sep 2021 10:27:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877dfrrkxo.fsf@disp2133>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/8/21 6:17 PM, Eric W. Biederman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Le 02/09/2021 à 20:43, Eric W. Biederman a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>
>>>> In the same spirit as commit fb05121fd6a2 ("signal: Add
>>>> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
>>>> copy_siginfo_to_user() in order to use it within user access blocks.
>>>>
>>>> For that, also add an 'unsafe' version of clear_user().
>>>
>>> Looking at your use cases you need the 32bit compat version of this
>>> as well.
>>>
>>> The 32bit compat version is too complicated to become a macro, so I
>>> don't think you can make this work correctly for the 32bit compat case.
>>
>> When looking into patch 5/5 that you nacked, I think you missed the fact that we
>> keep using copy_siginfo_to_user32() as it for the 32 bit compat case.
> 
> I did.  My mistake.
> 
> However that mistake was so easy I think it mirrors the comments others
> have made that this looks like a maintenance hazard.
> 
> Is improving the performance of 32bit kernels interesting?

Yes it is, and that's what this series do.

> Is improving the performance of 32bit compat support interesting?

For me this is a corner case, so I left it aside for now.

> 
> If performance one or either of those cases is interesting it looks like
> we already have copy_siginfo_to_external32 the factor you would need
> to build unsafe_copy_siginfo_to_user32.

I'm not sure I understand your saying here. What do you expect me to do 
with copy_siginfo_to_external32() ?

copy_siginfo_to_user32() is for compat only.

Native 32 bits powerpc use copy_siginfo_to_user()

> 
> So I am not going to say impossible but please make something
> maintainable.  I unified all of the compat 32bit siginfo logic because
> it simply did not get enough love and attention when it was implemented
> per architecture.

Yes, and ? I didn't do any modification to the compat case, so what you 
did remains.


> 
> In general I think that concern applies to this case as well.  We really
> need an implementation that shares as much burden as possible with other
> architectures.

I think yes, that's the reason why I made a generic 
unsafe_copy_siginfo_to_user() and didn't make a powerpc dedicated change.

Once this is merged any other architecture can use 
unsafe_copy_siginfo_to_user().

Did I miss something ?

Christophe
