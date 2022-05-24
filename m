Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBD5328C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sG80J6vz3cj8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7j6bGfz3bqR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7j4Hcmz4yT0;
 Tue, 24 May 2022 21:15:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220519125706.593532-1-joel@jms.id.au>
References: <20220519125706.593532-1-joel@jms.id.au>
Subject: Re: [PATCH] powerpc/microwatt: Add mmu bits to device tree
Message-Id: <165339059815.1718562.18123793859994145829.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:58 +1000
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 May 2022 22:27:06 +0930, Joel Stanley wrote:
> In commit 5402e239d09f ("powerpc/64s: Get LPID bit width from device
> tree") the kernel tried to determine the pid and lpid bits from the
> device tree. If they are not found, there is a fallback, but Microwatt
> wasn't covered as has the unusual configuration of being both !HV and bare
> metal.
> 
> Set the values in the device tree to avoid having to add a special case.
> The lpid value is the only one required, but add both for completeness.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/microwatt: Add mmu bits to device tree
      https://git.kernel.org/powerpc/c/0ef1ffc7189521e293b4c5532659385dfddf8939

cheers
