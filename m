Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A411F1D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 13:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Zn7g5zbQzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 23:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="TdT7jtcC"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Zn0D0tBVzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 23:29:15 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A5A009CBB5BB8E6A81C1F.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:5a00:9cbb:5bb8:e6a8:1c1f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3E281EC095C;
 Sat, 14 Dec 2019 13:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1576326552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=8NCoc4fb2yRyFtctOcE7NM5N1P1G1fFp8+EyemH6LM8=;
 b=TdT7jtcCxSBC/j3j6arokG0EX5msVb8eN5aWP4jJdYexOAWLvsWeWZBIvvXmkU0X9ArVuS
 YwGvoKUlJJYh8ZU5WSbTyEDdtEZaZSYfT/PXnaXXQCE4JfA3hjcMEIhY8tJDVf8l7s5MbZ
 NqxojWGpiWAs15TS2oWFCWsHAH08fLE=
Date: Sat, 14 Dec 2019 13:29:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH v5 3/5] Documentation/arm64: Fix a simple typo in
 memory.rst
Message-ID: <20191214122910.GD28635@zn.tnic>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
 <1574972716-25858-2-git-send-email-bhsharma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1574972716-25858-2-git-send-email-bhsharma@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 29, 2019 at 01:55:14AM +0530, Bhupesh Sharma wrote:
> Fix a simple typo in arm64/memory.rst
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
> ---
>  Documentation/arm64/memory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
> index 02e02175e6f5..cf03b3290800 100644
> --- a/Documentation/arm64/memory.rst
> +++ b/Documentation/arm64/memory.rst
> @@ -129,7 +129,7 @@ this logic.
>  
>  As a single binary will need to support both 48-bit and 52-bit VA
>  spaces, the VMEMMAP must be sized large enough for 52-bit VAs and
> -also must be sized large enought to accommodate a fixed PAGE_OFFSET.
> +also must be sized large enough to accommodate a fixed PAGE_OFFSET.
>  
>  Most code in the kernel should not need to consider the VA_BITS, for
>  code that does need to know the VA size the variables are
> -- 

Why is this a separate patch?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
