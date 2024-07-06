Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC49295D3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmS52cwfz3fwy
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ23t06z3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ22g6yz4xPY;
	Sun,  7 Jul 2024 09:12:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20240603-fix-cpu-hwdesc-v1-1-945f2850fcaa@linux.ibm.com>
References: <20240603-fix-cpu-hwdesc-v1-1-945f2850fcaa@linux.ibm.com>
Subject: Re: [PATCH] powerpc/prom: Add CPU info to hardware description string later
Message-Id: <172030740413.964765.17776308171096929157.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 03 Jun 2024 07:36:55 -0500, Nathan Lynch wrote:
> cur_cpu_spec->cpu_name is appended to ppc_hw_desc before cur_cpu_spec
> has taken on its final value. This is illustrated on pseries by
> comparing the CPU name as reported at boot ("POWER8E (raw)") to the
> contents of /proc/cpuinfo ("POWER8 (architected)"):
> 
>   $ dmesg | grep Hardware
>   Hardware name: IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 \
>     of:IBM,FW860.50 (SV860_146) hv:phyp pSeries
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/prom: Add CPU info to hardware description string later
      https://git.kernel.org/powerpc/c/7bdd1c6c87de758750d419eedab7285b95b66417

cheers
