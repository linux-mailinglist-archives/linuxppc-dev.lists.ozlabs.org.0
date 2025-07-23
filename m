Return-Path: <linuxppc-dev+bounces-10386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B7B0FA95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 20:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnNjN4X7Bz3bmS;
	Thu, 24 Jul 2025 04:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753297176;
	cv=none; b=cSMgtGrOXe+woCWGJY+sH0c8IyrSYIdk/on4OqlsvfXO0gh6qDUUebupjg7nXhBDQ+t0ZMjbnYBUpTkWj3L5RVAejrmRy3K6iFvD3oHjwB01pj+PXbqNb0uNW1BhsF8UzawFA2EAVXmiTGGV5pNZH3VsgdtKwCn5hrtq+1G7ScbtpBCXk3G/hqGfTCxm6eDbFcRRQ6jL2asRSYwc9pjpHRpGqA7xCxC2xSdvwiAnq5EipklgSYbovcwEIQwn4u2pN0wLSaT6kxl1CcaafTNPUwQSRzfqXuQqwYHXLdSJSnuSNis8ASu89wlZVpPEk/WZ0tj9KBmMpu0udF9ejW8UJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753297176; c=relaxed/relaxed;
	bh=3/iUg3kpzsiZrZyEgEoQDrYxpq8863x42bI2MvnPvd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=extlr2tObPr7MW/Cv8cj6My780f/T33meonT9VnJbQZl4V5kjH/ReFSOd0FEn5N6iOGGlG800jlYLjINy74RJwyuwpid9NoQSwkHqeDYqQ83+Z5YSkHf8xGtHMz0BWDhu0fUFENNs94g1KymhzWRwA/ihhBrYq2RQopNufvAlIDedq+l3cXnCDrAI9ZCQKGox3QP8rmsXJcLXV05AwStqgOiFnIhz/TkbNjQdN5/zU/i/oGfsUc+v2iMEwnPlLbW4q/rNEzHcgUKQ8uhVfm5jCPKJ6gesVhRBoZkkOVCrxA/OwSyJJJV1sl0E0p1z9nVj8nR6pdHwemODRJpXZ82tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=WNhhE56j; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=WNhhE56j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnNjF3878z30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 04:59:27 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C1C1740E0163;
	Wed, 23 Jul 2025 18:59:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NV1TOurcSxM6; Wed, 23 Jul 2025 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1753297157; bh=3/iUg3kpzsiZrZyEgEoQDrYxpq8863x42bI2MvnPvd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNhhE56jaVQu8KmDXYrC1yQdKtIH4nMnxxKq6HHMfPn3KWLUYHkITgL5pmZOmECm2
	 qIx5yZsp9NhxWPtrmSuKgpzrdK+6tDoipIeQAsybPeBFHe8nsxHbu9eGiRUwKvN35I
	 moWd3v49g+xVRScU8E2A1IRcf9nJuTnXJf0IoCcR5ViZ97oHkY2LPBNpggxXfI8909
	 KElCdwzek1ygeNaV95IzQSFtsYmW6y8EmMOZaOMj7eOAXvijsv9rBOh2DZ3mFNzXuu
	 ZF+l+TxcKo2TiX2+lIhI3pFmBVZA83e5J1tRBwTLfOopbAJnkvNL9m60r/t253U8pg
	 q/8ZlCL3IKF5Fg+PYg5+iDhJ3zt+Grhz4SPpVg3gvV2nq1fO3tKXzlnUZTy76DuQqZ
	 8w5WlekiffnTR7PRFrECf+uRApDOGb6dhTBLovo+ph+FCh/pMiKZbcADaVPA9P6JDc
	 pDVpuaKA19Snh/y1Uoa6TATlcEZ6FfJ1U2zkredBLcHM+xaX/TaPvBxUquapEQtLZw
	 bz3KciijHf7kc2P7gju5ur8KnwqmE+AAwyZx7tJYAGWAqA7ro+T4GvvI9YCkERW2Or
	 kRbhhGcn+OTYKMO/PQ2vTfHBNSTB5iEv+4o44KOwVfGCIiShLJhDiCKGmo+1U0Em4x
	 mws8PKuTNcbxgVonXq9TlbUc=
Received: from rn.tnic (unknown [78.130.214.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C25CE40E0254;
	Wed, 23 Jul 2025 18:58:47 +0000 (UTC)
Date: Wed, 23 Jul 2025 21:00:48 +0200
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev,
	osandov@osandov.com, xueshuai@linux.alibaba.com,
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <20250723190048.GBaIExYJYiHWnSBFye@renoirsky.local>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <202507232209.GrgpSr47-lkp@intel.com>
 <cdlrppnrheyq7z3gmwmwsmktpmoiwq7g5hxa67rcx4iem5i6ge@jksa5o5use4w>
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
In-Reply-To: <cdlrppnrheyq7z3gmwmwsmktpmoiwq7g5hxa67rcx4iem5i6ge@jksa5o5use4w>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 08:36:52AM -0700, Breno Leitao wrote:
> Basically there are two approaches, from what I understand:
> 
> 	1) mark do_machine_check() as noinstr

do_machine_check is already noinstr. I think you mean mark
hwerr_log_error_type() noinstr.

And yes, you can mark it. hwerr_log_error_type() is not that fascinating
to allow instrumentation for it.

> 	2) Move hwerr_log_error_type() earlier inside the
> 	instrumentation_begin() area.

Or you can do that - that looks like less of an effort btw.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

