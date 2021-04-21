Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2C366C21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLXL2K4Tz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVH1r1nz309v
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVG5gBNz9vFN; Wed, 21 Apr 2021 23:09:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 naveen.n.rao@linux.vnet.ibm.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <22cadf29620664b600b82026d2a72b8b23351777.1618927318.git.christophe.leroy@csgroup.eu>
References: <22cadf29620664b600b82026d2a72b8b23351777.1618927318.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/inst: ppc_inst_as_u64() becomes
 ppc_inst_as_ulong()
Message-Id: <161901050268.1961279.15476787728772841493.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:22 +1000
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

On Tue, 20 Apr 2021 14:02:06 +0000 (UTC), Christophe Leroy wrote:
> In order to simplify use on PPC32, change ppc_inst_as_u64()
> into ppc_inst_as_ulong() that returns the 32 bits instruction
> on PPC32.
> 
> Will be used when porting OPTPROBES to PPC32.

Applied to powerpc/next.

[1/2] powerpc/inst: ppc_inst_as_u64() becomes ppc_inst_as_ulong()
      https://git.kernel.org/powerpc/c/693557ebf407a85ea400a0b501bb97687d8f4856
[2/2] powerpc: Enable OPTPROBES on PPC32
      https://git.kernel.org/powerpc/c/eacf4c0202654adfa94bbb17b5c5c77c0be14af8

cheers
