Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D4F6D93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 05:26:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BHrT33jKzF3sS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 15:26:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BHpS4m7PzF363
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 15:24:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="n2sIvMiP"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47BHpS2k5Nz9sQw; Mon, 11 Nov 2019 15:24:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573446288; bh=nOjRCApbbLW3ygZm3Duw/OcFxSDsQlgMg9b2UyyPd2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2sIvMiPlwtkspPnzggF2f2pHlkVxKzwWV5++ePfcohaqzAz4TdGnSlvy/kpwkgle
 e+GuFJEZTb8n2GC40b6OODmqjS0VA5HBBc/bkfw1mdeoI+tbG78HApErLIH/z/fmzW
 W4AyBHx7crQsGTADwlAfs7Ig3d42vavbAyky11PfXEZXXuWPRl4Yx6ipOnHKyGzL/b
 mYSxxU0P0K8x/FJ7/PFpPh3iHPGkPlhQGpxWrjZ5d70HSO4ob6i5KvQknpBHNftUyN
 5VLnxWU1YOcTiaZYcdADpGOSz2GSkj1kO3AGt1xIOeD2xoZoOLybf/bvQPzfIEvUSz
 5IoXEwLtzDzXQ==
Date: Mon, 11 Nov 2019 15:19:24 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191111041924.GA4017@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-8-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104041800.24527-8-bharata@linux.ibm.com>
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, Ram Pai <linuxram@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 09:47:59AM +0530, Bharata B Rao wrote:
> From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> 
> Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> abort an SVM after it has issued the H_SVM_INIT_START and before the
> H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> encounters security violations or other errors when starting an SVM.
> 
> Note that this hcall is different from UV_SVM_TERMINATE ucall which
> is used by HV to terminate/cleanup an SVM.
> 
> In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
> HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
> possibly including its text/data would be stuck in secure memory.
> Since the SVM did not go secure, its MSR_S bit will be clear and the
> VM wont be able to access its pages even to do a clean exit.

It seems fragile to me to have one more transfer back into the
ultravisor after this call.  Why does the UV need to do this call and
then get control back again one more time?  Why can't the UV defer
doing this call until it can do it without expecting to see a return
from the hcall?  And if it does need to see a return from the hcall,
what would happen if a malicious hypervisor doesn't do the return?

Paul.
