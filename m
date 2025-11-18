Return-Path: <linuxppc-dev+bounces-14302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251DC69DDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9mqw0mCgz2yvH;
	Wed, 19 Nov 2025 01:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763475371;
	cv=none; b=RixceaFr/ghFhX+GmXobv0DvrgOrd1RI9NQIEQSARZAFkJm9EAieZpuf7FhWehHUlxm0mW+zWkmPN/aqeNRzI4r7GyZiXEQnr3V/CiRoTUGqgi0NnPrOR47is2Ig7yx3T6b5K1FLjC+rW04o+fih201sOztuyEhXy9y7rCESxqmscIxJKmEAZb0RAVxd+ZPx9QDdO3LLwcPDUUpKIDdiq4RAC6PoQ3mCaS0FyKpFF7Lggg35KjaVkagvVsZqdzGVm9KdmD6R53Bb1QfDafAwxZ1GIS8rLX228Ph/A1LKbabUe6GkPIYP+d1t2ZO1HhIob4tYpDs7gNijuCK3j9Y94g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763475371; c=relaxed/relaxed;
	bh=9GD8fqgyRaRKCE/AY0roMXTzEL0vi/2D0Y4+wcNO0K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbF5OHvrXIfxBgdlGQkwBXlEike2QqUdnEgHKP8Q6D1EJAzNQXrFikr1ftA4eF/+RJLvl7XhW/cX0s2VDKk7xWzT6D7BHH0GzBsmyJmSwYmH8At9jJIZbw/nNxap7W5OoH3yRxiRYWXXyT24K6qESsIxrMayV6X2Z7g0h3ybeWAGplr4gprzmTCIGWOWyR4xeeiHiC8rPwAmtmGtdIjnCMBaTbMqL3TKsLUwcqqWrMStVFA9RkDURNRjfK1IbCi8wkLEsxExVmGE1XQ9M8x9XB3Q22y2HY0oYGLRK7g/zv9ndGPbIZ8ijlUjEIhMbE4PYrVPQZEiw9Xo3HdgCUq4tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gzDSz+t8; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gzDSz+t8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 312 seconds by postgrey-1.37 at boromir; Wed, 19 Nov 2025 01:16:09 AEDT
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9mqs5c38z2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:16:09 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8C2FF40E016E;
	Tue, 18 Nov 2025 14:10:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kqE8OtHje236; Tue, 18 Nov 2025 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763475036; bh=9GD8fqgyRaRKCE/AY0roMXTzEL0vi/2D0Y4+wcNO0K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzDSz+t8y2W5ztKUxB2zKC8hvXpqWlIHWrKM18Ov/M9poPe8ZwILXR5W4V078i0Hu
	 l4fmG0sRIkNQPQCqUlkbpQ2RjFB7rV9NkkMZrVIMhJJYeNyhbinqJsA/xixzgr7IKI
	 QXfvIexTR17HxrYdZhGNzG93BEJgwLPzUpEzLSm0jWgfJ8JP665GEPVVKuAI5vGqvT
	 7GyF4Hm5Ez28zvH6SDR6ltfmuWLFLAXxb6v20g5vA8qZagWUJrql3QLi7G0MipLw5/
	 FT2qwDh4Ppd874MfgFEG0u4EGA6VUFIl9fICW8s/REdigd6f0t1OwASPOYdsCtm8rL
	 27XQsNZV3tfqueCpE0JSzzW/OGl2OLxQO7Cc6Qj5+qLQJ7oPcgJ7NG2rFqnb+d90JY
	 fKQkPBZactJdMwq6fpj9mh+8Q/DdSgRUQB4g4notdOEV2pRqsIfZa+Rebhwm0Xo+G9
	 vZZzZYrzIqrIsPTx3GmmgconK0RAqYSUJZ4EjGEw0W/ZdxAOujIerrllTGeDYUmQYg
	 sNRkw/GC8OPfjVfBjygiG3NqN2BRgM8JErLCmf9msXk3TKh5Ytm8BpVUM2jsgbBkzM
	 fgR1Ooth9wlGU+wGUdaWKFPZH7/4U8p7VH6uY/Ih7++wGDSLbQxTbv+DbWXuQ42pWV
	 YR8PsAW4U6JF9zUXCnPZyn+k=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 2BDBD40E0216;
	Tue, 18 Nov 2025 14:10:09 +0000 (UTC)
Date: Tue, 18 Nov 2025 15:10:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: tony.luck@intel.com, akpm@linux-foundation.org,
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
Message-ID: <20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
 <vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
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
In-Reply-To: <vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 18, 2025 at 05:01:47AM -0800, Breno Leitao wrote:
> Do you know what is the right tree for this patch?
> 
> I am wondering if it should go through Kdump, x86 or RAS/MCE tree?

I can take it if akpm wants me to...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

