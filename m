Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4AB25B037
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 17:53:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhT4d2zPRzDqy9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 01:53:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhSs54XSHzDqx0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 01:43:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhSrw4krPz9txTB;
 Wed,  2 Sep 2020 17:43:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nFwfpdFhuBJU; Wed,  2 Sep 2020 17:43:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhSrw21Q6z9txS3;
 Wed,  2 Sep 2020 17:43:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEA7E8B7EF;
 Wed,  2 Sep 2020 17:43:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tsIuuS3JiTII; Wed,  2 Sep 2020 17:43:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A79A8B7EA;
 Wed,  2 Sep 2020 17:43:28 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/vdso32: link vdso64 with linker
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-3-ndesaulniers@google.com>
 <b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu>
 <20200902141431.GV28786@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0c895acf-b6d7-baaf-d613-236f8be8e1fe@csgroup.eu>
Date: Wed, 2 Sep 2020 17:43:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902141431.GV28786@gate.crashing.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 02/09/2020 à 16:14, Segher Boessenkool a écrit :
> Hi!
> 
> On Wed, Sep 02, 2020 at 06:46:45AM +0000, Christophe Leroy wrote:
>> ld crashes:
>>
>>    LD      arch/powerpc/kernel/vdso32/vdso32.so.dbg
>> /bin/sh: line 1: 23780 Segmentation fault      (core dumped)
>> ppc-linux-ld -EB -m elf32ppc -shared -soname linux-vdso32.so.1
>> --eh-frame-hdr --orphan-handling=warn -T
>> arch/powerpc/kernel/vdso32/vdso32.lds
>> arch/powerpc/kernel/vdso32/sigtramp.o
>> arch/powerpc/kernel/vdso32/gettimeofday.o
>> arch/powerpc/kernel/vdso32/datapage.o
>> arch/powerpc/kernel/vdso32/cacheflush.o
>> arch/powerpc/kernel/vdso32/note.o arch/powerpc/kernel/vdso32/getcpu.o -o
>> arch/powerpc/kernel/vdso32/vdso32.so.dbg
>> make[4]: *** [arch/powerpc/kernel/vdso32/vdso32.so.dbg] Error 139
>>
>>
>> [root@localhost linux-powerpc]# ppc-linux-ld --version
>> GNU ld (GNU Binutils) 2.26.20160125
> 
> [ Don't build as root :-P ]
> 
> Try with a newer ld?  If it still happens with current versions, please
> open a bug report?  https://sourceware.org/bugzilla

Yes it works with 2.30 and 2.34
But minimum for building kernel is supposed to be 2.23

Christophe
