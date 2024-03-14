Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE987C113
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 17:16:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=bze+eO38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwXZ35qbkz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:16:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=bze+eO38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 407 seconds by postgrey-1.37 at boromir; Fri, 15 Mar 2024 03:15:49 AEDT
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwXYK1Mvrz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 03:15:49 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5C86C40E0174;
	Thu, 14 Mar 2024 16:08:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iYKy3ge94Yhi; Thu, 14 Mar 2024 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710432529; bh=u9nhnnVER2MqsEuiHVV7b+N5w2oLrVMSD1KImKcyqYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bze+eO38mtey/oQO9TE6rC5QYszyNbYqihUCyAmz11U2l0FLDWmeQPh5nSkRVWj5k
	 kk4fvAou9Jyo3bqFZ6YpVfG9krfdXdzSoBinA8p31jm5UlcR1msjpGMg+cS7AJf5A6
	 7PVMNux62VHqCC5m7RwuaMB6Rgb9gOYkZn7UQSIG+ubfDOl8AnOrbXL/c8ViFddWb3
	 GrrcM/2Ixna9slmgbPm9YZNiwdhcquWhH4EnirZ3J9fS97AhzLytZpk+6Lf5ZaJLi7
	 XVdAAAA9rhi5YSsd2j3SELHTdDpuOFrzPnyD5KpR/CdH4m8K631xoNVqMJpCeRw/t7
	 w/w/GnVNFedMNGAYomASXyifuPryU2Uzol8DNgCY2b6H7jeAOenl4LudLjPgmxfMOF
	 fkdSsZwbXuqtj9YX+Cl2gN6Pyt6BMKR+JBat4rA23IqfY1xccD5PdYvUCrB7x8lhGc
	 0t3irVSUWS9nB9v2ZghpQJLQWoHSBItDxoqoowoAs7qjVzwCmRlPHRyHFWKbO4PD3h
	 LgUcyEdUkROWhUtJjXRWRD65NenDiHrfu3rJ/YJW962Yy7ESPU3QNwb0JhDFyuGJzX
	 4BgPdTyWV6Qoeb89EDGC4H2/fFnY8bizj/OV2JfM88ofm2ZAuhxVv7sqtI+1kUaVoS
	 +iuAAdBOEGllWwDoaofW4c2g=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8744640E0028;
	Thu, 14 Mar 2024 16:08:29 +0000 (UTC)
Date: Thu, 14 Mar 2024 17:08:24 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240314160824.GDZfMg-J1VOyjxIMiV@fat_crate.local>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 08:37:09AM -0700, Dave Hansen wrote:
> This is pretty close to just a raw dump of the XSAVE CPUID leaves.
> Rather than come up with an XSAVE-specific ABI that depends on CPUID
> *ANYWAY* (because it dumps the "flags" register aka. ECX), maybe we
> should just bite the bullet and dump out (some of) the raw CPUID space.

Funny you should say that. This was what they had done originally but if
you dump CPUID and you want to add another component in the future which
is *not* described by CPUID, your scheme breaks.

So the idea is to have a self-describing buffers layout, independent
from any x86-ism. You can extend this in a straight-forward way then
later.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
