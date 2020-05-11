Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E71CD237
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:08:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LBqg4rKhzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LBp76wZjzDqLp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49LBp73y7jz8tJD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:07:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49LBp73F6Kz9sPF; Mon, 11 May 2020 17:07:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by ozlabs.org (Postfix) with ESMTP id 49LBp54T4hz9sSF;
 Mon, 11 May 2020 17:07:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 04B77Lor008138;
 Mon, 11 May 2020 02:07:21 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 04B77L6w008134;
 Mon, 11 May 2020 02:07:21 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 11 May 2020 02:07:21 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH RFC 3/4] powerpc/microwatt: Add early debug UART support
 for Microwatt
Message-ID: <20200511070721.GQ31009@gate.crashing.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050340.GD1464954@thinks.paulus.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509050340.GD1464954@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@ozlabs.org, Michael Neuling <mikey@neuling.org>,
 Benjamin Herrenschmidt <benh@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, May 09, 2020 at 03:03:40PM +1000, Paul Mackerras wrote:
> +	__asm__ volatile("mtmsrd %3,0; ldcix %0,%1,%2; mtmsrd %4,0"
> +			 : "=r" (val) : "b" (potato_uart_base), "r" (offset),
> +			   "r" (msr & ~MSR_DR), "r" (msr));

That should be  "=&r"(val)  (an earlyclobber), because when %0 is
written, %4 will still be used later.

Looks fine otherwise.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
