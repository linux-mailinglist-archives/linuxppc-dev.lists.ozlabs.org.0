Return-Path: <linuxppc-dev+bounces-11535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1003B3C8BF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 09:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDRf12yn3z2ytT;
	Sat, 30 Aug 2025 17:31:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756539097;
	cv=none; b=AC5v+n+di0iaw1JUhF85FbyPAKuXD6fEUVrrE2To7UoOv5UaU0ZSOpl2lfFHoM5E4vTNGqHLE9GGDCm7Bc/e/m3CMGMPvEso2PNomcD8c6WTzR7OlXhq2Sm2LbRW8Plrjojum9RP/91hfxsV+05Rqgs4byI+Yv7IRjfsNnm2roo7dBc/STNqtrmcfHz3oMzenk6Tkb1O9+Xa7KIisrTvXwE8HZ9U2iPC1sTBHvGzETiNqRvAbyR3zTDwCzBKxL1hWoGRy2Ub8t3pK8jvlC0CjJj6MABX07BkQZlp/5gGCNtSMTkSTG7ssihx8+6q32rMf/PKtTOOiIW9Ut+6xTP1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756539097; c=relaxed/relaxed;
	bh=vUVt8H114oBPRM3DQc+rlJzjxYG3q6VmtwmqaI0nblE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=e7TtWDzQsMHtYrIWUmnFPjXYQLAsQ0ORpMOZI8A2pVH1/Bi5wuRgzdlNeKZkg5MLrsk7/RYcyAcdYdr0fFQTaNNjBKYENqkZD9SGkYwnnasdRQ/vuDLTk1jaiEcjAqGScQkA6kMkgCJd0D5iK53ywhduQlRhXy7pibkgRRsJeLLElchcn0FkL4J5xXIwExt11gMykFDUpTrViHlTMPLfs97CdEsXPkmuxf2EYmfJj4IaEDMxhNhB6VVZVIUwrqpIWgNNFhk5s9Br2VlqXaVQeCjqkJt7cC+I4W5BDVpcxclkWjyOncJ2MSdbpRqJPhq2rKmfpT1NNCcjdv/EK79Vew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l5lpnEF8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l5lpnEF8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDRdz3pj4z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 17:31:35 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-248dc002bbaso22108115ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756539093; x=1757143893; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUVt8H114oBPRM3DQc+rlJzjxYG3q6VmtwmqaI0nblE=;
        b=l5lpnEF8G4kPFVY4b5PUfxAXl3QsI0PL9xw4uhgqTasvQL67rEzl7W+FYAUWdYLTt5
         5Iv4pFnq+uy0i7Vruhh5RL8d2xBadeMV8gJ8wj0GuKmmq0R10+QZ0+fZuge+VvGITi7z
         jlPmBGGIqB8Jpe7l1oCKygzNlXepKrYkQ1m1j2iLSz2me8DpNftiirYRVncWn0A4ToSn
         Mc4mje+0k3sNQTPV/OGpWdUrnqFXXKlxaUp/5o1DW3vg2p4OmZsnScA3Ggb6SWHN8xde
         6zj9L81k8OFDup7GZQZmNHl4R+57VdQziW6ujTpLUfxSJ92zxanwAsgTCYQRGEtOcYVj
         DSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539093; x=1757143893;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUVt8H114oBPRM3DQc+rlJzjxYG3q6VmtwmqaI0nblE=;
        b=nu+71wWe0Z8ivwK+5Y01x0YRS0gxid3ZOF9Zk2axMKYlpisG6JGP0EK2d2XmfZnt01
         4B2ugveiQhf6g5BkW/pz5tNoe5myVNuPQlueIXSyOExOCOuuQJTO9Xh4uXtZR7JuWCxF
         2G3y0qnr5+0nvvWmFByWgh0OHvtSPd5089CiKkDImLJ0eA16I6CoqzrLd4smXQVKZErJ
         QAYsChMfAiKqczByf+rC7lzsIUgQwqLpKuMJOXlV1757vmPRZfdaqf6ML8ePZyZGzBYQ
         K4KMWKxfexH9AuMYT0jUcIsqVr+kDHe8KRXm+qpPzmFQB+/8Utbm3foznViE++4RCPMr
         4HUw==
