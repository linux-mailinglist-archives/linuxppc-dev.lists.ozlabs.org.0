Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE323F2BFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 14:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grglv0SrXz3dD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 22:23:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hCKcgYn7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hCKcgYn7; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grgkl34Cwz3cVR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 22:22:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Grgkk2Z0gz9sX4;
 Fri, 20 Aug 2021 22:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629462158;
 bh=ngH04yasoDAT19PK5+ZD6U4NR+KRen5zJPJxVAaJ/LU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hCKcgYn75N8gAA5+piXSlhScl5G+ckXVbzomSuBiiZK2RKaX4aRY2yslmznYyeHvo
 rBP4Zw2XC7y0rIONSHiIs4DwvAMPtpranGxwyxI6NAB3hFLC5nBoxS0xvLwTkN7Y95
 J3d8kZD2+RrqDJfIG0UiJCy7rFonS/V4KvuZBnjwz2wufrFWtDOtg+kdJeeZLe0aL0
 TMHSAAqaDmCF9QICRb8WhZXFhjpKJ/0ij0YSHnX36ev/F3JKxG8RljkRN1dSANfrHD
 tpPku/WiizDz8iPxzZIp5mj4LFLRWWAEAtc2sbBeKosSknTZdcOVxxiXoDE3Irutnx
 PverWp2BQ0s1Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S PR: Declare kvmppc_handle_exit_pr()
In-Reply-To: <59d11f91-c235-6b7d-6d9a-de8d852aba35@csgroup.eu>
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-4-clg@kaod.org>
 <59d11f91-c235-6b7d-6d9a-de8d852aba35@csgroup.eu>
Date: Fri, 20 Aug 2021 22:22:37 +1000
Message-ID: <87v940cnle.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/08/2021 =C3=A0 14:56, C=C3=A9dric Le Goater a =C3=A9crit=C2=A0:
>> This fixes a compile error with W=3D1.
>>=20
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/kvm/book3s.h | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
>> index 740e51def5a5..c08f93b7f523 100644
>> --- a/arch/powerpc/kvm/book3s.h
>> +++ b/arch/powerpc/kvm/book3s.h
>> @@ -24,6 +24,7 @@ extern int kvmppc_core_emulate_mfspr_pr(struct kvm_vcp=
u *vcpu,
>>   					int sprn, ulong *spr_val);
>>   extern int kvmppc_book3s_init_pr(void);
>>   extern void kvmppc_book3s_exit_pr(void);
>> +extern int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int ex=
it_nr);
>
> Don't add new 'extern' keywords, they are useless and pointless for funct=
ions prototypes.

I dropped it when applying.

cheers
