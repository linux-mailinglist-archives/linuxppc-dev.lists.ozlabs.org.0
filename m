Return-Path: <linuxppc-dev+bounces-6036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE9A2EF98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 15:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys6J86mg4z302c;
	Tue, 11 Feb 2025 01:23:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739197416;
	cv=none; b=BCUrOcVcfjRqJYhpaiMDcZ5623sB/3hrdM9e6oWz7szRVE80vWOk1eoy3XHLH/7EomT6QH8+TYhUuWp84db+Zm+xS81El6eDORQ0UOnn2Gzz+miwwxkBlOvTBv1nhwyV2SgNQ/69DWKgV8Pvi2wMk84Jf2xYXjPxHixidirSBGkfNSIAFq8mDwUqUSCt6umq6G/c+QyozKzYBtK0YfAc1Rm6r9JoQ+Av9shDE9XRatnfl+v3tYfUIkTqqoXtMYcoGSStPYKRAS0gQYooq9uUR3nORh9vwVn0K8qJS1tMTQnwBtpPLmtodXVVpDJtV5zi9275zqXJz9VriDNx9e8TBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739197416; c=relaxed/relaxed;
	bh=Z9ihDNYI+zCbf0NSoNI9c/FdnZzk61DWASBxjVSt6UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqdkhD57sGSbdrRc6paPq92UdjF3eONupjZJ43x3IIFoYqKN7HqJv3GCKLteXznqFnBABdhyyXGnm6H/zbWRMPl4wJRwYZ7O+0qKEKTC37AB/1XCzVDr8vgm5a/WRkOeo6AgsFpEWo0Xu65TapE5N1MBcrtdL2SoPubKG42KtxmThm2DCr1+ikGWFLjP4zL94V6j3eliuwLuTU+HmwjkLEZ+7dY6RCsvXE/XVJwhiHSMehKbGxvoElCFflAlTuM15HTUlWcyjCEyQam9g1lG/2jvlele+9YyXz3j5PEj+svCqqCAdHgY4cWh75kgc3KGspRtGvFog6V80ugg3j81aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UXwpM+UG; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y31wsz+8; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UXwpM+UG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y31wsz+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys6J774l6z2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 01:23:35 +1100 (AEDT)
Date: Mon, 10 Feb 2025 15:23:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739197409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9ihDNYI+zCbf0NSoNI9c/FdnZzk61DWASBxjVSt6UM=;
	b=UXwpM+UGp5qjzqj1voR9MR6/yauR9Llt5V2fxsn/AkztJ7hHK4f3VMqPXIU/l8/1rq77yd
	wOCKfd3fwE6jSZvxZyPJK0jvxUHyThQED6Sp9GHawBtU/AcYI+QaGXMjjZ8qy3KKKYcqEW
	ZknWvJkTegstEEYOYYSlrh2JsguBBfdc0vC+wwF457yqYn+EfgZCW58ZYemyQrhFRXabxV
	8Xxg3WhICEJi+gQaMmCakoUzTrWDUtnaxcXHYOAEvzAg8AcXlV5hVj4gN3FUVFwVRAjSX1
	hTzC5cDetCLWBmgm8+EtGQsp2KjtUUlyO05Mi4Km/r9zb9GHkQuIvFfnaOcyTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739197409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9ihDNYI+zCbf0NSoNI9c/FdnZzk61DWASBxjVSt6UM=;
	b=Y31wsz+8FgMeY5YVZLiMPgwoBy7PbtqoeifYuoiMjBYb+lLwumRrX2ocY65RNcp34aZTjU
	R304GRy80KbeWkBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
Message-ID: <20250210142327.bCujH28L@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
 <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
 <20250210105949.b9PKqiw7@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210105949.b9PKqiw7@linutronix.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-10 11:59:50 [+0100], To Shrikanth Hegde wrote:
> Thank you for noticing. I did remove it on other architectures, I
> somehow missed it here. Will remove it from from the arch code.

This is what I have for powerpc now. I'm going to repost the series,
currently waiting for arm/x86.

-------->8-----------

Subject: [PATCH] powerpc: Rely on generic printing of preemption model.

After the first printk in __die() there is show_regs() ->
show_regs_print_info() which prints the current
preemption model.

Remove the preempion model from the arch code.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/kernel/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfdb..cb8e9357383e9 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -263,10 +263,9 @@ static int __die(const char *str, struct pt_regs *regs, long err)
 {
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
 
-	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
+	printk("%s PAGE_SIZE=%luK%s %s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
-- 
2.47.2


