Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A82332D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:18:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWFB1RW9zDqRb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcx0hgRzDqyY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BHVcw5wlHz9sRX; Thu, 30 Jul 2020 22:50:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcw3ljxz9sR4; Thu, 30 Jul 2020 22:50:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200724092528.1578671-1-mpe@ellerman.id.au>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/5] selftests/powerpc: Add test of stack expansion
 logic
Message-Id: <159611327263.1601380.4813279952363405661.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:24 +1000 (AEST)
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
Cc: linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 19:25:24 +1000, Michael Ellerman wrote:
> We have custom stack expansion checks that it turns out are extremely
> badly tested and contain bugs, surprise. So add some tests that
> exercise the code and capture the current boundary conditions.
> 
> The signal test currently fails on 64-bit kernels because the 2048
> byte allowance for the signal frame is too small, we will fix that in
> a subsequent patch.

Applied to powerpc/next.

[1/5] selftests/powerpc: Add test of stack expansion logic
      https://git.kernel.org/powerpc/c/c9938a9dac95be7650218cdd8e9d1f882e7b5691
[2/5] powerpc: Allow 4224 bytes of stack expansion for the signal frame
      https://git.kernel.org/powerpc/c/63dee5df43a31f3844efabc58972f0a206ca4534
[3/5] selftests/powerpc: Update the stack expansion test
      https://git.kernel.org/powerpc/c/9ee571d84bf8cfdd587a1acbf3490ca90fc40c9d
[4/5] powerpc/mm: Remove custom stack expansion checking
      https://git.kernel.org/powerpc/c/773b3e53df5b84e73bf64998e4019f50a6662ad1
[5/5] selftests/powerpc: Remove powerpc special cases from stack expansion test
      https://git.kernel.org/powerpc/c/73da08f6966b81feb429af4fb3229da4cf21d6d9

cheers
