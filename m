Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA02F9522
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 21:32:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJmnK0XNHzDrRC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 07:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PfM2ylZI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJmld48NlzDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 07:31:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2FD2D21D7F;
 Sun, 17 Jan 2021 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610915466;
 bh=wRda/Od136zEOR5r+9Z/a9Z3oldgv76IApzPnuBzupo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PfM2ylZIGRLjAH9vEzQ0usMGD0Bh6Tld7a39BqITE5XAMkl9/rW/aE7/Glqn76Fhv
 biU/QamZbVuDz0kszZuYs61Zt4tjqvkkzA/5xJoMJDJhiDomFHJB0LhNCrkFThOYTH
 8qf2oGNCCYh7NhLYMd+4ByYgPti/c+7Fqrh4AzmJZRhYnVE8KxMo4L333GbmMYbPhl
 cxUSf8XkN9SUx7e07AMu7a06M5klWozWKERR1Q0iHgHMjDlje9x8bNGfk1Nc5hC6V5
 yEMF2GcsXkjTX93guHfS0faplqyo9jE4ZLZn8dVEnL/v55sSmm8jVbIxqWvI7BiESE
 5nKBI+CerbSvA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1D523600DA;
 Sun, 17 Jan 2021 20:31:06 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o8hnn9of.fsf@mpe.ellerman.id.au>
References: <87o8hnn9of.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87o8hnn9of.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-4
X-PR-Tracked-Commit-Id: 41131a5e54ae7ba5a2bb8d7b30d1818b3f5b13d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1339d6355ac42e1bf4fcdfce8bfce61172f8891
Message-Id: <161091546605.25840.15782559954148445248.pr-tracker-bot@kernel.org>
Date: Sun, 17 Jan 2021 20:31:06 +0000
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
Cc: arielmarcovitch@gmail.com, schwab@linux-m68k.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 17 Jan 2021 21:24:00 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1339d6355ac42e1bf4fcdfce8bfce61172f8891

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
