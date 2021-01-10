Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922D2F099E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jan 2021 21:08:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDSb91srTzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 07:08:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ldkVfRSq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDSYT6RXxzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 07:07:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E6A722A84;
 Sun, 10 Jan 2021 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610309243;
 bh=l3BYfZ9T4jh8uGFh0LOO19KGji5xf/gQwKY/slc5NCU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ldkVfRSq4T0s2vxKCgDLSjSweL8wzlAgdolv7kLoOtcT0Xkm5K6zzcwNehYBYnqmO
 hgr9IKYaviPJHGWvO76Bxe8pub+v0jWiLrge204srobYl5SNWEciYjXYMGwtDhgT1O
 zeDbUfRUvjdhy0+HRANOg2VQavypIKzuuNWm5bsds/1B4zfmNm+XCrgpNZxLKMvFUg
 VrGgSnq22J9dH9y3Fz1XsHrVWMfD05Vl1AqO9lyl/eTYZYDGmfNWJSTICnQLfmvZfj
 tJIgjK6hPvYufPgI6QkxRrWoHkbeiAbgb1jrPTxwX643C6ftDae0U7kuU7v4AJNR4w
 fJmD+z1W7Sz9g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 93F9760141;
 Sun, 10 Jan 2021 20:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y2h1j6k9.fsf@mpe.ellerman.id.au>
References: <87y2h1j6k9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y2h1j6k9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-3
X-PR-Tracked-Commit-Id: 3ce47d95b7346dcafd9bed3556a8d072cb2b8571
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3cd1a16cc8829776523fcd114299373be4e5187
Message-Id: <161030924359.466.12818097113991379322.pr-tracker-bot@kernel.org>
Date: Sun, 10 Jan 2021 20:07:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, natechancellor@gmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 10 Jan 2021 23:54:30 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3cd1a16cc8829776523fcd114299373be4e5187

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
