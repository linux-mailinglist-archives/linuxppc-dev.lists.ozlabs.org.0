Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8D22C8CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:08:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCszH0C2KzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:08:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgj6mdSzDrdf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BCqgh2kJVz9sVG; Fri, 24 Jul 2020 23:25:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgg6Zy0z9sTj; Fri, 24 Jul 2020 23:25:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200716122142.3776261-1-mpe@ellerman.id.au>
References: <20200716122142.3776261-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Run per_event_excludes test on Power8
 or later
Message-Id: <159559696743.1657499.11504671848869579021.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:02 +1000 (AEST)
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

On Thu, 16 Jul 2020 22:21:42 +1000, Michael Ellerman wrote:
> The per_event_excludes test wants to run on Power8 or later. But
> currently it checks that AT_BASE_PLATFORM *equals* power8, which means
> it only runs on Power8.
> 
> Fix it to check for the ISA 2.07 feature, which will be set on Power8
> and later CPUs.

Applied to powerpc/next.

[1/1] selftests/powerpc: Run per_event_excludes test on Power8 or later
      https://git.kernel.org/powerpc/c/9d1ebe9a98c1d7bf7cfbe1dba0052230c042ecdb

cheers
