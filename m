Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CA319727
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 00:53:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcD3G2pXdzDwsJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 10:53:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AZVv5t5L; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcD1S43sxzDwpf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 10:51:40 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A50264E44;
 Thu, 11 Feb 2021 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613087498;
 bh=hCu6gUGDP9UN+JzdIaPKdPU+JA0XEE3mofDzVcBUxUM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=AZVv5t5L128wKsYqO0qy5imi2ONRaWlkl/vdXGGQwjbhwQcjUfsS36nMfE4vaunVd
 iHYTuBTbq9EdXpFHXVB5MawmhpQQHVbWVBxNx4SDgNk+i1eHeCVabZLmdMchVJbdVJ
 NdbgTpIdRnD6dAkGmsUu67oDV8z7350lHKyvgvfq3J428IclBcuWwxW6u/jxEDzSH5
 C+mUN8pX2R7f9O+u7UqxQjA2ZckzbxpXdraQXclLwfUB22Z53THWJ/ZquKAyi9jv13
 XJQCDZo5JKVtRZXTscKuG528OZ98a8rd57ePUtW4C+SSb0JItoGyxi8Np43+RS86PN
 5h6qviTNIe97w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 44D6560951;
 Thu, 11 Feb 2021 23:51:38 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-8 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87blcqnqkw.fsf@mpe.ellerman.id.au>
References: <87blcqnqkw.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87blcqnqkw.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-8
X-PR-Tracked-Commit-Id: 8c511eff1827239f24ded212b1bcda7ca5b16203
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcc0b49040c70ad827a7f3d58a21b01fdb14e749
Message-Id: <161308749821.14652.3292558738499889917.pr-tracker-bot@kernel.org>
Date: Thu, 11 Feb 2021 23:51:38 +0000
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
Cc: aneesh.kumar@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 12 Feb 2021 10:15:59 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcc0b49040c70ad827a7f3d58a21b01fdb14e749

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
