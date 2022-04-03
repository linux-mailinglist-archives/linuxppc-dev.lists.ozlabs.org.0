Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BD04F0D03
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 01:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KWr4j4VhBz3bh9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 09:40:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bNKCIoOS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KWr454Nsfz2xrY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 09:40:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bNKCIoOS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KWr433rm5z4xQt;
 Mon,  4 Apr 2022 09:40:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649029204;
 bh=/LriDKMelIcxILEmiYYeCqxlA2ksNDFTy/6Du99U0M0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bNKCIoOS1dKV4A+yR8Lzn3bKxXn6Q4y+cSWZ+UySUcNOU2esHkogkuMnuQ8tUwGWG
 E4+xVzwdq+CI6uYIDqGcJOVdVTA39Xi6+iwxC2N60edew1qa6BqS3YSwRrFkMNbLzb
 UKWOB+rxa/o13GAqkB2bDrB9/UUg2bzgP0wgsXwb1fdIHMtDoM7V/6wvihGxsjaxl4
 qqQnp9eRSiUARP3SBMHP/RZNBdqig4pvejApvunCHWNuGA4QcD9HYi7ztmQz2Z6xaD
 UXVMb1PWO+RXsFDLle+1ILDGTQea7lgKOFmVN2i7pP2P+10eAmnpvI6pjbcVJ+xTx5
 zia8dmxq/Nz6Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Remove fsl,85... bindings
In-Reply-To: <YkbOg4iLykg0gkKz@zn.tnic>
References: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
 <YkbOg4iLykg0gkKz@zn.tnic>
Date: Mon, 04 Apr 2022 09:40:00 +1000
Message-ID: <87bkxhg2i7.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Robert Richter <rric@kernel.org>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@alien8.de> writes:
> On Thu, Mar 31, 2022 at 12:13:10PM +0200, Christophe Leroy wrote:
>> Since commit 8a4ab218ef70 ("powerpc/85xx: Change deprecated binding
>> for 85xx-based boards"), those bindings are not used anymore.
>> 
>> A comment in drivers/edac/mpc85xx_edac.c say they are to be removed
>> with kernel 2.6.30.
>> 
>> Remove them now.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>  .../bindings/memory-controllers/fsl/fsl,ddr.yaml   |  6 ------
>>  .../devicetree/bindings/powerpc/fsl/l2cache.txt    |  6 ------
>>  drivers/edac/mpc85xx_edac.c                        | 14 --------------
>>  3 files changed, 26 deletions(-)
>
>
> I'll take it through the EDAC tree of there are no objections.

Fine by me, thanks.

cheers
