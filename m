Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AF5E7928
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYqJ53BqCz3dqW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 21:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYqHg415Xz3c6J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 21:12:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYqHf6lBhz4xD1;
	Fri, 23 Sep 2022 21:12:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
In-Reply-To: <20220913075029.682327-1-cuigaosheng1@huawei.com>
References: <20220913075029.682327-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH 0/9] Remove unused declarations for powerpc
Message-Id: <166393063277.495724.14141313298392539224.b4-ty@ellerman.id.au>
Date: Fri, 23 Sep 2022 20:57:12 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Sep 2022 15:50:20 +0800, Gaosheng Cui wrote:
> This series contains a few cleanup patches, to remove unused
> declarations which have been removed. Thanks!
> 
> Gaosheng Cui (9):
>   powerpc/xmon: remove unused ppc_parse_cpu() declaration
>   powerpc/spufs: remove orphan declarations from spufs.h
>   powerpc: remove unused chrp_event_scan() declaration
>   powerpc: remove unused udbg_init_debug_beat() declaration
>   powerpc/mm: remove orphan declarations from mmu_context.h
>   powerpc/powernv: remove orphan declarations from opal.h
>   powerpc/sysdev: remove unused xics_ipi_dispatch() declaration
>   powerpc/ps3: remove orphan declarations from ps3av.h
>   KVM: PPC: remove orphan declarations from kvm_ppc.h
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/xmon: remove unused ppc_parse_cpu() declaration
      https://git.kernel.org/powerpc/c/edd100634a5eb99cf97868c419bdf44d44355c4f
[2/9] powerpc/spufs: remove orphan declarations from spufs.h
      https://git.kernel.org/powerpc/c/cf78ddd3a1040a84bf882eecea44626dbad450c4
[3/9] powerpc: remove unused chrp_event_scan() declaration
      https://git.kernel.org/powerpc/c/29e1eb9169a9c73985ed15361520900ce1cef1d4
[4/9] powerpc: remove unused udbg_init_debug_beat() declaration
      https://git.kernel.org/powerpc/c/b5a472ad81ba23327ef11ca5b4ba9fd8ed38e45e
[5/9] powerpc/mm: remove orphan declarations from mmu_context.h
      https://git.kernel.org/powerpc/c/d24b8f01fe7b848f88ff0a3204a674a092f365d0
[6/9] powerpc/powernv: remove orphan declarations from opal.h
      https://git.kernel.org/powerpc/c/77d30535816e90ff6a4466210c403a6b8b42a0a5
[7/9] powerpc/sysdev: remove unused xics_ipi_dispatch() declaration
      https://git.kernel.org/powerpc/c/3abed8acfe95046b27117f48d52dccd2ea82a322
[8/9] powerpc/ps3: remove orphan declarations from ps3av.h
      https://git.kernel.org/powerpc/c/b47f0024f990803f36e6a06f82e9d0dbe8424c26
[9/9] KVM: PPC: remove orphan declarations from kvm_ppc.h
      https://git.kernel.org/powerpc/c/3d7a198cfdb47405cfb4a3ea523876569fe341e6

cheers
