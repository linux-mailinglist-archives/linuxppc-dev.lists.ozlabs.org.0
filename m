Return-Path: <linuxppc-dev+bounces-14854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E6CC915D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgzv6xbkz30Vq;
	Thu, 18 Dec 2025 04:40:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765993211;
	cv=none; b=EgWST/t4fTXBzJRqltFG5YzOpWmy0SJriSmYvWLL/GdYYfHC1Cu1j7PKgQn2JRWb6X6znTKW0H4B/SDRT028iRBY+B1zoI0P9oCmCji/vOH0SzvrGLglsKjExOEysN9shqiBRSJIGAlUSXzUW+K9GAuFKNiWwacso9cncC/W4DeNyX9MREy8+4N2f2WPDJRn3mEsJRl4OmyjEULgLyC0VvDIGPT29F1kA4+7zsnIOWqa5uymQF+fFihPMEZhlO/6JrDaUdA2rZMlOr5kriVWUKGpcAEsgLsVrQQK+rkq/VewwHZtuMuk9qYvHGokhtQi5BynSxM5F/EcXs47OMD3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765993211; c=relaxed/relaxed;
	bh=4yhvszXwgSYXxZddNKGLUE9jmt0WZWEUD7/gDeFq9hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmWN7RfNyU0Mavv2XIsPqO2xqNdf9OWMWD2XPJ/AccYiXcF868wa8RB3n1WmZZcECpz4DazrvxCYQ4jo6jmTHJj0lxVUrsez2eCI9pJ4HdC7Sf6OYs9ACP8u8G79nEKAhrnstCnKCUUU2HvlqcpNbSsZklrONmIO3FOUcx2H+esgOumQX+GnR6TtnSRtsoZh0avzAW0lww2EMu/WQ7l2I4iUn9G5XssLa/qFlLtqe0CpEigPtfcpteXm4CRvAZsuK2osBMVbEwE62udXJSNw1NRIjTrANji4O/zqFXcmZx3rKPsXqDwFS7/dayQbuU12cusEA8nCiTOhiRT/ZOBHsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fUOVH443; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fUOVH443;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgzt021bz30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:40:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3027A40D83;
	Wed, 17 Dec 2025 17:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6F6C4CEF5;
	Wed, 17 Dec 2025 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765993178;
	bh=CuLVx8Lnr4M45WzghD6+KOQBzv92E5mdpsGjCRcE9cs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fUOVH443DHmorIyTRjMBJ3vsomxj5Anlhrrgd0+/9kkjCN77bQLItXLxHJthFzLpl
	 Ayngq+jaZa6GiS3A19qlz4jcf607JOcqllcD/rTXTlHxY1AyoRr7awyq+/R2DEJ2Js
	 +sKNZ0TPr4jE9diGnnWXzU503t3bOzIsf5Kg4PT+gZLdfzSwU3qhXvsuaCpxNl/q6G
	 TeO6cdB6h8VGRBpYByx2QhsXFx/3WayAoj8Z6LHLDkgiCQzIl5bmLW9/cWlKumTot+
	 UvldrPVtEFflAAWWiBb8gXNZ7teZGGhIzYjA8CletkB6kIdr/2Ir6b4mli50vkTCnA
	 uqSweN4F0iORA==
Message-ID: <42a219c7-917f-43d1-b5d3-4a721d6aec24@kernel.org>
Date: Wed, 17 Dec 2025 18:39:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/32: Restore clearing of MSR[RI] at
 interrupt/syscall exit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
 <6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 17/12/2025 à 17:03, Guenter Roeck a écrit :
