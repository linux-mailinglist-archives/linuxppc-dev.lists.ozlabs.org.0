Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D66BC67F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 08:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pcddj3TyJz3cjb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 18:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BSYZpQwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pcdcq0BgRz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 18:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BSYZpQwa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pcdcj43gLz4x8y;
	Thu, 16 Mar 2023 18:07:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678950457;
	bh=Uoa/qK0tdF63rSzU8djzTz2HMi5Ua/1t+ckmoNcslIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BSYZpQwasbtNcuTSoDT6bijTCDl/Cvkd6x8Dqlk1pdpNNQdO/1PUOyGunqOTUT5Qc
	 ygnhlTaj0iW/PdkSEXieW1paBdk42bWFmbyxKAvIZyTV14cIlLdJuA14ixp8Hw2+Gp
	 EBI6k1e4XLgR/uGhvP1M1Kzy20URNHQzzTAMWRmFMXZOR1DCDmfcuMTsDXoDodpCpS
	 Ps7I+glJbtuhKuKkGArjbYELq5M0RTCCMIB+nfLYWp3ZMKkNirQUYbIK2H/rZzK3Lz
	 QdbNQ0prhjt3knA8sTFJJ0N4OBkqKqj6CEEd8vLXBkynAotbyO1nSlLpyLsqbRQU8J
	 6f5dWSD2Gzbbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ira Weiny <ira.weiny@intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
In-Reply-To: <64126d113d163_2595222942@iweiny-mobl.notmuch>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
 <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
 <64126d113d163_2595222942@iweiny-mobl.notmuch>
Date: Thu, 16 Mar 2023 18:07:31 +1100
Message-ID: <87lejxmax8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ira Weiny <ira.weiny@intel.com> writes:
> Dave Hansen wrote:
>> On 3/15/23 16:20, Ira Weiny wrote:
>> > Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray 
>> > callbacks") removed the calls to memcpy_page_flushcache().
>> > 
>> > kmap_atomic() is deprecated and used in the x86 version of
>> > memcpy_page_flushcache().
>> > 
>> > Remove the unnecessary memcpy_page_flushcache() call from all arch's.
>> 
>> Hi Ira,
>> 
>> Since the common code user is already gone these three patches seem
>> quite independent.  It seems like the right thing to do is have
>> individual arch maintainers cherry pick their arch patch and carry it
>> independently.
>
> Yes.
>
>> 
>> Is there a compelling reason to have someone pick up and carry these all
>> together that I'm missing?
>
> No reason.  Would you like me to submit them individually?

I'll just grab the powerpc one from the thread, no need to resend.

> Sorry, submitting them separately crossed my mind when I wrote them but I
> kind of forgot as they were all on the same branch and I was waiting for
> after the merge window to submit them.

It's also much easier to run git-send-email HEAD^^^, rather than running
it three separate times, let alone if it's a 20 patch series.

I wonder if we could come up with some convention to indicate that a
series is made up of independent patches, and maintainers are free to
pick them individually - but still sent as a single series.

cheers
