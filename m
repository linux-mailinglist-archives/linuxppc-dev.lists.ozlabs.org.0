Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60F888D37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 05:43:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCEzRCyz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V30g84Mzhz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCEzRCyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V30fQ1KbKz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 15:42:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C146D60DF5;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7D52C43141;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=4yStfrK4SQVUbj2aqcQE+48u8AfaMFrS4+tHEELssTw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZCEzRCyze7tj2dRAQEKT/yrQWS3Pqn4bPaxgQKZdu9YbhUtZLJD0OydpAcdL20PC4
	 7iWeNBDav2s+KtOjaj7l27OB0sCln5/g9V5SXAhjhM7EBkT+L/FFYX1S4pcK4XwWRQ
	 pBtQ6pxqVCSVdLLo8XRAXV45QE85EquJCd+GGNsSq4aDXrJ8fipEZWgCqfrqGbzsa5
	 oRYEe7vAr9h4RbHDCPMVAVMXcT3uCr2OT6NCXc2+AgDiyEYVn3ZkL0eQXFcRH4bldD
	 F4bUwh+2thCfZ6iLVZBp6HqT2GbT5c7VdFpeMjQyP5Lvmvg7/udPNRbiMi7Bn4c6f4
	 XPWJGMvrygDww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A971DD2D0ED;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <171134175469.18749.11610415936860732367.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240123064305.2829244-1-surenb@google.com>
In-Reply-To: <20240123064305.2829244-1-surenb@google.com>
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: linux-s390@vger.kernel.org, agordeev@linux.ibm.com, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, willy@infradead.org, linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, palmer@dabbelt.com, luto@kernel.org, linux-riscv@lists.infradead.org, gerald.schaefer@linux.ibm.com, will@kernel.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 22 Jan 2024 22:43:05 -0800 you wrote:
> The change [1] missed ARM architecture when fixing major fault accounting
> for page fault retry under per-VMA lock. Add missing code to fix ARM
> architecture fault accounting.
> 
> [1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")
> 
> Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")
> 
> [...]

Here is the summary with links:
  - [1/1] arch/arm/mm: fix major fault accounting when retrying under per-VMA lock
    https://git.kernel.org/riscv/c/e870920bbe68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


