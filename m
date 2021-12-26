Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029F47F927
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:57:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZQh6nqlz2yQG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:57:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLx339Pz2ywm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:54:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLx27HWz4xn2;
 Mon, 27 Dec 2021 08:54:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nick Child <nnac123@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
Subject: Re: [PATCH v2 00/20] powerpc: Define eligible functions as __init
Message-Id: <164055554810.3187272.13465033772962220255.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Dec 2021 17:00:15 -0500, Nick Child wrote:
> This patchset focuses on redefining/declaring functions that could be
> labeled with the macro `__init`. From my understanding, an
> initialization function is one which is only needed during the initial
> phases of booting, after which it's resources can be freed. I figure
> that any function which is only called by other initialization
> functions may also be labeled as an initialization function. There are
> several (mostly static) functions which can and should be labeled as
> `__init`. I created some scripts to help identify these functions. It
> scans all functions defined in `arch/powerpc` and, if it is only called
> by functions with the `__init` attribute, it will go on to adjust the
> prototype and definition to include the `__init` declaration. This
> patchset hopes to solve related issue #282:
>   https://github.com/linuxppc/issues/issues/282
> 
> [...]

Applied to powerpc/next.

[01/20] powerpc/kernel: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/d276960d9296b6a9074795fe60a513abf8474e35
[02/20] powerpc/lib: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/ce0c6be9c69883df38e7631d1d7364b52f6db135
[03/20] powerpc/mm: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/c13f2b2bb5afd90f152c389c1c9245a0d43bce80
[04/20] powerpc/perf: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/c49f5d88ff0166ffa4e48ee8ce84d63719f346be
[05/20] powerpc/sysdev: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/6c552983d0e65a8c923dfacc4f69b694205672c1
[06/20] powerpc/xmon: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/456e8eb324a47573b377f7041f4c038fac403f86
[07/20] powerpc/cell: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/7c1ab16b2d035c6bc3b6b6980ab7e72f547edc45
[08/20] powerpc/chrp: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/d3aa3c5edf0cb7ac0b0b5b0d144bba60b0ee77da
[09/20] powerpc/pasemi: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/e37e06af9b0d6b7828159455d33f8ef45c456460
[10/20] powerpc/powermac: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/b346f57100e9417f23ee9051f0efe621a492be96
[11/20] powerpc/powernv: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/e5913db1ef22817e128f0a794752f7393205e00b
[12/20] powerpc/pseries: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/e14ff96d08f0ade9dd33081d909ad65a02a858c1
[13/20] powerpc/ps3: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/f1ba9b9474a9e32b9c173c91e71f713bfa7b2463
[14/20] powerpc/4xx: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/1e3d992d213928851f7ddec6f150fb54fe759b64
[15/20] powerpc/44x: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/1ee969be25ed21a1192ca569ad827013eb7fac04
[16/20] powerpc/embedded6xx: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/c0dc225ae7dd9f01d46ea779f7f169d49aa59b78
[17/20] powerpc/83xx: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/f4a88b0ef5c5f7ce218aced7d811a31dd311a0b0
[18/20] powerpc/85xx: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/407454cafd3f1878dae6bb839d8bac2db264300f
[19/20] powerpc/512x: Add __init attribute to eligible functions
        https://git.kernel.org/powerpc/c/2493a24271dab3d5c1235a13cf6ee2d12773c9a1
[20/20] cuda/pmu: Make find_via_cuda/pmu init functions
        https://git.kernel.org/powerpc/c/7da1d1ddd1f02e5de7497a0c849256912652fb6c

cheers
