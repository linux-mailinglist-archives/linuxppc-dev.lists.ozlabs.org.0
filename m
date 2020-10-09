Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E52881F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:06:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yHm26LFzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yF84j5bzDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yF82Kfmz9sTL; Fri,  9 Oct 2020 17:03:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
References: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] Enable usage of larger LMB ( > 4G)
Message-Id: <160222339601.867048.474866853814379407.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:03:56 +1100 (AEDT)
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Oct 2020 17:18:32 +0530, Aneesh Kumar K.V wrote:
> Changes from v2:
> * Don't use root addr and size cells during runtime. Walk up the
>   device tree and use the first addr and size cells value (of_n_addr_cells()/
>   of_n_size_cells())
> 
> Aneesh Kumar K.V (4):
>   powerpc/drmem: Make lmb_size 64 bit
>   powerpc/memhotplug: Make lmb size 64bit
>   powerpc/book3s64/radix: Make radix_mem_block_size 64bit
>   powerpc/lmb-size: Use addr #size-cells value when fetching lmb-size
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/drmem: Make lmb_size 64 bit
      https://git.kernel.org/powerpc/c/ec72024e35dddb88a81e40071c87ceb18b5ee835
[2/4] powerpc/memhotplug: Make lmb size 64bit
      https://git.kernel.org/powerpc/c/301d2ea6572386245c5d2d2dc85c3b5a737b85ac
[3/4] powerpc/book3s64/radix: Make radix_mem_block_size 64bit
      https://git.kernel.org/powerpc/c/950805f4d90eda14325ceab56b0f00d034baa8bc
[4/4] powerpc/lmb-size: Use addr #size-cells value when fetching lmb-size
      https://git.kernel.org/powerpc/c/fbf2f134c8c312d3166534a8bd6a1aaee6e9c7ef

cheers
