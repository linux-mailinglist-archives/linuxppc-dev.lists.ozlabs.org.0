Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081AA4A7F23
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 06:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq6tq5Mvdz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 16:39:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rMj6cjmE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rMj6cjmE; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq6t74zpWz3bT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 16:39:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jq6sz71xZz4xmk;
 Thu,  3 Feb 2022 16:39:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643866745;
 bh=5ypoksyewD1/1A0wIikcTAQpbuRBIVCFLpLku2DM1UQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rMj6cjmEUS8Wn69koaMHGmWtpyj6ZO2nAuoyXA+oWiHfj2yhSyVXHPcjxkz5zmpZD
 WdOsbHhM5IN8Sxx+y5AE3lyjCEc+r5KfaNZza81P6gEszI/6eIqJvUMkHlMNrCqRMu
 MD3TSoNfM8O0TEuisU+c7WgVCaJ0RpIOaxUzrqSEcepCdb37tklQLk/xwJqw3N68Zc
 ulZFnLmU1XaXdjsexrU4b+S2Ms2cXvBTRrkylee8pfYCCllBETW7Tbn5AerQ5uFqCQ
 6bgj65lt4gPCXOpWLgub/FKbqZZkFeTJz7NSunJt46xMtkybfJYQqzJUkDijOk7idk
 3YDBVgFFETn3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
In-Reply-To: <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
 <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
Date: Thu, 03 Feb 2022 16:39:02 +1100
Message-ID: <87h79gmrux.fsf@mpe.ellerman.id.au>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luis Chamberlain <mcgrof@kernel.org> writes:
> On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote:
>> book3s/32 and 8xx have a separate area for allocating modules,
>> defined by MODULES_VADDR / MODULES_END.
>> 
>> On book3s/32, it is not possible to protect against execution
>> on a page basis. A full 256M segment is either Exec or NoExec.
>> The module area is in an Exec segment while vmalloc area is
>> in a NoExec segment.
>> 
>> In order to protect module data against execution, select
>> ARCH_WANTS_MODULES_DATA_IN_VMALLOC.
>> 
>> For the 8xx (and possibly other 32 bits platform in the future),
>> there is no such constraint on Exec/NoExec protection, however
>> there is a critical distance between kernel functions and callers
>> that needs to remain below 32Mbytes in order to avoid costly
>> trampolines. By allocating data outside of module area, we
>> increase the chance for module text to remain within acceptable
>> distance from kernel core text.
>> 
>> So select ARCH_WANTS_MODULES_DATA_IN_VMALLOC for 8xx as well.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>
> Cc list first and then the SOB.

Just delete the Cc: list, it's meaningless.

cheers
