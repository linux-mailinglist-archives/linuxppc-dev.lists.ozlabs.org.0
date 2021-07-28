Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCC3D934B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 18:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZfR02Ty7z3bYb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 02:35:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=LxjG3gFI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=LxjG3gFI; dkim-atps=neutral
X-Greylist: delayed 402 seconds by postgrey-1.36 at boromir;
 Thu, 29 Jul 2021 02:34:57 AEST
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZfQT6366z2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 02:34:57 +1000 (AEST)
Received: from nazgul.tnic (unknown [109.121.183.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F24F1EC0527;
 Wed, 28 Jul 2021 18:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1627489669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=GOEYhGPYQ4YUbo4gftj4JX0Uz5V/Qj9S6dris+AXSaA=;
 b=LxjG3gFIJCDuOQDGzY+hiG0vN+dfpBr7Vq5w2ORdpOETiJfx6X9JMDFJJMxIan0ujoNNw7
 KMi/vJ5Nq5Vi/Nq5x7JcXDHRAXe8ptcsnGwT9j1ZZa1hhOAXVDNeta9RonTrMrxsR3lvLV
 KIVjknjki6FEc0QGw1JCe7AU529aFu0=
Date: Wed, 28 Jul 2021 18:28:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/11] mm: Introduce a function to check for
 virtualization protection features
Message-ID: <YQGFh3BlaD8RAEBz@nazgul.tnic>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <cbc875b1d2113225c2b44a2384d5b303d0453cf7.1627424774.git.thomas.lendacky@amd.com>
 <YQFY5/cq2thyHzUe@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YQFY5/cq2thyHzUe@infradead.org>
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-efi@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 02:17:27PM +0100, Christoph Hellwig wrote:
> So common checks obviously make sense, but I really hate the stupid
> multiplexer.  Having one well-documented helper per feature is much
> easier to follow.

We had that in x86 - it was called cpu_has_<xxx> where xxx is the
feature bit. It didn't scale with the sheer amount of feature bits that
kept getting added so we do cpu_feature_enabled(X86_FEATURE_XXX) now.

The idea behind this is very similar - those protected guest flags
will only grow in the couple of tens range - at least - so having a
multiplexer is a lot simpler, I'd say, than having a couple of tens of
helpers. And those PATTR flags should have good, readable names, btw.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
