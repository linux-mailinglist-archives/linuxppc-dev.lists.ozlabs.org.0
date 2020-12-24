Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DE2E28FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 23:17:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D24Dw0MKbzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 09:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ttp4Jh88; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D24C072V3zDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 09:15:24 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3486622AAC;
 Thu, 24 Dec 2020 22:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608848121;
 bh=VsEEnkmtCYk88sgAcg3H79H4WZsqdw9ZodwVGVqpg78=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Ttp4Jh88H5+tODU8FD1qjhUAzurI/BBRefRfySfHmlM/DjPlb6euOefRJR2bklqmE
 8YyAYa/NK0uTWiunbxgm0XuelzUL5hnjta/e1ypM31siFzwmvLJnIOfqEnmqz4FKLf
 +BYfH39SjTl0kjsEUTbTZGh9t1lHrEJUvJZsG9YsylLG6YpAWaYTGcfxnKdfA6Ce7U
 Mtcq0e/xeyFRlxYLb7JnBr30AD7tGbea/V9XJ1pUXPleFqXGbxlMgtug/TwzMwOoPi
 vvM0Wl6TLwYwU/my9WCg3mm9ivQ8EVScfdadmV17pgYWuPDqsbsq2DBz6w95SJcbxO
 liPTEcQbH73RA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2F30560159;
 Thu, 24 Dec 2020 22:15:21 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ft3w6kc9.fsf@mpe.ellerman.id.au>
References: <87ft3w6kc9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ft3w6kc9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-2
X-PR-Tracked-Commit-Id: d5c243989fb0cb03c74d7340daca3b819f706ee7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b3f7f1b841e91f0f0414525fa6edaaa2df33ccb
Message-Id: <160884812118.9963.8876461526933137364.pr-tracker-bot@kernel.org>
Date: Thu, 24 Dec 2020 22:15:21 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, clg@kaod.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 24 Dec 2020 12:53:10 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b3f7f1b841e91f0f0414525fa6edaaa2df33ccb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
