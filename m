Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3994474F6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:45:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGkQ44k1z2xtW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGk220wtz2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:45:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGjz73kyz4xRB;
 Wed, 15 Dec 2021 11:45:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210901084550.1658699-1-aik@ozlabs.ru>
References: <20210901084550.1658699-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Book3S: Suppress failed alloc warning in
 H_COPY_TOFROM_GUEST
Message-Id: <163952881392.928111.6712272924823006428.b4-ty@ellerman.id.au>
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

On Wed, 1 Sep 2021 18:45:50 +1000, Alexey Kardashevskiy wrote:
> H_COPY_TOFROM_GUEST is an hcall for an upper level VM to access its nested
> VMs memory. The userspace can trigger WARN_ON_ONCE(!(gfp & __GFP_NOWARN))
> in __alloc_pages() by constructing a tiny VM which only does
> H_COPY_TOFROM_GUEST with a too big GPR9 (number of bytes to copy).
> 
> This silences the warning by adding __GFP_NOWARN.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST
      https://git.kernel.org/powerpc/c/792020907b11c6f9246c21977cab3bad985ae4b6

cheers
