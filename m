Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC88946EC5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 09:41:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QqCf1kfbzDrcW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 17:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qq7X0sDgzDrcZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 17:37:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="bdb8QER0"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45Qq7W4nsrz9sNT; Sat, 15 Jun 2019 17:37:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45Qq7W41Drz9sDB; Sat, 15 Jun 2019 17:37:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560584247; bh=tKoVDInPecXoeEXMW70V2vj5KuXPanLCpYWOumHs1rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdb8QER0aLThSFeUxQAFwQNi7i5uHfosRYjmTturWX2pu+Y46RASWLyKukwMrpK2y
 v3Q+Ut+yaP7nAQCySox+ZasCthS6xSoaYInqpusAr+63FWI0YWanmF6eXu3wI46APk
 +4G7qG43ELE/MH05qLKvmSqifeCfVfq0LC8kAFNWriRPEivN/fiqszUadjh33+Lmyq
 BL+Usp8T1XiSZYbG+umSw0DC9xoSTurrVtuYyyEdbwgcPZSo3wriOpxgRZ2e0pFiRn
 Bc4+zHxYbN7g0Al275AyW3X1jDDpuKAjAWIfOcwnyl2Uxp6iOGgMJfZGm8pVit50NQ
 OaTTxXlYNiELg==
Date: Sat, 15 Jun 2019 17:37:24 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v3 4/9] KVM: PPC: Ultravisor: Add generic ultravisor call
 handler
Message-ID: <20190615073724.GB24709@blackberry>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-5-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606173614.32090-5-cclaudio@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 02:36:09PM -0300, Claudio Carvalho wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> Add the ucall() function, which can be used to make ultravisor calls
> with varied number of in and out arguments. Ultravisor calls can be made
> from the host or guests.
> 
> This copies the implementation of plpar_hcall().

Again, we will want all of this on every powernv-capable kernel, since
they will all need to do UV_WRITE_PATE, even if they have no other
support for the ultravisor.

Paul.
