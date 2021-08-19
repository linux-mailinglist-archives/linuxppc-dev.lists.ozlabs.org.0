Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710FE3F1698
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 11:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr0Mj2YYlz3cKp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 19:48:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=q25frNr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+308e20cad7c5f5b5e2f7+6570+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=q25frNr0; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr0Lw1k0Lz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:48:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NIZCsGrRQbuo1Iii34pN1v0m0SpMM+x4PkA8jTWERkg=; b=q25frNr0RfbqC0fjoCxNp5/U9p
 XnS1Itp1kpFsNA/GpDu0yM5K5YaejGcpknYJqfk8EgGP6+4iHFTTLMsGRjmoCzrQgPNE5f0aWiJMP
 QQ9tLG/1QdIBzMpXUBSA5pPGezmjPq0CJwrYYk/ziy5TebK/nnSrHMZcfb2uIjCNLa4oakg80HoTF
 YSz/UGMzIuFO8B1+V7x8S7PTgRuTau4iALVZWpphyWlovh+/DBjKAy4vaUD6UbIXav3hhIt7y7OBs
 dRqDYFfcQQ/aBbwuYMYcW8088vlsXsee7dROmQFMco7Esnk7wRaXkBLBwlTa2FrZ/OuYJHiz30tR2
 lqk0CO2A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mGedJ-004t0t-0g; Thu, 19 Aug 2021 09:46:56 +0000
Date: Thu, 19 Aug 2021 10:46:45 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v2 02/12] mm: Introduce a function to check for
 virtualization protection features
Message-ID: <YR4ohWC4/cLsuCvv@infradead.org>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <482fe51f1671c1cd081039801b03db7ec0036332.1628873970.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <482fe51f1671c1cd081039801b03db7ec0036332.1628873970.git.thomas.lendacky@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390@vger.kernel.org,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 11:59:21AM -0500, Tom Lendacky wrote:
> +#define PATTR_MEM_ENCRYPT		0	/* Encrypted memory */
> +#define PATTR_HOST_MEM_ENCRYPT		1	/* Host encrypted memory */
> +#define PATTR_GUEST_MEM_ENCRYPT		2	/* Guest encrypted memory */
> +#define PATTR_GUEST_PROT_STATE		3	/* Guest encrypted state */

Please write an actual detailed explanaton of what these mean, that
is what implications it has on the kernel.

