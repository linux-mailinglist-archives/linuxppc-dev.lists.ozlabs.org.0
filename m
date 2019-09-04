Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F520A80C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 13:05:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ngvz5LQJzDql2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 21:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ngt84PFNzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:03:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46Ngt833H4z9sDB; Wed,  4 Sep 2019 21:03:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Ngt74vVWz9sBF;
 Wed,  4 Sep 2019 21:03:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 10/31] opal: add MPIPL interface definitions
In-Reply-To: <aa997e57-3d51-94b6-c587-79aededcafa2@linux.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272066.8896.14185583668659839717.stgit@hbathini.in.ibm.com>
 <87tv9tr5yc.fsf@mpe.ellerman.id.au>
 <aa997e57-3d51-94b6-c587-79aededcafa2@linux.ibm.com>
Date: Wed, 04 Sep 2019 21:03:42 +1000
Message-ID: <87ftlcqq5t.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> On 03/09/19 4:40 PM, Michael Ellerman wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
>>> index 57bd029..878110a 100644
>>> --- a/arch/powerpc/include/asm/opal.h
>>> +++ b/arch/powerpc/include/asm/opal.h
>>> @@ -39,6 +39,12 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
>>>  				uint64_t PE_handle);
>>>  int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
>>>  			uint64_t rate_phys, uint32_t size);
>>> +
>>> +int64_t opal_mpipl_update(enum opal_mpipl_ops op, u64 src,
>>> +			  u64 dest, u64 size);
>>> +int64_t opal_mpipl_register_tag(enum opal_mpipl_tags tag, uint64_t addr);
>>> +int64_t opal_mpipl_query_tag(enum opal_mpipl_tags tag, uint64_t *addr);
>>> +
>> 
>> Please consistently use kernel types for new prototypes in here.
>
> uint64_t instead of 'enum's?

The enums are fine, I mean u64 instead of uint64_t, s64 instead of
int64_t etc.

cheers
