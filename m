Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE06AFF06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 07:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWjNL08n3z3f3m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 17:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=vDkN/hgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWjJY05X0z3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 17:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=vDkN/hgS;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
	id 4PWjJS1Vqzz4xDl; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4PWjJS1PRgz4xDk; Wed,  8 Mar 2023 17:36:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1678257384;
	bh=xlh8AKwmpAujiBC2TZ8TY34N1ZFaVIBckKl457W8J10=;
	h=Date:From:To:Cc:Subject:From;
	b=vDkN/hgStBQKJlPuU1xJd5EiafxrU6GgJW87tN1Bsh1jcJ6eqKgHUSR/7DQPbFRRC
	 pQUCfITFhoyjG721Ii92hmEeKoRTeBMffaasIyw6wVV7cQByRyKyv5Nr/I4EQOOA2V
	 vjR4syd9hFNejQOPiW3oYtYqceouA4GdcsP792dvibsGZUW/HnPMDgT46A+bOpzPeR
	 //Kh7dznGphnJN+RsuhwGpLPqtF8eC+SVSoAdnFHqIfsjfguIrscaKZZnx+7E+nRR+
	 dvCEjFBXqfGbhC0pJ5Z8Vj4U1+zUKkv8MGqkBAI9P22gr96bZftMh/23DpM10PBbPW
	 uvZ69+Z8OSauA==
Date: Wed, 8 Mar 2023 17:33:43 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH 0/3] powerpc/kvm: Enable HV KVM guests to use prefixed
 instructions to access emulated MMIO
Message-ID: <ZAgsR04beDcARCiw@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org, Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series changes the powerpc KVM code so that HV KVM can fetch
prefixed instructions from the guest in those situations where there
is a need to emulate an instruction, which for HV KVM means emulating
loads and stores to emulated MMIO devices.  (Prefixed instructions
were introduced with POWER10 and Power ISA v3.1, and consist of two
32-bit words, called the prefix and the suffix.)

The instruction analysis code in arch/powerpc/lib/sstep.c has already
been extended to handle prefixed loads and stores, so all we have to
do in HV KVM is to fetch the suffix when necessary and pass it to
analyse_instr().

Since PR KVM doesn't yet handle prefixed instructions, we disable PR
KVM guests from using prefixed instructions (this is done using the
FSCR).

Paul.

 arch/powerpc/include/asm/kvm_host.h      |  4 ++--
 arch/powerpc/include/asm/kvm_ppc.h       | 37 +++++++++++++++++++++++---------
 arch/powerpc/include/asm/reg.h           |  1 +
 arch/powerpc/kvm/book3s.c                | 32 ++++++++++++++++++++++-----
 arch/powerpc/kvm/book3s_64_mmu_hv.c      | 26 ++++++++++++++++------
 arch/powerpc/kvm/book3s_hv.c             | 24 ++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  6 +++---
 arch/powerpc/kvm/book3s_paired_singles.c |  4 +++-
 arch/powerpc/kvm/book3s_pr.c             | 22 ++++++++++---------
 arch/powerpc/kvm/book3s_rmhandlers.S     |  1 +
 arch/powerpc/kvm/booke.c                 | 12 +++++++----
 arch/powerpc/kvm/bookehv_interrupts.S    |  2 +-
 arch/powerpc/kvm/e500_mmu_host.c         |  4 ++--
 arch/powerpc/kvm/emulate.c               |  8 ++++++-
 arch/powerpc/kvm/emulate_loadstore.c     |  8 +++----
 arch/powerpc/kvm/powerpc.c               |  4 ++--
 16 files changed, 136 insertions(+), 59 deletions(-)
