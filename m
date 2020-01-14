Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4788139ECD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 02:14:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xXYV46mDzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 12:14:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xXSd1jjlzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 12:10:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZhrKMjJn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xXSc0btNz9sPW;
 Tue, 14 Jan 2020 12:10:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578964224;
 bh=BhsPSXqX0XelWkb1vOTTgISH6svHQ5Taunl4ab8Dxmw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZhrKMjJnHvebLEftKJED3WHL/kGFATu3ZfR1EBQtoa2qYPIki4vfTQW4aJT7fu0Cr
 GYR2kV8Xw1u16cP+IuQXzFJcMHI8XyZt7STMlY8zCaFbMKpC6GNafQGrFEw6gmd3Z/
 6pbRD07H66ivOZbIoZDB1XfPUwPr6ORpTFsHFSszZOAGFmTyIj4kqH54W2sdj6QCGu
 vZmasly1pMxNg/QPGPzXfXBXXvDIbtH0g3bhdC8KTq/qEQKWkJR/nDYWBT7sPIp/Zq
 QqesChS83JmxiDU3vC6tjGFAYTc9aLjOkZ1P0mBi+4fmHtZ8xMU4vBGv5BUZnxT8J0
 Qzsus8IQwWzQA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>, Timur Tabi <timur@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Scott Wood <swood@redhat.com>, York Sun <york.sun@nxp.com>,
 "b08248\@gmail.com" <b08248@gmail.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
In-Reply-To: <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <8736cj8rvr.fsf@mpe.ellerman.id.au>
 <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
 <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
Date: Tue, 14 Jan 2020 11:10:25 +1000
Message-ID: <87tv4yalmm.fsf@mpe.ellerman.id.au>
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
Cc: Diana Madalina Craciun <diana.craciun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurentiu Tudor <laurentiu.tudor@nxp.com> writes:
> Hello,
>
> On 13.01.2020 15:48, Timur Tabi wrote:
>> On 1/13/20 6:26 AM, Michael Ellerman wrote:
>>> I've never heard of it, and I have no idea how to test it.
>>>
>>> It's not used by qemu, I guess there is/was a Freescale hypervisor that
>>> used it.
>>=20
>> Yes, there is/was a Freescale hypervisor that I and a few others worked=
=20
>> on.=C2=A0 I've added a couple people on CC that might be able to tell th=
e=20
>> current disposition of it.
>
> More info on this: it's opensource and it's published here [1]. We still=
=20
> claim to maintain it but there wasn't much activity past years, as one=20
> might notice.
>
>>> But maybe it's time to remove it if it's not being maintained/used by
>>> anyone?
>>=20
>> I wouldn't be completely opposed to that if there really are no more=20
>> users.=C2=A0 There really weren't any users even when I wrote the driver.
>
> There are a few users that I know of, but I can't tell if that's enough=20
> to justify keeping the driver.

It is, I don't want to remove code that people are actually using,
unless it's causing unsustainable maintenance burden.

But this should be easy enough to get fixed.

Could you or someone else at NXP volunteer to maintain this driver? That
shouldn't involve much work, other than fixing small things like this
warning.

cheers
