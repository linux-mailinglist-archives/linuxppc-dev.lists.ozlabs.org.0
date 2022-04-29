Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE55158F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 01:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqpbQ5zYBz3cK7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 09:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pi8CeEHR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=pi8CeEHR; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqjKm5yspz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 05:31:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juYOl8ucSjuSHKXBe+1Ir5OPZr6pZdgx66h4OReE1Ko=; b=pi8CeEHRcdz9D2M05lfyhONNOe
 Il5P/FNtKNDpfNnQvQkUO53LGYEhZ3HsOKcMT79tXUkEM7BDaPWYeiTRxruHlFJpgYZGLdkNZ+Vsx
 oyZivn3CQn+HYfOJsn02OXmy5/HYryfVse/FM/IqF31FwAMG26clpYwK7OV3zBWRhtbMoUne9k8x/
 cgyBslKy2FDshbzCm4dWwDcEIOqWM+BTXUAPCGsxBvDFlTKuVtiafdc18oTYk2LsBlxeiWqHf76sU
 fr20/x47wOCPaQYIMtyh+VGeHVXZk4bWHmVx7ebZUj8zme4Hs0U5M9F5U1lcdb0DAeivSR+YRjiw8
 sBGOVwOQ==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkWKu-000A9h-7O; Fri, 29 Apr 2022 21:31:28 +0200
Message-ID: <039cdf14-efc5-383b-3f3d-294a5ed9243e@igalia.com>
Date: Fri, 29 Apr 2022 16:31:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 13/30] s390/consoles: Improve panic notifiers reliability
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-14-gpiccoli@igalia.com> <YmwyjMtT7QTZiHaa@osiris>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YmwyjMtT7QTZiHaa@osiris>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 30 Apr 2022 09:26:41 +1000
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
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de,
 bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com,
 x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, dyoung@redhat.com,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, pmladek@suse.com,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/04/2022 15:46, Heiko Carstens wrote:
> [...]
> 
> Code looks good, and everything still seems to work. I applied this
> internally for the time being, and if it passes testing, I'll schedule
> it for the next merge window.
> 
> Thanks!

Perfect Heiko, thanks a bunch for your review and tests!
Let me know if anything breaks heh
Cheers,


Guilherme
