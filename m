Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB550CB3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 16:33:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Klv0H35Mfz3brH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 00:33:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lrXnP+fp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kltzf4wX6z2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 00:33:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lrXnP+fp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kltzc14TSz4xLb;
 Sun, 24 Apr 2022 00:33:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650724381;
 bh=WoVkgo+1c7VtsmcEJ4bIoptWeHFiV0K5oskKMxsYsV0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lrXnP+fpdJguWUAQWN2X0b9+V8jQE/+m2rqG1BLz3rDML3ZSMi7xW+qv0wJWDSXCq
 Xhj6CLepoh2fU8F3p1VITdGldCUyOGWiBEBeNheRZW0W9QjOxwcWq4mV9h/yV1SVZz
 c+/YHpTiXpRZJaJVp4FdGBpALyrEopPLt/J7w84o5QJo70nWyfSErzCldxBL4DU/cg
 Ysg3aCv7AQe5GSGXpXeS1D3CfNjPzG6b6y6k7x385n0URcFGtZBxB4hqsyEVAm8QBB
 nexrFGD9EmNJ0R4hQoYb2z1zQeghYrrFviCWnTbYgZose6Tbequ2yQWHEPpnPRKNHc
 i4zq7Oddw7rgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Haowen Bai <baihaowen@meizu.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>
Subject: Re: [PATCH] powerpc/pci: Remove useless null check before call
 of_node_put()
In-Reply-To: <c4613523-de98-b824-175a-89fd66931bd6@linux.ibm.com>
References: <1650509529-27525-1-git-send-email-baihaowen@meizu.com>
 <c4613523-de98-b824-175a-89fd66931bd6@linux.ibm.com>
Date: Sun, 24 Apr 2022 00:32:57 +1000
Message-ID: <87levv98fa.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 4/20/22 19:52, Haowen Bai wrote:
>> No need to add null check before call of_node_put(), since the
>> implementation of of_node_put() has done it.
>> 
>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>> ---
>>  arch/powerpc/kernel/pci_dn.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
>> index 61571ae23953..ba3bbc9bec2d 100644
>> --- a/arch/powerpc/kernel/pci_dn.c
>> +++ b/arch/powerpc/kernel/pci_dn.c
>> @@ -357,8 +357,8 @@ void pci_remove_device_node_info(struct device_node *dn)
>> 
>>  	/* Drop the parent pci_dn's ref to our backing dt node */
>>  	parent = of_get_parent(dn);
>> -	if (parent)
>> -		of_node_put(parent);
>> +
>> +	of_node_put(parent);
>
> This whole block of code looks useless, or suspect. Examining the rest of the
> code for this function this is the only place that parent is referenced. The
> of_get_parent() call returns the parent with its refcount incremented, and then
> we turn around and call of_node_put() which drops that reference we just took.
> The comment doesn't do what it says it does. If we really need to drop a
> previous reference to the parent device node this code block would need to call
> of_node_put() twice on parent to accomplish that.

Yeah good analysis.

It used to use pdn->parent, which didn't grab  an extra reference, see
commit 14db3d52d3a2 ("powerpc/eeh: Reduce use of pci_dn::node").

The old code was:

        if (pdn->parent)
                of_node_put(pdn->parent->node);

> A closer examination is required to determine if what the comment says we need
> to do is required. If it is then the code as it exists today is leaking that
> reference AFAICS.

Yeah. This function is only called from pnv_php.c, ie. powernv PCI
hotplug, which I think gets less testing than pseries hotplug. So
possibly we are leaking references and haven't noticed, or maybe the
comment is out of date.

cheers
