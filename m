Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EC437CAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbY7y02D1z3cWc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 05:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbY7T4QFNz2xXJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 05:40:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbY7J6ySlz9sT8;
 Fri, 22 Oct 2021 20:40:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FCwCzeJuT8i; Fri, 22 Oct 2021 20:40:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbY7J5Xvmz9sT5;
 Fri, 22 Oct 2021 20:40:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CB688B820;
 Fri, 22 Oct 2021 20:40:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CcRmgP-wPC5P; Fri, 22 Oct 2021 20:40:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EC9B8B764;
 Fri, 22 Oct 2021 20:40:11 +0200 (CEST)
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
To: Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@fastmail.com.au>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
Date: Fri, 22 Oct 2021 20:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Copied to Christopher M. Riedl <cmr@linux.ibm.com> and linuxppc list.

Le 22/10/2021 à 19:40, Stan Johnson a écrit :
> Hello Christophe and Finn,
> 
> My message to Christopher Riedl bounced:
> 
> <cmr@codefail.de>:
> 554: 5.7.1 <cmr@codefail.de>: Relay access denied
> 
> I'm not sure how to proceed; thanks for any help.

You should always copy the list, as other people might be interested by 
your problem and/or may help you.

Christophe

> 
> -Stan
> 
> -------- Forwarded Message --------
> Subject: Fwd: X stopped working with 5.14 on iBook
> Date: Fri, 22 Oct 2021 11:35:21 -0600
> From: Stan Johnson <userm57@yahoo.com>
> To: Christopher M. Riedl <cmr@codefail.de>
> CC: Finn Thain <fthain@fastmail.com.au>
> 
> Hello Christopher Riedl,
> 
> Please see the message below, in which a git bisect identifies a commit
> which may have stopped X from working on some PowerPC G4 systems
> (specifically the G4 PowerBook and Cube, possibly others).
> 
> I'm not sure how to proceed with further tests. If the identified commit
> could not have caused the problem, then further testing may be needed.
> Please let me know if you need any additional information.
> 
> Hopefully your e-mail filter will allow messages from yahoo.com addresses.
> 
> thanks for your help
> 
> -Stan Johnson
>   userm57@yahoo.com
> 
> -------- Forwarded Message --------
> Subject: Re: X stopped working with 5.14 on iBook
> Date: Fri, 22 Oct 2021 11:25:14 -0600
> From: Stan Johnson <userm57@yahoo.com>
> To: debian-powerpc@lists.debian.org
> CC: Riccardo Mottola <riccardo.mottola@libero.it>
> 
> On 10/14/21 9:21 PM, Stan Johnson wrote:
>> ...
>> Debian's 5.10.0-8 config file works (as expected) with Debian's 5.10.0-8
>> kernel source.
>> ...
>> X works with 5.14 using a tuned config file derived from 5.13 testing.
>> ...
> 
> Update:
> 
> The issue originally reported by Riccardo Mottola was that X wasn't
> working on a PowerBook G4 using Debian's default
> vmlinux-5.14.0-2-powerpc kernel. I was able to confirm that the X
> failure also occurs on a G4 Cube. My G4 Cube has Debian SID,
> sysvinit-core, Xfce and wdm installed. To test whether X works, I
> disabled wdm, then I log in at the text console and run "startx". When X
> fails, the screen goes blank and the backlight stays on; when X works,
> the normal desktop comes up.
> 
> X works in mainline v5.12 built using a config file based on Debian's
> config-5.10.0-8-powerpc.
> 
> X fails in mainline v5.13 built using a config file based on Debian's
> config-5.10.0-8-powerpc.
> 
> With much help and advice from Finn Thain, I was able to run a bisect
> using a config file based on Debian's config-5.10.0-8-powerpc, with
> v5.12 "good" and v5.13 "bad".
> 
> $ git reset --hard
> HEAD is now at 62fb9874f5da Linux 5.13
> $ git bisect start v5.13
> Updating files: 100% (12992/12992), done.
> Previous HEAD position was 62fb9874f5da Linux 5.13
> HEAD is now at 9f4ad9e425a1 Linux 5.12
> $ git bisect bad v5.13
> $ git bisect good v5.12
> Bisecting: 8739 revisions left to test after this (roughly 13 steps)
>> 85f3f17b5db2dd9f8a094a0ddc665555135afd22] Merge branch 'md-fixes' of
> https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-5.13
> 
> After the bisect, git reports this:
> 
> ----------
> 
> d3ccc9781560af051554017c702631560bdc0811 is the first bad commit
> commit d3ccc9781560af051554017c702631560bdc0811
> Author: Christopher M. Riedl <cmr@codefail.de>
> Date:   Fri Feb 26 19:12:59 2021 -0600
> 
>      powerpc/signal: Use __get_user() to copy sigset_t
> 
>      Usually sigset_t is exactly 8B which is a "trivial" size and does not
>      warrant using __copy_from_user(). Use __get_user() directly in
>      anticipation of future work to remove the trivial size optimizations
>      from __copy_from_user().
> 
>      The ppc32 implementation of get_sigset_t() previously called
>      copy_from_user() which, unlike __copy_from_user(), calls access_ok().
>      Replacing this w/ __get_user() (no access_ok()) is fine here since both
>      callsites in signal_32.c are preceded by an earlier access_ok().
> 
>      Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
>      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>      Link: https://lore.kernel.org/r/20210227011259.11992-11-cmr@codefail.de
> 
>   arch/powerpc/kernel/signal.h    | 7 +++++++
>   arch/powerpc/kernel/signal_32.c | 2 +-
>   arch/powerpc/kernel/signal_64.c | 4 ++--
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 