> Hi,
> 
> On Thu, Sep 11, 2025 at 02:30:12PM +0200, Christophe Leroy wrote:
>> Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
>> up return from interrupt") removed the inconditional clearing of
>> MSR[RI] when returning from interrupt into kernel. But powerpc/32
>> doesn't implement interrupt restart table hence still need MSR[RI]
>> to be cleared.
>>
>> It could be added back in interrupt_exit_kernel_prepare() but it is
>> easier and better to add it back in entry_32.S for following reasons:
>> - Writing to MSR must be followed by a synchronising instruction
>> - The smaller the non recoverable section is the better it is
>>
>> So add a macro called clr_ri and use it in the three places that play
>> up with SRR0/SRR1. Use it just before another mtspr for synchronisation
>> to avoid having to add an isync.
>>
>> Now that's done in entry_32.S, exit_must_hard_disable() can return
>> false for non book3s/64, taking into account that BOOKE doesn't have
>> MSR_RI.
>>
>> Also add back blacklisting syscall_exit_finish for kprobe. This was
>> initially added by commit 7cdf44013885 ("powerpc/entry32: Blacklist
>> syscall exit points for kprobe.") then lost with
>> commit 6f76a01173cc ("powerpc/syscall: implement system call
>> entry/exit logic in C for PPC32").
>>
>> Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
>> Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> This patch causes several of my ppc64:ppce500 boot tests with e5500 CPU
> to stall.
> 
> I have not found a common denominator (the proboem seems independent
> of boot media and network interface) , but the problem is repeatable.
> Roughtly 50-70% of boot attempts stall.

I know the issue, was reported by Erhard.

I have a fix under test, will likely send it tomorrow or on friday.

Thanks
Christophe

> 
> Reverting this patch fixes the problem.
> 
> Bisect log is attached for reference.
> 
> Thanks,
> Guenter
> 
> ---
> # bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
> # good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
> git bisect start 'HEAD' 'v6.18'
> # good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fkernel&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C1c5d3eacabe74f8fcd5f08de3d92c779%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639015897805615312%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=nEi%2F%2ByYYAhR5G2p23tHcDMlfi11SyRFs%2BOXU5PPCWIQ%3D&reserved=0
> git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
> # bad: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad 09cab48db950b6fb8c114314a20c0fd5a80cf990
> # good: [6044a1ee9dca906a807ba786421dc4254191ffd5] Merge tag 'devicetree-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> git bisect good 6044a1ee9dca906a807ba786421dc4254191ffd5
> # good: [ac20755937e037e586b1ca18a6717d31b1cbce93] Merge tag 'sysctl-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl
> git bisect good ac20755937e037e586b1ca18a6717d31b1cbce93
> # good: [4b9d25b4d38035b7b2624afd6852dfe4684f0226] Merge tag 'vfs-6.19-rc1.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
> git bisect good 4b9d25b4d38035b7b2624afd6852dfe4684f0226
> # good: [63a9b0bc65d5d3ea96a57e7985ea22a8582fbbe5] Merge tag 'kvm-riscv-6.19-1' of https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fkvm-riscv%2Flinux&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C1c5d3eacabe74f8fcd5f08de3d92c779%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639015897805638856%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cMLT0je4tG%2FOlzSrrv5Qtrg9UG0CEq%2BuTtJ9Mqjyi0c%3D&reserved=0 into HEAD
> git bisect good 63a9b0bc65d5d3ea96a57e7985ea22a8582fbbe5
> # good: [e0c26d47def7382d7dbd9cad58bc653aed75737a] Merge tag 'kvm-s390-next-6.19-1' of https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fkvms390%2Flinux&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C1c5d3eacabe74f8fcd5f08de3d92c779%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639015897805654700%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2FG7w4h3HaMV%2FZ%2Bk3sLINdVjnrdS4bjkNX8ORcpl7Fkk%3D&reserved=0 into HEAD
> git bisect good e0c26d47def7382d7dbd9cad58bc653aed75737a
> # bad: [07025b51c1149951d64804c73014499bb3564dca] Merge tag 'riscv-for-linus-6.19-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> git bisect bad 07025b51c1149951d64804c73014499bb3564dca
> # bad: [b296fda58d1d095c95c8207b09856b2ceafa1397] powerpc/64s/hash: Update directMap page counters for Hash
> git bisect bad b296fda58d1d095c95c8207b09856b2ceafa1397
> # bad: [39fe29e7f2fd38b0fee9bf987d180dee976dd2c7] powerpc: 86xx: Rename wdt@ nodes to watchdog@
> git bisect bad 39fe29e7f2fd38b0fee9bf987d180dee976dd2c7
> # bad: [10e1c77c3636d815db802ceef588522c2d2d947c] powerpc/32: Fix unpaired stwcx. on interrupt exit
> git bisect bad 10e1c77c3636d815db802ceef588522c2d2d947c
> # good: [7afe2383eff05f76f4ce2cfda658b7889c89f101] powerpc/kdump: Fix size calculation for hot-removed memory ranges
> git bisect good 7afe2383eff05f76f4ce2cfda658b7889c89f101
> # bad: [2997876c4a1a5864baa13d7393c2b68cf5b51183] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
> git bisect bad 2997876c4a1a5864baa13d7393c2b68cf5b51183
> # good: [98fa236044ca4f8841107382fb03832101fa7328] powerpc/8xx: Remove specific code from fast_exception_return
> git bisect good 98fa236044ca4f8841107382fb03832101fa7328
> # first bad commit: [2997876c4a1a5864baa13d7393c2b68cf5b51183] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
> 


