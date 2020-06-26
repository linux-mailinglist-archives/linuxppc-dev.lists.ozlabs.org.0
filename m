Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0420ABA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:01:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPqq2kfDzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:01:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTh4JWFzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:46:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTf2zNrz9sTJ; Fri, 26 Jun 2020 14:45:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20200520021103.19798-1-jniethe5@gmail.com>
References: <20200520021103.19798-1-jniethe5@gmail.com>
Subject: Re: [PATCH 1/2] selftests/powerpc: Allow choice of CI memory location
 in alignment_handler test
Message-Id: <159314672741.1150869.6200686826197857668.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:57 +1000 (AEST)
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
Cc: alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 May 2020 12:11:02 +1000, Jordan Niethe wrote:
> The alignment handler selftest needs cache-inhibited memory and
> currently /dev/fb0 is relied on to provided this. This prevents running
> the test on systems without /dev/fb0 (e.g., mambo). Read the commandline
> arguments for an optional path to be used instead, as well as an
> optional offset to be for mmaping this path.

Applied to powerpc/next.

[1/2] selftests/powerpc: Allow choice of CI memory location in alignment_handler test
      https://git.kernel.org/powerpc/c/01bd294642841998c76d9e6929597dcb7da9466a
[2/2] selftests/powerpc: Add prefixed loads/stores to alignment_handler test
      https://git.kernel.org/powerpc/c/620a6473df36f8dc6f70bc85ff3465b2e21d1254

cheers
