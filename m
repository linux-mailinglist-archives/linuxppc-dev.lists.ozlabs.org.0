Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630E1B2692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 14:44:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4963D15t7gzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 22:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49636D0qDnzDqfW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 22:39:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eJOPBeq4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49636B44VMz9sSM;
 Tue, 21 Apr 2020 22:39:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587472754;
 bh=GPkOTXyJ15wWXKJARmzHNz7C9ZkoThYXaXlm3NYCQ10=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eJOPBeq4Sd0Kq2idihHpPpfLRpRhqTt4w0XAeVadWCBeGf2PjBr5IYDDMeFz86eMW
 GSinelxEsbtv+aLxm0R9OFFVGUCmGzwc4AiLdTHoz7WQftHxRX+uKD11V4BNE6+UMU
 HCnQkTw8BwdOwPed3TD6mA2TD9rw2tUlTHpnHzN0WzkqMtnLMeI55ZxBtBb6N/vfDQ
 aFhOT0alsClhDLmSFBjxMf+PpCX3hrw0gjlYEWySmK63/a0BYeIX4KOccJFgGZjxTM
 W46KSi05NYy5oQWYbqrwEQULjDrA85uQW+uOIipIdG2HMeueQ0Puqs1XHIT1Jd0DsJ
 HQAoOUB8sDBcA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Alistair Popple <alistair@popple.id.au>
Subject: Re: [PATCH 1/2] powerpc: Add base support for ISA v3.1
In-Reply-To: <20200403153208.GI26902@gate.crashing.org>
References: <20200403041055.27535-1-alistair@popple.id.au>
 <20200403153208.GI26902@gate.crashing.org>
Date: Tue, 21 Apr 2020 22:39:28 +1000
Message-ID: <87pnc1gghr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> Hi!
>
> On Fri, Apr 03, 2020 at 03:10:54PM +1100, Alistair Popple wrote:
>> +#define   PCR_ARCH_300	0x10		/* Architecture 3.00 */
>
> It's called 3.0, not 3.00?

It should actually be 3.0B shouldn't it?

cheers
