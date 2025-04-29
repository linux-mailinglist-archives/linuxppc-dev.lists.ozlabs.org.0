Return-Path: <linuxppc-dev+bounces-8141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E63AA0B62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 14:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmztJ3zWyz2xfB;
	Tue, 29 Apr 2025 22:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745929240;
	cv=none; b=Fxfd5lZsxXhDpHPgOPynDRQb/k1ZeYmqLLg3qSkJ+IIiSP8DTYqJvYwcLIuYMBPDQbpBMj35GEEdJ1sX/f2mhwTShkRfbR08xUFjgnm7O/QlyDHwLlsld8YfTjHlS/jCStXEOZMZDvnxBiSbkgmbPYflFjAqcIMFNCeGGxk7JmLTua5dWdxfythm9TNzvZ3uk2MKDTWcvovBnbyS8dsUkxIwSGf+piBD/gBerw1EJ4Z3RvFH01FlqFtoC9seV5gwf74/ASJngiuegEMWzYoq8M1OlcpRR/8EX/E3XLML0KKOfRbirDTeXdCUqBmzGSd88rkOvCUEeRNIk5ckELL9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745929240; c=relaxed/relaxed;
	bh=6PKuB/Br5S58sls0TmY8ThhIvdTCR2qQN+/zyakeBqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9aLY3Z8XdcCEmX3Arh//ELFgpaNSqMTcWMr27gl6jBhPA9Q43EJt6JbJmv3E0U6SdfpuXS9KCuPkIc8ToIIkcaCpNXhGqWV3J8gEG8Djlf6L6xyi4GdsX4t2nN1IwCMnASUY/ETunP1IVS7PqAoelc2UsGzea6+eP+m3uMW1/kT24y3Pp8x5pQxwKxxhrXbZxsPSTHzGCwO5IlbkMPFuQGvIte2eSeXEJbOJvGemLxd6e3/WQgWZYhChIfVriX1+Zhqt1VtAzt1bVLjaMNZ+G1LA89NQv2G+0m3V3/Ja1qJKtJrsOzLPGQh3B8OEWYrL8RLzvdm5SKK5cPfc01Zww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmztH1m0Mz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 22:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmzNt5G8Rz9sB2;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuswGPPqwCmv; Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmzNt4bxgz9s92;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 992A18B766;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kJveHg6ejLpf; Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D42D8B763;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Message-ID: <17c35382-36c2-44e6-b553-e66a32a8c47e@csgroup.eu>
Date: Tue, 29 Apr 2025 13:58:38 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of
 strscpy_pad()
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
 <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 29/04/2025 à 13:47, Ioana Ciornei a écrit :
> On Tue, Apr 29, 2025 at 12:41:48PM +0200, Thorsten Blum wrote:
>> Both destination buffers are already zero-initialized, making strscpy()
>> sufficient for safely copying 'obj_type'. The additional NUL-padding
>> performed by strscpy_pad() is unnecessary.
>>
>> If the destination buffer has a fixed length, strscpy() automatically
>> determines its size using sizeof() when the argument is omitted. This
>> makes the explicit size arguments unnecessary.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Christophe, could you also pick-up this patch when you have a chance?
> 

Sure I will take it when time comes, but again I'd expect an explanation 
inside the patch (below the ---) for the resend. I now have this patch 
twice in the list and don't know why, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=&submitter=&state=&q=&archive=&delegate=61610

Christophe

