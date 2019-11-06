Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01624F0EBE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 07:08:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477GLT1pl0zF3XT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 17:08:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477G6q6vTKzF3ww
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 16:58:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ciR7ncEP"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 477G6q5JGMz9sQy; Wed,  6 Nov 2019 16:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573019907; bh=uxD2BTixjqrm1dB6sKzow9x5pztHfF4238phxQ8BQKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ciR7ncEPNUOWorVTvgXfESPYNSN7jm+1hXyZWGYwgCOVWVQAABvrmxGJUn0lbFxDO
 kRCHi3iRYKvCe6p/C/hmqZBxW7DyTHoAm94WB/4Z8HUIZV9QbLREGsRRq7GhHEWSDg
 maJv1xzn7cjVJve4Saz0lG7qwhpQHoIsgfO/zeOMdnTMqHhK35t1XLMHIRBk7Piokg
 zGzMC1UassrHrRfJp5dIOnh+EuF29AMcsfuALIWUtpOoODRhy5dzCRpJXofdQvpGmq
 KlAPYgunlyi9E6Po8S39aVXpIHpnRcNHlZqSZWAGgbql8jWCifdZCPNex+5ybe9I4d
 hIYmpQty8wLCQ==
Date: Wed, 6 Nov 2019 15:34:57 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 2/8] KVM: PPC: Support for running secure guests
Message-ID: <20191106043457.GC12069@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104041800.24527-3-bharata@linux.ibm.com>
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 09:47:54AM +0530, Bharata B Rao wrote:
> A pseries guest can be run as secure guest on Ultravisor-enabled
> POWER platforms. On such platforms, this driver will be used to manage
> the movement of guest pages between the normal memory managed by
> hypervisor (HV) and secure memory managed by Ultravisor (UV).
> 
> HV is informed about the guest's transition to secure mode via hcalls:
> 
> H_SVM_INIT_START: Initiate securing a VM
> H_SVM_INIT_DONE: Conclude securing a VM
> 
> As part of H_SVM_INIT_START, register all existing memslots with
> the UV. H_SVM_INIT_DONE call by UV informs HV that transition of
> the guest to secure mode is complete.
> 
> These two states (transition to secure mode STARTED and transition
> to secure mode COMPLETED) are recorded in kvm->arch.secure_guest.
> Setting these states will cause the assembly code that enters the
> guest to call the UV_RETURN ucall instead of trying to enter the
> guest directly.
> 
> Migration of pages betwen normal and secure memory of secure
> guest is implemented in H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> 
> H_SVM_PAGE_IN: Move the content of a normal page to secure page
> H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> 
> Private ZONE_DEVICE memory equal to the amount of secure memory
> available in the platform for running secure guests is created.
> Whenever a page belonging to the guest becomes secure, a page from
> this private device memory is used to represent and track that secure
> page on the HV side. The movement of pages between normal and secure
> memory is done via migrate_vma_pages() using UV_PAGE_IN and
> UV_PAGE_OUT ucalls.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Reviewed-by: Paul Mackerras <paulus@ozlabs.org>
