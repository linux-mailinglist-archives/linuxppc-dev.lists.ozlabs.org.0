Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E35785F44DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfNM6K1Dz3gw8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1k39Lpz3dpv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1k214sz4xHX;
	Wed,  5 Oct 2022 00:39:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926220250.157022-1-nathanl@linux.ibm.com>
References: <20220926220250.157022-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/smp: poll cpu_callin_map more aggressively in __cpu_up()
Message-Id: <166488995280.779920.3610162954505679118.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:52 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 17:02:50 -0500, Nathan Lynch wrote:
> At boot time, it is not necessary to delay between polls of
> cpu_callin_map when waiting for a kicked CPU to come up. Remove the
> delay intervals, but preserve the overall deadline (five seconds).
> 
> At run time, the first poll result is usually negative and we incur a
> sleeping wait. If we spin on the callin word for a short time first,
> we can reduce __cpu_up() from dozens of milliseconds to under 1ms in
> the common case on a P9 LPAR:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/smp: poll cpu_callin_map more aggressively in __cpu_up()
      https://git.kernel.org/powerpc/c/b37ac1894ac3c014863986d6b8ed880195213e78

cheers
