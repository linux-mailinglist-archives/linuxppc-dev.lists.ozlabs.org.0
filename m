Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7195377051
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 09:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcdyX6dDlz305y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 17:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=qqpx=kd=csgroup.eu=christophe.leroy@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcdy73Ffmz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 17:20:30 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4Fcdy06DFvz9sWp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 17:20:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fcdy05wFlz9sX1; Sat,  8 May 2021 17:20:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 2054 seconds by postgrey-1.36 at bilbo;
 Sat, 08 May 2021 17:20:24 AEST
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fcdy03XVYz9sWp
 for <linuxppc-dev@ozlabs.org>; Sat,  8 May 2021 17:20:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FcdBP5jKDz9sbc;
 Sat,  8 May 2021 08:46:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-bTMQL_rbAU; Sat,  8 May 2021 08:46:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FcdBP4Z2wz9sbC;
 Sat,  8 May 2021 08:46:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D03D8B774;
 Sat,  8 May 2021 08:46:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eS9vONDbL9FE; Sat,  8 May 2021 08:46:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 026538B76B;
 Sat,  8 May 2021 08:46:04 +0200 (CEST)
Subject: Re: Kernel crosscompilers
To: Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
Date: Sat, 8 May 2021 08:46:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
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



Le 06/05/2021 à 16:17, Arnd Bergmann a écrit :
> On Thu, May 6, 2021 at 2:42 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Hello Arnd,
>>
>> May I ask you whether you plan to build cross compilers based on GCC 11.1 at
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?
> 
> Hi Christophe,
> 
> I've built a snapshot a few days before the release, that one is
> identical to 11.1
> except for the reported version number. I've tried to ask around for
> help testing
> this, but so far I have not heard from anyone.
> 
> Building a new set of compilers takes around a day on my build box, so I want
> to make sure I don't have to do it more often than necessary. If you are able
> to give the binaries a spin, preferably on a ppc64le or arm64 host, please let
> me know how it goes and I'll rebuilt them on the release tag.
> 

Hi Arnd,

I don't have any ppc or arm host I can build on.
I'm building on x86 for powerpc embedded boards.

I have tried your GCC 11 snapshot, I get something booting but it crashes when launching init.

[    7.368410] init[1]: bad frame in sys_sigreturn: 7fb2fd60 nip 001083cc lr 001083c4
[    7.376283] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    7.383680] CPU: 0 PID: 1 Comm: init Not tainted 5.12.0-s3k-dev-16316-g9e799d5df185 #5054
[    7.391767] Call Trace:
[    7.394174] [c9023db0] [c00211e8] panic+0x130/0x304 (unreliable)
[    7.400112] [c9023e10] [c0024e68] do_exit+0x874/0x910
[    7.405104] [c9023e50] [c0024f80] do_group_exit+0x40/0xc4
[    7.410440] [c9023e60] [c0033334] get_signal+0x1d8/0x93c
[    7.415689] [c9023ec0] [c0007f34] do_notify_resume+0x6c/0x314
[    7.421369] [c9023f20] [c000d580] syscall_exit_prepare+0x120/0x184
[    7.427479] [c9023f30] [c001101c] ret_from_syscall+0xc/0x28

Something is going wrong with asm goto output. I implemented get_user() helpers with asm goto this 
cycle (commit 5cd29b1fd3e8). I tested it with CLANG before submitting, it was working.

Seems like there is something wrong with it with GCC11. When forcing CONFIG_CC_HAS_ASM_GOTO_OUTPUT 
to 'n', the kernel boots ok.

Christophe
