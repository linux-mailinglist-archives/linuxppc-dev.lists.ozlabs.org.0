Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC369151B51
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 14:31:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Blw01p62zDq5n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 00:31:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Rk/bwZCA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Blmw2ZWPzDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 00:25:20 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.6-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580822717;
 bh=N0Wnx6hjJLstyz1lA+v+EjrgLErGA6F36ngCuwLl8wg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Rk/bwZCApMOUODsemV9dwILJUa0CpCajVoc2O7YHpAVczTqCmoqFX+pPRlM7uCUEw
 gcnU1sDkVkEg3ZkZLWBUFx+F0H5zMjviRNSjZv9oH2jiKIrp6bcYVp4QBvgkeQqu1s
 dxIr4uKls431Qjj82E/h+2dP1vi0YB5E6j+Cf4pU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <878sli3640.fsf@mpe.ellerman.id.au>
References: <878sli3640.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <878sli3640.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.6-1
X-PR-Tracked-Commit-Id: 4c25df5640ae6e4491ee2c50d3f70c1559ef037d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 71c3a888cbcaf453aecf8d2f8fb003271d28073f
Message-Id: <158082271757.19118.3664369841819660996.pr-tracker-bot@kernel.org>
Date: Tue, 04 Feb 2020 13:25:17 +0000
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
Cc: aik@ozlabs.ru, jniethe5@gmail.com, bigeasy@linutronix.de,
 linuxram@us.ibm.com, kernelfans@gmail.com, oohall@gmail.com,
 sukadev@linux.ibm.com, shawn@anastas.io, alex@ghiti.fr,
 aneesh.kumar@linux.ibm.com, krzk@kernel.org, chenzhou10@huawei.com,
 anju@linux.vnet.ibm.com, joel@jms.id.au, byj.tea@gmail.com,
 sukadev@linux.vnet.ibm.com, ajd@linux.ibm.com, groug@kaod.org,
 npiggin@gmail.com, oss@buserror.net, tyreld@linux.vnet.ibm.com,
 natechancellor@gmail.com, laurentiu.tudor@nxp.com, peter.ujfalusi@ti.com,
 timur@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 rdunlap@infradead.org, mwb@linux.ibm.com, linux-kernel@vger.kernel.org,
 Julia.Lawall@inria.fr, fbarrat@linux.ibm.com, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Tue, 04 Feb 2020 23:10:55 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/71c3a888cbcaf453aecf8d2f8fb003271d28073f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
