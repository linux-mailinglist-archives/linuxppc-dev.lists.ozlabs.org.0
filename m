Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52623DB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 18:40:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4574QK5j1RzDqK6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 02:40:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="I0kYMPWM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4574Nf09GBzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 02:39:13 +1000 (AEST)
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F230214DA;
 Mon, 20 May 2019 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558370350;
 bh=ISo06FCJrG9k2nLXbAzv522hQDENE46NAA1tXip5Ako=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0kYMPWMpCmIFiFdE9bDFcr62ej78ewiWNnyHJT5Gm3GZEvbU+6w19XfssuSMsewm
 QfPxL21SH//mf2pBpU6UgGtqE+W3P9hWs+I83pSwIYO5dD4+NTuhgTVXmEfB6yvR78
 FSkBHcBwvd9IMlkfd2Xvd2GpWXadm+SMCYeMdy/w=
Date: Mon, 20 May 2019 09:39:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] crypto: vmx - CTR: always increment IV as quadword
Message-ID: <20190520163907.GA119750@gmail.com>
References: <20190515102450.30557-1-dja@axtens.net>
 <87r28tzy1i.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r28tzy1i.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: leo.barbosa@canonical.com, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, nayna@linux.ibm.com,
 omosnacek@gmail.com, leitao@debian.org, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, marcelo.cerri@canonical.com,
 gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 11:59:05AM +1000, Daniel Axtens wrote:
> Daniel Axtens <dja@axtens.net> writes:
> 
> > The kernel self-tests picked up an issue with CTR mode:
> > alg: skcipher: p8_aes_ctr encryption test failed (wrong result) on test vector 3, cfg="uneven misaligned splits, may sleep"
> >
> > Test vector 3 has an IV of FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD, so
> > after 3 increments it should wrap around to 0.
> >
> > In the aesp8-ppc code from OpenSSL, there are two paths that
> > increment IVs: the bulk (8 at a time) path, and the individual
> > path which is used when there are fewer than 8 AES blocks to
> > process.
> >
> > In the bulk path, the IV is incremented with vadduqm: "Vector
> > Add Unsigned Quadword Modulo", which does 128-bit addition.
> >
> > In the individual path, however, the IV is incremented with
> > vadduwm: "Vector Add Unsigned Word Modulo", which instead
> > does 4 32-bit additions. Thus the IV would instead become
> > FFFFFFFFFFFFFFFFFFFFFFFF00000000, throwing off the result.
> >
> > Use vadduqm.
> >
> > This was probably a typo originally, what with q and w being
> > adjacent. It is a pretty narrow edge case: I am really
> > impressed by the quality of the kernel self-tests!
> >
> > Fixes: 5c380d623ed3 ("crypto: vmx - Add support for VMS instructions by ASM")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daniel Axtens <dja@axtens.net>
> >
> > ---
> >
> > I'll pass this along internally to get it into OpenSSL as well.
> 
> I passed this along to OpenSSL and got pretty comprehensively schooled:
> https://github.com/openssl/openssl/pull/8942
> 
> It seems we tweak the openssl code to use a 128-bit counter, whereas
> the original code was in fact designed for a 32-bit counter. We must
> have changed the vaddu instruction in the bulk path but not in the
> individual path, as they're both vadduwm (4x32-bit) upstream.
> 
> I think this change is still correct with regards to the kernel,
> but I guess it's probably something where I should have done a more
> thorough read of the documentation before diving in to the code, and
> perhaps we should note it in the code somewhere too. Ah well.
> 
> Regards,
> Daniel
> 

Ah, I didn't realize there are multiple conventions for CTR.  Yes, all CTR
implementations in the kernel follow the 128-bit convention, and evidently the
test vectors test for that.  Apparently the VMX OpenSSL code got incompletely
changed from the 32-bit convention by this commit, so that's what you're fixing:

	commit 1d4aa0b4c1816e8ca92a6aadb0d8f6b43c56c0d0
	Author: Leonidas Da Silva Barbosa <leosilva@linux.vnet.ibm.com>
	Date:   Fri Aug 14 10:12:22 2015 -0300

	    crypto: vmx - Fixing AES-CTR counter bug
	    
	    AES-CTR is using a counter 8bytes-8bytes what miss match with
	    kernel specs.
	    
	    In the previous code a vadduwm was done to increment counter.
	    Replacing this for a vadduqm now considering both cases counter
	    8-8 bytes and full 16bytes.

A comment in the code would indeed be helpful.

Note that the kernel doesn't currently need a 32-bit CTR implementation for GCM
like OpenSSL does, because the kernel currently only supports 12-byte IVs with
GCM.  So the low 32 bits of the counter start at 1 and don't overflow,
regardless of whether the counter is incremented mod 2^32 or mod 2^128.

- Eric
