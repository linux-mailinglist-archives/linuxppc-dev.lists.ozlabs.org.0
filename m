Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7939CEE0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FybBZ2cFdz3fY9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:18:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3R2110z3bt1
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:19 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3Q1TNBz9t10; Sun,  6 Jun 2021 22:12:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
In-Reply-To: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] powerpc/sstep: Add emulation support and tests for
 'setb' instruction
Message-Id: <162298132057.2353459.1382383462872014977.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:40 +1000
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
Cc: naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 May 2021 07:18:31 -0500, Sathvika Vasireddy wrote:
> This patchset adds emulation support and tests for setb instruction.
> Test cases are written to test different CR fields with different
> bits set in each field.
> 
> v1->v2:
>   - Extract all the bits of the CR field (bfa) and check if the
>     LT, GT bits of that CR field (bfa) are set.
>   - Place 'setb' emulation code after 'mfcr' instruction emulation.
>   - Add 'cpu_feature' in the selftests patch to restrict them to ISA v3.0
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/sstep: Add emulation support for ‘setb’ instruction
      https://git.kernel.org/powerpc/c/5b75bd763d369e43e6d09e85eaea22fde37c0e89
[2/2] powerpc/sstep: Add tests for setb instruction
      https://git.kernel.org/powerpc/c/60060d704c55a9450208b8f0bc5026df9d4ab1d6

cheers
