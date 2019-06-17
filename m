Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066D479BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 07:40:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S0Rq03YzzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 15:40:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S0Ps5Q23zDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 15:38:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="eD7AWdyT"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45S0Ps3h6Wz9sBr; Mon, 17 Jun 2019 15:38:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560749937; bh=dZLUB0K5zrKTMsdEtdgkBMLfWZFYjrdP1VEZ//9dUfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eD7AWdyTBgymNpigRRjlwERLwtz6+5IChPlo6tHPrxOURmrv98db8J5lCApb6YzII
 UYl3AnywVl7MTAtOij4HF01ADdMY35yKXfvU6/8pMBTb8gXHGOf2mYLRm8HegSgQck
 qMHlW+/lnMQZCsSG75fQDuNcf17Izc3mLHUjShvRcjQ2B2GPTvPP19iznAPVzabihg
 /hQ1PUtN7jZqTYHlqJD5VQPAMRnZfXx0s4pAnM1c7kYei4KBoafU7PPaQGCcAiPqj/
 4CS602Ceg11qIljPAT9rsVnOXFdPBHH+ViwSOKfXAKsCJo0vHeZSFT89Vt2BkuW+p2
 fg4dE4xYnjfyg==
Date: Mon, 17 Jun 2019 15:37:56 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 3/6] kvmppc: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
Message-ID: <20190617053756.z4disbs5vncxneqj@oak.ozlabs.ibm.com>
References: <20190528064933.23119-1-bharata@linux.ibm.com>
 <20190528064933.23119-4-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528064933.23119-4-bharata@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 12:19:30PM +0530, Bharata B Rao wrote:
> H_SVM_INIT_START: Initiate securing a VM
> H_SVM_INIT_DONE: Conclude securing a VM
> 
> As part of H_SVM_INIT_START register all existing memslots with the UV.
> H_SVM_INIT_DONE call by UV informs HV that transition of the guest
> to secure mode is complete.

It is worth mentioning here that setting any of the flag bits in
kvm->arch.secure_guest will cause the assembly code that enters the
guest to call the UV_RETURN ucall instead of trying to enter the guest
directly.  That's not necessarily obvious to the reader as this patch
doesn't touch that assembly code.

Apart from that this patch looks fine.

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
