Return-Path: <linuxppc-dev+bounces-15092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934ECE7D1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 19:35:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dg4fB1b1Lz2xpg;
	Tue, 30 Dec 2025 05:35:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767033330;
	cv=none; b=CefgUyV08xc0QL1KxQ+MkpvZyELp7pRGqELTuKoFTYR7aits3Fw2IYDVRSbmh5XByKGh3JUJB/Ru9bPGO9NvVg1+m4zvzaeNAwUPDeSkYCebK9MieHgkonj/ezIB3lwm8gzXExEhVHfuWI6N9qVD9bDqZgJWL4+Uce2xepOuStq88nVYsGEW2wnMFCHUhFJ3RXmaibDiDbsssIA/WCvnbhFvzX1peXNANXA1yGZ9CMjlR9i8eaNO3gtKyUvLybETCa5JcBj/8lenqSncvtbjyb6e/D2iSz2MTsgtu7ZSOj96jqQCMgVcb6XkvQB0LDJez7L+RE9LF2goZDg+onVQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767033330; c=relaxed/relaxed;
	bh=vtFPbWhdjZCTP8lIFtEwD2ZcNGsbPDoPMVEGnz9CGZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBCXvTZhfltiR1QQ93M0FULtVgpOAujFOazDiYNAmbyjwp/4t0Ym967icK5DXDR1CyAzrgop0hJdKgbWlIWjHuk/Y2I//Ba+ULKJhq4uZsoC97wa6AoPziEgfwU2vinbr3n+Hvo6Dh/XtOL7ufORKNismGuzTDIS+oVtv+nHsUGR3cjumaL2GBLoP69wlA0b6Li6EEYjJ6p2edX5B6N8FCrA/ohA6aKOigiVJkv417brBxjl1t64W9If/GBV2uOe6Xo+/8fY/930iVINXypSVkmcirj/CaPMHSFuVv64D6lhuwcgMjdJnsOt+RcmS8D3lMgw/vBjzYh1UWK6erlsfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tJiTqQdx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tJiTqQdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dg4f84vqZz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 05:35:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69473432E9;
	Mon, 29 Dec 2025 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EF6C4CEF7;
	Mon, 29 Dec 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767033326;
	bh=eG2cXpjbEn5KgR3sqGbsjKORgaU2dlYeuXkzKF8Mu+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tJiTqQdxcxiahCt/5Na42Sqqnb6QMNXBFsKWCsh/jwM7SZm5uZJ6HLYmiAziNGUIM
	 bStVvsBKeMwq3158DF+MVo9QN/3PmTb3lyOHtcBb4uKosJIhW1HwdKEgIRXdhJLqIv
	 Aze3DO85ITf1QVHZwt8J08+vxDRRz+G7IJLe4q9AeAEu/dotyEun9ursQ2VT4iGuwF
	 /uUam40Exa8qQD64T3RwaQSpZhRY3Q8GKi1W2craqo9vuRBjDKQdEdaMErKFYMrgrL
	 I+Qs35NIYKKJSezvh7BHgJsqWQugepNS5WIMPfLeYt/RvPpPpf/xHw5lAuaNu5cPsR
	 klwqXccc4oIpw==
Message-ID: <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
Date: Mon, 29 Dec 2025 19:35:18 +0100
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
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Andrew Morton <akpm@linux-foundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
 <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 28/12/2025 à 23:35, Andrew Morton a écrit :
> On Wed, 24 Dec 2025 17:25:24 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
> 
>> Note for backporting: This fix is a partial retrieval of the commit
>> mentioned in the Fixes tag. It is only valid once the change referenced
>> by the Depends-on tag is present. When backporting this patch, the
>> commit mentioned in the Depends-on tag must be included first.
>>
>> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250121150419.1342794-1-sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3fe08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639025581404027066%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3iVUdaMBWhExKkDiV%2BBfYufPTKva1dVikhyQShOq7mc%3D&reserved=0 [1]
>> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250128043358.163372-1-sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3fe08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639025581404053206%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=GamDe2R87SdpFurnj9Cmt9wOQtkGLgIO1z7nl5QPxgY%3D&reserved=0 [2]
>> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
>> Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
> 
> This will be the first "Depends-on:" in history.  Which is a hint that
> we're doing something wrong.  This innovation will surely fool any
> downstream automation.  Let's use existing tools if possible.

What do you mean by "first in history" ? Do you mean it's never been 
used before ? As far as I can see it has been used several times 
already. First one was in 2014 with commit a0855054e59b ("iwlwifi: dvm: 
drop non VO frames when flushing")

Sasha, do tools use it ?

$ git log | grep "Depends-on: " | wc -l
137

$ git log | grep "Depends-on: " | head -10
     Depends-on: e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
     Depends-on: arm64: dts: nuvoton: Combine NPCM845 reset and clk nodes
     Depends-on: 058518c20920 ("landlock: Align partial refer access 
checks with final ones")
     Depends-on: d617f0d72d80 ("landlock: Optimize file path walks and 
prepare for audit support")
     Depends-on: 7ccbe076d987 ("lsm: Only build lsm_audit.c if 
CONFIG_SECURITY and CONFIG_AUDIT are set")
     Depends-on: 26f204380a3c ("fs: Fix file_set_fowner LSM hook 
inconsistencies")
     Depends-on: commit 045b14ca5c36 ("of: WARN on deprecated 
#address-cells/#size-cells handling")
     Depends-on: v6.12+ with PREEMPT_RT enabled
     Depends-on: 045b14ca5c36 ("of: WARN on deprecated 
#address-cells/#size-cells handling")
     Depends-on: commit aec89dc5d421 ("block: keep q_usage_counter in 
atomic mode after del_gendisk")

Christophe

