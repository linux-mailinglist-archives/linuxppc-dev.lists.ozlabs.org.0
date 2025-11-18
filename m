Return-Path: <linuxppc-dev+bounces-14299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96BC6984D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 14:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9lC055mvz2yv9;
	Wed, 19 Nov 2025 00:02:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41b8:202:deb::311:108"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763470956;
	cv=none; b=F91aimO8UgKzdXi18+4EGENf+6eFZFFbSyapS2ZmmLBLidE2979FRd00aOeMX2g30SGxLdbxrnyatKkIcI23J2y8jhm2FofT/UEfoXk524gId2ob2xNNhKQhRIxa2/H6ZuTyx4D0KKmrdnHqtarCWw5vws6I45ycS90nsVncLP9U63hPyGFulRw2q5ssLdahzhJycMbMsFjHui0zDhTJ8Zi44th2FLc5nRTkY6IKxAbAwD8yq6WkFjShHXKHjcq6xX9NZYjSixKUauIXR5EcCiIJq9tR3uYuOeQhAQGEQAOs+XdG74XPKs3d9wrx7JjcI+7uzjP8Gwj2tvoPBvXhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763470956; c=relaxed/relaxed;
	bh=CB2uOReZgsobtwaBKBpmnV0Wphw1VrV1rB9pFCourqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diHVzN0yA9EVI1ptNYVu06iAm6yCM64FXFe2mUu73+hFcbdU6h+3XvNEY9EBsrZAIXS8K5FA7DyGUtA5AEe+teoluZ4m6vmxRjm9yyTGBDWeLi7LaJRmAyc9grgXF9VN+svuhRJFmWnQg+XudPMLN5A8CW3pJRHkkKtxE5a1m1FFjf/+9r6DLUXL07LytSGjYmIK/+pXMk92Ms2WCFfwgkgGh2SRj/stMv41NlzIlmnVpzizgQsnFoojdGE/Ue8kJXzvA5Oxw7EeP6EhyxHISSycVLq94N5NIAw3Jy2j2aThlAXjuFuNZBYIIKe5dyJPAeNHTC+drFXFz1b8ULAstg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=v04/qdvc; dkim-atps=neutral; spf=none (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org) smtp.mailfrom=debian.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=v04/qdvc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=debian.org (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org)
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9lBz2jdbz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 00:02:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CB2uOReZgsobtwaBKBpmnV0Wphw1VrV1rB9pFCourqE=; b=v04/qdvc32+tt+zPP4pbDmrzkf
	zXGN+g/n7abQcm8ATAQLOOicg69LK54vwGhdR8jdcZh3yLsGHMNA3Ut6OlqqiMOMStHcN7gxFfKxN
	enI0+iv1n4sauXKQob6ILS8ypE7nUnadXxnfCJlEXdPaBj7rxfELh4+KlLT/MN2SBs8/tGY6r+j1s
	CViq6f347IAYD/ZBAw4f+BRM+uNF9RSbdew7zxtwQhEk2cL2iXEVhLh8nlUMvdMAnDuiu44RuoVai
	ciM5p5UncHRv9cYN7CNYAyQVHPxLxsepPQA/I94/WwnvGJaaw6RSksnJT8E8jby62YqZCLWtPio7B
	sRZNlS6w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vLLLH-00FHMs-OI; Tue, 18 Nov 2025 13:01:56 +0000
Date: Tue, 18 Nov 2025 05:01:47 -0800
From: Breno Leitao <leitao@debian.org>
To: tony.luck@intel.com, bp@alien8.de, akpm@linux-foundation.org
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	acpica-devel@lists.linux.dev, osandov@osandov.com, xueshuai@linux.alibaba.com, 
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, kernel-team@meta.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH RESEND v5] vmcoreinfo: Track and log recoverable hardware
 errors
Message-ID: <vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
X-Debian-User: leitao
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Andrew, Borislav, Tony,

On Fri, Oct 10, 2025 at 03:36:50AM -0700, Breno Leitao wrote:
> Introduce a generic infrastructure for tracking recoverable hardware
> errors (HW errors that are visible to the OS but does not cause a panic)
> and record them for vmcore consumption. This aids post-mortem crash
> analysis tools by preserving a count and timestamp for the last
> occurrence of such errors. On the other side, correctable errors, which
> the OS typically remains unaware of because the underlying hardware
> handles them transparently, are less relevant for crash dump
> and therefore are NOT tracked in this infrastructure.

<snip>

> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Do you know what is the right tree for this patch?

I am wondering if it should go through Kdump, x86 or RAS/MCE tree?

Thanks
--breno

