Return-Path: <linuxppc-dev+bounces-8676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F2CABC868
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 22:31:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1TqZ4VWxz2yjV;
	Tue, 20 May 2025 06:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747686698;
	cv=none; b=FWDFCcUBxdHtlkGKgp0zPuO6OVZ50sotkjZZPvA7cMGw92Fz5v68+nCCZYzdaDhJnSyMsnSpeKx2Eg6CBPwL0I7tuBaNAaz1/mn+Wm/+1AwogFdAB/TRpj2qnE2EBMLUSdopfu+RVB+boaHSjSagNgd0LdJFyHgZWEL7PriNmw07BGXALCCi2mN5NuIPjn/okoeq/+6QpO2TRNdzxIzfpnGkWdExnJpkyqijmK+3n2lkp+Z6S6yGUIeB6aqt+aK+n6MP+w0Wn7Mza/15WSa/Sq7a2gEUcojkpcYA0abG7ze1Sy48MZBeUCXdK+iPd3tsNyl/+gWijd8PFs2oDo7uzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747686698; c=relaxed/relaxed;
	bh=yoFAXZ4yOrSLmS+OCOfyEIpqBmihPeI+uV271tPkKAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bgdfa1f4RKDOgdHp8KxDFvjiUmRBIHE2CpvNkbH/NBQF8Z6qayi8eJlJGcZWJBOMQzJ25sgzwrqfur9hhmisAsFOhw1Z0LzWrO9XHanJQDBFgFC0Jcy9B9xGVKZnWVuKHQnGBRqYpTq/+OjHF0ykMaZTJ4bjQrUgogILMrG67y+sssN2sSdFU//KiG/hOLZj3Fd4VLezWFCgfJEq5f6qvL22QnVftD1FIxfLhpL1dvXXxzPjQAgLBCLceEXDjPXN8zqGB2sJIRiSD6A7nkWkeIh0IuDPmkAn5HHCkdIDT8QVjagF31h5T5CNTKUOgtrH9ctCQ8r5qE4JVsI6VRx+3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1TqR3bwDz2yhV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 06:31:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=yoFAXZ4yOrSLmS+OCOfyEIpqBmihPeI+uV271tPkKAk=; b=hL+c+2u9ljMpTVtZN9FQvggAwX
	W+gFqdXmGylPRUpotCW6W/69Mp3GkRGz3dsmjXL9uxbnG0WXlnG+pFtgzmip1A2FFqOtd6iff+GDd
	GkVsPJUXbTo3rCNEMoAFzpu8endMmJCsl980pIGC6P7B/cTr6F5I57PHCR5uObC3mLQXB/8hdi89o
	TBDIq1gin2OazzlqoMHO4UnZ34W6VNFS/UjcxqaPODKuhON717LZ2T4trO+dKV9IzzWNqRPTGD+3X
	SlSYhLfDQ+MnSfx9e5DoGyAHd7HD2dHudv/+XdNfI3VGjgMH2XtCwrt7s8tkZidnuG1EQg9Bm8yvt
	23ms30dg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH78p-00000002Lb1-38Yz;
	Mon, 19 May 2025 20:31:19 +0000
Message-ID: <90d3653b-0106-4368-a003-6bb698aa42a6@infradead.org>
Date: Mon, 19 May 2025 13:31:16 -0700
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
Subject: Re: [PATCH] docs: powerpc: Add htm.rst to table of contents
To: Brigham Campbell <me@brighamcampbell.com>, shuah@kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250517210757.1076554-3-me@brighamcampbell.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250517210757.1076554-3-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/17/25 2:07 PM, Brigham Campbell wrote:
> These changes fix the following error, which was introduced by commit
> ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
> repository without any reference to the document.
> 
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs
>      imc
>      isa-versions

-- 
~Randy

