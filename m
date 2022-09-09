Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3FB5B3746
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFHn1Jbsz3fNX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDc1Hx6z2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDc0ZtNz4xZX;
	Fri,  9 Sep 2022 22:10:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20220902085316.2071519-1-npiggin@gmail.com>
References: <20220902085316.2071519-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc: stolen time accounting for VIRT_CPU_ACCOUNTING_GEN
Message-Id: <166272521713.2076816.17851811189048939894.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:06:57 +1000
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

On Fri, 2 Sep 2022 18:53:12 +1000, Nicholas Piggin wrote:
> pseries provides stolen time accounting when VIRT_CPU_ACCOUNTING_NATIVE
> is selected, but not when VIRT_CPU_ACCOUNTING_GEN is. We like GEN
> because it's less code in arch/powerpc, allows full nohz, and distros
> have moved to it, so this series adds stolen time accounting for GEN,
> and moves our pseries configs over to it.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/pseries: Add wait interval counter definitions to struct lppaca
      https://git.kernel.org/powerpc/c/a8933c8d55c37f4d5eb617b4bdb72b8888b88681
[2/4] powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING
      https://git.kernel.org/powerpc/c/0e8a63132800dd8ae5fcb19113f79bea43ea18d9
[3/4] powerpc/64: Remove PPC64 special case for cputime accounting default
      https://git.kernel.org/powerpc/c/02382aff72357727f9eee5107fd32c6cd070f1d6
[4/4] powerpc/pseries: Move dtl scanning and steal time accounting to pseries platform
      https://git.kernel.org/powerpc/c/6ba5aa541aaa079c0ca888f7fe564b2035d5ca0a

cheers
