Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68C9295C8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmQP6xbNz3dCm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ117VZz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ06MdQz4wc3;
	Sun,  7 Jul 2024 09:12:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240701130021.578240-1-hbathini@linux.ibm.com>
References: <20240701130021.578240-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v3] radix/kfence: map __kfence_pool at page granularity
Message-Id: <172030740420.964765.16253599039112772802.b4-ty@ellerman.id.au>
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Marco Elver <elver@google.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Potapenko <glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jul 2024 18:30:21 +0530, Hari Bathini wrote:
> When KFENCE is enabled, total system memory is mapped at page level
> granularity. But in radix MMU mode, ~3GB additional memory is needed
> to map 100GB of system memory at page level granularity when compared
> to using 2MB direct mapping. This is not desired considering KFENCE is
> designed to be enabled in production kernels [1]. Also, mapping only
> the memory allocated for KFENCE pool at page granularity is sufficient
> to enable KFENCE support. So, allocate __kfence_pool during bootup and
> map it at page granularity instead of mapping all system memory at
> page granularity.
> 
> [...]

Applied to powerpc/next.

[1/1] radix/kfence: map __kfence_pool at page granularity
      https://git.kernel.org/powerpc/c/353d7a84c214f184d5a6b62acdec8b4424159b7c

cheers
