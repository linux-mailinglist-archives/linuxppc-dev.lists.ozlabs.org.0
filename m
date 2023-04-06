Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DC6D8BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:37:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMyX6BNDz3fcY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsMxc0kJkz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 10:36:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsMxb5Hs4z4xDr;
	Thu,  6 Apr 2023 10:36:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230403045314.3095410-1-mpe@ellerman.id.au>
References: <20230403045314.3095410-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] KVM: PPC: BookE: Fix W=1 warnings
Message-Id: <168074126988.3672916.8350769200565877785.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 10:34:29 +1000
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

On Mon, 03 Apr 2023 14:53:14 +1000, Michael Ellerman wrote:
> Fix various W=1 warnings in booke.c:
> 
>   arch/powerpc/kvm/booke.c:1008:5: error: no previous prototype for ‘kvmppc_handle_exit’ [-Werror=missing-prototypes]
>    1008 | int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
>         |     ^~~~~~~~~~~~~~~~~~
>   arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'vcpu' not described in 'kvmppc_handle_exit'
>   arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'exit_nr' not described in 'kvmppc_handle_exit'
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: BookE: Fix W=1 warnings
      https://git.kernel.org/powerpc/c/43d05c6123ca1ace5982ca326c156502e735b7d5

cheers
