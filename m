Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B20035F44E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfRD5Lj2z3hHl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1p0Ks6z3dsV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1k6159z4xHZ;
	Wed,  5 Oct 2022 00:39:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926075726.2846-1-nicholas@linux.ibm.com>
References: <20220926075726.2846-1-nicholas@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Message-Id: <166488992976.779920.838090389693307955.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:29 +1100
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

On Mon, 26 Sep 2022 07:57:23 +0000, Nicholas Miehlbradt wrote:
> There is support for DEBUG_PAGEALLOC on hash but not on radix.
> Add support on radix.
> 
> 

Applied to powerpc/next.

[1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
      https://git.kernel.org/powerpc/c/5e8b2c4dd3a0a4a2966e61d60dbeafab441cff28
[2/4] powerpc/64s: Remove unneeded #ifdef CONFIG_DEBUG_PAGEALLOC in hash_utils
      https://git.kernel.org/powerpc/c/3e791d0f32b10eff9437822c6099c7a158560151
[3/4] powerpc/64s: Allow double call of kernel_[un]map_linear_page()
      https://git.kernel.org/powerpc/c/d7902d31cbc3bf72722768831a684b0286ccd523
[4/4] powerpc/64s: Enable KFENCE on book3s64
      https://git.kernel.org/powerpc/c/a5edf9815dd739fce660b4c8658f61b7d2517042

cheers
