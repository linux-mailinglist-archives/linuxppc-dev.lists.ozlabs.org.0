Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78867FA92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 20:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P44p208JKz3fJw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 06:51:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucQIwNrY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucQIwNrY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3rlX4gKbz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 21:48:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C648060B51;
	Sat, 28 Jan 2023 10:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F057DC433D2;
	Sat, 28 Jan 2023 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674902917;
	bh=Y432cQgFP5F34pSdT8J5cN2U4/Abh03N/7/nnZFsfgA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ucQIwNrYn1j82n5kEO9WaLijY1byLMow61bm47krLw9/rm4ppKVrlbLz6phB9zNbS
	 qYY9lfErpOzRey8+JWhrlP2K20ge8aTXRGAB1RaAXSma5mb3gsVcM7JjsMlaYHRq6p
	 5Sc6Wb+I4Y9+t6nEP7exbyKAI00PmKAmlmdPi+RpRtLkxQxgwEsoweOc60InbgtjXH
	 FqvZ8MvQZkaZTFpjHfucUR24TwuTg8tFdRbslI7LaInKzs0Rwp3ur5+5MyfOIl4uaR
	 6DEA3qekp8dP3oIUZTw+yBhAfVg6biPer6tOhWjPLMuQk2/uOpgUZPcQmhGK5/Sihz
	 AcjSu+HZd6TdA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH 00/35] Documentation: correct lots of spelling
 errors (series 1)
Message-Id: <167490289567.2145989.15703368734300500078.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:48:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Mailman-Approved-At: Sun, 29 Jan 2023 06:50:52 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-sgx@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-spi@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, Max Filipp
 ov <jcmvbkbc@gmail.com>, keyrings@vger.kernel.org, linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>, linux-trace-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, isdn4linux@listserv.isdn4linux.de, linux-input@vger.kernel.org, "Serge E. Ha
 llyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-crypto@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, target-devel@vger.kernel.org, bpf@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>, linux-mm@kvack.org, linux-trace-devel@vger.kernel.org, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, linux-leds@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Jonas Bonn <jonas@southpole.se>, Heiko Carstens <hca
 @linux.ibm.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-block@vger.kernel.org, =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, openrisc@lists.librecores.org, Josh Poimboeuf <jpoimboe@kernel.org>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-security-module@vger.kernel.org, Daniel Bristot de Oliveira <bristot@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023 22:39:30 -0800, Randy Dunlap wrote:
> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series. [if all goes well]
> 
> These patches are based on linux-next-20230125.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[27/35] Documentation: spi: correct spelling
        commit: 0f6d2cee58f1ff2ebf66f0bceb113d79f66ecb07

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

