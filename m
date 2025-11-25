Return-Path: <linuxppc-dev+bounces-14489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13471C86441
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 18:43:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dG95L6N67z2yG5;
	Wed, 26 Nov 2025 04:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764092582;
	cv=none; b=ZT9lEy3uE1bAbAolwBrHleaHeJf3khb2sfm66PEdyqTF7oCr64bYgNp/R2OrEpSYKcMK1RpGYdkC6lfCRxTfxnKKhu7wr3ZpHdZR1vm0ciD0P2BrUDJ9wwrWC7Lk0KDS8j4mHqj+xofmA7VIE+K7Xjam5vNCKSHsjl9zzw8YiKmbNu6Lu637twInHugw0wSrrs4No/fGp/R/UpA86dT7opkjSanND3Okoh4J6NDkoDfPYudu7exi7ZzYu3je+s9zUxCq7s4JDTPqwWogocvY74DXzXiVsIpukNSyxQ02blJATlT5atrkuFZ4DYOke1mZ69hr0vWIOBuN0J4UncAkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764092582; c=relaxed/relaxed;
	bh=Flf67ZijIH8cHplKxTy2qaA6YRgNZ0as3pFMcflAhlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkmwn9UX0IYqZoMpeHPJHR+4l4M+5kB1tiEIPeAeNmfvVYA+dJN5bu2uFhHqS1Co4Tx4OekntwXS4wDqeCpx+1Ij64LXOSzsgUfcOB4Ui0p4S3DuplzQDbaU7YVFoIh/v/GSevZMkOPTSZT22rv1+TGAIldUttzmIWY0OPbruN6c++3Q7tW26s26fpeldwkUYEHj3FSZXJgpLgnIE9BT7reW8ZAs6z9rN7aYu0VYOZEdMTaWW9V0C6HfMMGHb4+Ofd0+Z2++oMqMoeBRohqxdeOCN/Qgpan3+kTFRetYanPsyocjyMjk7QiSZoPe2GPBpwxvMb6crLhUYpZ6AA8U1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jfig/jpu; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jfig/jpu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dG95J24qNz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 04:42:58 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AC03640E0253;
	Tue, 25 Nov 2025 17:42:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id To3KnAzsrizz; Tue, 25 Nov 2025 17:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1764092566; bh=Flf67ZijIH8cHplKxTy2qaA6YRgNZ0as3pFMcflAhlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfig/jpuvuAzxZouWtelYFbmMFFHxJ7ybHn8YOnj59P6YChLrwbQWwni5nlQpSTSs
	 bvB0xGsVpaXuVuxQIHKRHJrCMcbR/8UIOkp3o/5vWJY1p4U05ycL7Xf8V2mwPd9Ysd
	 2N/dsxxMZLLQ+sbecT2+TzFjuQQpnAaB0FE7InXjDiekXjcMYVi75X5IZIFqPTp5rx
	 SjQ6wkoQKeIdix2Hb6aDtl/4fLsqegxkJJcAwQ72jil2HjY0aNwSNvKIp5EyMxiIUm
	 pFsk0svA5WyubEzPDwun1ybZzgQQ5NWbj1QFmQz2Nwf/W5vb4MJa4r3FdPqyJ7NJZi
	 Jb7o5Sm5U6IHTmQ00HlXHUyc9wSb4KGbPlHz5ugmohz3eFGFsZYvglXeJHZOvLatVG
	 2hH/bHOFZBGc6Dp79RY0iYHubByFihteXMTQzInm6OIc5EoEoM1JDhoFNuoczlvLQF
	 O7yTMorRdwPGmA6D9asEgU7j4rKaqUnQ8AWUA1mmQWLFlf9GaI43ASOzy167gjY9jD
	 gI5yky67zV9afaW92sKmwuHdnykIYm9ktxVAHYiinDogo1jzo64TrcKPwVl/Fyv+hT
	 lTjQR5i4RqPcE4U56eBICJw8j0i3g1w3rtD8VYlCrgua2OZBRfQ4ijERPEzkll/t8Z
	 nAlDqigrayea84xsUnnD8vVs=
Received: from zn.tnic (p57969402.dip0.t-ipconnect.de [87.150.148.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5046E40E015B;
	Tue, 25 Nov 2025 17:42:19 +0000 (UTC)
Date: Tue, 25 Nov 2025 18:42:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, tony.luck@intel.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev, osandov@osandov.com,
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
	linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, kernel-team@meta.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH RESEND v5] vmcoreinfo: Track and log recoverable hardware
 errors
Message-ID: <20251125174211.GIaSXqc1tAdGejYYwh@fat_crate.local>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
 <vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
 <20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
 <20251125093211.081d4ba0e18f1f9a85a0de5f@linux-foundation.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125093211.081d4ba0e18f1f9a85a0de5f@linux-foundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25, 2025 at 09:32:11AM -0800, Andrew Morton wrote:
> I don't feel I'll add much value here so please take it via the
> appropriate tree.

Yeah, that's the thing - judging from the diffstat your tree is probably the
most fitting one. So I think we're on the right track here.

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

