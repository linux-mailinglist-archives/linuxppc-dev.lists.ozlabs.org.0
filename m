Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F25850A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSgz22P7z3f5R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:15:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ70vrqz3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ55wVyz4x1Y;
	Fri, 29 Jul 2022 23:10:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, wim@linux-watchdog.org, linux@roeck-us.net, npiggin@gmail.com, nathanl@linux.ibm.com, christophe.leroy@csgroup.eu, Laurent Dufour <ldufour@linux.ibm.com>, rdunlap@infradead.org
In-Reply-To: <20220713154729.80789-1-ldufour@linux.ibm.com>
References: <20220713154729.80789-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] Extending NMI watchdog during LPM
Message-Id: <165909973609.253830.7930031213898440605.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:16 +1000
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 17:47:25 +0200, Laurent Dufour wrote:
> When a partition is transferred, once it arrives at the destination node,
> the partition is active but much of its memory must be transferred from the
> start node.
> 
> It depends on the activity in the partition, but the more CPU the partition
> has, the more memory to be transferred is likely to be. This causes latency
> when accessing pages that need to be transferred, and often, for large
> partitions, it triggers the NMI watchdog.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/mobility: wait for memory transfer to complete
      https://git.kernel.org/powerpc/c/882c0d1704cf61df13f01933269202d51e74b9f3
[2/4] watchdog: export lockup_detector_reconfigure
      https://git.kernel.org/powerpc/c/7c56a8733d0a2a4be2438a7512566e5ce552fccf
[3/4] powerpc/watchdog: introduce a NMI watchdog's factor
      https://git.kernel.org/powerpc/c/f5e74e836097d1004077390717d4bd95d4a2c27a
[4/4] pseries/mobility: set NMI watchdog factor during an LPM
      https://git.kernel.org/powerpc/c/118b1366930c8c833b8b36abef657f40d4e26610

cheers
