Return-Path: <linuxppc-dev+bounces-14891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AEECCEE8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXgJp6qcWz2yFY;
	Fri, 19 Dec 2025 19:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766131994;
	cv=none; b=GTVK91n/ArOtC3+WDVcm3/txT9j16eB4w+o5FAj08HrWtB9XqUBSQZKozDmH6p9gnqwi7Dbm/JjxOevrDh8Jm78mW8j/Hi4FkBH+dvDMrIeOuKT+rAP5esZnSOssJt8Ow4Ca+o/2Zx5mMevTsduNft/cnG+jdZ/UAxSYyFbIwcA8JrWO0kr6LHSwOEyqwEzkRdm0/54scJIqxECH2FJaFD4morokjMvEJuSfPtd1CElnWlOwLsViNBYcHbMkQQQbkJDAT1nok+SfvC/H6CUYvm3XlSQjPnhVmDhP7yzE/g3PislN/pgmbWb73ipm/uwm4VovIWg4Fx6R8He/RB6ioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766131994; c=relaxed/relaxed;
	bh=OvpuZ8PIxat/8+yvXFluaI02bnxexB1erWkSZhJRxVk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K+whUtWRTz1hgoXT1Nz/+kprn74bPfGacPUPGl/PgEV5sE6pb8Rynr8IbMUeNMBDyE5CRpbB7QrEpZ8t0WHYOUUfT0Iz7qKoBvqpal9u8mEGFcpH+gl6b7+v4EiEMZjhLxovBuGseqbvOwd1qRyumgMFtek6Y2dWilm/AixcSKoCDQKYarBxJU2VD+IHAZZa9gUglT0ZJRpPfbU4OtoeA7De0uJey27+JVBq6ybZvh0olAyZJz6rAomYR0eBahZKsrdgqskvyhl05Fewx6PZW5wfdfUiXmvjGtMuIsfAkafoy96cDVePAxwRQwJ25uxSfU3kD/L69r1ueBUnku92sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaLW4S1t; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaLW4S1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXgJp10XGz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 19:13:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7A70441F0;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830A6C4CEF1;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131991;
	bh=VHoS82AXfCFO1ejAKfSVVHRYub84nw1PWg6S5l2Exag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IaLW4S1tN6Y5d0CEwtYrP7pEFFatg4+zyVk42le/G1ucAiucsqwdqRrXSmIZwetfz
	 2zs60fMbWBsq8viNHscFfmAKLsGTsX8ViZtlMfKG9WYxS113c6NsRFI8XmO0QqXa/c
	 G0kwrN1ENE+XMTcx1FH3lNlIq0qG47mawO0dWLcFaANMO7XG7pRpYaBN+N0AlY0L56
	 ULFhlpqrcbAvM1rLyzbhF9iEwedS5paG2uV9+u0arVl40hVQMgM6e0mGyCZneg8EU8
	 smrcfl6UIkPgQ9go9rjfopU/D3bUCirJ/35nYbjYY0piCkggs9AMgBsGaHp6htqpnM
	 PkespiJB9S78Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C24380AA50;
	Fri, 19 Dec 2025 08:10:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613180027.3684357.16322390150390680475.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:00 +0000
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org,
 nicolas.schier@linux.dev, nsc@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, tsbogend@alpha.franken.de, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, davem@davemloft.net, andreas@gaisler.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Nicolas Schier <nsc@kernel.org>:

On Tue, 14 Oct 2025 15:05:15 +0200 you wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
    https://git.kernel.org/riscv/c/d81d9d389b9b
  - [v2,02/10] init: deduplicate cc-can-link.sh invocations
    https://git.kernel.org/riscv/c/80623f2c83d7
  - [v2,03/10] kbuild: allow architectures to override CC_CAN_LINK
    (no matching commit)
  - [v2,04/10] riscv: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,05/10] s390: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,06/10] powerpc: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,07/10] MIPS: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,08/10] x86/Kconfig: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,09/10] sparc: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,10/10] kbuild: simplify CC_CAN_LINK
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



