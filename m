Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B3DBB91
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 05:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vW6l65gnzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 14:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vW4j6jbpzDqdZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 14:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="nRThZA6S"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46vW4j556zz9sPF; Fri, 18 Oct 2019 14:00:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1571367653; bh=Un3FmhVENxAIGmN4EhILnWeEZRlRNIZ61ifl2W3Z37o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRThZA6Sy8jco4Qp9JuyQtlnYpcc16jjWKqf8VyyrXQ8mNTwQQl/MzYCIf0J9sEpN
 1RnrSw3SHE4DSrtpK1XnFpm8fe3ASteM1MqUx+MPHsa/J5nSMbwRx48opw9tNXpVFg
 SThjXFgxjxrm9/BS43rUPAlBTjdrQkzmAuGhPd/je3K2OodOwGPk3i6M2wbeg6U2ew
 7mI4NjgZW+Iv0AArtugNeipEkVjT+IPLPjufB7KphuzRhS+DKdOZuAhR7Rn859EN1w
 u6ppMxJ5p2Z78+XJEK7/4QnoUWwV4HHUILtu12a2745FI+oM5gW7sECHUinKEmw7Cd
 3qt7vPyIdnRkg==
Date: Fri, 18 Oct 2019 14:00:49 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v9 2/8] KVM: PPC: Move pages between normal and secure
 memory
Message-ID: <20191018030049.GA907@oak.ozlabs.ibm.com>
References: <20190925050649.14926-1-bharata@linux.ibm.com>
 <20190925050649.14926-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925050649.14926-3-bharata@linux.ibm.com>
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

On Wed, Sep 25, 2019 at 10:36:43AM +0530, Bharata B Rao wrote:
> Manage migration of pages betwen normal and secure memory of secure
> guest by implementing H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
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

As we discussed privately, but mentioning it here so there is a
record:  I am concerned about this structure

> +struct kvmppc_uvmem_page_pvt {
> +	unsigned long *rmap;
> +	struct kvm *kvm;
> +	unsigned long gpa;
> +};

which keeps a reference to the rmap.  The reference could become stale
if the memslot is deleted or moved, and nothing in the patch series
ensures that the stale references are cleaned up.

If it is possible to do without the long-term rmap reference, and
instead find the rmap via the memslots (with the srcu lock held) each
time we need the rmap, that would be safer, I think, provided that we
can sort out the lock ordering issues.

Paul.
