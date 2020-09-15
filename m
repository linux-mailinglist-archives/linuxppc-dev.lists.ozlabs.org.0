Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A226A42E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:32:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrLgh2W7FzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrLcf06s8zDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Kt+4Q+i+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrLcd2lksz9sVM;
 Tue, 15 Sep 2020 21:30:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600169409;
 bh=OQ8ZlDy64ei4/T3Jt7Yt/gqzJpjsR9iZH/wbYSEEXi4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Kt+4Q+i+95pHJ2GUXntDEfvXikdxYELoaEDu8K4QLKvBA3NlsKSvdzQ54SUoHIqVg
 CSXhc9s33UMWUYMFds1IRNb6TZOEq1WxKSn9Kt6XUVzPW8e2Jh8L0abkdt12A8KB3h
 3T0gtjXya5WbpHRnLCNy5k2ObQjXQNjs40wJCmAQ5fH6AiZifOf2dbeSFnQpTtEQ6z
 DpZeuwezpM83zT9UOEhX8yJKsrQk7cUW6fFMDJe2h8OZoKzWWh57PC4IJfxHcTSTJH
 X/QEX9dIzv5JKDq2SB9Px4TF5RbrSlgRfm645iBnBOupNtkjBe5sUFLuVpY+AO5TU9
 voPe9UbNcG0lg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
In-Reply-To: <20200912081451.66225-1-vaibhav@linux.ibm.com>
References: <20200912081451.66225-1-vaibhav@linux.ibm.com>
Date: Tue, 15 Sep 2020 21:30:08 +1000
Message-ID: <87imcfp9a7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> A warning is reported by the kernel in case perf_stats_show() returns
> an error code. The warning is of the form below:
>
>  papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
>  	  Failed to query performance stats, Err:-10
>  dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
>  fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count
>
> On investigation it looks like that the compiler is silently truncating the
> return value of drc_pmem_query_stats() from 'long' to 'int', since the
> variable used to store the return code 'rc' is an 'int'. This
> truncated value is then returned back as a 'ssize_t' back from
> perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
> unsigned number and triggers this warning..
>
> To fix this we update the type of variable 'rc' from 'int' to
> 'ssize_t' that prevents the compiler from truncating the return value
> of drc_pmem_query_stats() and returning correct signed value back from
> perf_stats_show().
>
> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
>        stats from PHYP')

Please don't word wrap the Fixes tag it breaks b4.

I've fixed it up this time.

cheers
