Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E567287D9C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 11:30:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hl4lpG4a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxcpF4dTHz3vXl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 21:30:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hl4lpG4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxcnR2YR9z2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 21:30:00 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1A76D40E0028;
	Sat, 16 Mar 2024 10:29:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dZdn1D9LnRxm; Sat, 16 Mar 2024 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710584989; bh=622fp/iwp0ja+uFsTK0H2ih9wpqwwCGXkZw+tdKCZZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hl4lpG4aBMiBGkEAdBApzAWkUTNmIjN6gGZru/Omfr2NSGYd+Eur8KsJk1v2bhbcX
	 mNTFUAGfZFWMDyzbt16LVieLOBiur2s1/G8CUcJWY4DsLnNp+nefPnj8jrikbBlmmc
	 kDRvjWw4fIVwOVve0hPhIa77byI1sIVcZ24TTiKB5JY5Qyzflm7yhELCbUjHtSjyb6
	 3gHPtyuY+uhH+SpjB4q9plg4l5PkzpysVkznlLhnmDHlBpeE1b/axg1deSbOY+ALbK
	 zCoshMVYuVJzut6EdV9om+PfTzodOWueFePPk3z3zEHTFJeXYfATWwxop60/WzYeaF
	 oJa4Kbm/ZFbXgFtK3h24dbmM54ynEGBYrTvJiAXc78BqxMTYKHtGPzI0RM9BxdKKWp
	 bIlK8QswcadJSZuaeQSmOe0DO/dYKtrk1wPBxVme05UAbblpOvAAdGPxI46PPfYpYJ
	 VIM+6nTjL2P32pu3V6Qg3TR2tFPinqIfiUr+yhzuul040Brh8DMdh8dYsREhh9DKe8
	 9UDv/vm5rP3ZaGprd05tICZiXGJIWxk8750U7Eb44jursEcGWn0hRWC1AlqEwP786p
	 Rj62Htck4PEabWcxU720Tv6Ql4bFzLgkG8sodSDkCyhmRtHWPKdTIOCz1RjQ6nPvp2
	 0G0rWKf6D5nBjoUO+kJtw/to=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0303840E0140;
	Sat, 16 Mar 2024 10:29:28 +0000 (UTC)
Date: Sat, 16 Mar 2024 11:29:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240316102921.GAZfV0gQ9Sn_hYcKhW@fat_crate.local>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <20240314160824.GDZfMg-J1VOyjxIMiV@fat_crate.local>
 <6ce6aa20-25d2-4784-823f-2a18f592e002@intel.com>
 <20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local>
 <87cyrvjbpb.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cyrvjbpb.ffs@tglx>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, linux-mm@kvack.org, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, Dave Hansen <dave.hansen@intel.com>, Vignesh Balasubramanian <vigbalas@amd.com>, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 16, 2024 at 12:51:28AM +0100, Thomas Gleixner wrote:
> Anything which is not enumerated in CPUID does not exist in
> XSTATE. Period and end of story.

But why not have a simple buffer definition which doesn't need CPUID?

Also, doing the CPUID thing would need extending the gdb remote protocol
as explained here:

https://lore.kernel.org/r/971d21b7-0309-439e-91b6-234f84da959d@FreeBSD.org

The simple buffer layout won't.

So regardless of where hw is going, I think a simple buffer definition
is always better.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
