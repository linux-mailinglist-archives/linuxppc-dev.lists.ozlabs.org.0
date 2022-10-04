Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076345F449F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:46:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfBK5rTtz3fnF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:46:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1V2P8Xz3c5G
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1V1DNDz4xH9;
	Wed,  5 Oct 2022 00:38:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, mpe@ellerman.id.au
In-Reply-To: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
References: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL
Message-Id: <166488996654.779920.8718749297311438980.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:06 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Sep 2022 18:57:33 -0700, Haren Myneni wrote:
> Generally the hypervisor decides to allocate a window on different
> VAS instances. But if the user space wishes to allocate on the
> current VAS instance where the process is executing, the kernel has
> to pass associativity domain IDs to allocate VAS window HCALL. To
> determine the associativity domain IDs for the current CPU, passing
> smp_processor_id() to node associativity HCALL which may return
> H_P2 (-55) error during DLPAR CPU event.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL
      https://git.kernel.org/powerpc/c/f3e5d9e53e74d77e711a2c90a91a8b0836a9e0b3

cheers
