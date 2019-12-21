Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915D1289B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 15:57:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g7xq0c4YzDqv3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2019 01:57:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="dRhbY1jJ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47g7vP4MPCzDqnx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2019 01:55:12 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-4 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576940110;
 bh=MI/JmG2aNZLH/n4zNzRm8HaS1AdrgVr2N65rL/m9UO8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dRhbY1jJH0CP7sZg8h2wzi5T8ukY+RVnvEPChsH2sWHaR430ctqXdKlbzMlNXOw5J
 zEDz53EQbjeBEPDrgDQMxD7Wpa7atNFm7M/3QzyTeGzzzWU3l0sbYLRMiv07rGeOZU
 avuJYeHI85dOGasK7J8KlKGurO73naWiJRGtIMiE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sgldlwb0.fsf@mpe.ellerman.id.au>
References: <87sgldlwb0.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87sgldlwb0.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.5-4
X-PR-Tracked-Commit-Id: 228b607d8ea1b7d4561945058d5692709099d432
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d04182dd36dc5a4dd2e352c1d0f0241e83bd2a0
Message-Id: <157694011047.20544.8813472995788397797.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2019 14:55:10 +0000
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
Cc: pauld@redhat.com, ajd@linux.ibm.com, david@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 rppt@linux.ibm.com, fbarrat@linux.ibm.com, longman@redhat.com,
 Linus Torvalds <torvalds@linux-foundation.org>, marcus@mc.pp.se,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 21 Dec 2019 23:04:03 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d04182dd36dc5a4dd2e352c1d0f0241e83bd2a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
