Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD303AC254
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:29:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mCg4q4Fz3cY4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4N4N7bz3bwC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:00 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4M42x0z9sxS; Fri, 18 Jun 2021 14:22:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
References: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/6] powerpc/nohash: Refactor update of BDI2000
 pointers in switch_mmu_context()
Message-Id: <162398828812.1363949.10092519584526889516.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:28 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 3 Jun 2021 09:29:02 +0000 (UTC), Christophe Leroy wrote:
> Instead of duplicating the update of BDI2000 pointers in
> set_context(), do it directly from switch_mmu_context().

Applied to powerpc/next.

[1/6] powerpc/nohash: Refactor update of BDI2000 pointers in switch_mmu_context()
      https://git.kernel.org/powerpc/c/25910260ff69fa0c37e26541aac4e8f978e1f17f
[2/6] powerpc/nohash: Convert set_context() to C
      https://git.kernel.org/powerpc/c/a56ab7c7290f5922363d1ee11bbafc4da2b9bf51
[3/6] powerpc/nohash: Remove CONFIG_SMP #ifdefery in mmu_context.h
      https://git.kernel.org/powerpc/c/c13066e53aabd8f268f051d267270765e10343aa
[4/6] powerpc/nohash: Remove DEBUG_MAP_CONSISTENCY
      https://git.kernel.org/powerpc/c/dac3db1edf8b4c75859f07789f577322f2a51e3a
[5/6] powerpc/nohash: Remove DEBUG_CLAMP_LAST_CONTEXT
      https://git.kernel.org/powerpc/c/a36c0faf3dbc429d5ddcb941afe38dd6fe6c5901
[6/6] powerpc/nohash: Remove DEBUG_HARDER
      https://git.kernel.org/powerpc/c/e2c043163d44f7b3a9e65d9161af72b647b18451

cheers
