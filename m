Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CC8239B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 01:38:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ikxh+Mtb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T573h1DC2z3c5t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 11:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ikxh+Mtb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T572k3W08z2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 11:37:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TIrs4SVN4sRDCoR2FH1y2ydUgyXfkIj7iu/mUg4qpdk=; b=Ikxh+Mtbz4GAUdOd1bXxWWLrlB
	pGSr9SZaGlzzVkrssTh0BnOyVHZoapyzpE5XBIamNL8v45hj/wCVhQzr8Pr8ZCiQN4aP5MZvJa1uH
	B6AWmGpbuip67N10bR60c/8xmEx6101/vB/+b2M74ksqusrgD7jRMHapo2gkpODYvyRHRjJ7EcSQG
	bvpto/NSjrsJatdFEnMlBeEiWFUdWx4IrLf47b/t8HOHEPnShXnFnVF4UdHWbyHvELHS8YfGI4l5i
	pCJwfhx/sP6+69Z+51bWTSnRl9vKC3SvSSXkWBaTIv/cM/Q2vnE5ghdX5/Dfcqpj08Tua9zOgBJNY
	pyvbuIzQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rLBjK-00CV87-0P;
	Thu, 04 Jan 2024 00:37:02 +0000
Message-ID: <e3dcf2f8-85dc-4adc-b917-af494a829499@infradead.org>
Date: Wed, 3 Jan 2024 16:37:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] powerpc: Fix typos
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20240103231605.1801364-1-helgaas@kernel.org>
 <20240103231605.1801364-8-helgaas@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240103231605.1801364-8-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/3/24 15:16, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix typos, most reported by "codespell arch/powerpc".  Only touches
> comments, no code changes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/boot/Makefile                   |  4 ++--
>  arch/powerpc/boot/dts/acadia.dts             |  2 +-
>  arch/powerpc/boot/main.c                     |  2 +-
>  arch/powerpc/boot/ps3.c                      |  2 +-
>  arch/powerpc/include/asm/io.h                |  2 +-
>  arch/powerpc/include/asm/opal-api.h          |  4 ++--
>  arch/powerpc/include/asm/pmac_feature.h      |  2 +-
>  arch/powerpc/include/asm/uninorth.h          |  2 +-
>  arch/powerpc/include/uapi/asm/bootx.h        |  2 +-
>  arch/powerpc/kernel/eeh_pe.c                 |  2 +-
>  arch/powerpc/kernel/fadump.c                 |  2 +-
>  arch/powerpc/kernel/misc_64.S                |  4 ++--
>  arch/powerpc/kernel/process.c                | 12 ++++++------
>  arch/powerpc/kernel/ptrace/ptrace-tm.c       |  2 +-
>  arch/powerpc/kernel/smp.c                    |  2 +-
>  arch/powerpc/kernel/sysfs.c                  |  4 ++--
>  arch/powerpc/kvm/book3s_xive.c               |  2 +-
>  arch/powerpc/mm/cacheflush.c                 |  2 +-
>  arch/powerpc/mm/nohash/kaslr_booke.c         |  2 +-
>  arch/powerpc/platforms/512x/mpc512x_shared.c |  2 +-
>  arch/powerpc/platforms/cell/spufs/sched.c    |  2 +-
>  arch/powerpc/platforms/maple/pci.c           |  2 +-
>  arch/powerpc/platforms/powermac/pic.c        |  2 +-
>  arch/powerpc/platforms/powermac/sleep.S      |  2 +-
>  arch/powerpc/platforms/powernv/pci-sriov.c   |  4 ++--
>  arch/powerpc/platforms/powernv/vas-window.c  |  2 +-
>  arch/powerpc/platforms/pseries/vas.c         |  2 +-
>  arch/powerpc/sysdev/xive/common.c            |  4 ++--
>  arch/powerpc/sysdev/xive/native.c            |  2 +-
>  29 files changed, 40 insertions(+), 40 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
#Randy
