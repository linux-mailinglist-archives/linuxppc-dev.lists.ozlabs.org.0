Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA496480CFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 21:11:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNlzy3ywpz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 07:11:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jSsDD7Cl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jSsDD7Cl; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNlzF3fp0z2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 07:11:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0389BB811EA;
 Tue, 28 Dec 2021 20:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA191C36AE9;
 Tue, 28 Dec 2021 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640722259;
 bh=oaNLl9LgH1XIQGV1DN/UwV0AaYorgAiyRQ4eF5Zbto4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jSsDD7Cl2F6fzck324WjyH3W42v6k7A+7opTQylZjml7e8pmZoMaKiDZOwQZ379jc
 M1VL6xp9TCXaKZegKvorDVWPFGVxHV6cFnB9S2gPbWQGSBrlU5kEC4IFbxkQq7jGtY
 mu23/OtelIxZyigP/3WdsKfqDk7Si0DSzyxXir25YHBWHsBFx450tNC5GS21M7c5kH
 YvWvO6C71LenRvkkLmZu7y+iRodgBY23PaNIZ7cK0TEs+AONvY0BCCQnGG59+RXS1+
 HIXG2YHT5wASKBsQns9tLJt9rU0La6B+iLtrWJpq5dGJqYnQeFhkvvBcYBOC5KoRIU
 0bAEi+wHUIoZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B93BBC004F1; Tue, 28 Dec 2021 20:10:59 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v8z90y7t.fsf@mpe.ellerman.id.au>
References: <87v8z90y7t.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87v8z90y7t.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.16-5
X-PR-Tracked-Commit-Id: 8d84fca4375e3c35dadc16b8c7eee6821b2a575c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f651faaaba5f41ffac195e64f58483721e60eafc
Message-Id: <164072225974.9016.13251867159989276042.pr-tracker-bot@kernel.org>
Date: Tue, 28 Dec 2021 20:10:59 +0000
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Tue, 28 Dec 2021 22:23:50 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.16-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f651faaaba5f41ffac195e64f58483721e60eafc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
