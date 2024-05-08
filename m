Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F418BFF07
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGXz4YYZz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXB3Dt6z2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXB2T20z4x2v;
	Wed,  8 May 2024 23:41:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20240325052815.854044-1-bgray@linux.ibm.com>
References: <20240325052815.854044-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/code-patching: Test patch_instructions() during boot
Message-Id: <171517558558.165093.8840549210363479947.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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

On Mon, 25 Mar 2024 16:28:14 +1100, Benjamin Gray wrote:
> patch_instructions() introduces new behaviour with a couple of
> variations. Test each case of
> 
>   * a repeated 32-bit instruction,
>   * a repeated 64-bit instruction (ppc64), and
>   * a copied sequence of instructions
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/code-patching: Test patch_instructions() during boot
      https://git.kernel.org/powerpc/c/c5ef5e35844ad30503c49802b9d6a6c818fca886
[2/2] powerpc/code-patching: Use dedicated memory routines for patching
      https://git.kernel.org/powerpc/c/c3710ee7cd695dc1b0b4b8cfbf464e313467f970

cheers
