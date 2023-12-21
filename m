Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9D81B417
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:45:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnBN1XCrz3w1L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5b4J3nz3cVj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5b3RtKz4xNG;
	Thu, 21 Dec 2023 21:40:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231206115548.1466874-1-mpe@ellerman.id.au>
References: <20231206115548.1466874-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/Makefile: Don't use $(ARCH) unnecessarily
Message-Id: <170315510011.2192823.10396130939206059927.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 06 Dec 2023 22:55:45 +1100, Michael Ellerman wrote:
> There's no need to use $(ARCH) for references to the arch directory in
> the source tree, it is always arch/powerpc.
> 
> 

Applied to powerpc/next.

[1/4] powerpc/Makefile: Don't use $(ARCH) unnecessarily
      https://git.kernel.org/powerpc/c/dc420877b5bd92db5d80df6b117c7a0f987290af
[2/4] powerpc/vdso: No need to undef powerpc for 64-bit build
      https://git.kernel.org/powerpc/c/42449052c94f22e18e01d71147d8fd75cb58132a
[3/4] powerpc/Makefile: Default to ppc64le_defconfig when cross building
      https://git.kernel.org/powerpc/c/22f17b02f88b48c01d3ac38d40d2b0b695ab2d10
[4/4] powerpc/Makefile: Auto detect cross compiler
      https://git.kernel.org/powerpc/c/402928b58ec62b42b11992a7b51ff2f56ed65a18

cheers
