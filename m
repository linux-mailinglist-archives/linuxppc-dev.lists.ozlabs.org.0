Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4073E737C7B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 09:45:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=P4wD/i70;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmFsb0XN0z3bZ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 17:45:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmFrX6g6tz30Nn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 17:44:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XIUg3gDajjXx1L9B+6vEGFUgDSherxnnB+qfdlVJNWU=; b=P4wD/i70lrhaTSBrIAiJA1ZJw4
	Q6Q6jj7EaLa5t9YFa47VdKWDJfVTyYN3lQ0GXxuvHgEUZP0PWzJVNfKdnaFahJYDMSXhG8X2Odb47
	IEYEKArt2e4aY7U7kesU85LQpAKjdy484CGV92R8iAsWzNcL/oGQy8MmRoyYQi4EMKxH6VExImUAr
	T42Z/1JwMe5xnRb7wjg65ARU47dJMomPDfxxJrkdtta/lmPJ/5iyuHMpCWw5k4JG2izlKzW9XejsZ
	L3g4lEcetUs1uGuta7zyI3tfPv1wTYXeeTxVWCCKUBfUHRh69yyy9eghCAPLDPBq5pU8JRIYnmsUx
	P4K8pevA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsVC-00HIVK-1L;
	Wed, 21 Jun 2023 07:43:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0B475300222;
	Wed, 21 Jun 2023 09:43:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E49482BD11718; Wed, 21 Jun 2023 09:43:37 +0200 (CEST)
Date: Wed, 21 Jun 2023 09:43:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH v2 0/2] send tlb_remove_table_smp_sync IPI only to
 necessary CPUs
Message-ID: <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620144618.125703-1-ypodemsk@redhat.com>
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
Cc: geert+renesas@glider.be, david@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, ppandit@redhat.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 05:46:16PM +0300, Yair Podemsky wrote:
> Currently the tlb_remove_table_smp_sync IPI is sent to all CPUs
> indiscriminately, this causes unnecessary work and delays notable in
> real-time use-cases and isolated cpus.
> By limiting the IPI to only be sent to cpus referencing the effected
> mm.
> a config to differentiate architectures that support mm_cpumask from
> those that don't will allow safe usage of this feature.
> 
> changes from -v1:
> - Previous version included a patch to only send the IPI to CPU's with
> context_tracking in the kernel space, this was removed due to race 
> condition concerns.
> - for archs that do not maintain mm_cpumask the mask used should be
>  cpu_online_mask (Peter Zijlstra).
>  

Would it not be much better to fix the root cause? As per the last time,
there's patches that cure the thp abuse of this.
