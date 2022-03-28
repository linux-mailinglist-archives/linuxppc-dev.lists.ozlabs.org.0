Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFF4E92E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 12:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRqRR12mKz3c1b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 21:57:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N7gslZiA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=kvalo@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N7gslZiA; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRnZf4SR5z2xSM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 20:34:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F242CB80FCD;
 Mon, 28 Mar 2022 09:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0B4C004DD;
 Mon, 28 Mar 2022 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648460036;
 bh=vyhorH3ReopEjyyeOaqNXz1F+fuDMA3PtzKea0coFV8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=N7gslZiAbUk2K0itCjecfsI/RWbD921JgzGNP2Kjob9tlNWKxpcv0XxXJfPNZin/w
 A0IR7YQPjfgzcF8nfIw2Qp9ZjcFTNb7LTztL9AYoQlq+D0DFSUCrNS2qiH6JPnE1fC
 d1KCYuVMQdA55JmSSOhMn38gdsnsuJiIvXS7xjuBjd+D58bh2S8/2S5hzqSNDwuMtF
 wL6A4k/3MHLny+7jUG8f45x9h9oK0icdinMC+NM7pK2YaZF62B/PFs4TG4m+pXcVBe
 gM+xB7pqzFL7oswhmEfyYWWLVgaR1DNvn0CsMhOvyHk4QEK83ayzd9+XQz5ZI40AA0
 C+vN55O6TsHMw==
From: Kalle Valo <kvalo@kernel.org>
To: Benjamin =?utf-8?Q?St=C3=BCrz?= <benni@stuerz.xyz>
Subject: Re: [PATCH 00/22] Replace comments with C99 initializers
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz>
Date: Mon, 28 Mar 2022 12:33:42 +0300
In-Reply-To: <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz> ("Benjamin
 \=\?utf-8\?Q\?St\=C3\=BCrz\=22's\?\= message of "Sun,
 27 Mar 2022 14:46:00 +0200")
Message-ID: <87fsn2zaix.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 28 Mar 2022 21:56:49 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 pkshih@realtek.com, linux-samsung-soc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 gregory.clement@bootlin.com, rafael.j.wysocki@intel.com, linux@armlinux.org.uk,
 krzk@kernel.org, jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, mike.marciniszyn@cornelisnetworks.com, rric@kernel.org,
 ajd@linux.ibm.com, arnd@arndb.de, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin St=C3=BCrz <benni@stuerz.xyz> writes:

> This patch series replaces comments with C99's designated initializers
> in a few places. It also adds some enum initializers. This is my first
> time contributing to the Linux kernel, therefore I'm probably doing a
> lot of things the wrong way. I'm sorry for that.

Just a small tip: If you are new, start with something small and learn
from that. Don't do a controversial big patchset spanning multiple
subsystems, that's the hard way to learn things. First submit one patch
at a time to one subsystem and gain understanding of the process that
way.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
