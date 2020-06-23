Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D10204D5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:04:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rgMY5XckzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 19:04:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=aIBArjKQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rgKj21LTzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 19:03:05 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C77020723;
 Tue, 23 Jun 2020 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592902983;
 bh=dwWcASt70MTuxccXh9SiyO0yx9YTgv4Fs1v9uGeJeog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aIBArjKQcPyob07dgdMW1n0RPQYZmKhdnf7NDLJ9uG1vh48+wabjCoHwI6zYolY0m
 QysB5Pq1bMfO3l+UnqTrhM/Q+Xs0ksycC2hlHacWZPIYTvSxCNf3NknfQR0wETfDM4
 /4nBQyW/f6EuIdcyG2e/KuC2gNBLzUs/O26ZmIAI=
Date: Tue, 23 Jun 2020 10:02:57 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 6/8] arm: Break cyclic percpu include
Message-ID: <20200623090257.GA3743@willie-the-truck>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.454517573@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623083721.454517573@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, bigeasy@linutronix.de, x86@kernel.org,
 heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 davem@davemloft.net, a.darwish@linutronix.de, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 10:36:51AM +0200, Peter Zijlstra wrote:
> In order to use <asm/percpu.h> in irqflags.h, we need to make sure
> asm/percpu.h does not itself depend on irqflags.h.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/arm/include/asm/percpu.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- a/arch/arm/include/asm/percpu.h
> +++ b/arch/arm/include/asm/percpu.h
> @@ -10,6 +10,8 @@
>   * in the TPIDRPRW. TPIDRPRW only exists on V6K and V7
>   */
>  #if defined(CONFIG_SMP) && !defined(CONFIG_CPU_V6)
> +register unsigned long current_stack_pointer asm ("sp");

If you define this unconditionally, then we can probably get rid of the
copy in asm/thread_info.h, rather than duplicate the same #define.

Will
