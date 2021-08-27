Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000F3F99C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0qV0CZtz3f1X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kQ61FRz3bjG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kP4mPBz9t5K;
 Fri, 27 Aug 2021 23:22:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/4] powerpc/ptdump: Use DEFINE_SHOW_ATTRIBUTE()
Message-Id: <163007016107.52768.13539127295741805273.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:01 +1000
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

On Thu, 8 Jul 2021 16:49:40 +0000 (UTC), Christophe Leroy wrote:
> Use DEFINE_SHOW_ATTRIBUTE() instead of open coding
> open() and fops.
> 
> 
> 
> 

Applied to powerpc/next.

[1/4] powerpc/ptdump: Use DEFINE_SHOW_ATTRIBUTE()
      https://git.kernel.org/powerpc/c/11f27a7fa4ca27935de74e3eb052bdc430d5f8d8
[2/4] powerpc/ptdump: Remove unused 'page_size' parameter
      https://git.kernel.org/powerpc/c/64b87b0c70e0fd28352895cba3c0a9631e0072dd
[3/4] powerpc/ptdump: Reduce level numbers by 1 in note_page() and add p4d level
      https://git.kernel.org/powerpc/c/cf98d2b6eea6a1b2c43f85680ad58fcc3ea9496b
[4/4] powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
      https://git.kernel.org/powerpc/c/e084728393a58e7fdafeee2e6b20e0faff09b557

cheers
