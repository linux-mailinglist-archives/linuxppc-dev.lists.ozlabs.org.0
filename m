Return-Path: <linuxppc-dev+bounces-15456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C6D0A807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 14:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnjr730JVz2xgv;
	Sat, 10 Jan 2026 00:52:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767966727;
	cv=none; b=EJrhCo25026AwRshv5Y/Z4C4EdDq5m0JXzpv7i8aUMIQMB9SCp5RwQVIG99mKIrMy1jcFOAv9E0VRZcT6PguD/4ay9dhELrYbk3koXZIDIywMqj+/ob3HIikILbH9POkBa04pBYWnWWEpj04+pZlt+6XNpPylZC1fHbvPOfnegDruuR3Jn0okZR+CWcqmOJ30Ad7hjorIW8QijIw6u4UZ1cc2H7KHzmkG2bPEJWk9ALIAxt17YpWARz0Jih7KWtyQD3BB0azjhDONiPrr+7OecZaz88iqtVzMFJtRpuslbMIJ9KnHXDe4sFaAVQWaxv7XhJd34US9FL/RE9K/U/J8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767966727; c=relaxed/relaxed;
	bh=KJQIdm7+jCE6CHXsOBXIdtscjOnc6Dh54et095b0POU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUmsGfgjGVYKPRAqAY2jAEGY12210YUQKRhIP4X4S6cjWaxbRiTAXlynWYTdNCiUnNq9YoRlRrmuLj+XlBu3o7ArMGJM1wJiy5KXVzv3+ki1wqgL3uS46Tv3XjV9NiikAmF71iqM4Q5+13L3qFrIdrj8PVziDdaA0b0bV6XL+pwyE3y6RpWWlUmU1SsR7eugyV+1TFJkZvi1rwfKn0XYGHO7xZF1sBu4Lt7mKbgB/QgsnpoVOTsPtFE38wsuaAivN58ubRSG6LFle52n7Rft+oBBR3prtkMg3jwdLnzB5vsbNI1IduXQr7PrQyEsDB5Ea1MxkKAqNBB5KwYQmSyTdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VOuJ4cz9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VOuJ4cz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnjr62mNmz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 00:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97A224095D;
	Fri,  9 Jan 2026 13:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD79C4CEF1;
	Fri,  9 Jan 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767966723;
	bh=JmQoDU+xB61L0vG2xAw8si4DDlJ4kpYKIP6hcBYkDHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOuJ4cz9fYa82d1d6GkpK6UUxf3+Sy7pmJZyTUwXXj9por6Q9uHTFlfFKmyS136Qs
	 dr7vgDzlW8nrWJn4VqL+XT25/385bgjfUBtgZrYqS0S3Rb9QUZWvsh8d+FUTHijpAF
	 ORbnYjrpgGOg8kDPHmc20UzpM5wPx7TThRsrX2WmDfi/ck2qBDHH4TOORR3R40Ky9z
	 qjdvGE6Ig52LMlCi7t9XAErPJ4si42O35nxRtWKEB4vWVUN2hHVHZ6d/Md5IwvNjt4
	 bRilLQgGAETr9RumMECFEh/JW10F4c5deie6C/LQCdzU2Tpk665P66uwHEnPCm79C0
	 yxdQA1QmVoMUQ==
Date: Fri, 9 Jan 2026 19:20:55 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-trace-kernel@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev, Maryam Moghadas <maryammo@ca.ibm.com>
Subject: Re: [PATCH 1/3] powerpc64: make clang cross-build friendly
Message-ID: <aWEHPEJFYccmCVQK@blrnaveerao1>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
 <20251108210405.2375472-2-hbathini@linux.ibm.com>
 <rtnn6dd6y3refo7myc4crzmrunbuyabr2ewlyk7oe4yx3f2rl2@wzoyvsucfeyf>
 <8141c6eb-f2b7-4a19-b637-af699bb8d5c4@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8141c6eb-f2b7-4a19-b637-af699bb8d5c4@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 08, 2025 at 09:32:06PM +0530, Hari Bathini wrote:
> Thanks for the review, Naveen.
> 
> On 24/11/25 11:19 am, Naveen N Rao wrote:
> > On Sun, Nov 09, 2025 at 02:34:03AM +0530, Hari Bathini wrote:
> > > ARCH_USING_PATCHABLE_FUNCTION_ENTRY depends on toolchain support for
> > > -fpatchable-function-entry option. The current script that checks
> > > for this support only handles GCC. Rename the script and extend it
> > > to detect support for -fpatchable-function-entry with Clang as well,
> > > allowing clean cross-compilation with Clang toolchains.
> > > 
> > > Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> > > ---
> > >   arch/powerpc/Kconfig                                         | 5 +++--
> > >   ...-function-entry.sh => check-fpatchable-function-entry.sh} | 0
> > >   2 files changed, 3 insertions(+), 2 deletions(-)
> > >   rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)
> > > 
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index 325c1171894d..dfb62e211c92 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -568,8 +568,9 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
> > >   	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
> > >   	depends on $(cc-option,-fpatchable-function-entry=2)
> > >   	def_bool y if PPC32
> > > -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
> > > -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
> > > +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_GCC
> > > +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -target ppc64le -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_CLANG
> > 
> > Can you instead pass $(CLANG_FLAGS) to retain the same command across
> > gcc/clang?
> 
> Should work, I guess.
> But do I need to test for any additional clang flags that
> may interfere with what we are trying to check here?

From what I can tell, $(CLANG_FLAGS) includes a fairly static set of 
flags which will be included alongside other $CFLAGS. So, I don't think 
anything special should be needed there.

- Naveen


