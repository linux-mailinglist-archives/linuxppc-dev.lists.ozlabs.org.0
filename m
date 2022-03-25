Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4614E79FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 18:18:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ8284prSz30J6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 04:18:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RFKJV4G3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RFKJV4G3; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ81X5VTJz2yHc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 04:18:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B265B82986;
 Fri, 25 Mar 2022 17:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09C44C34100;
 Fri, 25 Mar 2022 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648228683;
 bh=A+XQxqZdScw9iczbAg/yAqzk3QtGf9oiDWgVa+/1egU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RFKJV4G3Wq4KBw6W/8H2CmkyuTAn8V+s45/+4vbBWem/3EF7+AuTp9ZgSArmgOXaT
 YZQlnDmAobmDpBnOJkTWsqIB+Cx8Xl+GS4c/vOKBijeU6VCik0nlqAB+HLhVEEDxwa
 4c+CDY6GRdcOJmQFUGcegJzQLlGNIwkEjmLKZ0vtlAJTaHzOyrfOMq8GdF+JdfEfRg
 d4S4Nboy8vmwoh32gRr5B9aRiaCx/eT/CJBbhklO112zQMxtpJ4YyK4eOtjesjYSnu
 /HP3S4PV5Rpe4ehVVnZJuong+EKP5gxBNhHTWEBv8kLCHmy+P3Fx1nOfM/8Wb521m1
 kvw2mis/9ZbGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E3DAAE6BBCA; Fri, 25 Mar 2022 17:18:02 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zglefhxd.fsf@mpe.ellerman.id.au>
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zglefhxd.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.18-1
X-PR-Tracked-Commit-Id: fe2640bd7a62f1f7c3f55fbda31084085075bc30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f1c153e406a7375ae0fc3d6000b64e7ba27cf8a
Message-Id: <164822868291.13188.1113305308391567958.pr-tracker-bot@kernel.org>
Date: Fri, 25 Mar 2022 17:18:02 +0000
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
Cc: wangborong@cdjrlc.com, unixbhaskar@gmail.com, wedsonaf@google.com,
 pmladek@suse.com, aik@ozlabs.ru, jniethe5@gmail.com, psampat@linux.ibm.com,
 mbenes@suse.cz, hbh25y@gmail.com, mikey@neuling.org, joe.lawrence@redhat.com,
 anders.roxell@linaro.org, aneesh.kumar@linux.ibm.com, deller@gmx.de,
 danielhb413@gmail.com, haren@linux.ibm.com, treding@nvidia.com,
 ganeshgr@linux.ibm.com, clabbe@baylibre.com, mamatha4@linux.vnet.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, msuchanek@suse.de,
 kernel.noureddine@gmail.com, nathanl@linux.ibm.com, pmenzel@molgen.mpg.de,
 yuehaibing@huawei.com, keescook@chromium.org, arnd@arndb.de,
 guozhengkui@vivo.com, kjain@linux.ibm.com, chenjingwen6@huawei.com,
 npiggin@gmail.com, oss@buserror.net, rmclure@linux.ibm.com,
 maddy@linux.ibm.com, christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
 sachinp@linux.ibm.com, bigunclemax@gmail.com, ldufour@linux.ibm.com,
 hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, farosas@linux.ibm.com,
 geoff@infradead.org, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, Julia.Lawall@inria.fr,
 riteshh@linux.ibm.com, cgel.zte@gmail.com, vaibhav@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>, tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 25 Mar 2022 21:25:02 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f1c153e406a7375ae0fc3d6000b64e7ba27cf8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
