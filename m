Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C5E5E04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 18:08:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470m9q0DpmzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 03:08:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="IljuDX+V"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470m811S8HzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 03:06:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 470m7v1pVHzB09bF;
 Sat, 26 Oct 2019 18:06:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IljuDX+V; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BPqKipELns7U; Sat, 26 Oct 2019 18:06:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 470m7v0lmZzB09bC;
 Sat, 26 Oct 2019 18:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572106011; bh=CK0LYv4h3ZlYT/dhpa0t6Pn4VtjWWoV9J0PN7vV6RVE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IljuDX+Vy3V0vg6689c0n53c/r+FxCnLFvIHof0rQfYvAfiuMaXATQ9P28TC8mDEf
 jA+07kuSHuY0YsBvdyO3ncrp00zygT/XNIgbP22Xtf3yCC4KCTtMXHPd/jx00oWJ+1
 XAfTZpl1Sq+W4eLiQREvtc/NTf3MTepI015bsRc8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAF518B8B2;
 Sat, 26 Oct 2019 18:06:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cIy1fqYXscf2; Sat, 26 Oct 2019 18:06:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 22E2C8B7C9;
 Sat, 26 Oct 2019 18:06:52 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
To: Thomas Gleixner <tglx@linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
 <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
Date: Sat, 26 Oct 2019 18:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/10/2019 à 17:53, Thomas Gleixner a écrit :
> On Tue, 22 Oct 2019, Christophe Leroy wrote:
>> Le 22/10/2019 à 11:01, Christophe Leroy a écrit :
>>> Le 21/10/2019 à 23:29, Thomas Gleixner a écrit :
>>>> On Mon, 21 Oct 2019, Christophe Leroy wrote:
>>>>
>>>>> This is a tentative to switch powerpc/32 vdso to generic C
>>>>> implementation.
>>>>> It will likely not work on 64 bits or even build properly at the moment.
>>>>>
>>>>> powerpc is a bit special for VDSO as well as system calls in the
>>>>> way that it requires setting CR SO bit which cannot be done in C.
>>>>> Therefore, entry/exit and fallback needs to be performed in ASM.
>>>>>
>>>>> To allow that, C fallbacks just return -1 and the ASM entry point
>>>>> performs the system call when the C function returns -1.
>>>>>
>>>>> The performance is rather disappoiting. That's most likely all
>>>>> calculation in the C implementation are based on 64 bits math and
>>>>> converted to 32 bits at the very end. I guess C implementation should
>>>>> use 32 bits math like the assembly VDSO does as of today.
>>>>
>>>>> gettimeofday:    vdso: 750 nsec/call
>>>>>
>>>>> gettimeofday:    vdso: 1533 nsec/call
>>>
>>> Small improvement (3%) with the proposed change:
>>>
>>> gettimeofday:    vdso: 1485 nsec/call
>>
>> By inlining do_hres() I get the following:
>>
>> gettimeofday:    vdso: 1072 nsec/call
> 
> What's the effect for clock_gettime()?
> 
> gettimeofday() is suboptimal vs. the PPC ASM variant due to an extra
> division, but clock_gettime() should be 1:1 comparable.
> 

Original PPC asm:
clock-gettime-realtime:    vdso: 928 nsec/call

My original RFC:
clock-gettime-realtime:    vdso: 1570 nsec/call

With your suggested vdso_calc_delta():
clock-gettime-realtime:    vdso: 1512 nsec/call

With your vdso_calc_delta() and inlined do_hres():
clock-gettime-realtime:    vdso: 1302 nsec/call

Christophe
