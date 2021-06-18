Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97E3AD129
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 19:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G65T15MQFz3byB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 03:27:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=QxaZv37P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=QxaZv37P; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G65SZ6FYZz303h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 03:26:38 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 7AEE0345C4E;
 Fri, 18 Jun 2021 13:26:34 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TuF5gIHS_P9W; Fri, 18 Jun 2021 13:26:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 39D64346030;
 Fri, 18 Jun 2021 13:26:33 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 39D64346030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1624037193;
 bh=RVU1L7Bs5o8SF/s3fQLWZ2mgUojZ65JgsimVBayw7WM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=QxaZv37PI2T8k93cxNlviHuor7Eo1jdIh84JQW8lKtRqEnYg+leveVO3V0WFWrykT
 MvqRXaDcPeJ0eAiUxm+yvxtY3zYscfcARDn2rN0ViMIPWwVcsj7n0OufUs3b9Z1+9R
 oEl+McAQbfLVbznVaLyI+IjT8OEOZRe3hMWnqTSYXPrFjcy1639fmawQUsbPISdolV
 vzjbXySgml575Cim3yIEQOpynXR/OAVs0L+ob5PmJZT2AamgShg4nH+wblsIvv+a9o
 2rIOi5IDZ47uAsVlnSrTmJsFS38xpSUbGgJqwa7YawAOIt4JkaTWO/VI7k6xNPxC35
 h+2QpUFHgBE5Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aQITEBiYLT6c; Fri, 18 Jun 2021 13:26:33 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 1BA0A346100;
 Fri, 18 Jun 2021 13:26:33 -0400 (EDT)
Date: Fri, 18 Jun 2021 13:26:32 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2077369633.12794.1624037192994.JavaMail.zimbra@efficios.com>
In-Reply-To: <8b200dd5-f37b-b208-82fb-2775df7bcd49@csgroup.eu>
References: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
 <20180129202020.8515-3-mathieu.desnoyers@efficios.com>
 <8b200dd5-f37b-b208-82fb-2775df7bcd49@csgroup.eu>
Subject: Re: [PATCH for 4.16 v7 02/11] powerpc: membarrier: Skip memory
 barrier in switch_mm()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4026)
Thread-Topic: powerpc: membarrier: Skip memory barrier in switch_mm()
Thread-Index: CQE5LhemvVU5Lc+W1e2QOiB/EG3b7A==
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
Cc: maged michael <maged.michael@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Watson <davejwatson@fb.com>,
 Will Deacon <will.deacon@arm.com>, Andrew Hunter <ahh@google.com>,
 David Sehr <sehr@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arch <linux-arch@vger.kernel.org>,
 x86 <x86@kernel.org>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 Greg Hackmann <ghackmann@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Paul <paulmck@linux.vnet.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Avi Kivity <avi@scylladb.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api <linux-api@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jun 18, 2021, at 1:13 PM, Christophe Leroy christophe.leroy@csgroup.eu wrote:
[...]
> 
> I don't understand all that complexity to just replace a simple
> 'smp_mb__after_unlock_lock()'.
> 
> #define smp_mb__after_unlock_lock()	smp_mb()
> #define smp_mb()	barrier()
> # define barrier() __asm__ __volatile__("": : :"memory")
> 
> 
> Am I missing some subtility ?

On powerpc CONFIG_SMP, smp_mb() is actually defined as:

#define smp_mb()        __smp_mb()
#define __smp_mb()      mb()
#define mb()   __asm__ __volatile__ ("sync" : : : "memory")

So the original motivation here was to skip a "sync" instruction whenever
switching between threads which are part of the same process. But based on
recent discussions, I suspect my implementation may be inaccurately doing
so though.

Thanks,

Mathieu


> 
> Thanks
> Christophe

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
