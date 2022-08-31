Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296F5A7E68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl420hkGz3dtw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl2v0GQNz3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:12:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl2s2MMPz4xGG;
	Wed, 31 Aug 2022 23:12:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220823115952.1203106-1-mpe@ellerman.id.au>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] Revert "powerpc: Remove unused FW_FEATURE_NATIVE references"
Message-Id: <166195152488.42804.15137826276382927471.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:12:04 +1000
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Aug 2022 21:59:51 +1000, Michael Ellerman wrote:
> This reverts commit 79b74a68486765a4fe685ac4069bc71366c538f5.
> 
> It broke booting on IBM Cell machines when the kernel is also built with
> CONFIG_PPC_PS3=y.
> 
> That's because FW_FEATURE_NATIVE_ALWAYS = 0 does have an important
> effect, which is to clear the PS3 ALWAYS features from
> FW_FEATURE_ALWAYS.
> 
> [...]

Applied to powerpc/fixes.

[1/2] Revert "powerpc: Remove unused FW_FEATURE_NATIVE references"
      https://git.kernel.org/powerpc/c/310d1344e3c58cc2d625aa4e52cfcb7d8a26fcbf
[2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
      https://git.kernel.org/powerpc/c/91926d8b7e71aaf5f84f0cf208fc5a8b7a761050

cheers
