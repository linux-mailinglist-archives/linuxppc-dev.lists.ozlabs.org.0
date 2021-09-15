Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DEC40CAFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 18:47:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8mMy2fmnz2yMM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 02:47:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=OinwDiMH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=OinwDiMH; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8mM94ZMQz2xnf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 02:46:24 +1000 (AEST)
Received: from zn.tnic (p200300ec2f0d07008534a6109a52ea91.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:700:8534:a610:9a52:ea91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 04D0A1EC051F;
 Wed, 15 Sep 2021 18:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1631724372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ohcK2lrqZI/0Un5cQQISQvRNuEO3HIFBods4v3gznU8=;
 b=OinwDiMHyIs6ppSqYums+HJ/wABxvhGKKUPvdDics4JXpIwsFCihfmg/tYjRwayQUS5zAl
 /A8dCEMw7DwHpgzspvS586x6N5hMBRCXCrXZr4wBrq7mNNSRVp8ss+I1qG84M8RgMvHJvz
 7a85Vcl/oUKHuIwbTjsfd22UCB+v5Mg=
Date: Wed, 15 Sep 2021 18:46:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 0/8] Implement generic cc_platform_has() helper function
Message-ID: <YUIjS6lKEY5AadZx@zn.tnic>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1631141919.git.thomas.lendacky@amd.com>
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Dave Young <dyoung@redhat.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 05:58:31PM -0500, Tom Lendacky wrote:
> This patch series provides a generic helper function, cc_platform_has(),
> to replace the sme_active(), sev_active(), sev_es_active() and
> mem_encrypt_active() functions.
> 
> It is expected that as new confidential computing technologies are
> added to the kernel, they can all be covered by a single function call
> instead of a collection of specific function calls all called from the
> same locations.
> 
> The powerpc and s390 patches have been compile tested only. Can the
> folks copied on this series verify that nothing breaks for them. Also,
> a new file, arch/powerpc/platforms/pseries/cc_platform.c, has been
> created for powerpc to hold the out of line function.

...

> 
> Tom Lendacky (8):
>   x86/ioremap: Selectively build arch override encryption functions
>   mm: Introduce a function to check for confidential computing features
>   x86/sev: Add an x86 version of cc_platform_has()
>   powerpc/pseries/svm: Add a powerpc version of cc_platform_has()
>   x86/sme: Replace occurrences of sme_active() with cc_platform_has()
>   x86/sev: Replace occurrences of sev_active() with cc_platform_has()
>   x86/sev: Replace occurrences of sev_es_active() with cc_platform_has()
>   treewide: Replace the use of mem_encrypt_active() with
>     cc_platform_has()

Ok, modulo the minor things the plan is to take this through tip after
-rc2 releases in order to pick up the powerpc build fix and have a clean
base (-rc2) to base stuff on, at the same time.

Pls holler if something's still amiss.

Sathya,

if you want to prepare the Intel variant intel_cc_platform_has() ontop
of those and send it to me, that would be good because then I can
integrate it all in one branch which can be used to base future work
ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
