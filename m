Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6C3FC935
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzTMk0yrFz302D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzTLH0Twkz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:58:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzTLB1wD1z9t10;
 Tue, 31 Aug 2021 23:58:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
References: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/3] powerpc/smp: Misc fixes
Message-Id: <163041822209.889087.5904408364515318379.b4-ty@ellerman.id.au>
Date: Tue, 31 Aug 2021 23:57:02 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Aug 2021 15:33:58 +0530, Srikar Dronamraju wrote:
> Changelog : v1 -> v2:
> v1: https://lore.kernel.org/linuxppc-dev/20210821092419.167454-1-srikar@linux.vnet.ibm.com/t/#u``
> [ patch 1: Updated to use DIV_ROUND_UP instead of max to handle more situations ]
> [ patch 2: updated changelog to make it more generic powerpc issue ]
> 
> The 1st patch fixes a regression which causes a crash when booted with
> nr_cpus=2.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/smp: Fix a crash while booting kvm guest with nr_cpus=2
      https://git.kernel.org/powerpc/c/8efd249babea2fec268cff90b9f5ca723dbb7499
[2/3] powerpc/smp: Update cpu_core_map on all PowerPc systems
      https://git.kernel.org/powerpc/c/b8b928030332a0ca16d42433eb2c3085600d8704
[3/3] powerpc/smp: Enable CACHE domain for shared processor
      https://git.kernel.org/powerpc/c/5bf63497b8ddf53d8973f68076119e482639b2bb

cheers
