Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75453D09DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 09:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV6ss5pf5z3bf0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 17:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV6sY0W5Wz2yP1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 17:39:12 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GV6sX4B2Gz9sXJ; Wed, 21 Jul 2021 17:39:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210716024310.164448-1-npiggin@gmail.com>
References: <20210716024310.164448-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
Message-Id: <162685313071.1066498.453375758692637604.b4-ty@ellerman.id.au>
Date: Wed, 21 Jul 2021 17:38:50 +1000
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jul 2021 12:43:09 +1000, Nicholas Piggin wrote:
> When running CPU_FTR_P9_TM_HV_ASSIST, HFSCR[TM] is set for the guest
> even if the host has CONFIG_TRANSACTIONAL_MEM=n, which causes it to be
> unprepared to handle guest exits while transactional.
> 
> Normal guests don't have a problem because the HTM capability will not
> be advertised, but a rogue or buggy one could crash the host.

Applied to powerpc/fixes.

[1/2] KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
      https://git.kernel.org/powerpc/c/bd31ecf44b8e18ccb1e5f6b50f85de6922a60de3
[2/2] KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
      https://git.kernel.org/powerpc/c/bc4188a2f56e821ea057aca6bf444e138d06c252

cheers
