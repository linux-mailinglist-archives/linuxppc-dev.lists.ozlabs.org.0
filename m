Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018718E96B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 15:45:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lgKD6Y7KzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 01:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.27;
 helo=mail27.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=vTbnNMEn; 
 dkim-atps=neutral
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 48lgH85VKhzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 01:43:16 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584888198; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=8ZrWvNR4lZD7mLPZKWh5kIh2oW3QrCXRdxOVL7dTNX0=;
 b=vTbnNMEnuWIeG+3Ne5I1AmhndbfvwHKeAUK7K2takb4KnlUwpB8y99rGYxOdUwjEy1P7HRgp
 4O8KyjXmMr/0BsN5kqX5L5EXpvqbY/6hf1arzBwUUu/xpR3QlVBXw/ut75C2LhZMbcGIE75v
 H7RQA4n2+8UCznH3WEuq2KynK5U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e777977.7facd49ff1f0-smtp-out-n02;
 Sun, 22 Mar 2020 14:43:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3A67DC432C2; Sun, 22 Mar 2020 14:43:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4495EC433D2;
 Sun, 22 Mar 2020 14:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4495EC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 04/20] orinoco_usb: Use the regular completion
 interfaces
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.150783464@linutronix.de>
Date: Sun, 22 Mar 2020 16:42:46 +0200
In-Reply-To: <20200321113241.150783464@linutronix.de> (Thomas Gleixner's
 message of "Sat, 21 Mar 2020 12:25:48 +0100")
Message-ID: <87pnd4bgd5.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: , Randy Dunlap <rdunlap@infradead.org>,
	linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-pci@vger.kernel.org, Sebastian Siewior <bigeasy@linutronix.de>,
	tel.com@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
	Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Brian Cain <bcain@codeaurora.org>, linux-acpi@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-csky@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
	kbuild test robot <lkp@in>, linuxppc-dev@lists.ozlabs.org,
	Greentime Hu <green.hu@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	platform-driver-x86@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
	Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Davidlohr Bueso <dbueso@suse.de>, netdev@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Gleixner <tglx@linutronix.de> writes:

> From: Thomas Gleixner <tglx@linutronix.de>
>
> The completion usage in this driver is interesting:
>
>   - it uses a magic complete function which according to the comment was
>     implemented by invoking complete() four times in a row because
>     complete_all() was not exported at that time.
>
>   - it uses an open coded wait/poll which checks completion:done. Only one wait
>     side (device removal) uses the regular wait_for_completion() interface.
>
> The rationale behind this is to prevent that wait_for_completion() consumes
> completion::done which would prevent that all waiters are woken. This is not
> necessary with complete_all() as that sets completion::done to UINT_MAX which
> is left unmodified by the woken waiters.
>
> Replace the magic complete function with complete_all() and convert the
> open coded wait/poll to regular completion interfaces.
>
> This changes the wait to exclusive wait mode. But that does not make any
> difference because the wakers use complete_all() which ignores the
> exclusive mode.
>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
> V2: New patch to avoid conversion to swait functions later.
> ---
>  drivers/net/wireless/intersil/orinoco/orinoco_usb.c |   21 ++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)

I assume this is going via some other than wireless-drivers so:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
