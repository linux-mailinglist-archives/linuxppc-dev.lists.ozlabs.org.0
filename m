Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496B3E9061
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 14:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl85f0wy2z308v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 22:19:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=FrdABWFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=FrdABWFO; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl84x28bJz3019
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 22:19:11 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id d4so5219308lfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QRfjFOudnOiwA+M7/UAaVDTJpihSFBYjea6mHo6NSYA=;
 b=FrdABWFOYFHYVQYvsn9eIFG1XXIqUnaFBCPEPrWXTbkImjcaYqnfbbDKJbjXTj8n2z
 XKpeeMl+HDYMaw1njH7BCzSmXb2GWH1pBn4+E1w1Zkax9zqjTCMN0ceFLpN0oNSL7p4h
 tTOYo06jVnb3EuSp9CAkw3RajLjCGRh5DcWWOVaUC3oCLa3fiXHjMHrKiPKxkbd9MHf4
 XWiG9YDES/j+Q6K8AbBgatHhy3Ey7EF4Mw9l8egNLjOvPiIJBkLqlDJHfGJd1OD2IwY9
 /Dj5oeYRUTA55X3eykWwXtvq+RdRhaXu8H17iGSYXfRtDXdJr3ACYPa147h4M5kexh1Q
 1YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QRfjFOudnOiwA+M7/UAaVDTJpihSFBYjea6mHo6NSYA=;
 b=K4jmz71F2KbFKpB8/1vfkJWYghr61sa7AIGuoHN0a1peZgeAmgfJYw7f2xQR1vfsq9
 mlqxzWhlVtRDr+7lmfmzHhpzKk7iCwgWfCen2E3H4qJr0Y8lzJ6ukd15gscsbh4P3rxa
 /1GbwHKh4XZGI5GdX7mJ4GNHy9AkmsKsep6UnGxnEGDhOKFYPs1SYeVn/epa/cTO6c0i
 q8NSZHkyBrObfVNq3qXKalQvPGS76my1lg3mw0VO2d26XQJzRfW5wRvf5AxAYndTtDFn
 W0uBRNVWr/2wwT5WvKiL6JFcXQeC4OWg2sS7ijNXtmgoIoN0/ZFaGkF2qNTE7JMSf6ut
 xmAg==
X-Gm-Message-State: AOAM530iOTtt/xnErMz2KCk9jcyGDc+mTYYI7+nniSnmNHrSBQX/wrgc
 K6j3qLIf6UFvrbFiDpUiFBJRTw==
X-Google-Smtp-Source: ABdhPJwYqCmmrayYkwT8dKOh/tHUuUvcGTl6bQD02skpgV77PxIfPFHOo1k2HSgXk2Z2qwWhaj6ksA==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr4762329lfm.631.1628684346244; 
 Wed, 11 Aug 2021 05:19:06 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id w7sm2337599lft.285.2021.08.11.05.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 05:19:05 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A68EB102A2E; Wed, 11 Aug 2021 15:19:17 +0300 (+03)
Date: Wed, 11 Aug 2021 15:19:17 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 07/11] treewide: Replace the use of mem_encrypt_active()
 with prot_guest_has()
Message-ID: <20210811121917.ghxi7g4mctuybhbk@box.shutemov.name>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <029791b24c6412f9427cfe6ec598156c64395964.1627424774.git.thomas.lendacky@amd.com>
 <166f30d8-9abb-02de-70d8-6e97f44f85df@linux.intel.com>
 <4b885c52-f70a-147e-86bd-c71a8f4ef564@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b885c52-f70a-147e-86bd-c71a8f4ef564@amd.com>
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
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Dave Young <dyoung@redhat.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 10, 2021 at 02:48:54PM -0500, Tom Lendacky wrote:
> On 8/10/21 1:45 PM, Kuppuswamy, Sathyanarayanan wrote:
> > 
> > 
> > On 7/27/21 3:26 PM, Tom Lendacky wrote:
> >> diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> >> index de01903c3735..cafed6456d45 100644
> >> --- a/arch/x86/kernel/head64.c
> >> +++ b/arch/x86/kernel/head64.c
> >> @@ -19,7 +19,7 @@
> >>   #include <linux/start_kernel.h>
> >>   #include <linux/io.h>
> >>   #include <linux/memblock.h>
> >> -#include <linux/mem_encrypt.h>
> >> +#include <linux/protected_guest.h>
> >>   #include <linux/pgtable.h>
> >>     #include <asm/processor.h>
> >> @@ -285,7 +285,7 @@ unsigned long __head __startup_64(unsigned long
> >> physaddr,
> >>        * there is no need to zero it after changing the memory encryption
> >>        * attribute.
> >>        */
> >> -    if (mem_encrypt_active()) {
> >> +    if (prot_guest_has(PATTR_MEM_ENCRYPT)) {
> >>           vaddr = (unsigned long)__start_bss_decrypted;
> >>           vaddr_end = (unsigned long)__end_bss_decrypted;
> > 
> > 
> > Since this change is specific to AMD, can you replace PATTR_MEM_ENCRYPT with
> > prot_guest_has(PATTR_SME) || prot_guest_has(PATTR_SEV). It is not used in
> > TDX.
> 
> This is a direct replacement for now.

With current implementation of prot_guest_has() for TDX it breaks boot for
me.

Looking at code agains, now I *think* the reason is accessing a global
variable from __startup_64() inside TDX version of prot_guest_has().

__startup_64() is special. If you access any global variable you need to
use fixup_pointer(). See comment before __startup_64().

I'm not sure how you get away with accessing sme_me_mask directly from
there. Any clues? Maybe just a luck and complier generates code just right
for your case, I donno.

A separate point is that TDX version of prot_guest_has() relies on
cpu_feature_enabled() which is not ready at this point.

I think __bss_decrypted fixup has to be done if sme_me_mask is non-zero.
Or just do it uncoditionally because it's NOP for sme_me_mask == 0.

> I think the change you're requesting
> should be done as part of the TDX support patches so it's clear why it is
> being changed.
> 
> But, wouldn't TDX still need to do something with this shared/unencrypted
> area, though? Or since it is shared, there's actually nothing you need to
> do (the bss decrpyted section exists even if CONFIG_AMD_MEM_ENCRYPT is not
> configured)?

AFAICS, only kvmclock uses __bss_decrypted. We don't enable kvmclock in
TDX at the moment. It may change in the future.

-- 
 Kirill A. Shutemov
