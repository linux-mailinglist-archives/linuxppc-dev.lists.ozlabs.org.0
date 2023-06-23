Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81C73AE2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 03:04:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bhJvOndx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnJt20HWBz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 11:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bhJvOndx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnJs517n8z30QD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 11:03:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9EF86193C;
	Fri, 23 Jun 2023 01:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F0D6C433C0;
	Fri, 23 Jun 2023 01:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687482214;
	bh=S/jEbHfSkgLqfoC13Bm0yPnjBDCSVlADJchgSprepFc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bhJvOndxSGDVm+u60L0opPd6dvANbnPzebZU9YOomZS2fV+cmt+Bz9jLSHEhKvdjP
	 oD471UgOnQpKcbOXloFUDa+6I8uy/envQ5TVX/srP8geH7YhpwOlkD1vTFN0Ltx1PY
	 ddodssgI2VWY7Q/HdPEcq6/AZoDxeN3q9VIUJ+ppd+WfkR99hIRrzUA4QR631Xe3EG
	 0Hyx+dtREVWCe+cudWfstGHKbNVPdpHu28zwzoxN9mvUREknlETudD/VdhKiRIEJbu
	 CZyoNrpK1uXA8jlHkzlAi0n5Tt2e4zcHGl4dftstfES3SV+m1LHo2IU5J+wLa36izM
	 DZXHuMsI2B+gQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B390C691EE;
	Fri, 23 Jun 2023 01:03:34 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wmzvogge.fsf@mail.lhotse>
References: <87wmzvogge.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wmzvogge.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-5
X-PR-Tracked-Commit-Id: dfaed3e1fa7099de8de4e89cbe7eb9c1bca27dfe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7758c0ddbc48fec149baea667d2abc85229a997
Message-Id: <168748221430.12146.11415465909512288644.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jun 2023 01:03:34 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 22 Jun 2023 21:59:45 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7758c0ddbc48fec149baea667d2abc85229a997

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
