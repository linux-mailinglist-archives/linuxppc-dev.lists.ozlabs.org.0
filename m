Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076B745B32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 13:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cjOfTwTD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvkMR6rPMz3bwY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 21:33:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cjOfTwTD;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvkLX74CTz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 21:32:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688383972;
	bh=amKSxElUXOBsQ/ZeBWOs02uQ1wiOklOJIeiioUSfrbU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cjOfTwTDAdyQWLk5OgoU+scBQqHcMgm1xrC+YKMj0qbh8OB31tJr1QzMaNC0oznvJ
	 5X0JG5ai36xAcluxWkPzUNyXsx9HP7NnCyAAHIc5tCcUI0+X97GYSkWIniwW851GHM
	 TLlSFRW2wZ2EMDgY2rh+blKYhn0GA7jOZEEzYZdMh551VhhBHulejM+xi7fe7g3pdV
	 ydTC9xYNU76Kby9gUINFGbVxRipDDqGU6wPEVYAgO+EuxQCXEY8RgrYwWnuKhHTwzW
	 JjaP823x4D8XKPAXeVOlcwaEHpocYrsmkcoXd3LMO4jkK02naIaG24u/e8dgsHSYz8
	 H3wWvd3AHHkPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvkLW1b5Yz4wZp;
	Mon,  3 Jul 2023 21:32:50 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Michael Ellerman
 <patch-notifications@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring
 <robh@kernel.org>
Subject: Re: [PATCH] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is
 not present
In-Reply-To: <1a205224-06d4-9337-5621-c9760c02f9e5@xenosoft.de>
References: <20230505171816.3175865-1-robh@kernel.org>
 <168836167601.46386.17041701491443802315.b4-ty@ellerman.id.au>
 <1a205224-06d4-9337-5621-c9760c02f9e5@xenosoft.de>
Date: Mon, 03 Jul 2023 21:32:50 +1000
Message-ID: <873525w7q5.fsf@mail.lhotse>
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 03.07.23 07:21, Michael Ellerman wrote:
>> On Fri, 05 May 2023 12:18:17 -0500, Rob Herring wrote:
>>> Commit e4ab08be5b49 ("powerpc/isa-bridge: Remove open coded "ranges"
>>> parsing") broke PASemi Nemo board booting. The issue is the ISA I/O
>>> range was not getting mapped as the logic to handle no "ranges" was
>>> inverted. If phb_io_base_phys is non-zero, then the ISA range defaults
>>> to the first 64K of the PCI I/O space. phb_io_base_phys should only be 0
>>> when looking for a non-PCI ISA region.
>>>
>>> [...]
>> Applied to powerpc/fixes.
>>
>> [1/1] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is not present
>>        https://git.kernel.org/powerpc/c/79de36042eecb684e0f748d17ba52f365fde0d65
>>
>> cheers
> Hello Michael,
>
> This patch has already been applied. Link: 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4927cb98f0eeaa5dbeac882e8372f4b16dc62624

Yes, it's actually the same commit. I'm just catching up on sending the
thanks emails. Sorry for the confusion.

cheers
