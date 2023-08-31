Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FC78E53F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbncp10Myz3cDl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncG2Cb3z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncD1m1lz4wy0;
	Thu, 31 Aug 2023 14:04:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
References: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/mm/book3s64: Fix build error with SPARSEMEM disabled
Message-Id: <169345455033.11824.994989718132322236.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Cc: foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Aug 2023 13:16:57 +0530, Aneesh Kumar K.V wrote:
> With CONFIG_SPARSEMEM disabled the below kernel build error is observed.
> 
>  arch/powerpc/mm/init_64.c:477:38: error: use of undeclared identifier 'SECTION_SIZE_BITS'
> 
> CONFIG_MEMORY_HOTPLUG depends on CONFIG_SPARSEMEM and it is more clear
> to describe the code dependency in terms of MEMORY_HOTPLUG. Outside
> memory hotplug the kernel uses memory_block_size for kernel directmap.
> Instead of depending on SECTION_SIZE_BITS to compute the direct map
> page size, add a new #define which defaults to 16M(same as existing
> SECTION_SIZE)
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/mm/book3s64: Fix build error with SPARSEMEM disabled
      https://git.kernel.org/powerpc/c/f1424755db913c5971686537381588261cdfd1ee
[2/2] powerpc/mm/book3s64: Use 256M as the upper limit with coherent device memory attached
      https://git.kernel.org/powerpc/c/4c33bf147249ebbf3dded016996a8a24c5737254

cheers
