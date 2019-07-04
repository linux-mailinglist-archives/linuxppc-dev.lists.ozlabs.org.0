Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C45FA1E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:32:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fgRb273kzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 00:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fgNM20fyzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 00:29:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fgNJ699kz9sNw;
 Fri,  5 Jul 2019 00:29:36 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: ["RFC PATCH" 1/2] powerpc/mm: Fix node look up with numa=off boot
In-Reply-To: <878stgsa2r.fsf@linux.ibm.com>
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
 <1329fd62-c2ad-f2c9-d3df-731f543dd3ea@linux.ibm.com>
 <87imslso3u.fsf@linux.ibm.com>
 <0beef991-6e3a-9f88-3c83-f9ff97c5d454@linux.ibm.com>
 <878stgsa2r.fsf@linux.ibm.com>
Date: Fri, 05 Jul 2019 00:29:35 +1000
Message-ID: <877e8x3mb4.fsf@concordia.ellerman.id.au>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> Just checking: do people still need numa=off? Seems like it's a
>>> maintenance burden :-)
>>> 
>>
>> That is used in kdump kernel.
>
> I see, thanks.

That doesn't mean it's a good idea :)

Does it actually reduce memory usage much? Last time I dug into the
kdump kernel's usage of weird command line flags none of them really did
anything useful.

cheers
