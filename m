Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21C89F9B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 16:18:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HyGuA7aN;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4xJUkqSe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF4g36yK2z3vYp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 00:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HyGuA7aN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4xJUkqSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF4fJ2clPz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 00:17:28 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1712758642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dKudWSPi1Iu7TxLjPm3UxpQgYscfG9LL8/XF7l+GrvA=;
	b=HyGuA7aNqIHvi+4YBZ2QTOZarh53jTI7l8pcSR0KU9yTM0x6W08XWU/pG67KKgdebK+sIX
	FwjoVZmyg7O6xEUcvy+MO47yD03ffWBG/lff3YyabpnGJKHwoaheyhwW5IP8k9wEfXefaF
	mYA/SjvfDZJZ+GKi2/1UsSyopdwaYdea5VK+/9Nr6IAnCdWrbNvA+4ezEc0FS8/ORLA2Ae
	0koMqYMoes8RWFR8DrFeCRaZJ93fDlcnb2QUW9W+gXdKfhuFJpYMazyq1XlKIkYJx1OGKA
	7GcCYStS4+NRnOcXxE9Xnrn+uwyydjRUi4I/lXtbSu2V6sqJgXLpz/ph/JC4Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1712758642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dKudWSPi1Iu7TxLjPm3UxpQgYscfG9LL8/XF7l+GrvA=;
	b=4xJUkqSelu6YTEbO70Sq2RQ639AxhkKBi91Xaeg78LxGCFeiiaamNADOI/cbtpAQXtMwxa
	U0veKRge4GuNBODg==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv12 1/4] genirq: Provide a snapshot mechanism for
 interrupt statistics
In-Reply-To: <f3c7ef07-8fad-4ef6-9095-16e4bd734477@linux.alibaba.com>
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-2-yaoma@linux.alibaba.com> <87frvu7t85.ffs@tglx>
 <f3c7ef07-8fad-4ef6-9095-16e4bd734477@linux.alibaba.com>
Date: Wed, 10 Apr 2024 16:17:21 +0200
Message-ID: <875xwp480e.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10 2024 at 14:45, Bitao Hu wrote:
> On 2024/4/9 17:58, Thomas Gleixner wrote:
> By the way, what do you think of my reason for using printk() instead of
> pr_crit()? Should I change this part of the code in v13?

Either way is fine. Just put a proper explanation into the change log if
you stick with printk().

Thanks,

        tglx
