Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13352C9B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 04:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3YRM60jgz3c9N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 12:17:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TjF3X4Yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TjF3X4Yp; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3YQh6Nsfz3bdg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 12:17:15 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id l16so4898577oil.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 19:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y0e3s4RapEZi4G82QiUsPIelUiN1IwZyRHMRAQVsVPE=;
 b=TjF3X4Yp0lgg/uvmElGGdNAeDdcPn9oRbm26OiQxEN0veObjN1zwzYv1fWgv9H6mkA
 Q5ExoilldaN1jk8RmuAJvFMjgau4nOWa5vtPeK2Yi+09Ht3EciK7E/7K1upUH1+M4Kuf
 IkOCKikay4euKRiYPMBBPnkI6L5GmmnqD9zil6r5BVJaW67STbw0ZOzrZsmrEpge/e0C
 3IYhv6tS5jha+Xb5W+KCQknbJhrHB98OBX/t15tJ/9rm3Stz6plqgNgPNk99apyCy9Y9
 LRtaiH5DOn1Q0Odedhump91EyePUY264rNNSFCGMG72Q0IZHo+p9Of+ORN+2aCjf8aCo
 S7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Y0e3s4RapEZi4G82QiUsPIelUiN1IwZyRHMRAQVsVPE=;
 b=wj1dH3j5qnUmYUm7xD7lMqXlnbW/ovVvu0wUd9fY1ylZrkpjOCz7GeVySPLtAjrnny
 21iSfDWWu46bPE8BH+huzQpNXCGaefxnqJRkFv2Xdd/vHk3KDl5A68KC5Dq852TIkQu5
 rkx4q8G8+qeCBCyogEwdUUos9Dk8nj4ykJgP7kHXpyYTrjU00/eiceF/X4QCOXmxCAE4
 +zBeV6fyz+RtY96/d+E3hsJA80m1WRU0w5Qjfi4sm4PvD5D9ljKncXOswt1iQEuL9eoy
 G/3fn6Ew0Y1E/5NXMyleIja15yo75zIbYg591WpjBWRU3BAWNZjqCWytGVtdKak6iDtc
 Z10Q==
X-Gm-Message-State: AOAM532QEvXzuqbNgY9JfR6v5FclA34AbrLgpTsugtkDtvaT9WejmMJr
 i6WZ+GVfJFBk86FQNmDUdis=
X-Google-Smtp-Source: ABdhPJwLRMRuhNzPfOMPwta8qqogSiaN5c910UJjyq42LdbAbyM+PuLisYYCj19ZdZxfvWR70QSokA==
X-Received: by 2002:aca:61c1:0:b0:2ec:d091:ff53 with SMTP id
 v184-20020aca61c1000000b002ecd091ff53mr1662399oib.235.1652926632701; 
 Wed, 18 May 2022 19:17:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h61-20020a9d2f43000000b0060603221263sm1338227otb.51.2022.05.18.19.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 19:17:09 -0700 (PDT)
Date: Wed, 18 May 2022 19:17:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 3/4] powerpc/code-patching: Use jump_label for testing
 freed initmem
Message-ID: <20220519021706.GA3526833@roeck-us.net>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <0aee964721cab7316cffde21a2ca223cee14d373.1647962456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aee964721cab7316cffde21a2ca223cee14d373.1647962456.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 22, 2022 at 04:40:20PM +0100, Christophe Leroy wrote:
> Once init is done, initmem is freed forever so no need to
> test system_state at every call to patch_instruction().
> 
> Use jump_label.
> 
> This reduces by 2% the time needed to activate ftrace on an 8xx.
> 

It also causes the qemu mpc8544ds emulation to crash.

