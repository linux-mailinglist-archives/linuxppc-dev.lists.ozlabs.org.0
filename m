Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990B692E66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:38:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDHsQ2dMGz3fY3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 15:38:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ax5Fd5J1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ax5Fd5J1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDBMl4c8Sz3f60
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 11:30:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68D32B82658;
	Sat, 11 Feb 2023 00:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F72C433EF;
	Sat, 11 Feb 2023 00:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676075420;
	bh=XEnPFOJ4CxMJH7vgfkFyQKY4s2/0EUC8Eknfpc5jk+s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ax5Fd5J1UIn8ED+GyB4f+E8hJ9LztVDn7UWC4mXnOgmf1KRe9qg37VcP6B98kKnsO
	 LZzZNA4MyyMSEIeG7mqIPLuzuz9GmmbPPuWcsDH0Kn9CG/IJyeHa00w9d6VJpmGmI4
	 NXRL4d9rj/vrxhHmcYkuvvsfAImKsX22nRKpEN6IZm/ArT43ezp69CpPKFWLzONl7c
	 8gCOQZrkyi8vqNwPvy5MhnCJYm+ujIZHdOmgGLEGxaUbIkSFrVEqOIZ1FTpVoog4RF
	 TTYadPmdXwwh9e6QDAyw5jGTuEaFaEB2cc1S76SGjrhSDxS3EsrNV3ZLEUNm5ahnDy
	 xyu+Hg0HqKq8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 740A6E21EC7;
	Sat, 11 Feb 2023 00:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/24 v2] Documentation: correct lots of spelling errors
 (series 1)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167607542046.32477.11523239261636548840.git-patchwork-notify@kernel.org>
Date: Sat, 11 Feb 2023 00:30:20 +0000
References: <20230209071400.31476-1-rdunlap@infradead.org>
In-Reply-To: <20230209071400.31476-1-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Sat, 11 Feb 2023 14:54:09 +1100
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
Cc: linmiaohe@huawei.com, juri.lelli@redhat.com, linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, fenghua.yu@intel.com, peterz@infradead.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jmorris@namei.org, dhowells@redhat.com, jcmvbkbc@gmail.com, keyrings@vger.kernel.org, live-patching@vger.kernel.org, zbr@ioremap.net, agordeev@linux.ibm.com, mbenes@suse.cz, will@kernel.org, tglx@linutronix.de, steffen.klassert@secunet.com, linux-s390@vger.kernel.org, vincent.guittot@linaro.org, paul@paul-moore.com, linux-scsi@vger.kernel.org, corbet@lwn.net, linux-xtensa@linux-xtensa.org, maz@kernel.org, deller@gmx.de, rydberg@bitmath.org, linux@armlinux.org.uk, daniel.m.jordan@oracle.com, mingo@redhat.com, linux-input@vger.kernel.org, coresight@lists.linaro.org, serge@hallyn.com, pmladek@suse.com, gor@linux.ibm.com, suzuki.poulose@arm.com, hca@linux.ibm.
 com, jikos@kernel.org, akinobu.mita@gmail.com, rostedt@goodmis.org, stefan.kristiansson@saunalahti.fi, linux-block@vger.kernel.org, jglisse@redhat.com, openrisc@lists.librecores.org, bp@alien8.de, bhelgaas@google.com, shorne@gmail.com, reinette.chatre@intel.com, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org, axboe@kernel.dk, chris@zankel.net, isdn@linux-pingi.de, jonas@southpole.se, mathieu.poirier@linaro.org, linux-mm@kvack.org, netdev@vger.kernel.org, dmitry.torokhov@gmail.com, naoya.horiguchi@nec.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-trace-devel@vger.kernel.org, mhiramat@kernel.org, bristot@kernel.org, linux-crypto@vger.kernel.org, olteanv@gmail.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Feb 2023 23:13:36 -0800 you wrote:
> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series.
> 
> These patches are based on linux-next-20230209.
> 
> [...]

Here is the summary with links:
  - [03/24] Documentation: core-api: correct spelling
    (no matching commit)
  - [08/24] Documentation: isdn: correct spelling
    https://git.kernel.org/netdev/net-next/c/d12f9ad02806

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


