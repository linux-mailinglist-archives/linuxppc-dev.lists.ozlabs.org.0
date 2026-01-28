Return-Path: <linuxppc-dev+bounces-16373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNAOCmdWemlm5QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 19:33:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BBA7CC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 19:33:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1W9b1H5yz2xpg;
	Thu, 29 Jan 2026 05:33:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769625187;
	cv=none; b=PXi2SuefsSYe7nm407+jYoxYOIFGZ8habdupbI3DvgcST2Opqjvu5KRLdzo9Pc0xN+qC1lr9mP48K8WnC64SvfKYTg6Mzce5dXNFFxIjmD0ituYjdVs9Sgpz8h0ulRoCTatpJP5nDZLMmZ505Yw4GOUHUcmJGlQZz1lQm/hCFhnhcQ5xJxwBvjtsrHyLve9nJjm7UMe+5FpcisMwGpkLR5kB165FGQxnrP3YnjBQABALJOSxoMF3HjxEU77KoJQZyPC8aJrrU3msSZFmo7Qb1cQAIi+I66ZDQejxB5vdli4/wxbDGiCjxM+LQ9U6aBlQakLYuAGWVXZSwyGL9GqKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769625187; c=relaxed/relaxed;
	bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKnOwTQoW7CzVMBhOw+9Ma17OuT+R+itvynz4+9EuDGOHnRw0tXasNFB2dpcyLpWfH+KPhE/NSIpT7W9SZ+VRhkbUk6PJXmR4YqnfcQhd8JtDdBRNE2zyXhc60LY0OoEz38JmkeMm0J54X96W/iHBqjQLE1SFqbgv9vYEVLV6YAO+JcV7iiNTsqD3Ft29HxAPzwlstXWjtUj5s2GotW7xEKPrgCXkhuaxvjJKkaV78+74inp6/t0qfmcKnQv1y3Te0xe721x53xLYovk6KV8rQxClPUgTSQBGAyMOReVi+NRBPEkyuBQ8VaRLTuBe/IPVio01irrcpuSs24sP1v74w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DzIeImQM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DzIeImQM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1W9X3kqXz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 05:33:03 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fed090e5fso159986f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 10:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769625174; x=1770229974; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=DzIeImQM3+dZ53rS3yoPq4z901cmDu6R1pj7MHZeDQq7xu7ccEqlp76mbiqJGITLnd
         uW67ikCEUwgcnUyrRfLf/YAbwBnxJVRNQlrNFqk9CKyYuKDoWkS8oNwrJIk07onlUvPc
         +dqDdy1VKLCOdDzzLaP415sLjKRsvBdMz9JMOIhCaz/wvrZaODz/Wu9BPJ5dKQg306S2
         uk6DGGXQFeFcEpc4ZXLNuNwSaUi995nx81j0pwaesB1Pt+mhI2P41elm+XNVTgyrvldI
         +8DEcYbRtZsy8tHHbWaVMPPq7NA4BEk+N+3IoIWJo97Un9h0l0POxF34qveX6GmzWsL/
         INjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769625174; x=1770229974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=bRN/KrVyoy5vyz0dSI6I1hUl93N8MKtuMBEie1yG/YiJiL+T9KSGpd2pmxqorlO5+g
         LmYSlWan5bi+MusfRICGIRZUZYuWgnfW4zEztT7tPUeIEE7KM678KbPNIIVYXmziOnrw
         U2bRQZO5eas492zcthm/5Xu8OdkJKbaPvwtlR4QdZGpKvtHuPPA1DfB7uBJpW44yb9QJ
         3hSMNm4z2leKEF+JqXfYX1Ff+EuzUTcbdOXGmMvZg1pmd6cMBPMh4rfIImLwvq1fVDSU
         F9UtBGYjGiERvPR4NQ1Z0zdDlZqNzzS3/CjTaAtHQsgE8WJ50UxdUaxKP1+2Lb8zqvBn
         VYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIWX7+mAgahjKtXozs0+wmh8cdDcg7Xv6e8KdSlqYhXWNO1FY+Zn87bQGgd9bYhRjXsytWT7i3bYIoYto=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyBguF6K6LGzmyRtJJyPYpBvv/yRLjcdd18aKl12e2NqsvYQoT
	GjMol07BXjHD+fpK/E2ZTD9Fk0fv/x+isDWT0KYPQgDZ9PpptQMQLJV0
