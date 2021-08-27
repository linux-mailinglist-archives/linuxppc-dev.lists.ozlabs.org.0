Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7F3F99B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:24:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0mT4DrNz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0k84GXfz2xXT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0k76mjHz9sXN;
 Fri, 27 Aug 2021 23:22:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <000a28c51808bbd802b505af42d2cb316c2be7d3.1629216000.git.christophe.leroy@csgroup.eu>
References: <000a28c51808bbd802b505af42d2cb316c2be7d3.1629216000.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ptrace: Make user_mode() common to PPC32 and PPC64
Message-Id: <163007016280.52768.4828261616849206237.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:02 +1000
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

On Tue, 17 Aug 2021 16:00:14 +0000 (UTC), Christophe Leroy wrote:
> Today we have:
> 
> 	#ifdef __powerpc64__
> 	#define user_mode(regs) ((((regs)->msr) >> MSR_PR_LG) & 0x1)
> 	#else
> 	#define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
> 	#endif
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptrace: Make user_mode() common to PPC32 and PPC64
      https://git.kernel.org/powerpc/c/19e932eb6ea47f4f37513eb2ae0daee19117765c

cheers
