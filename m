Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8855AA6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 13:32:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bWgw5dljzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 21:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bWfF07GJzDqkh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 21:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45bWfD3063z9s3l;
 Sat, 29 Jun 2019 21:30:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v3 1/3] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
In-Reply-To: <CAOSf1CHS98Y9gwEUTkAmzjnWSW=yz89DWdXUnr1QijrvMTWvkQ@mail.gmail.com>
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-2-vaibhav@linux.ibm.com>
 <87h88as7iy.fsf@concordia.ellerman.id.au>
 <CAOSf1CHS98Y9gwEUTkAmzjnWSW=yz89DWdXUnr1QijrvMTWvkQ@mail.gmail.com>
Date: Sat, 29 Jun 2019 21:30:44 +1000
Message-ID: <87a7e0k4rf.fsf@concordia.ellerman.id.au>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Fri, Jun 28, 2019 at 1:39 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> > *snip*
>>
>> How can we be changing the meaning of HCALL numbers without breaking all
>> existing usages?
>
> The changed one being changed here were never used by linux or
> implemented by either hypervisor.

OK. Please say so in the change log so that it's clear it's not a
behaviour change.

>> Where are these hypervisor calls documented?
>
> In an internal spec from one the phyp guys. I have been complaining
> about it not being open (or merged into PAPR at the very least), but
> it doesn't look like there's been any movement there.

Please send a patch for Documentation/powerpc/ describing the API for
the hypercalls we're using.

cheers
