Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C332A3B3CAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:27:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6VH3dKqz3c38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6RX3GL6z30Hk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:40 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RW2fn2z9ssD; Fri, 25 Jun 2021 16:24:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210623041245.865134-1-npiggin@gmail.com>
References: <20210623041245.865134-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: offline CPU in stop_this_cpu
Message-Id: <162460208858.3247425.9514772539370272915.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:28 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Jun 2021 14:12:45 +1000, Nicholas Piggin wrote:
> printk_safe_flush_on_panic() has special lock breaking code for the
> case where we panic()ed with the console lock held. It relies on
> panic IPI causing other CPUs to mark themselves offline.
> 
> Do as most other architectures do.
> 
> This effectively reverts commit de6e5d38417e ("powerpc: smp_send_stop do
> not offline stopped CPUs"), unfortunately it may result in some false
> positive warnings, but the alternative is more situations where we can
> crash without getting messages out.

Applied to powerpc/next.

[1/1] powerpc: offline CPU in stop_this_cpu
      https://git.kernel.org/powerpc/c/bab26238bbd44d5a4687c0a64fd2c7f2755ea937

cheers
