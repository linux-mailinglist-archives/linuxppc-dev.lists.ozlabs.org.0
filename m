Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E58833652
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 22:13:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IkVsrhLG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THTk65wb9z3cb8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 08:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IkVsrhLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THTdj6Ncfz30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 08:10:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 68D25B8093B;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16022C43399;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=Ak11chN7WclRj25UANXp4k7/EzZxe8YnZ7/DdCdJ/Eo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IkVsrhLG/8fIWEIS1jEMWek7Zvt5oHhH4iIiHcFrYKDuct84cFWNZbyPVw7aE5USn
	 EdxvcG4HNDlt83k333dnvaOcO2tidVEdbhq0CJFxJ93Prs3gEH/p58Qy+GRyl8MbIG
	 meRvcghCnLWoHc45/tNBHxbTKecNuou/KLSqasbtSvlo31zpH/vwXMEceiLwTJ5m7a
	 YjChVCAqCod2OXw7UwGW23JceU1AUwebt/FMs3NKZ8hUGwmQQ5/Zq5DoX5UetCZ7iJ
	 PdCbAB2zls/W0Ay7Xq8My+r1A2H2Yz4w3lrzw3EiKKtObnuVW7ravh/Ls8/tlKFzw/
	 65jpJECS34fYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0468BD8C96C;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/7] kexec_file: print out debugging message if required
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170578499901.24348.12653685452300606867.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20231213055747.61826-1-bhe@redhat.com>
In-Reply-To: <20231213055747.61826-1-bhe@redhat.com>
To: Baoquan He <bhe@redhat.com>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, conor@kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 13 Dec 2023 13:57:40 +0800 you wrote:
> Currently, specifying '-d' on kexec command will print a lot of debugging
> informationabout kexec/kdump loading with kexec_load interface.
> 
> However, kexec_file_load prints nothing even though '-d' is specified.
> It's very inconvenient to debug or analyze the kexec/kdump loading when
> something wrong happened with kexec/kdump itself or develper want to
> check the kexec/kdump loading.
> 
> [...]

Here is the summary with links:
  - [v4,1/7] kexec_file: add kexec_file flag to control debug printing
    (no matching commit)
  - [v4,2/7] kexec_file: print out debugging message if required
    (no matching commit)
  - [v4,3/7] kexec_file, x86: print out debugging message if required
    (no matching commit)
  - [v4,4/7] kexec_file, arm64: print out debugging message if required
    (no matching commit)
  - [v4,5/7] kexec_file, ricv: print out debugging message if required
    https://git.kernel.org/riscv/c/eb7622d908a0
  - [v4,6/7] kexec_file, power: print out debugging message if required
    (no matching commit)
  - [v4,7/7] kexec_file, parisc: print out debugging message if required
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


