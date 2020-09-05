Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24625E5F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 09:17:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk5VC08pyzDqsj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 17:17:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bk5SS00g7zDqly
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 17:16:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bk5SF0YcXz9v21X;
 Sat,  5 Sep 2020 09:16:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I2kWpVRgLGRj; Sat,  5 Sep 2020 09:16:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bk5SD6rtHz9v21V;
 Sat,  5 Sep 2020 09:16:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F36098B76E;
 Sat,  5 Sep 2020 09:16:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LbgFIZMjw9IA; Sat,  5 Sep 2020 09:16:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C9E268B75B;
 Sat,  5 Sep 2020 09:16:12 +0200 (CEST)
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
To: David Laight <David.Laight@ACULAB.COM>,
 'Alexey Dobriyan' <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>
References: <20200903142242.925828-1-hch@lst.de>
 <20200904060024.GA2779810@gmail.com>
 <20200904175823.GA500051@localhost.localdomain>
 <63f3c9342a784a0890b3b641a71a8aa1@AcuMS.aculab.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4500d8d9-7318-4505-6086-2d2dc41f3866@csgroup.eu>
Date: Sat, 5 Sep 2020 09:16:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <63f3c9342a784a0890b3b641a71a8aa1@AcuMS.aculab.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/09/2020 à 23:01, David Laight a écrit :
> From: Alexey Dobriyan
>> Sent: 04 September 2020 18:58
>>
>> On Fri, Sep 04, 2020 at 08:00:24AM +0200, Ingo Molnar wrote:
>>> * Christoph Hellwig <hch@lst.de> wrote:
>>>> this series removes the last set_fs() used to force a kernel address
>>>> space for the uaccess code in the kernel read/write/splice code, and then
>>>> stops implementing the address space overrides entirely for x86 and
>>>> powerpc.
>>>
>>> Cool! For the x86 bits:
>>>
>>>    Acked-by: Ingo Molnar <mingo@kernel.org>
>>
>> set_fs() is older than some kernel hackers!
>>
>> 	$ cd linux-0.11/
>> 	$ find . -type f -name '*.h' | xargs grep -e set_fs -w -n -A3
>> 	./include/asm/segment.h:61:extern inline void set_fs(unsigned long val)
>> 	./include/asm/segment.h-62-{
>> 	./include/asm/segment.h-63-     __asm__("mov %0,%%fs"::"a" ((unsigned short) val));
>> 	./include/asm/segment.h-64-}
> 
> What is this strange %fs register you are talking about.
> Figure 2-4 only has CS, DS, SS and ES.
> 

Intel added registers FS and GS in the i386

Christophe
