Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53C3639F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:06:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtXT56Wrz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4FNtVP19s3z3c0k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:13 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVN4SY4z9vGW; Mon, 19 Apr 2021 14:04:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
Subject: Re: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
Message-Id: <161880478844.1398509.6358522077010393586.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 16:45:05 +0200, Cédric Le Goater wrote:
> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
> 
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
> 
> [...]

Patches 2-9 applied to powerpc/next.

[2/9] powerpc/xive: Introduce an IPI interrupt domain
      https://git.kernel.org/powerpc/c/7d348494136c8b47c39d1f7ccba28c47d5094a54
[3/9] powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
      https://git.kernel.org/powerpc/c/1835e72942b5aa779c8ada62aaeba03ab66d92c9
[4/9] powerpc/xive: Simplify xive_core_debug_show()
      https://git.kernel.org/powerpc/c/5159d9872823230669b7949ba3caf18c4c314846
[5/9] powerpc/xive: Drop check on irq_data in xive_core_debug_show()
      https://git.kernel.org/powerpc/c/a74ce5926b20cd0e6d624a9b2527073a96dfed7f
[6/9] powerpc/xive: Simplify the dump of XIVE interrupts under xmon
      https://git.kernel.org/powerpc/c/6bf66eb8f404050030805c65cf39a810892f5f8e
[7/9] powerpc/xive: Fix xmon command "dxi"
      https://git.kernel.org/powerpc/c/33e4bc5946432a4ac173fd08e8e30a13ab94d06d
[8/9] powerpc/xive: Map one IPI interrupt per node
      https://git.kernel.org/powerpc/c/7dcc37b3eff97379b194adb17eb9a8270512dd1d
[9/9] powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
      https://git.kernel.org/powerpc/c/fd6db2892ebaa1383a93b4a609c65b96e615510a

cheers
