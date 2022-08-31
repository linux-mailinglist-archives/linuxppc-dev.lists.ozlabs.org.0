Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A965A7E8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHlBm21N9z3fgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl6K689wz3c69
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:15:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6K0xtgz4xGR;
	Wed, 31 Aug 2022 23:15:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
In-Reply-To: <20220817050640.406017-1-ruscur@russell.cc>
References: <20220817050640.406017-1-ruscur@russell.cc>
Subject: Re: [PATCH v4 1/2] powerpc/mm: Support execute-only memory on the Radix MMU
Message-Id: <166195163958.45984.15308325694886524412.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:13:59 +1000
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, npiggin@gmail.com, linux-hardening@vger.kernel.org, aneesh.kumar@linux.ibm.com, nicholas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Aug 2022 15:06:39 +1000, Russell Currey wrote:
> Add support for execute-only memory (XOM) for the Radix MMU by using an
> execute-only mapping, as opposed to the RX mapping used by powerpc's
> other MMUs.
> 
> The Hash MMU already supports XOM through the execute-only pkey,
> which is a separate mechanism shared with x86.  A PROT_EXEC-only mapping
> will map to RX, and then the pkey will be applied on top of it.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/mm: Support execute-only memory on the Radix MMU
      https://git.kernel.org/powerpc/c/395cac7752b905318ae454a8b859d4c190485510
[2/2] selftests/powerpc: Add a test for execute-only memory
      https://git.kernel.org/powerpc/c/98acee3f8db451eaab9fbd422e523c228aacf08c

cheers
