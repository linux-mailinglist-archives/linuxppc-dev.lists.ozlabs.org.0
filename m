Return-Path: <linuxppc-dev+bounces-14548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA374C93889
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Nov 2025 06:52:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJK7L0RBpz2yvR;
	Sat, 29 Nov 2025 16:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764395533;
	cv=none; b=mrniGzO7JkTfENwI8eAM1TntgqvAHyIa6i9QgdrpRr1fT5tfDRA8UzAv9Z01XLRWf91xhjuff/m9g7lLXJUmphKVI7S7D0Bu0KmHSAyKEA1OkTa540/Ezv1u37uWmKsJFA6O4LohMPpILJw4a31ZJPUBC+QfNX7C0rH2NggsWd06LIXVqV/3kvDKpb3+9Z6sHgUSa5Egx+AmnuII28gjiZC1FPpNPTuQvYOtBdtlLLHlXG20HGX6+z2toQ0qE7QawPDV0zcPEvcGa0SJYn1MCXga+LaFbcSdWEqPPhdAJuBa89+zGAQV18/A73QY2UoYTSoHzHlYgGn0CzdZDaLJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764395533; c=relaxed/relaxed;
	bh=doDwKBjeRt3ojNdHy4rwU67LpbUPzQAmKh+ZUfy66HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSWn5jVgwN020ji2VZTIkandPrwCTIWedqH7dn0RlXom1t45cfqFkuPW4kkYcs/wKmLAbKJob1nWSxuvlGGE33Iu9Za50TyRvwTbVO6RbkIhk12SH1RXkoAUnkktT3OQ55J7Jr1e6v1mqQ89Tj7/7HpLLdayrSxQ7ehMxV9u6vu67SY847o5TVWQ77Z+Pb7knNGjXsyDoyh13df8KQy20d8RVi2/5P3CFWZWrbjruFYfmtw0mKY+oYND4/E27rR16/Q0bZgCo+v/n8fVw7pIGUrE1OEwUJq8UHhEOwpBMcCKnKtnkuOBEeUgqoJENl98h4b/8nSEOY78WMIVb1+Rhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LCvPjskq; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LCvPjskq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJK7D2gTGz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Nov 2025 16:52:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=doDwKBjeRt3ojNdHy4rwU67LpbUPzQAmKh+ZUfy66HE=; b=LCvPjskq2JefLHMPNeys9LK/sf
	peeMtzlMCh1AIcelyp/QgGFitQAr90uo+3X2YoZeU9TJla2C3NO9VqyjSyp0Mtoi9ACe4GSbaK65t
	g9MPgtzlgJkVd4UMafRIQSJ1bAPlxuq2calccGd0G82xT+7OP7f+T7Os1ndKlXJIzZt8UotYjAErV
	O4umQwl/2VbrpvwaO3q+Bzp3I+99a4VdhezkGl7bh29TKnG2ezphMVlPEw66QoJN3rD3WEFeV+V8s
	/HZoO6JqVLKQPqVnW2x8B26MJnyL/Dpht75ineUP0i+RG+XLRSX19cM9jQ/UHY7m/zLA7uSLvvW/a
	xLiJaflw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPDsB-00000001JCI-3XiD;
	Sat, 29 Nov 2025 05:51:55 +0000
Message-ID: <15e8003c-ed40-4e28-8d64-4c396c62a0ec@infradead.org>
Date: Fri, 28 Nov 2025 21:51:55 -0800
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
Subject: Re: [PATCH] powerpc/ps3: fix ps3.h kernel-doc warnings
To: linuxppc-dev@lists.ozlabs.org
Cc: Geoff Levand <geoff@infradead.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <20251129002452.1195777-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251129002452.1195777-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,
I have an update (v2) for this patch.
Will send this weekend.

On 11/28/25 4:24 PM, Randy Dunlap wrote:
> Fix some kernel-doc warnings in ps3.h:
> 
> - add @dev to struct ps3_dma_region
> - don't mark a function as "struct"
> - add Returns: description for one function
> - add a short description for ps3_system_bus_set_drvdata()
> - correct an enum @name
> 
> to eliminate these warnings:
> 
> Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
>  described in 'ps3_dma_region'
> Warning: arch/powerpc/include/asm/ps3.h:166 int
>  ps3_mmio_region_init(struct ps3_system_bus_device *dev, struct
>  ps3_mmio_region *r, unsigned long bus_addr, unsigned long len, enum
>  ps3_mmio_page_size page_size); error: Cannot parse struct or union!
> Warning: arch/powerpc/include/asm/ps3.h:167 No description found for
>  return value of 'ps3_mmio_region_init'
> Warning: arch/powerpc/include/asm/ps3.h:407 missing initial short
>  description on line:
>  * ps3_system_bus_set_drvdata -
> Warning: arch/powerpc/include/asm/ps3.h:473 Enum value
>  'PS3_LPM_TB_TYPE_INTERNAL' not described in enum 'ps3_lpm_tb_type'
> Warning: arch/powerpc/include/asm/ps3.h:473 Excess enum value
>  '@PS3_LPM_RIGHTS_USE_TB' description in 'ps3_lpm_tb_type'
> 
> This leaves struct members in several structs and function parameters in
> one function still undescribed.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Geoff Levand <geoff@infradead.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> ---
>  arch/powerpc/include/asm/ps3.h |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


-- 
~Randy


