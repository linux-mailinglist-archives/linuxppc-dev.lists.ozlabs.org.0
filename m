Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9EE44A42B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 02:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp9nd0Fxmz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 12:46:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ipfToaop;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ipfToaop; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp9mx4sXvz2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 12:46:08 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b11so4748409pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 17:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=x/kAZvJELqvaaxhMw+HYCsaEmYB0aK/LpXX3JqYDTIA=;
 b=ipfToaopP6G9E1tD6qx54iPQhJ+1LCTMyQzzB8n54AWTfEmabEf7r+4tf5WFCM04n2
 gzCPowu1wBJC3o+n1l1U5Xtl2hPQ5BvfpxxChiyqMcHD8jDDKbFzPpMJb8eqJX5FqKle
 +9UUqO6q6+IqSbQkQOzHIhATgNvIqt4Gdp0UhZ4qRQWJSTKIoUYlulAjVYHMv42RHtbl
 FGQbYiksxKQtf92JDAohO+5owXdIwwWckEQTKNsvTvJIa6drWB6sIHOg+w7k2M4028ij
 QTKW9tWWMG+xoMUvi+16WDLZ7OzjkwdXnHRnUxtDbDZlRu5mB9fe1aI4KvuzWq7JEw5I
 0s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=x/kAZvJELqvaaxhMw+HYCsaEmYB0aK/LpXX3JqYDTIA=;
 b=iSkclSrJJzM+GSljOkvRfvQYKOUeqRWMWsTxx04Z9TyHTqMJ4QTUIoL26i8aExxVWX
 f6tpL5sx/zdLQ3PWDvgCmcjASzUfEw89vcl784k1jTOFtSn0rEKCD4cMbhlxbEBqSqLF
 ZbVxxs0YkLh5645hXexS57v4fjCOD8HxgACcpvd8wJUO55n3e0oaqiZ2Qeczsem9FSq4
 znyTWO6a/gpwS1W1HiUR0JwfXNR/37KAIRCMoFKBgEldTq/J1AbsIjlRXBNHq6PdHOlf
 /Ag6NaHMmpvfGfqw+3I7RNCups7ewQ4xktwPhxCZxgYrKIRT+aRZSFlayhuAJbPj3G9v
 0FvQ==
X-Gm-Message-State: AOAM533oaAAYD2dB76i/MsDufzGcddjh4xqmN5ZW3K5YLfiE6EGw8YMu
 ghJJN5Nqjunupk4MaKqJjyA=
X-Google-Smtp-Source: ABdhPJztiPTG/XtrqPxiglu9jilDqHAo62mTt1xfDtQQwuhp5KynsOzxd0BeRBh3xUDUTC8SZnRrEQ==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr3066792pjg.202.1636422366684; 
 Mon, 08 Nov 2021 17:46:06 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id h10sm18023009pfc.104.2021.11.08.17.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 17:46:06 -0800 (PST)
Date: Tue, 09 Nov 2021 11:46:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries/cpuhp: Use alloc_cpumask_var() in
 pseries_cpu_hotplug_init()
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, =?iso-8859-1?q?Daniel=0A?= Henrique Barboza
 <danielhb413@gmail.com>, Waiman Long <longman@redhat.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, Paul Mackerras
 <paulus@samba.org>
References: <20211108164751.65565-1-longman@redhat.com>
 <87y25ym96i.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y25ym96i.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1636421918.tc1hk6vx8h.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?iso-8859-1?q?Zhang=0A?= Xiaoxu <zhangxiaoxu5@huawei.com>,
 =?iso-8859-1?q?Laurent=0A?= Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of November 9, 2021 11:04 am:
> Waiman Long <longman@redhat.com> writes:
>> It was found that the following warning message could be printed out whe=
n
>> booting the kernel on PowerPC systems that support LPAR:
>>
>> [    0.129584] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1451 memblock_all=
oc_internal+0x5c/0x104
>> [    0.129593] Modules linked in:
>> [    0.129598] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-11.el9.p=
pc64le+debug #1
>> [    0.129605] NIP:  c000000002040134 LR: c00000000204011c CTR: c0000000=
020241a8
>> [    0.129610] REGS: c000000005637760 TRAP: 0700   Not tainted  (5.14.0-=
11.el9.ppc64le+debug)
>> [    0.129616] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 48=
000222  XER: 00000002
>> [    0.129635] CFAR: c0000000004d1cf4 IRQMASK: 0
>> [    0.129635] GPR00: c00000000204011c c000000005637a00 c000000002c94d00=
 0000000000000001
>> [    0.129635] GPR04: 0000000000000080 0000000000000000 0000000000000000=
 ffffffffffffffff
>> [    0.129635] GPR08: 0000000000000000 0000000000000003 c00000000205ac64=
 0000000000080000
>> [    0.129635] GPR12: 0000000000000000 c0000000049d0000 c000000000013078=
 0000000000000000
>> [    0.129635] GPR16: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
>> [    0.129635] GPR20: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
>> [    0.129635] GPR24: c000000002003808 c00000000146f7b8 0000000000000000=
 0000000000000100
>> [    0.129635] GPR28: c000000002d7cf80 0000000000000000 0000000000000008=
 0000000000000000
>> [    0.129710] NIP [c000000002040134] memblock_alloc_internal+0x5c/0x104
>> [    0.129717] LR [c00000000204011c] memblock_alloc_internal+0x44/0x104
>> [    0.129723] Call Trace:
>> [    0.129726] [c000000005637a00] [c000000005637a40] 0xc000000005637a40 =
(unreliable)
>> [    0.129735] [c000000005637a60] [c0000000020404d8] memblock_alloc_try_=
nid+0x94/0xcc
>> [    0.129743] [c000000005637af0] [c00000000205ac64] alloc_bootmem_cpuma=
sk_var+0x4c/0x9c
>> [    0.129751] [c000000005637b60] [c0000000020242e0] __machine_initcall_=
pseries_pseries_cpu_hotplug_init+0x138/0x1d8
>> [    0.129760] [c000000005637bf0] [c000000000012404] do_one_initcall+0xa=
4/0x4f0
>> [    0.129768] [c000000005637cd0] [c000000002005358] do_initcalls+0x140/=
0x18c
>> [    0.129776] [c000000005637d80] [c0000000020055b8] kernel_init_freeabl=
e+0x178/0x1d0
>> [    0.129783] [c000000005637db0] [c0000000000130a0] kernel_init+0x30/0x=
190
>> [    0.129790] [c000000005637e10] [c00000000000cef4] ret_from_kernel_thr=
ead+0x5c/0x64
>>
>> The warning is printed in memblock_alloc_internal() because the slab
>> has been initialized when the initcalls are being processed. To
>> avoid the warning, change alloc_bootmem_cpumask_var() call in
>> pseries_cpu_hotplug_init() to alloc_cpumask_var() instead. Also
>> change cpumask_or() to cpumask_copy() or we will have to use
>> zalloc_cpumask_var().
>>
>> Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused=
 on another node")
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
>=20
> This looks similar to the patch Nick sent recently:
>=20
>   https://lore.kernel.org/linuxppc-dev/20211105132923.1582514-1-npiggin@g=
mail.com/

Ah, you get CONFIG_CPUMASK_OFFSTACK=3Dy if CONFIG_DEBUG_PER_CPU_MAPS=3Dy.
I was wondering how Waiman found it.

Differences between the two patches are error checking - no big deal but=20
we should just do it. And GFP_NOWAIT - is this required here?

Thanks,
Nick
