Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F141B983
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJtHF6qWpz2yw1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 07:41:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=K5Ca7t9h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=K5Ca7t9h; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJtGd3HkLz307W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 07:40:37 +1000 (AEST)
Received: from zn.tnic (p200300ec2f13b200371079131a9f19c8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f13:b200:3710:7913:1a9f:19c8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 185C51EC06C1;
 Tue, 28 Sep 2021 23:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632865234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=3zAlBZi1O1Z7iGiOtlzR59oObKF3oTwf3vRM6tWoLcY=;
 b=K5Ca7t9hqqMM2deF0li2lbysEHXsHTs91GSL2ZqKLhzfX9w19AiIGCNaZ3Y63sCu3hsepG
 fIbQEa5D8HQEE2RRoDDCLkqS/Fxfaghkv3CiOoHYu4QVTSTfUfcSzUHkFkeeRHlHYg9afU
 kuT2sPlWmWHkAbKxJ37GJ775LHgIgQc=
Date: Tue, 28 Sep 2021 23:40:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v4 0/8] Implement generic cc_platform_has() helper function
Message-ID: <YVOLzMwyXP3ZSR0F@zn.tnic>
References: <20210928191009.32551-1-bp@alien8.de>
 <80593893-c63b-d481-45f1-42a3a6fd762a@linux.intel.com>
 <YVN7vPE/7jecXcJ/@zn.tnic>
 <7319b756-55dc-c4d1-baf6-4686f0156ac4@linux.intel.com>
 <YVOB3mFV1Kj3MXAs@zn.tnic>
 <695a3bf6-5382-68df-3ab5-8841b777fca2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <695a3bf6-5382-68df-3ab5-8841b777fca2@linux.intel.com>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Young <dyoung@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 02:01:57PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> Yes. But, since the check is related to TDX, I just want to confirm whether
> you are fine with naming the function as intel_*().

Why is this such a big of a deal?!

There's amd_cc_platform_has() and intel_cc_platform_has() will be the
corresponding Intel version.

> Since this patch is going to have dependency on TDX code, I will include
> this patch in TDX patch set.

Ok.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
