Return-Path: <linuxppc-dev+bounces-17683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL+lIyjpp2mDlgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:11:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE01FC48A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQljw5Ylwz3bp0;
	Wed, 04 Mar 2026 19:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772611876;
	cv=none; b=lbTUw/n5uLjTpk4MPaz70Er5v7NL5dl0WPiK/hqcCQ0G/o0UWZfSYnpXmPqJtaOHqgtUaJ7lv9g/V83n3nQ8E92Zjo+DEJr4TdntEJ6LQYGws3O2GvzuGxx7KNPSmMHo0e4QagVTbRznoiw4ae2rHR6vZ+mj2/fVktJz2bxiJYrYMclCgJ2CrqtkHRACeW98vDE5o9yx1tft0YqAavp4peBfF+a8AUJ4kGdn+xoPOOSFr90MuF9dxs8TRpeLo1Ck/ukRNz81JOyK4D3roYV89VLSHZZxv8jvoC4rVUgNZU3y38jwVT2IgSsXIpuJcGALt9kZqsLxYv7SCSxtbuhyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772611876; c=relaxed/relaxed;
	bh=C0EweCKy3lU+DdloOAnpjGiH/03g5gh5bSik4KxXyvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9SOKTS7bWUsRhgI20MeqBtQkxUjjfhh6c3HWCzUnUgadiU7Goyb3G5Fw4Jt/pOMKvfZBU1NZuy204UPYF+eIc9AGqkqeojszsZPBnGniyEx5CvEMNf4fRAtMFudkTXFuiCVdsObOSHZksFfvcuWRkecpVozc78mZerGr2DgU7MK3XzJFLKVS7mcSy7NmUuXIOp0ccGcWrPd4g+jqIPtSJzOq/O1+y3LZxyZcaZfCmhI+idQUPAh8X64dDzhskrdaeNmkReFWsR8okpAomiZb85/ctAMLFJAP6hSA81VbGOIi5OYlRq9SjsVfm2qs/9HVQEJUSKSAofT19URCQEr5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A5lAjDta; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A5lAjDta;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQljv6fg5z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 19:11:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A8AB41858;
	Wed,  4 Mar 2026 08:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0EDC2BC87;
	Wed,  4 Mar 2026 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611874;
	bh=II4aDDUE02AkgxLhaNuEGD/wI5+MI7d/Qa23fAse7cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A5lAjDtanRrs9/jMMfHZjLSQ4Tg+H1VtfLa02oOUXcBRCAvsllq3CMU8FsnYUKRU3
	 woEFbclHxtUCwYTflKhlqjQJ6PMrfjDkK1vS5GSChwmTBU1t/pmnqyAIxzz3JAtWu2
	 ZbxNjbEL2y7qLePDpgoHQAxIhG6/hySl/e8E08ruXkBf9va7XSf3qwlpvMCFAxJgJn
	 VtP6wU0+i5KB4nyeyOBs7VQZC3BzAIhStfnN8Yuvxcvj/3LjK6oz8JHPMmslzsIxJG
	 CecyeCXm0oJ/jY87OVjfE/zG8M/hbHlZQFGt3yFkwXPD/7uU5Ewy54hZdZcV8TPiTj
	 ZUGPqjyFwEuQg==
Message-ID: <5e2c2d09-315c-4f68-a762-54253e2320c9@kernel.org>
Date: Wed, 4 Mar 2026 09:11:06 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/14] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
 <20260304-vdso-sparc64-generic-2-v6-2-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-2-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9CBE01FC48A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:nick.alcock@oracle.com,m:jstultz@google.com,m:sboyd@kernel.org,m:glaubitz@physik.fu-berlin.de,m:shuah@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:sln@onemain.com,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17683-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linutronix.de:email,gaisler.com:email,outlook.com:url]
X-Rspamd-Action: no action



Le 04/03/2026 à 08:48, Thomas Weißschuh a écrit :
> This header is unnecessary and together with some upcoming changes would
> introduce compiler warnings.
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250916-mm-rcuwait-v1-1-39a3beea6ec3%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C8f791d1218bb4befc3d908de79c289b8%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639082073628618434%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xxp2D4fWK%2Fd9%2BhcwfbD7s7ft5l773T3LhRdnchXga28%3D&reserved=0
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   lib/vdso/datastore.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index 2cca4e84e5b5..7377fcb6e1df 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -1,7 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/linkage.h>
> -#include <linux/mmap_lock.h>
>   #include <linux/mm.h>
>   #include <linux/time_namespace.h>
>   #include <linux/types.h>
> 


