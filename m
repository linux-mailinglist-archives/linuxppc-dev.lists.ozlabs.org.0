Return-Path: <linuxppc-dev+bounces-7225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B9A69879
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 19:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHybp5VN9z300V;
	Thu, 20 Mar 2025 05:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742410582;
	cv=none; b=lzldxVp6ZO6CwZwY5eIcQkI2ORE+S76FaraA3qL3AUTXsWmbN9+VyzVFKC8QBhBJQ8HBi3paqZGtXFJD9EgjMoBDmmvVKD6mXEno6aCb6aXEwA1DaTN/5eDaq6n/0fqu1AEItOAhMWMzRnbjR356jy81oBL7qitYooEFWUaUHJb5u3/HOTjKvizSmeHqo4xqYVp6qRe5Ow2oG06BoMMEdMl+MDGzrNMb/4bBRs2hzubVrVGF09AeJTeH+4eab6akE2nK10ZgRj0rvPaROsKCh6ozQQpVKj5ad+cM2WxcR6Dn3LwoBgLPKTucgSnZxFe4l7csDytzb/Yuz/OBQr59eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742410582; c=relaxed/relaxed;
	bh=zqyBVaYb9ts4lSaXiElKMyansdaMcGaJGQGVhzkplWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m16ymH5HjXGNA1EKXdfFM+6RnYi6e8l5XOpYQgJwl8O7DyaR8EMOP23nGyUCSRklffQQy60/AdBJdfqoT/oPoJ3elLt15kX85jlEjO0NzCOaTzS+shyYSQdUUJnIROJQmqYSH8a3bptZUd5aR6p0JvvkT0623EAx5iJOc9/DQRKL7Vs9hUpSfakSmptvWdUcysG+KPloXgxi1Id1tKplC4sS/OsPNiieBfiXP3PojgPpW3+x72+Z8gpxBb+ybr0g8yeA5p2i1EAsK62Ak9jpuzV07uN+B/rwk1s6Rma/T2qV3b4wgGcte49OOjFkf2KD9JiXWawPgKrHSEldvxprVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xaQi4Ef4; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=yosry.ahmed@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xaQi4Ef4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=yosry.ahmed@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 495 seconds by postgrey-1.37 at boromir; Thu, 20 Mar 2025 05:56:19 AEDT
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHybl1Wnsz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 05:56:18 +1100 (AEDT)
Date: Wed, 19 Mar 2025 18:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742410061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zqyBVaYb9ts4lSaXiElKMyansdaMcGaJGQGVhzkplWo=;
	b=xaQi4Ef4746B+A1AJBeekKoem5X9BsU2Zv43rk34K1b57B9N/UUB0WB7+ebMMyAm4dfIwQ
	po8r8m5IqUgNRKUb/IkSMFPDZP7ikmojvJbVFmFRwuujjWoxhQaSwuSjM3plvtnggGTY0s
	MOiuRmYvVaZE3dOZtPg1/9XMdLYCzcU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Borislav Petkov <bp@alien8.de>
Cc: Brendan Jackman <jackmanb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, Junaid Shahid <junaids@google.com>
Subject: Re: [PATCH RFC v2 04/29] mm: asi: Add infrastructure for boot-time
 enablement
Message-ID: <Z9sRQ0cK0rupEiT-@google.com>
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-4-8419288bc805@google.com>
 <20250319172935.GMZ9r-_zzXhyhHBLfj@fat_crate.local>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319172935.GMZ9r-_zzXhyhHBLfj@fat_crate.local>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025 at 06:29:35PM +0100, Borislav Petkov wrote:
> On Fri, Jan 10, 2025 at 06:40:30PM +0000, Brendan Jackman wrote:
> > Add a boot time parameter to control the newly added X86_FEATURE_ASI.
> > "asi=on" or "asi=off" can be used in the kernel command line to enable
> > or disable ASI at boot time. If not specified, ASI enablement depends
> > on CONFIG_ADDRESS_SPACE_ISOLATION_DEFAULT_ON, which is off by default.
> 
> I don't know yet why we need this default-on thing...

