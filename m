Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F43F9A4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:35:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx11Q04J1z3gpc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:35:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0qT08lXz3cJw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:26:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0qS2cT2z9sW4;
 Fri, 27 Aug 2021 23:26:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210820103431.1701240-1-npiggin@gmail.com>
References: <20210820103431.1701240-1-npiggin@gmail.com>
Subject: Re: [PATCH v1] powerpc/64s: Fix scv implicit soft-mask table for
 relocated kernels
Message-Id: <163007070195.56462.821752486008069851.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:25:01 +1000
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
Cc: Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Aug 2021 20:34:31 +1000, Nicholas Piggin wrote:
> The implict soft-mask table addresses get relocated if they use a
> relative symbol like a label. This is right for code that runs relocated
> but not for unrelocated. The scv interrupt vectors run unrelocated, so
> absolute addresses are required for their soft-mask table entry.
> 
> This fixes crashing with relocated kernels, usually an asynchronous
> interrupt hitting in the scv handler, then hitting the trap that checks
> whether r1 is in userspace.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix scv implicit soft-mask table for relocated kernels
      https://git.kernel.org/powerpc/c/787c70f2f9990b5a197320152d2fc32cd8a6ad1a

cheers
