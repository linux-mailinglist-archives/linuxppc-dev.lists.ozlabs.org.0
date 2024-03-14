Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06087C153
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 17:34:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JSAM8cgc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwXzF4dRCz3vY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JSAM8cgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1502 seconds by postgrey-1.37 at boromir; Fri, 15 Mar 2024 03:34:10 AEDT
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwXyV6RnBz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 03:34:10 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9E10940E0196;
	Thu, 14 Mar 2024 16:34:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8u331dPGBT4t; Thu, 14 Mar 2024 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710434044; bh=GGF0W7br1YH0ZUlowMCaPMKKH8Q1iNP76Vr0o+a0Qno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSAM8cgcbWNcgxL5xkU6azEPrkz//J+mlQKFJ/7VqRuZZv+Uwu2dVlcW7GpSsD8K1
	 jGurAjPDQXcf0lNcGO20/AXzsa+stfPbYHuY6Zr47bNGeYgqfq8LjQHc+hQqwMV5NT
	 P8ilKqJBqq+JAxMMIY/54tgtojeeOlTXp/u4t2simmbbg/zsJlmxfcxCXf9f1GJhvx
	 y4n6MLLdHSNcYzkQ49D/xrkolApNRt9UIh8a5MwLKKUxS8gETCwWi2NFhGuSjz42uK
	 xJ+M3I4YiPyVe8gvYa8ghAYu9gv9PiTIk+KoyNx3I6UTev0DBFJJuUT9waQKrv9T+K
	 Z4hasRC9L8UjFNa7tyKaj+EDdUJnEBTlWB1RnIO3pQNWIhy50KKlW8sUFZc71xMva0
	 gdg6livm0X7k1KxPJjo2droDcfx7XCayZX1JIE5OLjYYC5AVd4uAbXMqBfeDoB6qJk
	 EFZQAzxSV+rxEU4h+RkxuerWIwJIXdVJi0Z2MNIIOhz8YwnOzlo73fN05fsNk0pGj6
	 yGGOlMYUFxWB8gtuBxXnc4uLS4uWZkLTgmNEvcrcPRcC9mR9PR/Wby5EXFWNEugTfi
	 fkQqkSSMFAV3KW/SqtHEEVg2mircpzHLR/bcvrRK7nb9q1Acu2ttVHZpHjYC2glhrd
	 nIXWKv4LaCeAHb3Mzt/TL/ak=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3C91240E016B;
	Thu, 14 Mar 2024 16:33:46 +0000 (UTC)
Date: Thu, 14 Mar 2024 17:33:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Willgerodt, Felix" <felix.willgerodt@intel.com>
Subject: Re: [PATCH 0/1] Add XSAVE layout description to Core files for
 debuggers to support varying XSAVE layouts
Message-ID: <20240314163345.GBZfMm6Ve5QMY_xPjl@fat_crate.local>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <MN2PR11MB4566BF54DEFF9B7627B096B78E292@MN2PR11MB4566.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MN2PR11MB4566BF54DEFF9B7627B096B78E292@MN2PR11MB4566.namprd11.prod.outlook.com>
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
Cc: "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Vignesh Balasubramanian <vigbalas@amd.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jinisusan.george@amd.com" <jinisusan.george@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 04:25:44PM +0000, Willgerodt, Felix wrote:
> I am wondering if it wouldn't be easier for everyone if corefiles would just
> contain space for all possible XSAVE components?

You mean we should shuffle out from the kernel 8K of AMX state even if
nothing uses it or the machine doesn't even support it?

That's silly.

Please have a look at this:

+struct xfeat_component {
+       u32 xfeat_type;
+       u32 xfeat_sz;
+       u32 xfeat_off;
+       u32 xfeat_flags;
+} __packed;

What is wrong with having a blob of such xfeat_component things
describing the XSTATE buffer and parsing it in gdb?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
