Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC683619B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM5VR4Chxz3bms
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:13:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM5V52mwkz2yRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:12:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM5V14zPvzB09b0;
 Fri, 16 Apr 2021 08:12:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 17hBHoXH2I7P; Fri, 16 Apr 2021 08:12:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM5V13VW3zB09Zy;
 Fri, 16 Apr 2021 08:12:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54BD68B81C;
 Fri, 16 Apr 2021 08:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7Zys5WVVVkfX; Fri, 16 Apr 2021 08:12:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DBC6B8B81A;
 Fri, 16 Apr 2021 08:12:40 +0200 (CEST)
Subject: Re: [PATCH] symbol : Make the size of the compile-related array fixed
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?B?6Z+p5aSn6bmPKEhhbiBEYXBlbmcp?= <handapeng@oppo.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Mike Rapoport <rppt@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arseny Solokha <asolokha@kb.kras.ru>,
 Arvind Sankar <nivedita@alum.mit.edu>, Kees Cook <keescook@chromium.org>,
 Joerg Roedel <jroedel@suse.de>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
References: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
 <db764cb6-4294-10c0-56ed-a0fe3b307018@csgroup.eu>
Message-ID: <2dfd1880-556e-1324-0b22-0907d24c7d5a@csgroup.eu>
Date: Fri, 16 Apr 2021 08:12:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <db764cb6-4294-10c0-56ed-a0fe3b307018@csgroup.eu>
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
Cc: =?UTF-8?B?6ZmI5a6J5bqGKEFucWluZyk=?= <chenanqing@oppo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Also, the following statement which appears at the end of your mail is puzzling. What can we do with 
your patch if there are such limitations ?

This e-mail and its attachments contain confidential information from OPPO, which is intended only 
for the person or entity whose address is listed above. Any use of the information contained herein 
in any way (including, but not limited to, total or partial disclosure, reproduction, or 
dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this 
e-mail in error, please notify the sender by phone or email immediately and delete it!



Le 16/04/2021 à 08:08, Christophe Leroy a écrit :
> Hi,
> 
> This mail is unreadable.
> 
> Please send your patch as raw text mail, not as attached file.
> 
> Thanks
> Christophe
> 
> Le 16/04/2021 à 05:12, 韩大鹏(Han Dapeng) a écrit :
>> ----------------------------------------------------------------------------------------------------
>> *OPPO*
>> *
>> *
>> 本电子邮件及其附件含有OPPO公司的保密信息，仅限于邮件指明的收件人使用（包含个人及群组）。禁止任何人 
>> 在 未经授权的情况下以任何形式使用。如果您错收了本邮件，请立即以电子邮件通知发件人并删除本邮件及其 
>> 附件。
>>
>> This e-mail and its attachments contain confidential information from OPPO, which is intended only 
>> for the person or entity whose address is listed above. Any use of the information contained 
>> herein in any way (including, but not limited to, total or partial disclosure, reproduction, or 
>> dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this 
>> e-mail in error, please notify the sender by phone or email immediately and delete it!
>>
