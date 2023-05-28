Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2771375C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 03:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTLJN4j0kz3f7P
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 11:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTkXBfZe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTkXBfZe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTLHV6cmJz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 11:12:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B217760B6C;
	Sun, 28 May 2023 01:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9EFC433D2;
	Sun, 28 May 2023 01:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685236354;
	bh=jDUk00N23htJgTCus2ggznr7zHYOBahre42lfiwSgxM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qTkXBfZeqtBfPuEaxeqB1Ybwm8Yw4Lu8mDAhMePguj1umXdXyOX0I7g3xHDQP9uQ6
	 JUhJXeFl79P4XjJ9AO1ZACpNsvco8mDHlKRmR71HcoNxZmo9yp791HAODI1ynsGFOY
	 gP7yP+NrW9gl8sCEbpTJbt5DKp8/T49jNHPOh3k3rUrYr7ZTBQlXVBkM12DS9Ija7o
	 bVLmx3WjuXkshoT6rc2Uwxrv1SpYVkR/gk9SxlVJZn5RXn2Lr7voukKE5JWwrtCzOV
	 U/L8HqpbYhQ+gxpAM94nuW3AeKwrmYvqU2rhKhqSksagTXOpMDdQiVNM1fJUaY/TOT
	 DP+M2XNafbt4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0649BC4166F;
	Sun, 28 May 2023 01:12:34 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a5xptira.fsf@mail.lhotse>
References: <87a5xptira.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a5xptira.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-3
X-PR-Tracked-Commit-Id: 358e526a1648cdd773ba169da5867874ae2408e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 416839029e3858f61dc7dd346559c03e74ed8380
Message-Id: <168523635401.7029.2615898149537862363.pr-tracker-bot@kernel.org>
Date: Sun, 28 May 2023 01:12:34 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 28 May 2023 10:14:01 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/416839029e3858f61dc7dd346559c03e74ed8380

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
