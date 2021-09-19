Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CC410B8C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 14:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HC6Jp0Hdsz3cGB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 22:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HC6H40gCwz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Sep 2021 22:21:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HC6H00bFVz9sXS;
 Sun, 19 Sep 2021 22:21:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20210909064330.312432-1-ganeshgr@linux.ibm.com>
References: <20210909064330.312432-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mce: Fix access error in mce handler
Message-Id: <163205402970.1052045.3688302812661937958.b4-ty@ellerman.id.au>
Date: Sun, 19 Sep 2021 22:20:29 +1000
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Sep 2021 12:13:30 +0530, Ganesh Goudar wrote:
> We queue an irq work for deferred processing of mce event
> in realmode mce handler, where translation is disabled.
> Queuing of the work may result in accessing memory outside
> RMO region, such access needs the translation to be enabled
> for an LPAR running with hash mmu else the kernel crashes.
> 
> After enabling translation in mce_handle_error() we used to
> leave it enabled to avoid crashing here, but now with the
> commit 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before
> returning from handler") we are restoring the MSR to disable
> translation.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mce: Fix access error in mce handler
      https://git.kernel.org/powerpc/c/3a1e92d0896e928ac2a5b58962d05a39afef2e23

cheers
