Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D90145B6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:18:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tvF49LWzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 05:18:33 +1100 (AEDT)
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
 header.s=mail header.b=OcJlBYzu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tMs1slyzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:54:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482tMm3lzRz9vBf2;
 Wed, 22 Jan 2020 18:54:44 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OcJlBYzu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g55D7HPV3Pwg; Wed, 22 Jan 2020 18:54:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482tMm2SL9z9vBf1;
 Wed, 22 Jan 2020 18:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579715684; bh=nMZdRf5UsRj5KxQzwPP0NxCJ+9fa/JNI7E3shGKwtEs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OcJlBYzuayKTBlwDBdHG6QFeB0VoE/H+bzD9dU4M5bNP7OWUZKU4CVf0g6xmdG17n
 aDVEV8uPTBOJLj3L7ro5dOR/K2G0KeM7H1aC/PuOC8xLvG2mvLfW1Nobjbnwkl2FQU
 I6xJXWlceBU7CM1zDVJfem12s6jlYfllbGHsPocg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 029598B810;
 Wed, 22 Jan 2020 18:54:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fO2Q8JMqvBdc; Wed, 22 Jan 2020 18:54:45 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 565C88B7FE;
 Wed, 22 Jan 2020 18:54:45 +0100 (CET)
Subject: Re: [PATCH v1 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr>
 <CAHk-=whTzEu5=sMEVLzuf7uOnoCyUs8wbfw87njes9FyE=mj1w@mail.gmail.com>
 <20200122174129.GH23230@ZenIV.linux.org.uk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e6423f62-c29a-1a67-fb75-1330f5ef1348@c-s.fr>
Date: Wed, 22 Jan 2020 18:54:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122174129.GH23230@ZenIV.linux.org.uk>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/01/2020 à 18:41, Al Viro a écrit :
> On Wed, Jan 22, 2020 at 08:13:12AM -0800, Linus Torvalds wrote:
>> On Wed, Jan 22, 2020 at 5:00 AM Christophe Leroy
>> <christophe.leroy@c-s.fr> wrote:
>>>
>>> Modify filldir() and filldir64() to request the real area they need
>>> to get access to.
>>
>> Not like this.
>>
>> This makes the situation for architectures like x86 much worse, since
>> you now use "put_user()" for the previous dirent filling. Which does
>> that expensive user access setup/teardown twice again.
>>
>> So either you need to cover both the dirent's with one call, or you
>> just need to cover the whole (original) user buffer passed in. But not
>> this unholy mixing of both unsafe_put_user() and regular put_user().
> 
> I would suggest simply covering the range from dirent->d_off to
> buf->current_dir->d_name[namelen]; they are going to be close to
> each other and we need those addresses anyway...
> 

In v2, I'm covering from the beginning of parent dirent to the end of 
current dirent.

Christophe
