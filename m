Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9D54CB84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNSbf72NHz3cfC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 00:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kAIWl67V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kAIWl67V;
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNSb16wCcz306l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 00:38:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=75kgVCcqOPOLeu4JBiLLFab/dM4uNZ1dcLuvpDx9ZCg=; b=kAIWl67VuUe8cBDkmFOZTh4b+J
	Uy6PgE2+CwIEzhFEfsXCTAadcMkk5TefuTIBHvgzxNrjmUz+/r/f3fMBR5i8mMC7UweLMh9MkeJoD
	97gkOJRUGibA77qDy9s4vL7NkQkS1Sv+TX4WpruLFHmbGvImVgE9LeYadgdIraA8AGxMlB+PxaWy/
	1adKvJuvvpCbTsZosCqi5SMDlMupfKEgEY7JpKMS8HhvbF7gyowCTheRqW0YX0S9D05qpW9G1fKLt
	DJUWQ6k8Tz/HxaHb6kuJRSWnDBXrsJA/DQco3hh/lFSm8XLWvSeNFNfH2bKr+ugXM0hH/Gw2zl2s+
	laFslj7w==;
Received: from 179.red-81-39-194.dynamicip.rima-tde.net ([81.39.194.179] helo=[192.168.15.167])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1o1U8m-002LYs-SW; Wed, 15 Jun 2022 16:37:04 +0200
Message-ID: <362f6520-8209-1721-823c-11928338f57d@igalia.com>
Date: Wed, 15 Jun 2022 11:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <87fskzuh11.fsf@email.froward.int.ebiederm.org>
 <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com> <Yqic0R8/UFqTbbMD@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <Yqic0R8/UFqTbbMD@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-hyperv@vger.kernel.org, halves@canonical.com, gregkh@linuxfoundation.org, peterz@infradead.org, alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org, feng.tang@intel.com, mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org, dyoung@redhat.com, vgoyal@redhat.com, mhiramat@kernel.org, linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 andriy.shevchenko@linux.intel.com, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, "Eric W. Biederman" <ebiederm@xmission.com>, kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Perfect Petr, thanks for your feedback!

I'll be out for some weeks, but after that what I'm doing is to split
the series in 2 parts:

(a) The general fixes, which should be reviewed by subsystem maintainers
and even merged individually by them.

(b) The proper panic refactor, which includes the notifiers list split,
etc. I'll think about what I consider the best solution for the
crash_dump required ones, and will try to split in very simple patches
to make it easier to review.

Cheers,


Guilherme
