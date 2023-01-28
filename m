Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6967FE29
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 11:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4SDs6Xryz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 21:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEOdKD+x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEOdKD+x;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P45fk1Nh0z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jan 2023 07:30:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11704B80BEB;
	Sat, 28 Jan 2023 20:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA46EC4339C;
	Sat, 28 Jan 2023 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674937816;
	bh=NyfyYmvHuYCep7B9YHaipGsiO9fFZKxd2hw/3QQJwqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LEOdKD+xVK+ChdUeMYF7EWUBmGq14I7a4s4JCxsX0Z2pbDfy98ZnOQg9LaM70RuVC
	 9xRu4+lF+DVHmBGVHpWV6C3DKQnB6htlyuiQ1J3mBpVE0Cta4vW2RE/BXmcJavx0so
	 NpT9ZM/k0gp3REittQZbOAE5Pu2nnNW4ZzWWewKaFAFD3E6WwCsC+zOFh5CoV4HfQe
	 lQLG294nW9w5VbGq5Yt6s9D6T/oia27mZXgUwJMw43HV8z7gJz+N1dbAJrJr5rDjld
	 W58/LuDYy+LQisFZsbodjJ+lGQoGjrCfyPfOcghY/B7T6gUkoFPJyIGFHljP3NeW1j
	 sFiy6/39HdTbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76D09E52504;
	Sat, 28 Jan 2023 20:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/35] Documentation: correct lots of spelling errors (series
 1)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167493781647.31903.18128774325127042067.git-patchwork-notify@kernel.org>
Date: Sat, 28 Jan 2023 20:30:16 +0000
References: <20230127064005.1558-1-rdunlap@infradead.org>
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Sun, 29 Jan 2023 21:26:55 +1100
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
Cc: linmiaohe@huawei.com, juri.lelli@redhat.com, rydberg@bitmath.org, rafael@kernel.org, catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, perex@perex.cz, benjamin.tissoires@redhat.com, pavel@ucw.cz, srinivas.pandruvada@linux.intel.com, zbr@ioremap.net, agordeev@linux.ibm.com, vincent.guittot@linaro.org, jmorris@namei.org, linux-acpi@vger.kernel.org, len.brown@intel.com, linux-pm@vger.kernel.org, tglx@linutronix.de, linux-sgx@vger.kernel.org, isdn@linux-pingi.de, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, mhiramat@kernel.org, olteanv@gmail.com, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, jcmvbkbc@gmail.com, keyrings@vger.kernel.org, linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org, paul@paul-moore.com, linux-trace-kernel@vger.kernel.org, deller@gmx.de, lee@kernel.org, andrii@kernel.org, daniel.m.jordan@oracle.com, linux-crypto@vger.kernel.org, linux-xtensa@linux-xtensa.org, gor@linux.ibm.com
 , suzuki.poulose@arm.com, coresight@lists.linaro.org, bhelgaas@google.com, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, mathieu.poirier@linaro.org, wsa@kernel.org, jarkko@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, ast@kernel.org, will@kernel.org, daniel@iogearbox.net, corbet@lwn.net, isdn4linux@listserv.isdn4linux.de, linux-input@vger.kernel.org, serge@hallyn.com, fenghua.yu@intel.com, jikos@kernel.org, akinobu.mita@gmail.com, rostedt@goodmis.org, broonie@kernel.org, bp@alien8.de, linux-fbdev@vger.kernel.org, reinette.chatre@intel.com, martin.petersen@oracle.com, dmitry.torokhov@gmail.com, naoya.horiguchi@nec.com, target-devel@vger.kernel.org, bpf@vger.kernel.org, pmladek@suse.com, peterz@infradead.org, dhowells@redhat.com, linux-mm@kvack.org, linux-trace-devel@vger.kernel.org, live-patching@vger.kernel.org, mbenes@suse.cz, linux-leds@vger.kernel.org, steffen.klassert@secunet.com, linux-scsi@vger.kernel.org, maz@kernel.org, x86@kernel.
 org, linux@armlinux.org.uk, mingo@redhat.com, jonas@southpole.se, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, linux-block@vger.kernel.org, jglisse@redhat.com, openrisc@lists.librecores.org, jpoimboe@kernel.org, axboe@kernel.dk, netdev@vger.kernel.org, tiwai@suse.com, linux-security-module@vger.kernel.org, bristot@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu, 26 Jan 2023 22:39:30 -0800 you wrote:
> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series. [if all goes well]
> 
> These patches are based on linux-next-20230125.
> 
> [...]

Here is the summary with links:
  - [04/35] Documentation: bpf: correct spelling
    https://git.kernel.org/bpf/bpf-next/c/1d3cab43f4c7
  - [05/35] Documentation: core-api: correct spelling
    (no matching commit)
  - [13/35] Documentation: isdn: correct spelling
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