X-Gm-Gg: AZuq6aKtcxgrH+LHl8vE/ORTtfzA1xFpKcFSgAI1NVXqHblAob3eieLqARG8psoiNnH
	yEUGfhIxzmz6O4JomIKHLvxIoN+H1rVuVOqCMnsEQgBmuZ3zmzIKbuPwdFdTwQOd5p9NT9rUSUU
	b6I8JUUvONMMWS+liIWD3Z0/VbYiJyf1E6YBRVhcVVrAcn1ua9bSjurOfK/jwDt+Wt0GduGqDXU
	ADeqtxoMTuWYjneH0JiW2E4snwR2imxapGsfOz9qnj19xrFEImaAJBZXF3xQC0VIfoNLTZIgIXc
	Om8+DvNdDmKJUSo8kEmDZN560S0iZVebuatea2w6gIYivie14kCvYbkb9Qr9Sxd7HXykJhLAQXN
	gPZ8omfW1kEAVAaHNQD/vxw1SQSku6WNCfUxLpLmFV5BcYU8SViKNLdn4PT/0c2KKKItPT/33Du
	asG28yRMuM7jUm+0YMXT/J2+aWDkBkHXg3p3QCsxMswYz0NYCS8kRF
X-Received: by 2002:a05:6000:3113:b0:435:9241:37c2 with SMTP id ffacd0b85a97d-435dd01e23fmr8152542f8f.9.1769625174058;
        Wed, 28 Jan 2026 10:32:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm9165906f8f.26.2026.01.28.10.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:32:53 -0800 (PST)
Date: Wed, 28 Jan 2026 18:32:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
Message-ID: <20260128183251.7177c345@pumpkin>
In-Reply-To: <670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-3-ryan.roberts@arm.com>
	<aXpArjZ1QQowshnA@zx2c4.com>
	<670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.roberts@arm.com,m:Jason@zx2c4.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
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
	TAGGED_FROM(0.00)[bounces-16373-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 983BBA7CC3
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 17:33:19 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 28/01/2026 17:00, Jason A. Donenfeld wrote:
> > On Mon, Jan 19, 2026 at 01:01:09PM +0000, Ryan Roberts wrote:  
> >> We will shortly use prandom_u32_state() to implement kstack offset
> >> randomization and some arches need to call it from non-instrumentable
> >> context. So let's implement prandom_u32_state() as an out-of-line
> >> wrapper around a new __always_inline prandom_u32_state_inline(). kstack
> >> offset randomization will use this new version.
> >>
> >> Acked-by: Mark Rutland <mark.rutland@arm.com>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  include/linux/prandom.h | 20 ++++++++++++++++++++
> >>  lib/random32.c          |  8 +-------
> >>  2 files changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> >> index ff7dcc3fa105..801188680a29 100644
> >> --- a/include/linux/prandom.h
> >> +++ b/include/linux/prandom.h
> >> @@ -17,6 +17,26 @@ struct rnd_state {
> >>  	__u32 s1, s2, s3, s4;
> >>  };
> >>  
> >> +/**
> >> + * prandom_u32_state_inline - seeded pseudo-random number generator.
> >> + * @state: pointer to state structure holding seeded state.
> >> + *
> >> + * This is used for pseudo-randomness with no outside seeding.
> >> + * For more random results, use get_random_u32().
> >> + * For use only where the out-of-line version, prandom_u32_state(), cannot be
> >> + * used (e.g. noinstr code).

If you are going to respin:
		(e.g. noinst or performance critical code).

	David

> >> + */
> >> +static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)  
> > 
> > This is pretty bikesheddy and I'm not really entirely convinced that my
> > intuition is correct here, but I thought I should at least ask. Do you
> > think this would be better called __prandom_u32_state(), where the "__"
> > is kind of a, "don't use this directly unless you know what you're doing
> > because it's sort of internal"? It seems like either we make this inline
> > for everybody, or if there's a good reason for having most users use the
> > non-inline version, then we should be careful that new users don't use
> > the inline version. I was thinking the __ would help with that.  
> 
> I'm certainly happy to do that, if that's your preference. I have to respin this
> anyway, given the noinstr issue.
> 
> > 
> > Jason  
> 


