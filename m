Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB05F726
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 13:14:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fb3h40WkzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 21:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fb226MhKzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 21:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fb223WXvz9sNf;
 Thu,  4 Jul 2019 21:13:30 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: Fix maximum memory value
In-Reply-To: <1561743225.hrre8pgw6j.naveen@linux.ibm.com>
References: <156170480663.26214.11212383510892156924.stgit@aravinda>
 <87tvc9sjrb.fsf@linux.ibm.com> <1561743225.hrre8pgw6j.naveen@linux.ibm.com>
Date: Thu, 04 Jul 2019 21:13:26 +1000
Message-ID: <871rz6qch5.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Nathan Lynch wrote:
>> Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
>>> Calculating the maximum memory based on the number of lmbs
>>> and lmb size does not account for the RMA region. Hence
>>> use memory_hotplug_max(), which already accounts for the
>>> RMA region, to fetch the maximum memory value. Thanks to
>>> Nathan Lynch for suggesting the memory_hotplug_max()
>>> function.
>> 
>> Well, I hope I haven't led you astray... will it give you the desired
>> result on a kernel configured without memory hotplug support, booted in
>> an LPAR with some huge pages configured?
>> 
>> If so, then
>> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
>> 
>> It would likely help with review and future maintenance if the semantics
>> and intended use of the MaxMem field are made a little more
>> explicit. For example, is it supposed to include persistent memory?
>> Perhaps a follow-up patch could address this. Or maybe I'm overthinking
>> it.
>
> This was primarily aimed to replicate what AIX lparstat does and 
> documentation (*) just says:
>
>   Maximum Memory
>       Maximum possible amount of Memory.
>
> I think this mirrors the maximum memory value set in the LPAR profile, 
> and this provides a way to obtain that value from within the LPAR.

But the doc string for memory_hotplug_max() says:

 * memory_hotplug_max - return max address of memory that may be added


ie. maximum *address* not maximum *amount*.

Possibly it turns out to be the same value, but that is just because you
have no holes in your layout.

So I don't think this patch is correct.

cheers
