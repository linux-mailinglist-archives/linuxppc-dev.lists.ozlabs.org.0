Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C47665C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 09:50:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dOnUWXAM;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ve9ftLHd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC0Dt11btz3cRk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 17:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dOnUWXAM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ve9ftLHd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 583 seconds by postgrey-1.37 at boromir; Fri, 28 Jul 2023 17:50:07 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC0Cz0Nvwz3012
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 17:50:06 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1690530018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3lFFYmxXQsCGkR7WqgUDzZWwO7vYvbu+VSipk5DNPA=;
	b=dOnUWXAMBHlcF7DznBkjH1bNSRZt+A6Mltw6RDp2xMdbpTnFdfZBI3y1RDIiQndh8norCs
	xgaR6VqxfVHeggOYHmhBxPMiDlAaLCNYfZR3VoDu25WsUpWOUPH0WgFJ/oAPIEC2pSTIYe
	k438ON5htB+OEfFOxqneM4VHIeGVLIQXPSwi0j/birbgYbTwS1aQ+m90UQ4lMluYbs5a49
	M6C8x3aTtTkqVg8sAoRWE5LZY7sFQKgQFWOmmAQa3RF/RMgRRb6yiD79UNeahJrVQ3wKlA
	0ofotDXP5emQXeBeW6E7GiF2jWptWbCnD7GI9BgBZcRP7c4Ux94kdXRBfdkb+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1690530018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3lFFYmxXQsCGkR7WqgUDzZWwO7vYvbu+VSipk5DNPA=;
	b=Ve9ftLHdXNIrLTDWdMIvBVbeE5nyJztICBjwg4I7sZqU1LICnyGJbPbsQ6R9RRc5HsYj6c
	XRpOJBT5fqzZ3UCg==
To: "Zhang, Rui" <rui.zhang@intel.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "ldufour@linux.ibm.com"
 <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4 00/10] Introduce SMT level and add PowerPC support
In-Reply-To: <c66e3e800a7d257ef7a90749fe567f056f4c3ace.camel@intel.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <c66e3e800a7d257ef7a90749fe567f056f4c3ace.camel@intel.com>
Date: Fri, 28 Jul 2023 09:40:17 +0200
Message-ID: <87wmykqyam.ffs@tglx>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rui!

On Sun, Jul 09 2023 at 15:25, Rui Zhang wrote:
> I ran into a boot hang regression with latest upstream code, and it
> took me a while to bisect the offending commit and workaround it.

Where is the bug report and the analysis? And what's the workaround?

Thanks,

        tglx
