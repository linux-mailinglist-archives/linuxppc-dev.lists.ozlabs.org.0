Return-Path: <linuxppc-dev+bounces-17038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBn8C/MgnGnI/wMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:42:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59493174137
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKG8t4zf3z2yFc;
	Mon, 23 Feb 2026 20:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771839726;
	cv=none; b=VhQ9EKv1PPDtI4czYQdiD53gy2V8OeIIqEWTfiamZ3Y96oXGTVGQ/21LyTVrGNc3rgwx0an4wy3V+LkdxKY3vfwwPRp6+LDDVVqAn1B5xRBXQqCYDXyjaAYxR+rZ/Zzl40r5tc+SS+VGmAKt4iBJHQU6umcjYqh9DxLUDEsXfYiRiqhEkYfVw343nWDQgcG5QEuZzZm1q7imXFQjTeIIyB/uvAi71aCYJcZUecUUj7rIm4DiPZG0m9LOJfwH26VpD4+cFYU0p6KxohWIHOI2X6U8jx3DTBz+lx2HzvjkAsz+Vt2PEJknmY+lk93VYAMou8SlQnQNWrnDzcrYN1XYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771839726; c=relaxed/relaxed;
	bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWkAqxlNVQWf9DKpwD4IK3DVNdkcJiDMndgy0HsNYZWHTEoESYBHts8rwdkl/3BTh3gzs23qTPHllbGn9U2WWgHMdSIS4JpdA9AigZMHpQiYoy/Ogc2FCAP9dMzRs053my2b2xeVqNjZViqkuEq3bz3wjqsJHLJH6cIP+WiL3RVMpBp04+F4ChMO5WDhs2hRVyLFOvMoeXtdUtyl535bmZL4LsIlYfTAPTvbexdBKgUHlCW2hr426/PoaYwGkFZtaXncZsmFFyqUrA7Jgc/6VCpbUWTosoAZ0grQyJ00e1wqlhhu3J0bnZkX8MaqwkVUOqutK/9mPGarOZW4DkFz/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Br7ovlo0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Br7ovlo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKG8s18jPz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:42:04 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3155300f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771839721; x=1772444521; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=Br7ovlo0AOq53Q1NdGnM52DJ+ciFCqzVjyF48VdwIhW3daqYQUfSBj+hto+oLQHCX8
         V+3CLKykqyC/KjEMt2yXwwW3DmUOr40R85u5M2S/+hzUsfm/y3bDWlrTkO+6OF/By+QP
         ea0HF321mE2FSOct9Hr8fZQv3QoudZ8QISytdF/NCbUBaf+j8XaW5SZbVtlB8bsJF2Hc
         +DcE48ZtlHLcWAVMjSFtmOHIRb92Kj6oryEMdEYWLvT4Br5U2OtTWoFgaIS73Em54Uuc
         FbszwPGwKTT4PyqD2vbpPEv9EgHNsm8WKr8AjUHfFdBnvswrYe85P9YKqjPhKCFH0qNP
         Pgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839721; x=1772444521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=ENlmQGSEfZ4tCjZ/dopj1E0tpE90i+uyOW8uC4M+pj7iVSZ604uCZjImOea0yJwNHf
         IYQeUmt/EpgNufV3F/BwuEVy/MjB4z7Ed6XInHAXz3XPX8sVPBVHXCPiWyj6C/GKmelH
         t5DsiOSlO9cjRgYHh0/XGL6pTVQCYQw9UiPiRgYcTy9JIsP8/2aGXN+GBhFsZZC+/TRU
         Sp+UUYXx9DA51IBHafc+wdeaxugMoOKC+RIPIwEpEEeKvpJs4PWlRvAFum6t5lao13DD
         OtQZ54nu2y4Cd58QE304+1rPPhuQlol2M9g/eHoOVdauR2VuiUU7ruJHb8+I4RLvYg0r
         Gf2g==
X-Forwarded-Encrypted: i=1; AJvYcCX3BOkfXzZbjVqEc4mZ4PpjHGEPDfotMuLAaJPSD3L9FLS14TSV03t1gygxhlpEQQwSzUOv5NMrcY0Izgk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywi7aMIHxFZmFRCNzJxqvkNAm0eXJ3WyQz10wX+7Kl87MXb45V3
	pkf9M4fw0qJCHRewjuXMrRbUKhiiP1AAaH+v7NbdftHSeibv5nGXgOcr
X-Gm-Gg: AZuq6aLV+yQrKP8gbYtVK38FpdCQYPd2h8JAeBzcVaE4S40jy1xRsYb/umvrdZWekI3
	7cIKgMIBkCCGyP6Elh8j3fjjSg0KvBJRVzQyWmoJY43or6wrCRYvdoC60tU5TgNdzudotFUwMMg
	uAGh8DXFMWkb7L3Voe63298QI0Y+IIw/hqFmCR3MM9+ysNE1Z70m8yNvjwI1VwM21r/jOs2hNQ/
	SzWzFRtORS+sxQuvdOTSpqTMNlFYwKGGI6P5+aGxa6SQHoI33k51xvjGhBryfeT77LzYokp5lhd
	NWTrtMFyFDGpMIVcTc0EWGX4R93D3c5c6STbiVUQYCWLmb2lgRN2flHOg2Pl4lKoJ8bp6qBPRWy
	H9TTOND0B5pVmTr8/2GulH+U4Jxm22qQ54H6ZwhyfYt0SLk0oRQvRh4IgOybR9PuO//Unj+n8e4
	hwjYrTxX70EUZITZshY90fN9+d62Fscpfdo5Tww97kP3wM6oxOvf+FzOTIFTT7ncqTywlu+r+mh
	mE=
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr121940845e9.3.1771839720960;
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0330sm222508405e9.9.2026.02.23.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Date: Mon, 23 Feb 2026 09:41:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260223094158.2197d7af@pumpkin>
In-Reply-To: <87ecmcwjh9.ffs@tglx>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-4-ryan.roberts@arm.com>
	<87ecmcwjh9.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:ryan.roberts@arm.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17038-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 59493174137
X-Rspamd-Action: no action

On Sun, 22 Feb 2026 22:34:26 +0100
Thomas Gleixner <tglx@kernel.org> wrote:

> On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
> > I tested an earlier version of this change on x86 bare metal and it
> > showed a smaller but still significant improvement. The bare metal
> > system wasn't available this time around so testing was done in a VM
> > instance. I'm guessing the cost of rdtsc is higher for VMs.  
> 
> No it's not, unless the hypervisor traps RDTSC, which would be insane as
> that would cause massive regressions all over the place.
> 
> So guessing is not really helpful if you want to argue performance.

The cost of rdtsc will depend on the cpu architecture.
To get valid comparisons you need to run on identical systems.

Regardless, the cost of rdtsc could easily be larger than the
cost of the prandom_u32_state() code (especially if inlined or
without all the return thunk 'crap').

	David

> 
> Thanks,
> 
>         tglx


