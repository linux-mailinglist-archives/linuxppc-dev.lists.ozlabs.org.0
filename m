Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6735B611
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:24:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJHHv3y0Gz3bp8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 02:24:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJHHb1FChz2xyG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 02:23:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJHHM2Bm5zB09Zv;
 Sun, 11 Apr 2021 18:23:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id M7H_TZ3xfLZz; Sun, 11 Apr 2021 18:23:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJHHM11MkzB09Zt;
 Sun, 11 Apr 2021 18:23:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A74A38B770;
 Sun, 11 Apr 2021 18:23:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z7Gre_ROyeC9; Sun, 11 Apr 2021 18:23:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3131E8B75B;
 Sun, 11 Apr 2021 18:23:46 +0200 (CEST)
Subject: Re: sysctl: setting key "net.core.bpf_jit_enable": Invalid argument
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>
References: <412d88b2-fa9a-149e-6f6e-3cfbce9edef0@molgen.mpg.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d880c38c-e410-0b69-0897-9cbf4b759045@csgroup.eu>
Date: Sun, 11 Apr 2021 18:23:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <412d88b2-fa9a-149e-6f6e-3cfbce9edef0@molgen.mpg.de>
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
Cc: it+linux-bpf@molgen.mpg.de, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/04/2021 à 13:09, Paul Menzel a écrit :
> Dear Linux folks,
> 
> 
> Related to * [CVE-2021-29154] Linux kernel incorrect computation of branch displacements in BPF JIT 
> compiler can be abused to execute arbitrary code in Kernel mode* [1], on the POWER8 system IBM 
> S822LC with self-built Linux 5.12.0-rc5+, I am unable to disable `bpf_jit_enable`.
> 
>     $ /sbin/sysctl net.core.bpf_jit_enable
>     net.core.bpf_jit_enable = 1
>     $ sudo /sbin/sysctl -w net.core.bpf_jit_enable=0
>     sysctl: setting key "net.core.bpf_jit_enable": Invalid argument
> 
> It works on an x86 with Debian sid/unstable and Linux 5.10.26-1.

Maybe you have selected CONFIG_BPF_JIT_ALWAYS_ON in your self-built kernel ?

config BPF_JIT_ALWAYS_ON
	bool "Permanently enable BPF JIT and remove BPF interpreter"
	depends on BPF_SYSCALL && HAVE_EBPF_JIT && BPF_JIT
	help
	  Enables BPF JIT and removes BPF interpreter to avoid
	  speculative execution of BPF instructions by the interpreter


Christophe