BUG: Unable to handle kernel data access on write at 0xc122eb34
Faulting instruction address: 0xc001b580
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K MPC8544 DS
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.18.0-rc7-next-20220518 #1
NIP:  c001b580 LR: c001b560 CTR: 00000003
REGS: c5107dd0 TRAP: 0300   Not tainted  (5.18.0-rc7-next-20220518)
MSR:  00009000 <EE,ME>  CR: 24000882  XER: 00000000
DEAR: c122eb34 ESR: 00800000
GPR00: c001b560 c5107ec0 c5120020 10000000 00000000 00000078 0c000000 cfffffff
GPR08: c001e9ec 00000001 00000007 00000000 44000882 00000000 c0005178 00000000
GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1230000
NIP [c001b580] free_initmem+0x48/0xa8
LR [c001b560] free_initmem+0x28/0xa8
Call Trace:
[c5107ec0] [c001b560] free_initmem+0x28/0xa8 (unreliable)
[c5107ee0] [c00051b0] kernel_init+0x38/0x150
[c5107f00] [c001626c] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
3fe0c123 912a00dc 90010024 48000665 3d20c218 8929fa65 2c090000 41820058
813feb34 2c090000 4082003c 39200001 <913feb34> 80010024 3cc0c114 83e1001c

Reverting this patch fixes the problem.

Guenter

---
# bad: [736ee37e2e8eed7fe48d0a37ee5a709514d478b3] Add linux-next specific files for 20220518
# good: [42226c989789d8da4af1de0c31070c96726d990c] Linux 5.18-rc7
git bisect start 'HEAD' 'v5.18-rc7'
# bad: [555b5fa93f08980ccb6bc8e196226046fe047901] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 555b5fa93f08980ccb6bc8e196226046fe047901
# bad: [8f5ef5e622d3f217d6542779723566099f370c31] Merge branch 'for-next' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
git bisect bad 8f5ef5e622d3f217d6542779723566099f370c31
# good: [2b7d17d4b7c1ff40f58b0d32be40fc0bb6c582fb] soc: document merges
git bisect good 2b7d17d4b7c1ff40f58b0d32be40fc0bb6c582fb
# good: [4964f9250fbf76cb0b9c1124d5b9ab65de9bfd0e] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
git bisect good 4964f9250fbf76cb0b9c1124d5b9ab65de9bfd0e
# bad: [18fae10a22071ccd0a2c44df2749ff482132774e] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git
git bisect bad 18fae10a22071ccd0a2c44df2749ff482132774e
# bad: [b4a5aaaa51e4ab7f03eec509d3710d50e52e87a6] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
git bisect bad b4a5aaaa51e4ab7f03eec509d3710d50e52e87a6
# bad: [b6b1c3ce06ca438eb24e0f45bf0e63ecad0369f5] powerpc/rtas: Keep MSR[RI] set when calling RTAS
git bisect bad b6b1c3ce06ca438eb24e0f45bf0e63ecad0369f5
# good: [87ccc6684d3b57e3073f77cf28396b3037154193] powerpc/book3e: Fix sparse report in mm/nohash/fsl_book3e.c
git bisect good 87ccc6684d3b57e3073f77cf28396b3037154193
# good: [f31c618373f2051a32e30002d8eacad7bbbd3885] powerpc: Sort and de-dup primary opcodes in ppc-opcode.h
git bisect good f31c618373f2051a32e30002d8eacad7bbbd3885
# good: [9290c379d19774d8de6e2b895d756004dbad9ce5] powerpc/8xx: Simplify flush_tlb_kernel_range()
git bisect good 9290c379d19774d8de6e2b895d756004dbad9ce5
# bad: [d8d2af70b98109418bb16ff6638d7c1c4336f7fe] cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
git bisect bad d8d2af70b98109418bb16ff6638d7c1c4336f7fe
# bad: [b033767848c4115e486b1a51946de3bee2ac0fa6] powerpc/code-patching: Use jump_label for testing freed initmem
git bisect bad b033767848c4115e486b1a51946de3bee2ac0fa6
# good: [cb3ac45214c03852430979a43180371a44b74596] powerpc/code-patching: Don't call is_vmalloc_or_module_addr() without CONFIG_MODULES
git bisect good cb3ac45214c03852430979a43180371a44b74596
# first bad commit: [b033767848c4115e486b1a51946de3bee2ac0fa6] powerpc/code-patching: Use jump_label for testing freed initmem
