Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC53B30AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hc96B4Fz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:00:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hbG4tgKz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 23:59:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9hbD1RGfz9sVm; Thu, 24 Jun 2021 23:59:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
In-Reply-To: <20210621085003.904767-1-bharata@linux.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
Subject: Re: [PATCH v8 0/6] Support for H_RPT_INVALIDATE in PowerPC KVM
Message-Id: <162454315792.2927609.10468593686064082281.b4-ty@ellerman.id.au>
Date: Thu, 24 Jun 2021 23:59:17 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: aneesh.kumar@linux.ibm.com, farosas@linux.ibm.com, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 14:19:57 +0530, Bharata B Rao wrote:
> This patchset adds support for the new hcall H_RPT_INVALIDATE
> and replaces the nested tlb flush calls with this new hcall
> if support for the same exists.
> 
> Changes in v8:
> -------------
> - Used tlb_single_page_flush_ceiling in the process-scoped range
>   flush routine to switch to full PID invalation if
>   the number of pages is above the threshold
> - Moved iterating over page sizes into the actual routine that
>   handles the eventual flushing thereby limiting the page size
>   iteration only to range based flushing
> - Converted #if 0 section into a comment section to avoid
>   checkpatch from complaining.
> - Used a threshold in the partition-scoped range flushing
>   to switch to full LPID invalidation
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/6] KVM: PPC: Book3S HV: Fix comments of H_RPT_INVALIDATE arguments
      https://git.kernel.org/powerpc/c/f09216a190a4c2f62e1725f9d92e7c122b4ee423
[2/6] powerpc/book3s64/radix: Add H_RPT_INVALIDATE pgsize encodings to mmu_psize_def
      https://git.kernel.org/powerpc/c/d6265cb33b710789cbc390316eba50a883d6dcc8
[3/6] KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
      https://git.kernel.org/powerpc/c/f0c6fbbb90504fb7e9dbf0865463d3c2b4de49e5
[4/6] KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE
      https://git.kernel.org/powerpc/c/53324b51c5eee22d420a2df68b1820d929fa90f3
[5/6] KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability
      https://git.kernel.org/powerpc/c/b87cc116c7e1bc62a84d8c46acd401db179edb11
[6/6] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM
      https://git.kernel.org/powerpc/c/81468083f3c76a08183813e3af63a7c3cea3f537

cheers
