Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2110DFCB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 00:07:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47QRqC5ckyzDqHf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 10:07:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="XU3HwnFE"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47QRmf748YzDqss
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2019 10:05:22 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575155120;
 bh=tGckANu044kEHwyFyJWgagVeyE0g1taM4zR/godAuo8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=XU3HwnFERqjhyOJpClp9IVB9F4kgbNCv6gHgTa3BJCUoSJOAomp7beGVZdqdT/TqY
 F/g1eZ3pHpySi1GNkSdijFxg/VzcsFtxbA72iwV6KfbS1rHO73Hc26o7Zs0KvqlAWH
 Pts7FFFj+INMqZELm6iLTQZuRSbpcdF4Gitjryyc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <877e3hfxyq.fsf@mpe.ellerman.id.au>
References: <877e3hfxyq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877e3hfxyq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.5-1
X-PR-Tracked-Commit-Id: 2807273f5e88ed086d7d5d838fdee71e11e5085f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7794b1d4185e2587af46435e3e2f6696dae314c7
Message-Id: <157515512019.27985.3391840091234798469.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2019 23:05:20 +0000
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
Cc: tyreld@linux.ibm.com, nayna@linux.ibm.com, geert+renesas@glider.be,
 david@redhat.com, linux@rasmusvillemoes.dk, zohar@linux.ibm.com,
 yanaijie@huawei.com, oohall@gmail.com, hch@lst.de, aneesh.kumar@linux.ibm.com,
 madalin.bucur@nxp.com, yuehaibing@huawei.com, krzk@kernel.org,
 debmc@linux.vnet.ibm.com, valentin@longchamp.me, alastair@d-silva.org,
 harish@linux.ibm.com, leonardo@linux.ibm.com, msuchanek@suse.de,
 nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com, thuth@redhat.com,
 ajd@linux.ibm.com, gwalbon@linux.ibm.com, linuxram@us.ibm.com,
 npiggin@gmail.com, oss@buserror.net, chris.packham@alliedtelesis.co.nz,
 cai@lca.pw, clg@kaod.org, bhelgaas@google.com, natechancellor@gmail.com,
 hbathini@linux.ibm.com, asteinhauser@google.com, malat@debian.org,
 linuxppc-dev@lists.ozlabs.org, cmr@informatik.wtf,
 linux-kernel@vger.kernel.org, sbobroff@linux.ibm.com,
 chris.smart@humanservices.gov.au, vaibhav@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 30 Nov 2019 21:41:17 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7794b1d4185e2587af46435e3e2f6696dae314c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
