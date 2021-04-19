Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1F363A21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtfQ0V7Xz3g0f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVr0KnSz3cX2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:34 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVh1jqgz9vHV; Mon, 19 Apr 2021 14:04:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210402024124.545826-1-npiggin@gmail.com>
References: <20210402024124.545826-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1
 processors
Message-Id: <161880480802.1398509.2944115945091458775.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:08 +1000
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

On Fri, 2 Apr 2021 12:41:24 +1000, Nicholas Piggin wrote:
> Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
> mode for HV=1 interrupts. Instead, a new LPCR[HAIL] bit is defined
> which behaves like AIL=3 for HV interrupts when set.
> 
> Set HAIL on bare metal to give us mmu-on interrupts and improve
> performance.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors
      https://git.kernel.org/powerpc/c/49c1d07fd04f54eb588c4a1dfcedc8d22c5ffd50

cheers
