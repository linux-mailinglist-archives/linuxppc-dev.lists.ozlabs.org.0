Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091D4123F3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 06:47:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d3tG1h0LzDqZV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 16:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d3fD18hWzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 16:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="P8P7Oc3C"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47d3fC3JrGz9sRs; Wed, 18 Dec 2019 16:36:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1576647395; bh=vkkInNqS+SwPpU3kaJCTXghI/oELZZ27t+qKvtMxzA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8P7Oc3Cp7HwjsBZTwpp+jcJ43wH03dnhYSwWHzKeY0UGpZvcz6RniJv3T23jYaCT
 zHQwSA1cLT/7NmuQBXAcmB29XKf8vZKlISVS0y1qCdwyGB5B8lzNFWCN3vLsxlYHYN
 AuaroncnYHWL+mqcNnlw+Dtf6dnQZsBiO8jxcXv6XPWVpxfnG4XWc8yJm4OuYk6l5w
 QmLPGj7IQ45+2Cn1tyCgBEQlY7FQWScOfIoiKDrWc0P9gIBLg2pVBew3gVQLGgpLaH
 c5x9SyHb1ah+r/S2fA3X6QQRZimPzu7Z0n9etxJ3dOhYReq34a6I/Sl4S2s51rwuJK
 7pyOvfzgPWmTQ==
Date: Wed, 18 Dec 2019 16:36:32 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 2/2] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191218053632.GC29890@oak.ozlabs.ibm.com>
References: <20191215021104.GA27378@us.ibm.com>
 <20191215021208.GB27378@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215021208.GB27378@us.ibm.com>
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
Cc: linuxram@us.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 14, 2019 at 06:12:08PM -0800, Sukadev Bhattiprolu wrote:
> 
> Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> abort an SVM after it has issued the H_SVM_INIT_START and before the
> H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> encounters security violations or other errors when starting an SVM.
> 
> Note that this hcall is different from UV_SVM_TERMINATE ucall which
> is used by HV to terminate/cleanup an VM that has becore secure.
> 
> The H_SVM_INIT_ABORT should basically undo operations that were done
> since the H_SVM_INIT_START hcall - i.e page-out all the VM pages back
> to normal memory, and terminate the SVM.
> 
> (If we do not bring the pages back to normal memory, the text/data
> of the VM would be stuck in secure memory and since the SVM did not
> go secure, its MSR_S bit will be clear and the VM wont be able to
> access its pages even to do a clean exit).
> 
> Based on patches and discussion with Paul Mackerras, Ram Pai and
> Bharata Rao.
> 
> Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Minor comment below, but not a showstopper.  Also, as Bharata noted
you need to hold the srcu lock for reading.

> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		struct kvm_memory_slot *memslot;
> +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> +
> +		if (!slots)
> +			continue;
> +
> +		kvm_for_each_memslot(memslot, slots)
> +			kvmppc_uvmem_drop_pages(memslot, kvm, false);
> +	}

Since we use the default KVM_ADDRESS_SPACE_NUM, which is 1, this code
isn't wrong but it is more verbose than it needs to be.  It could be

	kvm_for_each_memslot(kvm_memslots(kvm), slots)
		kvmppc_uvmem_drop_pages(memslot, kvm, false);

Paul.
