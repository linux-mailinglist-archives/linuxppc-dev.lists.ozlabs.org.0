Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E946169C2B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Feb 2023 22:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKds05Hbnz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 08:26:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kEGohGHV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKdr303w6z3bVr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kEGohGHV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKdr13zMPz4x4p;
	Mon, 20 Feb 2023 08:25:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676841921;
	bh=Va+sBtwMUiEp1wvvO6yhVupMG23TdQy367pr2KPb0Ds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kEGohGHVZ0Xp3ryJAtRg+a2nI2GUzno+R075VEQXgMIvUh88nEE5Qejch42xk/Zwn
	 wnVLfID/+NmFAJsPQwNM4oJJhaDSe0jPIkUkiRo+b03KzDXu+zD3IekSqU7Qo4b4mF
	 +zt9zXNGg2O/csWh2wZh8lcBtKwVYi6BsnGwdEnOJq9LJKUbFGmLk5nZF2lcH2gqwB
	 bxkr9fSsCjI7nOLH1HPvjo8OPiAcI4iNloAfi8YfSsnoC3m619cqsNeq1PrkPyNHIh
	 VKA6D+Fulv0yuMLWy1hk+MzfCKbWkGpstNdBYgRDWk0PY5jr6CZqlrRIDg7FFIhp2p
	 plrNr4k9/hQ0g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-6 tag
In-Reply-To: <CAHk-=wh=m4sr1iLbt_PMmbrWsjLmkCAbz=NkKZmfTYFWv-RA7Q@mail.gmail.com>
References: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
 <CAHk-=wh=m4sr1iLbt_PMmbrWsjLmkCAbz=NkKZmfTYFWv-RA7Q@mail.gmail.com>
Date: Mon, 20 Feb 2023 08:25:20 +1100
Message-ID: <87edqlz6tb.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, Feb 17, 2023 at 2:40 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Thanks to: Benjamin Gray, "Erhard F.".
>
> That just looks _odd_.

Yeah true. My scripts just take it verbatim from the From: line of the
email.

> It's not like the full name wasn't already elsewhere in the kernel
> logs as a reporter (and at least once as patch author), so I just
> fixed it up ;)

Thanks.

cheers
