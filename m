Return-Path: <linuxppc-dev+bounces-17802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDGFBd6vqmluVQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:43:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A621F0C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS30m3BDwz3c5f;
	Fri, 06 Mar 2026 21:43:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772793816;
	cv=none; b=Xnk/nm77k5In4iopAzAxiRirO1BecFnACpxo/Ci+wwaPw/iaKDWLVWGmTm6B2C3+ez8BA9YHIsdpPPy1z7+1aXdnNfzSGFV2hbAAigZ0iz37es/83znFBtF1w58v62b8HhpVacFnWB7al6FFNkyKhPU6FkTZPSoDbAytH3i8zVgbeAfZbkVu9rEVu8T4v/m0OuOLMnRxvmh3w8zpwTNkh55Mi01RC2dVxp4afrTaoSQu89qqIAT0w+Gb+XQypv5HgawtNokJ/8onno+PUBDI/+Y1AnLzC9Ltr6KHn8FFg2OenQ8e5wOq+uIACJtraC9XvIsrPbNy6pzCEUuT0cwdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772793816; c=relaxed/relaxed;
	bh=xw51UHimXbuvHkvrh4C5tgrv5o29CeDYxDWm+24Rni4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEr/XuFVg5FBbEJzwcLkHLz8CDu/B2Y0WmDXOuj60R0+bAH7T4GiKl+C+eG9fp+wCTGurG+p8uoz/cGFrkc8JNVKFr/qJVO5VqD5fYc8U+z2wmomvIHzfWvCnBNjT/KsMHAmosVgkGGid/6hnL2an51wl7s5OhM27mA4CxH7IjKOoh6K0MOd9B7VLB9wSqzDH23TUU3WdLmnlj6mv4n7bPrWIAJwwIvwMTRjkO7+miOMbmVLKraFpW1L3/P3bTeZNAzRTbtXsZtGbaHfNPTQPfe7Hsnu9KEvtxjQMKgxW9LCbNquqzhRV726lVrVDDCoB3FPR2vg6o+5wEYywcUDIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BzVtHObI; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BzVtHObI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS30l3K2wz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 21:43:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CC036012A;
	Fri,  6 Mar 2026 10:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D3C4CEF7;
	Fri,  6 Mar 2026 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772793812;
	bh=jKZEF3IUSt1J91757T2vSUpKudKOAuc0I9XBO5Sn7ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BzVtHObIL82/q9O+sOb2/+FweppM29b9mnTSAfc69usZmapfE8B7l+05Z7ufxsOTk
	 CRb055OLrA9Fy0yEzPfSTSO3b4HQdk2eAUXkpLJI5GsUQVNu5xWwHe/INBvaNDqBZg
	 g48NgVDztPTNO6Bd1g9Q+EQL2umvqAmLBE0LYiE6WC7dKN/L9rELZLCDr3TfV/KUNo
	 0vqW/J+Wr4G4E1dUk3ZG5r6MLRBygEtiuFa87etC+eXlXVJtK5o7NcTKq8hG2Vvqvj
	 DK52IoDgQ/NqyZ4P0Mzc/8FITgp1u7NKxRK8gEjFAVqYwr+lNx6ZLS/spi4VZXOb/Q
	 8lsBXIqpub5Vg==
Message-ID: <96cdd223-5139-4535-b82d-831dac472cc3@kernel.org>
Date: Fri, 6 Mar 2026 11:43:24 +0100
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
Subject: Re: [PATCH v2 0/5] vDSO: Use 32-bit CHECKFLAGS for compat vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 David Laight <david.laight.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Sun Jian <sun.jian.kdev@gmail.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 788A621F0C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17802-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:sun.jian.kdev@gmail.com,m:lkp@intel.com,m:dan.carpenter@linaro.org,m:davidlaightlinux@gmail.com,m:sunjiankdev@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.ozlabs.org,intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action



Le 02/03/2026 à 08:58, Thomas Weißschuh a écrit :
> When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
> are used. These are combined with the 32-bit CFLAGS. This confuses
> sparse, producing false-positive warnings or potentially missing
> real issues.
> 
> Manually override the CHECKFLAGS for the compat vDSO with the correct
> 32-bit configuration.
> 
> Not all architectures are supported, as many do not use sparse for their
> (compat) vDSO. These can be enabled later.
> 
> Also add some checks to bitsperlong.h to detect such issues earlier.
> 
> Based on tip/timers/vdso.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Simplify __BITS_PER_LONG consistency checks
> - Fix an inconsistency in the powerpc audit code

The powerpc audit code should be replaced by generic 
AUDIT_ARCH_COMPAT_GENERIC, as there is no difference between them 
apparently.

A tentative was made in the past but was declined by audit maintainers 
because we were not able to test it allthought the failure was the same 
before and after the patch, see 
https://github.com/linuxppc/issues/issues/412

Christophe


