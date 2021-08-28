Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A63FA20C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxH2M6Q91z3bZx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 10:07:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=ibXqVy9z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=ibXqVy9z; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxH1d0Fr3z2ynM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 10:06:27 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 334D2383D90;
 Fri, 27 Aug 2021 20:06:25 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dJnw97AVp-6J; Fri, 27 Aug 2021 20:06:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id AABF53839D9;
 Fri, 27 Aug 2021 20:06:20 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com AABF53839D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1630109180;
 bh=aNbnUoaMo9qyJFeAmPDlGUugMe1xHV+lzHQym41zPgk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ibXqVy9zMTh8pzWhCDOoh0A6j0FvWS8eYDH852Q65ZQn7p1jJGIre5/cPOpdeIP+y
 aA3o07Eg6BWPXmQhKAcL/ut69D3yBdvdejeJXIhzPTSWYfZet9c55De2zXu/+jv9qb
 9rMBUNtRH3XFmY4l5818jP7JeOTnYOyaVW6g21SlH6hM5lnPmcjj7mBKimFhzIieoI
 r/xa04WF8N3Rq/3K+SW2ss83aevuy6/MvU/Sy30Y15mPyUw7HSYrNN1GbX2+DRw0YH
 7ZItjz+GSSq3DkuqubXPIjIIupZU9sNhSleF8+cDrSh10TSYD5CLywa6jmXG5NyjL6
 CV8mJ14ojbACA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9JJ04Y5MGhgL; Fri, 27 Aug 2021 20:06:20 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 87F07383C99;
 Fri, 27 Aug 2021 20:06:20 -0400 (EDT)
Date: Fri, 27 Aug 2021 20:06:20 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <1054916754.30218.1630109180443.JavaMail.zimbra@efficios.com>
In-Reply-To: <YSlz8h9SWgeuicak@google.com>
References: <20210820225002.310652-1-seanjc@google.com>
 <766990430.21713.1629731934069.JavaMail.zimbra@efficios.com>
 <282257549.21721.1629732017655.JavaMail.zimbra@efficios.com>
 <YSblqrrpKcORzilX@google.com>
 <1700758714.29394.1630003332081.JavaMail.zimbra@efficios.com>
 <YSgpy8iXXXUQ+b/k@google.com>
 <339641531.29941.1630091374065.JavaMail.zimbra@efficios.com>
 <YSlz8h9SWgeuicak@google.com>
Subject: Re: [PATCH v2 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF91 (Linux)/8.8.15_GA_4059)
Thread-Topic: selftests: Add a test for KVM_RUN+rseq to detect task migration
 bugs
Thread-Index: eu98ugrRMaO1Ldp5KUn1lSy5MLrp5Q==
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 dvhart <dvhart@infradead.org>, linux-mips <linux-mips@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, paulmck <paulmck@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, rostedt <rostedt@goodmis.org>,
 Shakeel Butt <shakeelb@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Aug 27, 2021, at 7:23 PM, Sean Christopherson seanjc@google.com wrote:

> On Fri, Aug 27, 2021, Mathieu Desnoyers wrote:
[...]
>> Does it reproduce if we randomize the delay to have it picked randomly from 0us
>> to 100us (with 1us step) ? It would remove a lot of the needs for arch-specific
>> magic delay value.
> 
> My less-than-scientific testing shows that it can reproduce at delays up to
> ~500us,
> but above ~10us the reproducibility starts to drop.  The bug still reproduces
> reliably, it just takes more iterations, and obviously the test runs a bit
> slower.
> 
> Any objection to using a 1-10us delay, e.g. a simple usleep((i % 10) + 1)?

Works for me, thanks!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
