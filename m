Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B74D611010
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLX70rZRz3cGr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 22:52:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLTv22Bbz3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 22:50:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MzLTv0snFz4xGh;
	Fri, 28 Oct 2022 22:50:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221014030729.2077151-1-npiggin@gmail.com>
References: <20221014030729.2077151-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/2] powerpc: misc interrupt and context tracking
Message-Id: <166695778725.1609528.6583615090667609678.b4-ty@ellerman.id.au>
Date: Fri, 28 Oct 2022 22:49:47 +1100
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

On Fri, 14 Oct 2022 13:07:27 +1000, Nicholas Piggin wrote:
> These are several fixes for regressions and crash bugs. Since v1
> I cut down the fixes to a minimum.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (2):
>   KVM: PPC: BookS PR-KVM and BookE do not support context tracking
>   powerpc/64/interrupt: Prevent NMI PMI causing a dangerous warning
> 
> [...]

Applied to powerpc/fixes.

[1/2] KVM: PPC: BookS PR-KVM and BookE do not support context tracking
      https://git.kernel.org/powerpc/c/e59b3399fde5e173b026d4952b215043e77b4521
[2/2] powerpc/64/interrupt: Prevent NMI PMI causing a dangerous warning
      https://git.kernel.org/powerpc/c/a073672eb09670540e95a2a4aa1c46f5da74159f

cheers