X-Forwarded-Encrypted: i=1; AJvYcCUxJP7Y7URvNP5ogiguMKkEKZ06GeVdN2Q5HK1h4ETzTPrzx0+nXdwS0LAP2mv4R8vxqlgl8fZhBgQPxi8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUwfhuEUshhiAVDWyAJ5ECCbcpb7wCauUkQZUDmcXWzaW03+ir
	O0jGaBJVs02RJiEmZIwDBbTO/ioEv4KhiW5VpNE5DnEM3Grs+rAEDBBK
X-Gm-Gg: ASbGncvx6qqwXO6VnXujtGhxxwOzeUhilhiVz19U2hACVkFSqGjHfRpBtPrU8lNHHi9
	U3uPyN1MrPTt7286HcNIPydI5OBRVdL3RPl4qxO/uupl59IY8UkAJMJdYV9segjIcThCtDCD205
	l0NMevnq7VyIV6oDFTh/KdKEg/US+jUWh9Q9H6CcyZY61GfZlPQXjicb/7j5AFsYkkQS4qm2bL2
	xvy0TDZJKPPZRQs0b4Hbf042YRAlIPn+vzkdxmMfZx03D3fF/cJxk/kJlguUGYNiAaxNSoIdq+s
	YXFNxi5TeeGNiDrbEDkdL9llR4HWw9XZ/VMi4jtYYtuV73r9Aj3S2xy3NdIpnUWgYuFNGVK66Lu
	CpnV68xzp75gk/OARfRxWX40TN0IRKE8lbNyX
X-Google-Smtp-Source: AGHT+IG+YCxDGvexQmFBtK6PVYijlpzPgeVtfrL8AW/WmAl74P6OJEtJ7iCQq1TonpJvxc+b5N3D8Q==
X-Received: by 2002:a17:903:28c:b0:245:f2c2:64ed with SMTP id d9443c01a7336-24944a742f8mr17407535ad.24.1756539093210;
        Sat, 30 Aug 2025 00:31:33 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648d04csm44681135ad.107.2025.08.30.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 00:31:32 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 3/8] book3s64/hash: Fix phys_addr_t printf format in htab_initialize()
In-Reply-To: <824bfe0d-7a16-4b35-a0ec-565e4df3223e@csgroup.eu>
Date: Sat, 30 Aug 2025 13:00:58 +0530
Message-ID: <87tt1pjmfh.fsf@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com> <20a8d7bb22c45eeab5cc1b7e5a78446dc1506777.1756522067.git.ritesh.list@gmail.com> <824bfe0d-7a16-4b35-a0ec-565e4df3223e@csgroup.eu>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
>> We get below errors when we try to enable debug logs in book3s64/hash_utils.c
>> This patch fixes these errors related to phys_addr_t printf format.
>> 
>> arch/powerpc/mm/book3s64/hash_utils.c: In function ‘htab_initialize’:
>> arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
>>   1401 |                 DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
>> arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
>> cc1: all warnings being treated as errors
>> make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_utils.o] Error 1
>> 
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Paul Mackerras <paulus@ozlabs.org>
>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> Cc: Donet Tom <donettom@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/book3s64/hash_utils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index 1e062056cfb8..495b6da6f5d4 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -1394,7 +1394,7 @@ static void __init htab_initialize(void)
>>   		size = end - base;
>>   		base = (unsigned long)__va(base);
>> 
>> -		DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
>> +		DBG("creating mapping for region: %llx..%llx (prot: %lx)\n",
>
> Use %pa
>
> See 
> https://docs.kernel.org/core-api/printk-formats.html#physical-address-types-phys-addr-t
>

Right. Make sense. Will change it in the next spin. 

-ritesh

>>   		    base, size, prot);
>> 
>>   		if ((base + size) >= H_VMALLOC_START) {
>> --
>> 2.50.1
>> 

