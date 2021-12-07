Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AD46BC84
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h2d6LV9z307l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2J53H5z2xX0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2J2Hzmz4xgq;
 Wed,  8 Dec 2021 00:28:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V4 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks
Message-Id: <163888362657.3690807.10860814455501399694.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:06 +1100
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Jul 2021 01:48:28 -0400, Athira Rajeev wrote:
> Running perf fuzzer testsuite popped up below messages
> in the dmesg logs:
> 
> "Can't find PMC that caused IRQ"
> 
> This means a PMU exception happened, but none of the PMC's (Performance
> Monitor Counter) were found to be overflown. Perf interrupt handler checks
> the PMC's to see which PMC has overflown and if none of the PMCs are
> overflown ( counter value not >= 0x80000000 ), it throws warning:
> "Can't find PMC that caused IRQ".
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC
      https://git.kernel.org/powerpc/c/2c9ac51b850d84ee496b0a5d832ce66d411ae552

cheers
