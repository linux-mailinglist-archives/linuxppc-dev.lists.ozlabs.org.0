Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A921E925D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 17:39:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Z5GH3n5fzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 01:39:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Z5DS4FcCzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 01:37:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49Z5DF40wJz9v6b0;
 Sat, 30 May 2020 17:37:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GgYPmaTC_Rmm; Sat, 30 May 2020 17:37:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49Z5DF2w3Bz9v6Zy;
 Sat, 30 May 2020 17:37:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A1768B7B1;
 Sat, 30 May 2020 17:37:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n52eMljr_spt; Sat, 30 May 2020 17:37:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC6238B75E;
 Sat, 30 May 2020 17:37:50 +0200 (CEST)
Subject: Re: ppc64le and 32-bit LE userland compatibility
To: Will Springer <skirmisher@protonmail.com>, linuxppc-dev@lists.ozlabs.org
References: <2047231.C4sosBPzcN@sheen>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8be94d2e-8e20-52b6-22e6-152b79a94139@csgroup.eu>
Date: Sat, 30 May 2020 17:37:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <2047231.C4sosBPzcN@sheen>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/05/2020 à 21:03, Will Springer a écrit :

[...]

> 
> Also worth noting is the one other outstanding bug, where the time-related
> syscalls in the 32-bit vDSO seem to return garbage. It doesn't look like an
> endian bug to me, and it doesn't affect standard syscalls (which is why if you
> run `date` on musl it prints the correct time, unlike on glibc). The vDSO time
> functions are implemented in ppc asm (arch/powerpc/kernel/vdso32/
> gettimeofday.S), and I've never touched the stuff, so if anyone has a clue I'm
> all ears.
> 

There is a series at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=173231 to 
switch powerpc to the Generic C VDSO.

Can you try and see whether it fixes your issue ?

Christophe
