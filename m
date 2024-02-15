Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE08563F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFdx6swDz3dXf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFYX13yGz3vkr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 00:01:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFYW71SYz4wcl;
	Fri, 16 Feb 2024 00:01:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231229120107.2281153-1-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 1/5] powerpc/smp: Adjust nr_cpu_ids to cover all threads of a core
Message-Id: <170800202447.601034.7290612623478478380.b4-ty@ellerman.id.au>
Date: Fri, 16 Feb 2024 00:00:24 +1100
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
Cc: Pingfan Liu <kernelfans@gmail.com>, Pingfan Liu <piliu@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 Dec 2023 23:01:03 +1100, Michael Ellerman wrote:
> If nr_cpu_ids is too low to include at least all the threads of a single
> core adjust nr_cpu_ids upwards. This avoids triggering odd bugs in code
> that assumes all threads of a core are available.
> 
> 

Applied to powerpc/next.

[1/5] powerpc/smp: Adjust nr_cpu_ids to cover all threads of a core
      https://git.kernel.org/powerpc/c/5580e96dad5a439d561d9648ffcbccb739c2a120
[2/5] powerpc/smp: Increase nr_cpu_ids to include the boot CPU
      https://git.kernel.org/powerpc/c/777f81f0a9c780a6443bcf2c7785f0cc2e87c1ef
[3/5] powerpc/smp: Lookup avail once per device tree node
      https://git.kernel.org/powerpc/c/dca79603fbc592ec7ea8bd7ba274052d3984e882
[4/5] powerpc/smp: Factor out assign_threads()
      https://git.kernel.org/powerpc/c/9832de654499f0bf797a3719c4d4c5bd401f18f5
[5/5] powerpc/smp: Remap boot CPU onto core 0 if >= nr_cpu_ids
      https://git.kernel.org/powerpc/c/0875f1ceba974042069f04946aa8f1d4d1e688da

cheers
