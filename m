Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C420C3F808E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 04:37:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw6Sl5y8Jz2ypF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:37:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iTTrfsk8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iTTrfsk8; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw6S41DBDz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 12:36:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gw6S11rGzz9sWw;
 Thu, 26 Aug 2021 12:36:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629945409;
 bh=2OXwYFPaT8syx6JWKvv5n2OunEZA8YubhEiNd+O6vNI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iTTrfsk8i/I2qDKSS2vSmYHia/yXuVZmffPajGPYWQzMgtoXZJVGPpcnmPD20445J
 FHcLt5HsD9r2WGLWnpXrSfxEWurZGA6gRvxR0mFuK/U/Uen5nOoM6m0EwVsxQzcwOh
 NuBgoe21QVvto0hPsoVNmXx32Fmu/3Xm0qs5WjGjjNdHYQnMKWgubvSkzkkeg6BEQg
 60oOok0bLpd1RD/X/KUrESHMXacawrwcGZ61O5KmoM/jbVjqT2PNb1e7fcTzsLnfLa
 Qu2d2eO9vdmp3LSgTzi5N9pPSYn71WqGvBsqADmXqRhe5NsNlqHJXC+VWWbck4H4pa
 QatcGF4m3+dTw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
In-Reply-To: <9734b599-eb00-a1d6-cd3c-ed6d0441f240@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <87eeajcpmq.fsf@mpe.ellerman.id.au>
 <9734b599-eb00-a1d6-cd3c-ed6d0441f240@linux.ibm.com>
Date: Thu, 26 Aug 2021 12:36:48 +1000
Message-ID: <87lf4paq4f.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 8/24/21 12:09 PM, Michael Ellerman wrote:
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>> Add support to parse and log control memory access
>>> error for pseries.
>>>
>>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>>> ---
>>> v2: No changes in this patch.
>>> ---
>>>   arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>>> index 167f2e1b8d39..608c35cad0c3 100644
>>> --- a/arch/powerpc/platforms/pseries/ras.c
>>> +++ b/arch/powerpc/platforms/pseries/ras.c
>>> @@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
>>>   #define MC_ERROR_TYPE_TLB		0x04
>>>   #define MC_ERROR_TYPE_D_CACHE		0x05
>>>   #define MC_ERROR_TYPE_I_CACHE		0x07
>>> +#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
>> ...
>>>   
>>> +#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
>>> +#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
>>
>> Where do the above values come from?
>
> It is from latest PAPR that added support for control memory error.

Please cite the version of the document and the section number in the
change log.

cheers
