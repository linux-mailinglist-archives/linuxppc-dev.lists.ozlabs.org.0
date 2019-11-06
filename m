Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A38F0EB0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 07:06:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477GJK47LMzF5ct
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 17:06:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477G6q5TVTzF3sr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 16:58:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="HHMCpQKd"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 477G6q2hTsz9sPk; Wed,  6 Nov 2019 16:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573019907; bh=46gVeJC3dAyUhPqJ+NlvAv/IlXtVW7QrzM+5gy1u8eM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHMCpQKdyTCYf5CoNlipflMhC6MOArs1jnJrZWiyfg3s4UQLqUKCAk7jPXWgC7yAe
 2ZHWBR0YUuPk4zD9tAwQTZtRmIHc6dtWaGsNGXGnFOQb4wPirBZTrUnUJ10HC1H6o4
 nKZ2OIFN6jI+nxz9U3H4gPsliLqud8BLRcuEiuU8p27O16C8ueKYVMK8CrQ0mQpXkI
 RqlylrOVP7xlVWlS+RF2ye0g8YibvqaO//2XNQ+sFD+Nog0DruyN7vZhjolrqeEk7U
 UwAK2UJuF/fbivVZliFKXO0XJoZ7dQ3jGSr/3eUllAfeGb27dVreStB8ngrbt4GmI/
 rzuV5+OKu7pAw==
Date: Wed, 6 Nov 2019 15:33:29 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 1/8] mm: ksm: Export ksm_madvise()
Message-ID: <20191106043329.GB12069@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104041800.24527-2-bharata@linux.ibm.com>
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

On Mon, Nov 04, 2019 at 09:47:53AM +0530, Bharata B Rao wrote:
> KVM PPC module needs ksm_madvise() for supporting secure guests.
> Guest pages that become secure are represented as device private
> pages in the host. Such pages shouldn't participate in KSM merging.

If we don't do the ksm_madvise call, then as far as I can tell, it
should all still work correctly, but we might have KSM pulling pages
in unnecessarily, causing a reduction in performance.  Is that right?

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
