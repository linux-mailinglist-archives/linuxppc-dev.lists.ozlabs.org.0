Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A0E3EA458
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 14:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GllxN55RTz3bnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 22:14:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iwNzTryC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iwNzTryC; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gllwf4QWSz309r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 22:14:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GllwZ2T0Sz9s5R;
 Thu, 12 Aug 2021 22:14:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628770446;
 bh=hN3ugD0RfDhtBREwmeXQKal3cFfgpdgufAdWV+1IVr0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=iwNzTryCHhsEUFZuOEP29TRnMZxxAgqec2Sxg6pKYvZZnOvH6nuA5rlp1e+hC9fAE
 zClf+hyXJByYSnKUM6CA+/xx5y053FUJQNvTNGjRSpYsMy9MhgkbTqzTBRLY7cspPC
 f72M2Iz9rodtrd+zy2XssFQ1XNrWKDtIlzcB9wSvEz4XuvvUycRL5FBGcaRHeU36Ue
 6jFUTKV6zhw14H+FUzVhyOJ1gyHGelq2rYlqiBTNHlIrcIPUrCv/RDK3ig3DDjc8kl
 3HB41qyS/HqsmqtjB38atm0+lNOiSSPYLP5d868BSbS4c33OotyfnEXS85rr4Cbxhi
 Iu4StZXCwDtLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
In-Reply-To: <bb3855e1-f15d-1df6-5699-9addc69ce1db@linux.ibm.com>
References: <20210810045307.11892-1-aneesh.kumar@linux.ibm.com>
 <22c7c194-d75d-bf90-c8e5-83c995c7130c@csgroup.eu>
 <87o8a3m89i.fsf@mpe.ellerman.id.au>
 <bb3855e1-f15d-1df6-5699-9addc69ce1db@linux.ibm.com>
Date: Thu, 12 Aug 2021 22:14:04 +1000
Message-ID: <87lf56n9mb.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 8/12/21 12:58 PM, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 10/08/2021 =C3=A0 06:53, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>>> Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_c=
eiling.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/mm/book3s64/radix_tlb.c | 48 +++++++++++++++++++++++++=
+++
>>>>    1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/bo=
ok3s64/radix_tlb.c
>>>> index aefc100d79a7..5cca0fe130e7 100644
>>>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>>>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>>>> @@ -17,6 +17,7 @@
>> ...
>>>> +
>>>> +static int __init create_tlb_single_page_flush_ceiling(void)
>>>> +{
>>>> +	debugfs_create_file("tlb_single_page_flush_ceiling", S_IRUSR | S_IWU=
SR,
>>>> +			    powerpc_debugfs_root, NULL, &fops_tlbflush);
>>>
>>> Could you just use debugfs_create_u32() instead of re-implementing simp=
le read and write ?
>>=20
>> Yeah AFAICS that should work fine.
>>=20
>> It could probably even be a u16?
>
> I was looking at switching all that to u64. Should i fallback to u16,=20
> considering a tlb_signle_page_flush_ceiling value larger that 2**16=20
> doesn't make sense?

Hmm, if we make it u16 and someone writes a value >=3D 2^16 it just
truncates the value to 0, which is a bit unfortunate.

So maybe just make it u32, that way if someone writes a stupidly large
value it stays large.

cheers
