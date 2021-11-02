Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD95442D12
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7R90ZjCz3fsD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fw68D6z3081
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fw1mYlz4xdP;
 Tue,  2 Nov 2021 22:38:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211015001649.45591-1-joel@jms.id.au>
References: <20211015001649.45591-1-joel@jms.id.au>
Subject: Re: [PATCH v2] powerpc/64s: Default to 64K pages for 64 bit book3s
Message-Id: <163584791566.1845480.7370274887571267257.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:55 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 10:46:49 +1030, Joel Stanley wrote:
> For 64-bit book3s the default should be 64K as that's what modern CPUs
> are designed for.
> 
> The following defconfigs already set CONFIG_PPC_64K_PAGES:
> 
>  cell_defconfig
>  pasemi_defconfig
>  powernv_defconfig
>  ppc64_defconfig
>  pseries_defconfig
>  skiroot_defconfig
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Default to 64K pages for 64 bit book3s
      https://git.kernel.org/powerpc/c/f22969a6604165df658b99221b0aeb6918a9026d

cheers
