Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA528CD646
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 16:56:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NkAsg038;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlWGZ4ttwz78vS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 00:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NkAsg038;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlWFs4dZnz3vZl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 00:46:25 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A6C0B40E02A6;
	Thu, 23 May 2024 14:46:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l2nRQhdxUtB6; Thu, 23 May 2024 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1716475569; bh=lMSeCakuwLRl6qGLg3e16nybVlse1JsLGi9aJxe5ftU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkAsg038Z89PME2UN43DYilqftlUXNoYQ0I2xyQ+Dd87EiGQjCd2nHlYvBfwh+hwX
	 GQqXnErGMdybQAuqCqJMt1qbQ5oNP8WRw45nq1DUGAAJGH0tRQWRpVlSeRyp24f2Qr
	 UsoGBxlgCF83MDFxnI3qDTIlHZtAj+XQeCACCTVVkO4GR0V1cgoASkFFeuTyl+4P4O
	 EFaMZ7aOXrgmyqguiWfbw4vsFn5OnQO5Hfljlxn53B4AmauZf/QL4y8IV66VZE1qO1
	 y2Nms1+rheRklnlsw6m+9XtdgeY5WG3O16CucUtSn8S0qF/KMloZkrbw8L6r0vzeai
	 gRjh5MGKTOpMlw86P805CQmNb1QnHi/uXa5insULj9NwWUayOZCAyxm8G64CSZRjjZ
	 xnDcKc8GzOEJi9MLB8QwO3Bc/Hhb3zs1bMFAv/ohVFarLlV5FodOiEAHW0CBTbAKhk
	 KcpxoimWRptFK1V9CPXJ6IavRh5th2QUaNHd5zOWFQwtjQir1HqLiADLfuGGiV1klE
	 viyd4zCpOG5RVEZNgKPKv6VX5uo0GUD+aJT8NJj0O5q56KjltkI5HHxX1btqaGuxwm
	 V98KtpFeJ1V6e6l9xn2DQhfe6p9+yTTVqLuYD/zbX/dizkoOKWmbk3/G6oo3BQHnDG
	 ob4/bbWz/FqktDEHgWCsy1Ic=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CAE0740E016A;
	Thu, 23 May 2024 14:45:48 +0000 (UTC)
Date: Thu, 23 May 2024 16:45:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240523144543.GDZk9WlwKpCKx8I3RE@fat_crate.local>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
 <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2024 at 11:57:00AM +0530, Balasubrmanian, Vignesh wrote:
> Currently, this enum is the same as XSAVE, but when we add other features, this
> enum might have a different value of the XSAVE features and can be modified
> without disturbing the existing kernel code.

We will do that when we cross that bridge, right?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
