Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA511E8A7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 23:54:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Yddf4W6HzDqnW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 07:54:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=205.233.59.134; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=vaz+sD1C; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YdTc4rhhzDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 07:47:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RNuAZkRuWdbMfqnpvN7spk0s8Bbmz59zdmfGiC6+E4g=; b=vaz+sD1Cyird0t3NvpnMaViBZE
 lpOHWi0O2xQPOUNArQgbtNl3NxU2BAR+jmY0Q0sWCO62a81Iy1/AlHiznI8q5bbNbwt2HyF6KPsOm
 Cn7RrPBmYIpB/jZL/972e+qHjTboxvdIQG1aj6m45T283MBep6QD1EtT/E5bQ+eEyvA18JlsWrXCr
 D4RB8B4Hb8vKwYsAZRzCmSo89XVCjgIjK4FKMK/T3XyHvBH/FMj/7orkFy+n8PHwpUZUdY7UWQBlT
 34uq51a9n66Ao4ve+YzqFEJWHl7Fj9BmU5h/fhLTJ0NkbmLmyiILYVeK2jVw7ftp7JMIgY7FtBNv5
 Ywvn8fdQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jemmJ-0007TF-Ue; Fri, 29 May 2020 21:43:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 21F203011FF;
 Fri, 29 May 2020 23:42:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id CB10F2B9B1BC4; Fri, 29 May 2020 23:42:57 +0200 (CEST)
Message-ID: <20200529213550.683440625@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 29 May 2020 23:35:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v3 0/5] lockdep: Change IRQ state tracking to use per-cpu
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
 rostedt@goodmis.org, a.darwish@linutronix.de, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ahmed and Sebastian wanted additional lockdep_assert*() macros and ran
into header hell.

Move the IRQ state into per-cpu variables, which removes the dependency on
task_struct, which is what generated the header-hell.

These patches are intended to go on top of:

 https://lkml.kernel.org/r/20200529212728.795169701@infradead.org

but should apply on current tip/master without much difficulty.

There are a few build fixes for Sparc64, PowerPC64 and s390. Especially the
Sparc one I'm not sure about.

