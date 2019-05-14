Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D151C239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 07:45:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45368s6DLzzDq6l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 15:45:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45366y6FkMzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 15:43:38 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x4E5hO0j014621;
 Tue, 14 May 2019 00:43:25 -0500
Message-ID: <a9f1e109e0b6de8abfabc62375403754ab22dcfc.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] [PowerPC] Add simd.h implementation
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Shawn Landden <shawn@git.icu>
Date: Tue, 14 May 2019 15:43:23 +1000
In-Reply-To: <20190514014412.25373-1-shawn@git.icu>
References: <20190513005104.20140-1-shawn@git.icu>
 <20190514014412.25373-1-shawn@git.icu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-05-13 at 22:44 -0300, Shawn Landden wrote:
> +
> +/*
> + * Were we in user mode when we were
> + * interrupted?
> + *
> + * Doing kernel_altivec/vsx_begin/end() is ok if we are running
> + * in an interrupt context from user mode - we'll just
> + * save the FPU state as required.
> + */
> +static bool interrupted_user_mode(void)
> +{
> +       struct pt_regs *regs = get_irq_regs();
> +
> +       return regs && user_mode(regs);
> +}
> +

That's interesting .... it *could* work but we'll have to careful audit
the code to make sure thats ok.

We probably also want to handle the case where the CPU is in the idle
loop.

Do we always save the user state when switching out these days ? If
yes, then there's no "live" state to worry about...

Cheers,
Ben.


