Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052533EFE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 12:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0pZ01tXLz3bnX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 22:57:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o7FCwonQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o7FCwonQ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0pYb2qmjz303c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 22:57:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0pYT4yrVz9sTD;
 Wed, 17 Mar 2021 22:57:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615982241;
 bh=Zhmy2g9i1U4R/4NbsT62uiLktGvcjXOQHf91TVlASCo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o7FCwonQdnQAExLznUTypn+iMH7d97qDlNwxwgN8+JhdS3g9O3FWkMU/0jcrxay33
 HPYyHpQC+h/b3SmyS4YD8WBu/RCdQeGZKuDqmJ92xAK81UgMvecMxw2D0l09LBS3Mh
 jp0/+Bu3vk29Fe1xYt15TMLoK1++2Pz/2ZS8wERNgh8l+xAdecH8QsOdSCwZOPNf9b
 SkxsVnrq6nYjioVDGvZZ1LVabuLbT89sQW+ldA32nBHewmYpk5dmxY2ztHRSjdy1JE
 eg+q86EOvnBvxxUX133QQHy1ta89glwyc2rrJOUrYECjoP9IvpViKENHK4NF618IaQ
 OnG7EKuQu8sWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, "heying (H)" <heying24@huawei.com>,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com, rppt@kernel.org,
 ardb@kernel.org, clg@kaod.org, christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
In-Reply-To: <87tupab4a1.fsf@dja-thinkpad.axtens.net>
References: <20210316041148.29694-1-heying24@huawei.com>
 <87wnu6bhvi.fsf@dja-thinkpad.axtens.net>
 <f0130916-a8f3-75ba-b5da-7d37d9139ff3@huawei.com>
 <87tupab4a1.fsf@dja-thinkpad.axtens.net>
Date: Wed, 17 Mar 2021 22:57:14 +1100
Message-ID: <877dm6ouw5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> "heying (H)" <heying24@huawei.com> writes:
>
>> Thank you for your reply.
>>
>> =E5=9C=A8 2021/3/17 11:04, Daniel Axtens =E5=86=99=E9=81=93:
>>> Hi He Ying,
>>>
>>> Thank you for this patch.
>>>
>>> I'm not sure what the precise rules for Fixes are, but I wonder if this
>>> should have:
>>>
>>> Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
>>> Fixes: f79643787e0a ("powerpc/64s: flush L1D on kernel entry")
>>
>> Is that necessary for warning cleanups? I thought 'Fixes' tags are=20
>> needed only for
>>
>> bugfix patches. Can someone tell me whether I am right?
>
> Yeah, I'm not sure either. Hopefully mpe will let us know.

It's not necessary to add a Fixes tag for a patch like this, but you can
add one if you think it's important that the fix gets backported.

I don't think the cleanups in this case are that important, so I
wouldn't bother with a Fixes tag.

cheers
