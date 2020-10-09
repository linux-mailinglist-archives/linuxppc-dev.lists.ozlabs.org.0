Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D26288207
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:18:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yYN3SQmzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFK1ghWzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFJ2yhMz9sVZ; Fri,  9 Oct 2020 17:04:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20201007080605.64423-1-npiggin@gmail.com>
References: <20201007080605.64423-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/security: Fix link stack flush instruction
Message-Id: <160222339513.867048.4719227593980657822.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:03 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Oct 2020 18:06:05 +1000, Nicholas Piggin wrote:
> The inline execution path for the hardware assisted branch flush
> instruction failed to set CTR to the correct value before bcctr,
> causing a crash when the feature is enabled.

Applied to powerpc/next.

[1/1] powerpc/security: Fix link stack flush instruction
      https://git.kernel.org/powerpc/c/792254a77201453d9a77479e63dc216ad90462d2

cheers