It's a convenience to avoid needing to set asi=on if you want ASI to be
on by default. It's similar to HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
or ZSWAP_DEFAULT_ON.

[..]
> > @@ -175,7 +184,11 @@ static __always_inline bool asi_is_restricted(void)
> >  	return (bool)asi_get_current();
> >  }
> >  
> > -/* If we exit/have exited, can we stay that way until the next asi_enter? */
> > +/*
> > + * If we exit/have exited, can we stay that way until the next asi_enter?
> 
> What is that supposed to mean here?

asi_is_relaxed() checks if the thread is outside an ASI critical
section.

I say "the thread" because it will also return true if we are executing
an interrupt that arrived during the critical section, even though the
interrupt handler is not technically part of the critical section.

Now the reason it says "if we exit we stay that way" is probably
referring to the fact that an asi_exit() when interrupting a critical
section will be undone in the interrupt epilogue by re-entering ASI.

I agree the wording here is confusing. We should probably describe this
more explicitly and probably rename the function after the API
discussions you had in the previous patch.

> 
> > + *
> > + * When ASI is disabled, this returns true.
> > + */
> >  static __always_inline bool asi_is_relaxed(void)
> >  {
> >  	return !asi_get_target(current);
[..]
> > @@ -66,10 +73,36 @@ const char *asi_class_name(enum asi_class_id class_id)
> >  	return asi_class_names[class_id];
> >  }
> >  
> > +void __init asi_check_boottime_disable(void)
> > +{
> > +	bool enabled = IS_ENABLED(CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION_DEFAULT_ON);
> > +	char arg[4];
> > +	int ret;
> > +
> > +	ret = cmdline_find_option(boot_command_line, "asi", arg, sizeof(arg));
> > +	if (ret == 3 && !strncmp(arg, "off", 3)) {
> > +		enabled = false;
> > +		pr_info("ASI disabled through kernel command line.\n");
> > +	} else if (ret == 2 && !strncmp(arg, "on", 2)) {
> > +		enabled = true;
> > +		pr_info("Ignoring asi=on param while ASI implementation is incomplete.\n");
> > +	} else {
> > +		pr_info("ASI %s by default.\n",
> > +			enabled ? "enabled" : "disabled");
> > +	}
> > +
> > +	if (enabled)
> > +		pr_info("ASI enablement ignored due to incomplete implementation.\n");
> 
> Incomplete how?

This is referring to the fact that ASI is still not fully/correctly
functional, but it will be after the following patches.

I think it will be clearer if we just add the feature flag here so that
we have something to check for in the following patches, but add the
infrastructure for boot-time enablement at the end of the series when
the impelemntation is complete.

Basically start by a feature flag that has no way of being enabled, use
it in the implmentation, then add means of enabling it.

> 
> > +}
> > +
> >  static void __asi_destroy(struct asi *asi)
> >  {
> > -	lockdep_assert_held(&asi->mm->asi_init_lock);
> > +	WARN_ON_ONCE(asi->ref_count <= 0);
> > +	if (--(asi->ref_count) > 0)
> 
> Switch that to
> 
> include/linux/kref.h
> 
> It gives you a sanity-checking functionality too so you don't need the WARN...

I think we hve internal changes that completely get rid of this
ref_count and simplifies the lifetime handling that we can squash here.
We basically keep ASI objects around until the process is torn down,
which makes this simpler and avoids the need for complex synchronization
when we try to context switch or run userspace without exiting ASI
(spoiler alert :) ).

> 
> > +		return;
> >  
> > +	free_pages((ulong)asi->pgd, PGD_ALLOCATION_ORDER);
> > +	memset(asi, 0, sizeof(struct asi));
> 
> And then you can do:
> 
> 	if (kref_put())
> 		free_pages...
> 
> and so on.
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 

