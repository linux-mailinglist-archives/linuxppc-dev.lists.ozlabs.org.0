Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2951FFA2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 16:26:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxk4c2kJVz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 00:26:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=afqWOj15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=afqWOj15; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxk403FJFz3bd2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 00:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P7ItdBTC+KXB0aqEwbSMXisX2R2Wb9V+tpF+BUJ3fMQ=; b=afqWOj15+1L7ZOehgz4TDp3T9b
 MarVdwm0LTk8+i9B4YSy7xFp7vHwG1/w4WbfDff1U5lUjMxS0vk2DRuV0fJ7wbVLLeaMw89VjYM5x
 WVJwpPzVyva0X5NmUi/i4nuSyMS2YeO8WasLcgi1Y8xImc6fOPpwaaWR9ocIpTn6nZEFaqdopezXx
 OHjXA1hjw9QuPDRbTOoKOwl5vTqszrquVcmDp1xGYYzEdEOTzOi8SiNmSxJjEIE9o/SJMrBbQG4MO
 b+UdR8rUhoog9dM2StftHOG35g7VaJwxTPUyd5VBoTJ128N6lfMi0IgW+WU1FzuWQA7pga9h2J0Nf
 78MmVTaA==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no4KQ-000BPa-6C; Mon, 09 May 2022 16:25:38 +0200
Message-ID: <260dccd8-a4f6-882c-8767-5bc27576df14@igalia.com>
Date: Mon, 9 May 2022 11:25:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Randy Dunlap <rdunlap@infradead.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <4fe85e9c-4e96-e9d5-9fd8-f062bafcda4f@infradead.org>
 <7518924e-5bb4-e6e9-0e3e-3f5cb03bf946@igalia.com>
In-Reply-To: <7518924e-5bb4-e6e9-0e3e-3f5cb03bf946@igalia.com>
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com, pmladek@suse.com,
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
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
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

On 29/04/2022 13:04, Guilherme G. Piccoli wrote:
> On 27/04/2022 21:28, Randy Dunlap wrote:
>>
>>
>> On 4/27/22 15:49, Guilherme G. Piccoli wrote:
>>> +	crash_kexec_post_notifiers
>>> +			This was DEPRECATED - users should always prefer the
>>
>> 			This is DEPRECATED - users should always prefer the
>>
>>> +			parameter "panic_notifiers_level" - check its entry
>>> +			in this documentation for details on how it works.
>>> +			Setting this parameter is exactly the same as setting
>>> +			"panic_notifiers_level=4".
>>
> 
> Thanks Randy, for your suggestion - but I confess I couldn't understand
> it properly. It's related to spaces/tabs, right? What you suggest me to
> change in this formatting? Just by looking the email I can't parse.
> 
> Cheers,
> 
> 
> Guilherme

Complete lack of attention from me, apologies!
The suggestions was s/was/is - already fixed for V2, thanks Randy.
