Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F87A98CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 05:13:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P5PB2YN3zDqyn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P5MK14CszDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 13:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46P5MK0Slyz9sDB; Thu,  5 Sep 2019 13:11:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P5MJ3RYPz9s3Z;
 Thu,  5 Sep 2019 13:11:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 11/31] powernv/fadump: add fadump support on powernv
In-Reply-To: <12cd62dc-3089-1b9a-1c90-c7acc2bd4870@linux.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272823.8896.18439144196389587229.stgit@hbathini.in.ibm.com>
 <87sgpdr5y6.fsf@mpe.ellerman.id.au>
 <69b1eba6-9ca6-864c-7148-4693e4578339@linux.ibm.com>
 <12cd62dc-3089-1b9a-1c90-c7acc2bd4870@linux.ibm.com>
Date: Thu, 05 Sep 2019 13:11:56 +1000
Message-ID: <87mufjphc3.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> On 03/09/19 10:01 PM, Hari Bathini wrote:
>>=20
> [...]
>>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump=
.c
>>>> index f7c8073..b8061fb9 100644
>>>> --- a/arch/powerpc/kernel/fadump.c
>>>> +++ b/arch/powerpc/kernel/fadump.c
>>>> @@ -114,6 +114,9 @@ int __init early_init_dt_scan_fw_dump(unsigned lon=
g node, const char *uname,
>>>>  	if (strcmp(uname, "rtas") =3D=3D 0)
>>>>  		return rtas_fadump_dt_scan(&fw_dump, node);
>>>>=20=20
>>>> +	if (strcmp(uname, "ibm,opal") =3D=3D 0)
>>>> +		return opal_fadump_dt_scan(&fw_dump, node);
>>>> +
>>>
>>> ie this would become:
>>>
>>> 	if (strcmp(uname, "ibm,opal") =3D=3D 0 && opal_fadump_dt_scan(&fw_dump=
, node))
>>>             return 1;
>>>
>>=20
>> Yeah. Will update accordingly...
>
> On second thoughts, we don't need a return type at all here. fw_dump stru=
ct and callbacks are
> populated based on what we found in the DT. And irrespective of what we f=
ound in DT, we got
> to return `1` once the particular depth and node is processed..

True. It's a little unclear because you're looking for "rtas" and
"ibm,opal" in the same function. But we know=E2=84=A2 that no platform shou=
ld
have both an "rtas" and an "ibm,opal" node, so once we find either we
are done scanning, regardless of whether the foo_fadump_dt_scan()
succeeds or fails.

cheers
