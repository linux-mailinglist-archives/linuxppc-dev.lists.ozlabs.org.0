Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F39474F6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:45:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGks3gd4z305B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGk24n6Vz2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:45:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGk23nZqz4xd4;
 Wed, 15 Dec 2021 11:45:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210901084512.1658628-1-aik@ozlabs.ru>
References: <20210901084512.1658628-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
Message-Id: <163952881326.928111.10777487820265480047.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:40:13 +1100
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Sep 2021 18:45:12 +1000, Alexey Kardashevskiy wrote:
> The userspace can trigger "vmalloc size %lu allocation failure: exceeds
> total pages" via the KVM_SET_USER_MEMORY_REGION ioctl.
> 
> This silences the warning by checking the limit before calling vzalloc()
> and returns ENOMEM if failed.
> 
> This does not call underlying valloc helpers as __vmalloc_node() is only
> exported when CONFIG_TEST_VMALLOC_MODULE and __vmalloc_node_range() is not
> exported at all.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S: Suppress warnings when allocating too big memory slots
      https://git.kernel.org/powerpc/c/511d25d6b789fffcb20a3eb71899cf974a31bd9d

cheers
