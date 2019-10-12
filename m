Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1BD52E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 23:42:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rJF96LqxzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 08:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="VCpt0shd"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rJBx5Z1zzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 08:40:08 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570916406;
 bh=3oP6+/0+rNNfPfZP75AUY0sO+HAX3rC8+O4Z4holfXE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=VCpt0shdQFi1XqIhY9MAiIUahUjKTlvbZ+04d6YjqlQw5omJrxYivUUZIMru4s2Ek
 fgvjOWdc6JdMDMOsJwQeY2do6tJGoZzj8jWG7gsHU8SsT41fJx1Y8PQj4YHfEJfeGZ
 9M6KgEcrQ/GzLkF81EMjkpSa8D3vhj+uEgUnpXgw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r23iurdg.fsf@mpe.ellerman.id.au>
References: <87r23iurdg.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87r23iurdg.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.4-3
X-PR-Tracked-Commit-Id: 2272905a4580f26630f7d652cc33935b59f96d4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db60a5a035aa8692dc7cee293356bdcc078fa7b7
Message-Id: <157091640632.3377.10259916414495442367.pr-tracker-bot@kernel.org>
Date: Sat, 12 Oct 2019 21:40:06 +0000
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
Cc: sfr@canb.auug.org.au, desnesn@linux.ibm.com, arnd@arndb.de,
 emmanuel.nicolet@gmail.com, jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ldufour@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 12 Oct 2019 22:37:15 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db60a5a035aa8692dc7cee293356bdcc078fa7b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
