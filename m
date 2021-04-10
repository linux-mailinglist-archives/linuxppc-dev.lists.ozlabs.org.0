Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5835AE59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcqj0yG1z3cG6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:30:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp46TM4z3bpW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:32 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp35tBMz9sWX; Sun, 11 Apr 2021 00:29:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <828348da7868eda953ce023994404dfc49603b64.1616514473.git.christophe.leroy@csgroup.eu>
References: <828348da7868eda953ce023994404dfc49603b64.1616514473.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Switch to relative jump labels
Message-Id: <161806493513.1467223.12842890533757437748.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:55 +1000
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

On Tue, 23 Mar 2021 15:47:59 +0000 (UTC), Christophe Leroy wrote:
> Convert powerpc to relative jump labels.
> 
> Before the patch, pseries_defconfig vmlinux.o has:
> 9074 __jump_table  0003f2a0  0000000000000000  0000000000000000  01321fa8  2**0
> 
> With the patch, the same config gets:
> 9074 __jump_table  0002a0e0  0000000000000000  0000000000000000  01321fb4  2**0
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Switch to relative jump labels
      https://git.kernel.org/powerpc/c/b0b3b2c78ec075cec4721986a95abbbac8c3da4f

cheers
