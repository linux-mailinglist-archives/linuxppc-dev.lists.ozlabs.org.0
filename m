Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3B521DF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 17:16:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyM8D5tGwz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 01:16:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=fGhdvJlP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=fGhdvJlP; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyM7c0Snjz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 01:16:10 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 88D9E21BB4;
 Tue, 10 May 2022 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652195767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZqtmv8UjkqRBSiOYZ6ar9KDyJT6hDNxXl9SSULCXTQ=;
 b=fGhdvJlPt//dq0KQAtVijfj/ESEJ/OC2EKpevE2XN9mzQ9A1L9iCAxeXNQ+pUyb1Mv1UlE
 HCruB1nKt1ZaJRQk1txzbCvkQt9XnVOQap2jC6oxObMWliWuUvAfiBCulbtCmC4sio8+xa
 +ZqWsGMsijF1KXpHWJf4ANyjUo2sNOU=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2901B2C141;
 Tue, 10 May 2022 15:16:06 +0000 (UTC)
Date: Tue, 10 May 2022 17:16:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Message-ID: <YnqBsXBImU64PAOL@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-15-gpiccoli@igalia.com>
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 vkuznets@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2022-04-27 19:49:08, Guilherme G. Piccoli wrote:
> The notifiers infrastructure provides a way to pass an "id" to the
> callbacks to determine what kind of event happened, i.e., what is
> the reason behind they getting called.
> 
> The panic notifier currently pass 0, but this is soon to be
> used in a multi-targeted notifier, so let's pass a meaningful
> "id" over there.
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  include/linux/panic_notifier.h | 5 +++++
>  kernel/panic.c                 | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 41e32483d7a7..07dced83a783 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -9,4 +9,9 @@ extern struct atomic_notifier_head panic_notifier_list;
>  
>  extern bool crash_kexec_post_notifiers;
>  
> +enum panic_notifier_val {
> +	PANIC_UNUSED,
> +	PANIC_NOTIFIER = 0xDEAD,
> +};

Hmm, this looks like a hack. PANIC_UNUSED will never be used.
All notifiers will be always called with PANIC_NOTIFIER.

The @val parameter is normally used when the same notifier_list
is used in different situations.

But you are going to use it when the same notifier is used
in more lists. This is normally distinguished by the @nh
(atomic_notifier_head) parameter.

IMHO, it is a bad idea. First, it would confuse people because
it does not follow the original design of the parameters.
Second, the related code must be touched anyway when
the notifier is moved into another list so it does not
help much.

Or do I miss anything, please?

Best Regards,
Petr
