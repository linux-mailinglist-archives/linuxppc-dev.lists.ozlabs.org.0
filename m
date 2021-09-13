Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736CC409A42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 19:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Xnl28Blz2yfm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 03:01:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7XnJ4vbVz2xrx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 03:01:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H7XnC6dT6z9sTs;
 Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAPUdYAfKEbK; Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H7XnC5qdqz9sTr;
 Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4FB38B76E;
 Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J5CWsERj56uu; Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.172])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24FAC8B763;
 Mon, 13 Sep 2021 19:01:19 +0200 (CEST)
Subject: Re: [PATCH RESEND v3 4/6] signal: Add unsafe_copy_siginfo_to_user32()
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <e1b94e52688cd99ed4a3ab86170cd9ec48849291.1631537060.git.christophe.leroy@csgroup.eu>
 <87r1dspj2c.fsf@disp2133>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cf6e3669-1644-9611-6acc-781f46dd4f9e@csgroup.eu>
Date: Mon, 13 Sep 2021 19:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87r1dspj2c.fsf@disp2133>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/09/2021 à 17:54, Eric W. Biederman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> In the same spirit as commit fb05121fd6a2 ("signal: Add
>> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
>> copy_siginfo_to_user32() in order to use it within user access blocks.
>>
>> To do so, we need inline version of copy_siginfo_to_external32() as we
>> don't want any function call inside user access blocks.
> 
> I don't understand.  What is wrong with?
> 
> #define unsafe_copy_siginfo_to_user32(to, from, label)	do {		\
> 	struct compat_siginfo __user *__ucs_to = to;			\
> 	const struct kernel_siginfo *__ucs_from = from;			\
> 	struct compat_siginfo __ucs_new;				\
> 									\
> 	copy_siginfo_to_external32(&__ucs_new, __ucs_from);		\
> 	unsafe_copy_to_user(__ucs_to, &__ucs_new,			\
> 			    sizeof(struct compat_siginfo), label);	\
> } while (0)

As far as I understood, it is forbidden to call functions within user 
access blocks.

On powerpc it doesn't matter (yet), but as far as I understand x86 as a 
tool called "objtool" to enforce that.


> 
> Your replacement of "memset(to, 0, sizeof(*to))" with
> "struct compat_siginfo __ucs_new = {0}".  is actively unsafe as the
> compiler is free not to initialize any holes in the structure to 0 in
> the later case.

Ah ? I didn't know that.
Maybe we can make as exception for memset(). Or we can hard-code a 
zeroizing loop.

> 
> Is there something about the unsafe macros that I am not aware of that
> makes it improper to actually call C functions?  Is that a requirement
> for the instructions that change the user space access behavior?

See see 
https://lore.kernel.org/lkml/20190318155142.025214872@infradead.org/T/ ?

> 
>  From the looks of this change all that you are doing is making it so
> that all of copy_siginfo_to_external32 is being inlined.  If that is not
> a hard requirement of the instructions it seems like the wrong thing to
> do here. copy_siginfo_to_external32 has not failures so it does not need
> to be inlined so you can jump to the label.

Yes that's what I did, make sure everything is inlined. Or maybe I 
misunderstood something ?

Christophe
