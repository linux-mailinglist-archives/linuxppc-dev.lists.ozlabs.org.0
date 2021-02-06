Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3A312069
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 00:22:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DY7bz61s7zDvYm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 10:22:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FtJPiiIm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DY7ZV1dG5zDwj9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 10:21:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3281764E53;
 Sat,  6 Feb 2021 23:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612653663;
 bh=+xyygatuh3Fom9YWTWj4tM9GXTc/Sa+pVyh5PVHATMA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FtJPiiImIruEpLX8X0VZzm4fQz7L/NlOhYBPOy4aCAlq9HI11RWVfX2M7PZJSi7f0
 pwiuOWgQ111Kt0f9kdVlYHNfTEoHqjjLIKwRJr4ScyyPGR0qNn/LAeTOR8ULFrnpAD
 GrsN+DPTa1OjI24zTKtU83CePWgI8p0eF61llSnbO6E1K5475jho77Sfv4ZAs0Ud5x
 wU43DWRXhNOBfur6BC3kJKlN8z24PJ7asVIQdSq2vNUST0HJ9NnZ/DlRjRlGCfQO9L
 6NZnXRLJVSdOhYJcmscv2twiti63CQRtMszei9X4A9T4ma3MB9PaWylm6pCpPtI2QU
 UuzdhIo3DaC7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 273EC609CE;
 Sat,  6 Feb 2021 23:21:03 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-7 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <8735y9pdga.fsf@mpe.ellerman.id.au>
References: <8735y9pdga.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <8735y9pdga.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-7
X-PR-Tracked-Commit-Id: 24321ac668e452a4942598533d267805f291fdc9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f06279ea1908b9cd2d22645dc6d492e612b82744
Message-Id: <161265366314.26028.10795279007910033789.pr-tracker-bot@kernel.org>
Date: Sat, 06 Feb 2021 23:21:03 +0000
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
Cc: ravi.bangoria@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 masahiroy@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, raoni@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 06 Feb 2021 23:50:45 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f06279ea1908b9cd2d22645dc6d492e612b82744

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
