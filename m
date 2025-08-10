Return-Path: <linuxppc-dev+bounces-10788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96EB1FC24
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 23:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0VpX2PNjz3cbC;
	Mon, 11 Aug 2025 07:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754860356;
	cv=none; b=gIityuZgVe5QGMIrju3VV7ufmrk7lslYl2SNuHK8T49XbW9byfiNjvvnuIMrOd4qfmKI0rovzhYsUoWgAGhj0VQfNrAE+o23mUfaS6YFN82i4E5KCJ2cWHSmqCMaifyDSkFbWdaIxd2PlCswYATWbgxC/wW+8jxi74WqBS9eV/Ou7K/b0jgWNHe4rB+oOfpgi28qvzpZ4iZwAtRPSIWng7G0tbl9RTNPOQCzno70GlrpfNhkiOlJPze0P3PskNxytbDcHTuOQZfuuL09FgjSSLy+kMqJ2vMIUecu4wfm3NRB7Sr4mzDgjQvU8KPVQ574DWBtC1JWXtizjEU9Xbk4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754860356; c=relaxed/relaxed;
	bh=wwun8C53OEKLGsw85SfB6sZsEhws/7mYqqzX9Lv5cF8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QlJZUNiwqwVtn1Ph9LCv8JyB3+uLuzU5iMlY335OfNyTyQFyLdOaGBZKxOhGAdXW03/S7WC2kamCvJli7wVrKPzz6Hi8rZ1vc2HQVi4TaL95SGiLwyGtNbHCWLgE3vZgoOqmgO4+Hv5ArZcGVDdZPxo3qeXu/rMhojCPPQn2X26qPoCEv5AQkjuEWU6ZwSDj7GJr30yomTMIfFNvylAn9MCfp+iuc9e/mNPP6heiW6rWj4zabHDZKbFoO9fyER2+yDop/C4tK05oZ0nCwPQqJU1S6IrOamK3HgPOu5OYhjIJZX5CMBNZmzDH9QpMGq5WvcSpk9UG6JbuuGEaWy1DGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PRWX9qby; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PRWX9qby;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0VpW2TXZz3cZ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 07:12:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3E0DA568E7;
	Sun, 10 Aug 2025 21:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B60AC4CEEB;
	Sun, 10 Aug 2025 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860351;
	bh=+EPDIqigYF0dLwDVKm4n7P07Soa8UCdwgsSbIhQglhg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PRWX9qbyv9u6FbnKrFjePyfsaZ737MOhr4mO7TsZ7R+GzU8zlYvZAYf8JD/OXtEUT
	 hA9ZGe4MgMB70B1Zw0njMIw4A2/fhOmu8/xlsiHxmIUZJvNyZW6a8uiunB9JTjc62k
	 WQvCcnsGvL3edUrU5mU3msfwtOhFXOborJRekZFipn3fdTQKLp1K+FdaZrtWvHMoCG
	 BjGMfqHcgkkIzLtrpEo6cyj4t26pG93hr2845rzETZe270MpglUmq+wxcG1OLi+DB/
	 81Kg/BR1SiRTfzYt5r1OrTvGUw8lrqFdyiU9Eqy8LtRG2Wu0knKnUQq5VbApAR7XFV
	 wpBAVMLGZQIKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB739D0C2B;
	Sun, 10 Aug 2025 21:12:45 +0000 (UTC)
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
Subject: Re: [PATCH 00/23] binfmt_elf,arch/*: Use elf.h for coredump note
 names
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175486036374.1221929.319441619761028585.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:43 +0000
References: <20250701135616.29630-1-Dave.Martin@arm.com>
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, hpa@zytor.com, James.Bottomley@HansenPartnership.com,
 akihiko.odaki@daynix.com, aou@eecs.berkeley.edu, agordeev@linux.ibm.com,
 alex@ghiti.fr, andreas@gaisler.com, anton.ivanov@cambridgegreys.com,
 bp@alien8.de, bcain@kernel.org, catalin.marinas@arm.com, chris@zankel.net,
 borntraeger@linux.ibm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org,
 mingo@redhat.com, johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 jonas@southpole.se, kees@kernel.org, maddy@linux.ibm.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, npiggin@gmail.com, oleg@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, dalias@libc.org, richard@nod.at,
 linux@armlinux.org.uk, shorne@gmail.com, stefan.kristiansson@saunalahti.fi,
 svens@linux.ibm.com, tsbogend@alpha.franken.de, tglx@linutronix.de,
 gor@linux.ibm.com, vgupta@kernel.org, kernel@xen0n.name, will@kernel.org,
 ysato@users.sourceforge.jp, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Kees Cook <kees@kernel.org>:

On Tue,  1 Jul 2025 14:55:53 +0100 you wrote:
> This series aims to clean up an aspect of coredump generation:
> 
> ELF coredumps contain a set of notes describing the state of machine
> registers and other information about the dumped process.
> 
> Notes are identified by a numeric identifier n_type and a "name"
> string, although this terminology is somewhat misleading.  Officially,
> the "name" of a note is really an "originator" or namespace identifier
> that indicates how to interpret n_type [1], although in practice it is
> often used more loosely.
> 
> [...]

Here is the summary with links:
  - [16/23] riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
    https://git.kernel.org/riscv/c/c9502cc7bef5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



