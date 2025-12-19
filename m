Return-Path: <linuxppc-dev+bounces-14893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D0CCEE9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:13:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXgK14ddWz2yFq;
	Fri, 19 Dec 2025 19:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766132005;
	cv=none; b=b+dosARp16iiQUVRuAbNeqFNl+fYqMSaINRKf3U7Ru+lM4mjX/dPYzBMxFdZKt0NpA/1V4T7dC5GzgI035h0Xg54jHK4CJosTGNT3x7nM1+mHT2O7l08MNJhLcXSG/hA3Ri0RG7nPE95PGr3bHqjMwXxHoDhMa6Lhd6Uwsi/R6NExpqVImgYoVCWGB/8Z6U8smdnOkhxzYGSsnwx+njXf3OBNS8+Uhps1O23QR7RzhO1I6MmqI0Lx1E6mNaIVYPhW7Os+tAkviGkgC+aoWu5sxWoia3uU7Y/Z0Lr82TqtnwcGLZwDLyGs6gZ4GtmQzOc/wio/crs0iG9P07kph45Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766132005; c=relaxed/relaxed;
	bh=tNgLZRN3p12XEm1zXEDJmEBXEOAtqg4c0hsEDM4bDDo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kZrEFcfyUzjqK03HWmA6IhSm5pkdlI+KBtZoToDPXkN84+J5rCVChHWHMI6AoWFw4WhKFj6kcM0HINQDTK0qraWYeJGtXOwWU4F4xJVzC/z6f1VKcOjA+IjIQ/2DXzzretLLBjnNZRgmtXUbmlgtNwcJWe6l1MtwAEN1wUlSL4bDNIdyB3lOPNUL1asB2hTFoALiVJJS1YgDZbqJoSVfbXi6EzX1ibBYaTF2MuF9IiMVw2+Wfj1Mar/oaUNdD402BuKVA2wKzDCU79kavktdOpOO8/0mu5qfx0xrfYjm3kJPT+bCwfZd/trSvknXMIAzjEjmqwDdA7+11BL77/TaqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KrQ01xcr; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KrQ01xcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXgK119CVz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 19:13:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C95044067;
	Fri, 19 Dec 2025 08:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B07DC116D0;
	Fri, 19 Dec 2025 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132003;
	bh=Nh4bNCxQArVNKStHwunAd0nAadgCxl/5Y0MhYvrhhA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KrQ01xcrbwQWKQ0F78yn78ahzA97qwvNR9Pw+Q526pBm5+X6gDYIO9CNYymLeRk0E
	 ZeoqNVNLts2A+jqw1Ovp2vk6AC67N40g4CisyTOpmgLZDRQvLQIQ2pVjoUpj09ivIa
	 ZcimKcA+6epLIHHxV3HeX1HwAtuKRCpw0OvtH/glgC0VDYtkFi4iWqIV4yBFZ218s9
	 mL4+6Zqvfgf0isksNC3MpFvm5K/GsLNwiogk1x5iopcqLeLmW5vG9EJo7nunl8dFd3
	 zerwTiyf2THJDZXOCHtaB1n9UonvrcWmWLjKN7yFolOruk8m3r1hGw9jual2pfz+eG
	 kw8fQM72Fuiuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B12380AA50;
	Fri, 19 Dec 2025 08:10:13 +0000 (UTC)
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
Subject: Re: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613181252.3684357.901874888075051255.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:12 +0000
References: <20251017085938.150569636@linutronix.de>
In-Reply-To: <20251017085938.150569636@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 torvalds@linux-foundation.org, x86@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
 hca@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org, mathieu.desnoyers@efficios.com,
 andrew.cooper3@citrix.com, Julia.Lawall@inria.fr, nicolas.palix@imag.fr,
 peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
 andrealmeid@igalia.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-fsdevel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Fri, 17 Oct 2025 12:08:54 +0200 (CEST) you wrote:
> This is a follow up on the V2 feedback:
> 
>    https://lore.kernel.org/20250916163004.674341701@linutronix.de
> 
> The main concern over the V2 implementation was the requirement to have
> the code within the macro itself.
> 
> [...]

Here is the summary with links:
  - [V3,01/12] ARM: uaccess: Implement missing __get_user_asm_dword()
    (no matching commit)
  - [V3,02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
    (no matching commit)
  - [V3,03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/0988ea18c624
  - [V3,06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
    (no matching commit)
  - [V3,07/12] uaccess: Provide scoped masked user access regions
    (no matching commit)
  - [V3,08/12] uaccess: Provide put/get_user_masked()
    (no matching commit)
  - [V3,09/12,RFC] coccinelle: misc: Add scoped_masked_$MODE_access() checker script
    (no matching commit)
  - [V3,10/12] futex: Convert to scoped masked user access
    (no matching commit)
  - [V3,11/12] x86/futex: Convert to scoped masked user access
    (no matching commit)
  - [V3,12/12] select: Convert to scoped masked user access
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



