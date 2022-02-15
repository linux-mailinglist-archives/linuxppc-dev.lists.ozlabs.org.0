Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D04B62DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:34:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVC10lvgz3cZM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:34:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6D2XdCz3cTw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6D4H4yz4y4f;
 Tue, 15 Feb 2022 16:30:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210120181847.952106-1-farosas@linux.ibm.com>
References: <20210120181847.952106-1-farosas@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix debug print in smp_setup_cpu_maps
Message-Id: <164490279528.270256.11297930701793281955.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:35 +1100
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

On Wed, 20 Jan 2021 15:18:47 -0300, Fabiano Rosas wrote:
> When figuring out the number of threads, the debug message prints "1
> thread" for the first iteration of the loop, instead of the actual
> number of threads calculated from the length of the
> "ibm,ppc-interrupt-server#s" property.
> 
>   * /cpus/PowerPC,POWER8@20...
>     ibm,ppc-interrupt-server#s -> 1 threads <--- WRONG
>     thread 0 -> cpu 0 (hard id 32)
>     thread 1 -> cpu 1 (hard id 33)
>     thread 2 -> cpu 2 (hard id 34)
>     thread 3 -> cpu 3 (hard id 35)
>     thread 4 -> cpu 4 (hard id 36)
>     thread 5 -> cpu 5 (hard id 37)
>     thread 6 -> cpu 6 (hard id 38)
>     thread 7 -> cpu 7 (hard id 39)
>   * /cpus/PowerPC,POWER8@28...
>     ibm,ppc-interrupt-server#s -> 8 threads
>     thread 0 -> cpu 8 (hard id 40)
>     thread 1 -> cpu 9 (hard id 41)
>     thread 2 -> cpu 10 (hard id 42)
>     thread 3 -> cpu 11 (hard id 43)
>     thread 4 -> cpu 12 (hard id 44)
>     thread 5 -> cpu 13 (hard id 45)
>     thread 6 -> cpu 14 (hard id 46)
>     thread 7 -> cpu 15 (hard id 47)
> (...)
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix debug print in smp_setup_cpu_maps
      https://git.kernel.org/powerpc/c/b53c86105919d4136591e3bee198a4829c0f5062

cheers
