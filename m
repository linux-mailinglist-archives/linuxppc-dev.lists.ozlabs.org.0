Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10648204CC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 10:43:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rftw6cwMzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=gAD0zWOY; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rfp209ZxzDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:39:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FUcYaPjVDKdvDgNAWCH0VBlsZbePqhZn2SLAs+XhAu0=; b=gAD0zWOYV1+jt4nVM7z3Ipgm51
 8evIRze1W8EJ84Zziy4r0WwCuxroavZRpy3Og/W1UjErOpi6RCmIobX3Tzp0kzffSS92hZ8WR7Zg4
 ERPvMDZqZNAAL5Oz52cyutYWBqvlQAyf06hrFtjEQkNtFHKd7gb9jAQdwhR8GY4DlfIO6apmajpsq
 VpoFUEZ4Ub0Po92gBI3L0eKUBXEin+WKsQww5Yk9FWCyVIkpVZ8BtzVNu7yFhsLGCwf3Pqj7rZfme
 8dB7efJJJ4z0/Oa9PxCrzyQNoAtVgmATijrl+3obs5f9ulPN4QuvT38m7AyeP8w6Jbg2JLgnZxXkQ
 US5MHr1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jneS5-0005Rk-Dn; Tue, 23 Jun 2020 08:38:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 13B29306E5C;
 Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id DB18B237095F8; Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Message-ID: <20200623083645.277342609@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 23 Jun 2020 10:36:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v4 0/8] lockdep: Change IRQ state tracking to use per-cpu
 variables
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
Cc: linux-s390@vger.kernel.org, peterz@infradead.org, bigeasy@linutronix.de,
 x86@kernel.org, heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, a.darwish@linutronix.de,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ahmed and Sebastian wanted additional lockdep_assert*() macros and ran into
header hell. I figured using per-cpu variables would cure that, and also
ran into header hell, still tracktable though.

By moving the IRQ state into per-cpu variables we remove the dependency on
task_struct.

Patches go on top of anything recent I think, an actual git tree with them
in is (for now) here:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/irqstate

Which 0day blessed with 0 build fails.


