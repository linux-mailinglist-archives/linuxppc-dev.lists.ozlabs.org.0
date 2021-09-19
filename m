Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8978410B89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 14:21:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HC6HW59DYz2yPS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 22:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HC6H36htwz2xrM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Sep 2021 22:21:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HC6H06qYtz9sXV;
 Sun, 19 Sep 2021 22:21:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210908101718.118522-1-npiggin@gmail.com>
References: <20210908101718.118522-1-npiggin@gmail.com>
Subject: Re: [PATCH v1 1/2] powerpc/64s: system call rfscv workaround for TM
 bugs
Message-Id: <163205402834.1052045.16310536368273936213.b4-ty@ellerman.id.au>
Date: Sun, 19 Sep 2021 22:20:28 +1000
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
Cc: Eirik Fuller <efuller@redhat.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Sep 2021 20:17:17 +1000, Nicholas Piggin wrote:
> The rfscv instruction does not work correctly with the fake-suspend mode
> in POWER9, which can end up with the hypervisor restoring an incorrect
> checkpoint.
> 
> Work around this by setting the _TIF_RESTOREALL flag if a system call
> returns to a transaction active state, causing rfid to be used instead
> of rfscv to return, which will do the right thing. The contents of the
> registers are irrelevant because they will be overwritten in this case
> anyway.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/64s: system call rfscv workaround for TM bugs
      https://git.kernel.org/powerpc/c/ae7aaecc3f2f78b76ab3a8d6178610f55aadfa56
[2/2] KVM: PPC: Book3S HV: Tolerate treclaim. in fake-suspend mode changing registers
      https://git.kernel.org/powerpc/c/267cdfa21385d78c794768233678756e32b39ead

cheers
