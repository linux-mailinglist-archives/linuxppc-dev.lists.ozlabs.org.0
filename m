Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05770F9DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 17:12:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRF6K5xk8z3f8x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 01:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ElRel7+i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRF5X6MDvz3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:11:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ElRel7+i;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRF5X4n79z4x3g;
	Thu, 25 May 2023 01:11:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684941104;
	bh=gCH+qrmvnYdFXIGPJq+jFnmibZig7S/8yT7yhZq0Yzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ElRel7+iQi7Od05dNk0DvoixSdAzgi4CXfb6ihfSCU7jYHDwz4Nq0TIrH36t9J5Ni
	 0RFicYhcrElX8IGAXyRXDBVsomvTvAHTM6YlkYmogRaJLYNy/trk+vRLDKD+oguJb5
	 Q7np/JYQ27Xi0HdoB2v3KEjH6RbYXSbu7FuWN9kyCc+MZOj1iwuTw7AHZSQ7tF0EzG
	 p9z4RtUudIN0XZg+zaHpL1on6FZiE1bINRSXQWUst0CLG3FXgGVBdarZLgUUPPJE2f
	 WUUP4YL0LFlK0eqBGRVq6wiQMAYxoXigQ0oKDI3vLhdMUSatOx/El7cS+Yeu99BDB3
	 o6Aq8w6LAsI3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
In-Reply-To: <b1260c4d-78ac-9c61-02e3-538846796982@linux.vnet.ibm.com>
References: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
 <875y8yl1k5.fsf@mail.lhotse>
 <ad7517b3-02f2-436a-4c31-878031630c25@linux.vnet.ibm.com>
 <87r0rfywtf.fsf@mail.lhotse>
 <b1260c4d-78ac-9c61-02e3-538846796982@linux.vnet.ibm.com>
Date: Thu, 25 May 2023 01:11:44 +1000
Message-ID: <878rddahn3.fsf@mail.lhotse>
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> On 5/17/23 7:19 AM, Michael Ellerman wrote:
>> Gaurav Batra<gbatra@linux.vnet.ibm.com>  writes:
>>> Hello Michael,
>>>
>>> System test hit the crash. I believe, it was PHYP that resulted in it
>>> due to number of TCEs passed in to be >512.
>> OK. It's always good to spell out in the change log whether it's a
>> theoretical/unlikely bug, or one that's actually been hit in testing or
>> the field.

> I will submit another version of the patch with some changes in the log 
> once I figure out how to Tag it for stable (as mentioned below).
> 
>>> I was wondering about the Fixes tag as well. But, this interface, in
>>> it's current form, is there from the day the file was created. So, in
>>> this case, should I mention the first commit which created this source file?
>> If it really goes back to the origin commit, then it's probably better
>> to just say so and tag it for stable, rather than pointing to 1da177e4.

> How to do I tag it for stable? Will it be part of the "Fixes:" tag or 
> some other tag?

A stable tag is just adding in the change log:

Cc: stable@vger.kernel.org

Note *not* in the email headers, in the change log.

That asks the stable kernel folks to backport the commit to all
currently active stable trees. Whereas when you use a Fixes: tag it will
be only backported to stable trees that contain the offending commit.

>> I wonder though is there something else that changed that means this bug
>> is now being hit but wasn't before? Or maybe it's just that we are
>> testing on systems with large enough amounts of memory to hit this but
>> which aren't using a direct mapping?
>
>  From the details in Bugzilla, it does seems like the HCALL was 
> previously taking long as well but PHYP was more relaxed about it. Now, 
> PHYP is limiting on how long can an HCALL take.
>
> Below are some excerpts from the Bug: 202349
>
> Linux is passing too many counts in H_STUFF_TCE. The higher the counts, 
> the longer the HCALL takes. From a Hypervisor perspective, we cannot 
> stop Linux from doing this or it will violate the rules in the PAPR 
> (which then would cause Linux to crash). The dispatcher team has 
> "tightened the screws" on long running HCALLs by causing this trap to 
> fire. From our discussions, they will not put the limits back where they 
> were before.

OK, that explains why it's only been noticed recently, so that's good
info. In the change log you can say something like "newer firmware has
started enforcing the limits".

cheers
