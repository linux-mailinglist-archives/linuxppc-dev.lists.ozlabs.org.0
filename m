Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C583B4E35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr853qqzz3fNG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2c4K6hz3c2q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:04 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2b2fmrz9ssD; Sat, 26 Jun 2021 20:39:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20210524120227.3333208-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20210524120227.3333208-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/configs: Enable STACK_TRACER and FTRACE_SYSCALLS
 in some of the configs
Message-Id: <162470384350.3589875.1965473162245884872.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:23 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 May 2021 17:32:27 +0530, Naveen N. Rao wrote:
> Both these config options are generally enabled in distro kernels.
> Enable the same in a few powerpc64 configs to get better coverage and
> testing.

Applied to powerpc/next.

[1/1] powerpc/configs: Enable STACK_TRACER and FTRACE_SYSCALLS in some of the configs
      https://git.kernel.org/powerpc/c/dcf57af201eb2ba401e62df374afb7543c81b523

cheers
