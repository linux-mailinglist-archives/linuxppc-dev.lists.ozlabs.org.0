Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924145328A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sCY3WPhz3fQb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7Y5bG5z3bkD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7Y0nh8z4ySt;
 Tue, 24 May 2022 21:15:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Finn Thain <fthain@linux-m68k.org>
In-Reply-To: <5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org>
References: <5edbe76ce68227f71e09af4614cc4c1bd61c7ec8.1649326292.git.fthain@linux-m68k.org>
Subject: Re: [PATCH v2] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
Message-Id: <165339058086.1718562.16646756520470631496.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:40 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 07 Apr 2022 20:11:32 +1000, Finn Thain wrote:
> drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
> via-pmu-event.c:(.init.text+0x20): undefined reference to `input_allocate_device'
> via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_register_device'
> via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free_device'
> make[1]: *** [Makefile:1155: vmlinux] Error 1
> make: *** [Makefile:350: __build_one_by_one] Error 2
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
      https://git.kernel.org/powerpc/c/86ce436e30d86327c9f5260f718104ae7b21f506

cheers
