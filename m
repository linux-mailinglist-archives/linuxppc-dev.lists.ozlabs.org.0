Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702EA41C3BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 13:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKF4K2MKxz3btR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 21:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKF3t6nL5z2yM4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 21:47:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HKF3q6xzqz9sYm;
 Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFio4QSneCpM; Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HKF3q671Qz9sYh;
 Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B42748B770;
 Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 91HDvsyxwicu; Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 837A48B763;
 Wed, 29 Sep 2021 13:47:35 +0200 (CEST)
Subject: Re: [PATCH v4 5/8] bpf ppc64: Add BPF_PROBE_MEM support for JIT
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
 <20210929111855.50254-6-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9628c18d-001e-9777-e800-486a83844ac1@csgroup.eu>
Date: Wed, 29 Sep 2021 13:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929111855.50254-6-hbathini@linux.ibm.com>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, songliubraving@fb.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, andrii@kernel.org,
 kpsingh@kernel.org, paulus@samba.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/09/2021 à 13:18, Hari Bathini a écrit :
> From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> 
> BPF load instruction with BPF_PROBE_MEM mode can cause a fault
> inside kernel. Append exception table for such instructions
> within BPF program.
> 
> Unlike other archs which uses extable 'fixup' field to pass dest_reg
> and nip, BPF exception table on PowerPC follows the generic PowerPC


For my curiosity, can you explain why we don't want and can't do the 
same on powerpc as on other archs ?


> exception table design, where it populates both fixup and extable
> sections within BPF program. fixup section contains two instructions,
> first instruction clears dest_reg and 2nd jumps to next instruction
> in the BPF code. extable 'insn' field contains relative offset of
> the instruction and 'fixup' field contains relative offset of the
> fixup entry. Example layout of BPF program with extable present:
> 
>               +------------------+
>               |                  |
>               |                  |
>     0x4020 -->| ld   r27,4(r3)   |
>               |                  |
>               |                  |
>     0x40ac -->| lwz  r3,0(r4)    |
>               |                  |
>               |                  |
>               |------------------|
>     0x4280 -->| li  r27,0        |  \ fixup entry
>               | b   0x4024       |  /
>     0x4288 -->| li  r3,0         |
>               | b   0x40b0       |
>               |------------------|
>     0x4290 -->| insn=0xfffffd90  |  \ extable entry
>               | fixup=0xffffffec |  /
>     0x4298 -->| insn=0xfffffe14  |
>               | fixup=0xffffffec |
>               +------------------+
> 
>     (Addresses shown here are chosen random, not real)
> 
