Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F363A0599
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:14:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G030M3CTPz3bxn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:14:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FSXWgxmd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=FSXWgxmd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G02zs3fnFz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:14:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52E3660FD8;
 Tue,  8 Jun 2021 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623186852;
 bh=G2smJxvAvuJyR2PVlfkCgvduPlzSv6hHhHX7NFNY20I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FSXWgxmd8Uuly+8F/DNMxKu28peM0aEDJWzKxZhCGVBW3OFtmBlFiFDRnIaxVwEjp
 U+bMQ8ZGcX8xc9CsXU0xGdx9cw1evm79PHu5nuqSh5775dEpcL/aIdLs0/8ZpVRs0n
 pieXRb46jjM8WiXkFPegtAY9/fQA7BshRhnEuDpc=
Date: Tue, 8 Jun 2021 14:14:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH] crash_core, vmcoreinfo: Append 'SECTION_SIZE_BITS' to
 vmcoreinfo
Message-Id: <20210608141410.0026a925ba3a609b0dd4e560@linux-foundation.org>
In-Reply-To: <20210608142432.GA587883@MiWiFi-R3L-srv>
References: <20210608103359.84907-1-kernelfans@gmail.com>
 <20210608142432.GA587883@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 x86@kernel.org, kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Jun 2021 22:24:32 +0800 Baoquan He <bhe@redhat.com> wrote:

> On 06/08/21 at 06:33am, Pingfan Liu wrote:
> > As mentioned in kernel commit 1d50e5d0c505 ("crash_core, vmcoreinfo:
> > Append 'MAX_PHYSMEM_BITS' to vmcoreinfo"), SECTION_SIZE_BITS in the
> > formula:
> >     #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
> > 
> > Besides SECTIONS_SHIFT, SECTION_SIZE_BITS is also used to calculate
> > PAGES_PER_SECTION in makedumpfile just like kernel.
> > 
> > Unfortunately, this arch-dependent macro SECTION_SIZE_BITS changes, e.g.
> > recently in kernel commit f0b13ee23241 ("arm64/sparsemem: reduce
> > SECTION_SIZE_BITS"). But user space wants a stable interface to get this
> > info. Such info is impossible to be deduced from a crashdump vmcore.
> > Hence append SECTION_SIZE_BITS to vmcoreinfo.
> 
> ...
>
> Add the discussion of the original thread in kexec ML for reference:
> http://lists.infradead.org/pipermail/kexec/2021-June/022676.html

I added a Link: for this.
 
> This looks good to me.
> 
> Acked-by: Baoquan He <bhe@redhat.com>

I'm thinking we should backport this at least to Fixes:f0b13ee23241. 
But perhaps it's simpler to just backport it as far as possible, so I
added a bare cc:stable with no Fixes:.  Thoughts?
