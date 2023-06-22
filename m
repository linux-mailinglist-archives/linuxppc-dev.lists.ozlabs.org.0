Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662D73A02D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:58:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pSWWLPWk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzQb33Dsz2yHr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pSWWLPWk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmzPd60B9z2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:57:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dnuSRjit9BClyf8ssWCLDDODxXJZmhDnJ4paeO5Nhx4=; b=pSWWLPWkaaoJwHc5BYho2poyPl
	eIWhn/5lqy2SEgEoeR3nAv0aJ8EHJmEWIJd1pNAfu6XYd3iA1O0K29sU64D64FD89ly99k0csSzr6
	/Yf44ZWG5r1/r112unkcSNqmOEFsnJ0IvnVjdtAkNmAO9AQWc1o4P0yHC+mBLwUSiUQ7FE0bdA9lh
	v6HwdXpSBBNckOoEpyjh5Vl/7X7BxoC8B860EG/qV4xYN9NQxldNh1LTQhU35lNy0OPwpkt+6q1EM
	TEp5tJ83ZWBXcldmwOlDKqgo28P7Gral3S6BrII6lffytuKus/FlQUaypbE+qdNfn7/7v3vGBBB92
	oDeVJM5Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qCIvr-00FZUB-Ln; Thu, 22 Jun 2023 11:56:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4B83F300338;
	Thu, 22 Jun 2023 13:56:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1FD74241BF9B6; Thu, 22 Jun 2023 13:56:59 +0200 (CEST)
Date: Thu, 22 Jun 2023 13:56:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Message-ID: <20230622115659.GO4253@hirez.programming.kicks-ass.net>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 12:54:36PM +0200, Christophe Leroy wrote:

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index f850ab892ad5..8ac5711a055f 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -218,6 +218,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  		"kthread_exit",
>  		"kunit_try_catch_throw",
>  		"lbug_with_loc",
> +		"longjmp",
>  		"machine_real_restart",
>  		"make_task_dead",
>  		"mpt_halt_firmware",
> @@ -230,7 +231,9 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  		"sev_es_terminate",
>  		"snp_abort",
>  		"start_kernel",
> +		"start_secondary_resume",
>  		"stop_this_cpu",
> +		"unrecoverable_exception",
>  		"usercopy_abort",
>  		"x86_64_start_kernel",
>  		"x86_64_start_reservations",

Someone went and changed all that in tip/objtool/core :-)

But perhaps, like the uaccess_safe_builtins[] array below, should we
start marking sections so we can remember where stuff comes from later?

> @@ -1335,6 +1338,8 @@ static const char *uaccess_safe_builtin[] = {
>  	"rep_stos_alternative",
>  	"rep_movs_alternative",
>  	"__copy_user_nocache",
> +	"__copy_tofrom_user",
> +	"__arch_clear_user",
>  	NULL
>  };

Do we want to rename the 'misc' sectino to 'x86' and start a 'ppc32'
section there?

