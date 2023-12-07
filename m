Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8E808876
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:53:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDj327sYz3vg9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:53:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVy3QCNz3dBw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVv26DCz4xGP;
	Thu,  7 Dec 2023 23:44:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20231123071705.397625-1-naveen@kernel.org>
References: <20231123071705.397625-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc/lib: Validate size for vector operations
Message-Id: <170195271162.2310221.13222401441821913354.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Nov 2023 12:47:05 +0530, Naveen N Rao wrote:
> Some of the fp/vmx code in sstep.c assume a certain maximum size for the
> instructions being emulated. The size of those operations however is
> determined separately in analyse_instr().
> 
> Add a check to validate the assumption on the maximum size of the
> operations, so as to prevent any unintended kernel stack corruption.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/lib: Validate size for vector operations
      https://git.kernel.org/powerpc/c/8f9abaa6d7de0a70fc68acaedce290c1f96e2e59

cheers
