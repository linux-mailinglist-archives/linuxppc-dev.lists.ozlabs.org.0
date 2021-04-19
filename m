Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C193641D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP5xt0Jxgz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 22:40:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DGFut46F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DGFut46F; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP5xR3XJtz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:39:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP5xR0MRbz9vFj;
 Mon, 19 Apr 2021 22:39:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618835995;
 bh=RyrijtfIYowG0EB5//glwu7qvdRwxjiPD8NhN5NLv+4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DGFut46Fa5F+4ycc6GT6odPJ6YZBON0osgsBdNA+KMWmR3JalmUUuKN8mlEz+YxeB
 gK6ZqZvc2DL54rcFVIEGpYCInoitj+vxQCho8juvRQVIvshFGkqCShJpcZMBPJohHs
 QiEFp70MQ/fhWCbqZz7urqEbxDQXsFhZoQvdL42Jiu1pBmiNlYS/5pdAdVcXp+MZ6p
 EGP8PX56MDj4x1mwsJymTyVCMswzOGJeOlGg+IkBB3x3L4X2A8oA0ZhLmynqdpDWb3
 LwywMys7iMpZNvsiiXtIBqZptjxL/Y0Iozb5abgtUHM2gfqyg8oc5XxVIq041Bb9hL
 OcorivxcXZmlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/mce: Fix a typo in error type assignment
In-Reply-To: <4c45d421-ea8c-6243-ee15-ebc85dc733a6@linux.ibm.com>
References: <20210416125750.49550-1-ganeshgr@linux.ibm.com>
 <87fszpdr5m.fsf@mpe.ellerman.id.au>
 <4c45d421-ea8c-6243-ee15-ebc85dc733a6@linux.ibm.com>
Date: Mon, 19 Apr 2021 22:39:54 +1000
Message-ID: <87y2decusl.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 4/17/21 6:06 PM, Michael Ellerman wrote:
>
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>> The error type is ICACHE and DCACHE, for case MCE_ERROR_TYPE_ICACHE.
>> Do you mean "is ICACHE not DCACHE" ?
>
> Right :), Should I send v2 ?

No I can fix it up :)

cheers

>>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>>> ---
>>>   arch/powerpc/platforms/pseries/ras.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>>> index f8b390a9d9fb..9d4ef65da7f3 100644
>>> --- a/arch/powerpc/platforms/pseries/ras.c
>>> +++ b/arch/powerpc/platforms/pseries/ras.c
>>> @@ -699,7 +699,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>>   		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>>>   		break;
>>>   	case MC_ERROR_TYPE_I_CACHE:
>>> -		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>>> +		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>>>   		break;
>>>   	case MC_ERROR_TYPE_UNKNOWN:
>>>   	default:
>>> -- 
>>> 2.26.2
