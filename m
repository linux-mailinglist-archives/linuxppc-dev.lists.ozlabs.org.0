Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED4285873
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 08:05:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5kNL34y0zDqNj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 17:05:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5kLY5tpTzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 17:04:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C5kLJ6hhDz9v0Mg;
 Wed,  7 Oct 2020 08:04:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C3Q4p0VCWNtv; Wed,  7 Oct 2020 08:04:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C5kLJ5Xg3z9v0Mf;
 Wed,  7 Oct 2020 08:04:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B489A8B801;
 Wed,  7 Oct 2020 08:04:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MTwXJtHzQ69o; Wed,  7 Oct 2020 08:04:09 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A6AC8B75E;
 Wed,  7 Oct 2020 08:04:09 +0200 (CEST)
Subject: Re: [powerpc:next-test 76/183]
 arch/powerpc/kernel/vdso32/gettimeofday.S:40: Error: syntax error; found `@',
 expected `,'
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <202010070441.K8Bb46Rt-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9d8b2abf-000f-bad8-ae76-719a592584ff@csgroup.eu>
Date: Wed, 7 Oct 2020 08:03:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <202010070441.K8Bb46Rt-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/10/2020 à 22:41, kernel test robot a écrit :
> Hi Michael,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   72cdd117c449896c707fc6cfe5b90978160697d0
> commit: 231b232df8f67e7d37af01259c21f2a131c3911e [76/183] powerpc/64: Make VDSO32 track COMPAT on 64-bit
> config: powerpc-randconfig-r033-20201005 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1127662c6dc2a276839c75a42238b11a3ad00f32)

There has been already a discussion on this, see 
https://groups.google.com/g/clang-built-linux/c/ayNmi3HoNdY/m/ROdg7avVBwAJ

This apparently is a clang issue. The commit mentionned here is only exposing the issue, but the 
issue is not in the commit itself.

Regardless, this error should go away when we switch to the generic C VDSO.

Christophe
