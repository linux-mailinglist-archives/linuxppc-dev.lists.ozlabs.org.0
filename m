Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49613DD40A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 12:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdZLp631Nz3bX2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 20:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=8bytes.org (client-ip=2a01:238:4383:600:38bc:a715:4b6d:a889;
 helo=theia.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdZL54Fwzz3000
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 20:41:17 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C8EAC926; Mon,  2 Aug 2021 12:35:46 +0200 (CEST)
Date: Mon, 2 Aug 2021 12:35:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 02/11] x86/sev: Add an x86 version of prot_guest_has()
Message-ID: <YQfKgZEikvhgicws@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <b3e929a77303dd47fd2adc2a1011009d3bfcee20.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e929a77303dd47fd2adc2a1011009d3bfcee20.1627424774.git.thomas.lendacky@amd.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-s390@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 05:26:05PM -0500, Tom Lendacky wrote:
> Introduce an x86 version of the prot_guest_has() function. This will be
> used in the more generic x86 code to replace vendor specific calls like
> sev_active(), etc.
> 
> While the name suggests this is intended mainly for guests, it will
> also be used for host memory encryption checks in place of sme_active().
> 
> The amd_prot_guest_has() function does not use EXPORT_SYMBOL_GPL for the
> same reasons previously stated when changing sme_active(), sev_active and
> sme_me_mask to EXPORT_SYBMOL:
>   commit 87df26175e67 ("x86/mm: Unbreak modules that rely on external PAGE_KERNEL availability")
>   commit 9d5f38ba6c82 ("x86/mm: Unbreak modules that use the DMA API")
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Co-developed-by: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> Co-developed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Joerg Roedel <jroedel@suse.de>
