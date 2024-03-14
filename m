Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAE387C146
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 17:31:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ddlCZvhK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwXv63t3Jz3dX8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:31:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ddlCZvhK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwXt82W6Pz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 03:30:24 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7B2F840E0174;
	Thu, 14 Mar 2024 16:30:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id co3JfxzjaIvC; Thu, 14 Mar 2024 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710433818; bh=TDNTVQ6N/4Ma+VE1wv9KFMROi1UWZqALylRp98/G0mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddlCZvhK2bva1wkCFISPWhSgA7oIf8S2dPWHppglYZqtz2vSxx8HWA+RSdmHdKToP
	 OXiDCpFXON42bb3RABzcGuvB1VcNP+f46sdsuckHwDSIGgbzUfxd2sW7VA45U7YhIY
	 zKGAvZ2OsSZrlyo2UNQNOAnwT3d6RBb8y3L/G/4yPBqpQXrINgbYSoCXWF6d9IrIu8
	 uJviBtaXalfqUB+yQlT6brtKj8nY0vqkvoYeSyoYRcYvm+04ai8X4NBVX/jGJ+hew+
	 dsMNF2MHZyedo8t1y17yeo+d6xZHxKm7ufX97aqPVNYq41tpTncoXBicw2r50mUTab
	 Y4wNs/ovE3xZVjvzgyAEUg6yZFVua6Fu9WByko2XBA9PFBaQbG7yZekZ23pq+K4wDY
	 aFgxfQyTkKc8iNPSfuZoVynMtbBCaVJIV9sAiMdWw8iqFQcXtRI3kYZpu00yHs9Q4W
	 6UmIy+mT3JGW8uuvS6LAMEFBS6pwCeeCkkFAKrK+e7UuPvDcf+qXmARG2CkCym2cH3
	 dYYYwQntIQfkZPc0hf9tjG7WLVcILOT2TUw0TebHm/cIgFKLNTpwdEPDbTZBikrpzx
	 boTN8C5W0q/AR9R7VsUiKow4otv0wXPMKJjbw1ZeycSxcXSns3SGs0P1gthQAv0Kpv
	 TMQv0SmS6/g1mehnnlDUuNsE=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 27BBC40E016B;
	Thu, 14 Mar 2024 16:29:59 +0000 (UTC)
Date: Thu, 14 Mar 2024 17:29:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <20240314160824.GDZfMg-J1VOyjxIMiV@fat_crate.local>
 <6ce6aa20-25d2-4784-823f-2a18f592e002@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ce6aa20-25d2-4784-823f-2a18f592e002@intel.com>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 09:19:15AM -0700, Dave Hansen wrote:
> Are you envisioning an *XSAVE* state component that's not described by
> CPUID?

I want to be prepared. You can imagine some of the short cuts and
corners cutting hw guys would do so I'd want to be prepared there and
not tie this to CPUID.

> Or some _other_ (non-XSAVE) component in a core dump that isn't
> described by CPUID?

Yes, that too.

Since the format of this buffer is so simple and machine-independent, it
can be extended as needed without issues.

> That argument breaks down a bit on the flags though:
> 
> 	xc.xfeat_flags = xstate_flags[i];
> 
> Because it comes _directly_ from CPUID with zero filtering:
> 
> 	cpuid_count(XSTATE_CPUID, i, &eax, &ebx, &ecx, &edx);
> 	...
> 	xstate_flags[i] = ecx;
> 
> So this layout is quite dependent on what's in x86's CPUID.

Yeah, no, this should not be copying CPUID flags - those flags should be
*translated* to independently defined flags which describe those
buffers.

This is even more important if we change our xstate_flags[] machinery.
This buffer should not use any kernel-internal definitions and
structures but be completely self-describing.

Vignesh, pls fix that.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
