Return-Path: <linuxppc-dev+bounces-17088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE40HJRFnWmoOAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:30:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A257D1826D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:30:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKnsV6ZZXz3cGY;
	Tue, 24 Feb 2026 17:30:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771914638;
	cv=pass; b=fe4WXsldlnFv6Ul9SKn0DFhrVR7AtM3CCxS0WX2LLE9fy+dbd4PSAxkzHbUTvPHTcXM2BWWl1CdQMb7wkGRWboEph0/UMKCmYZzyb6ZCctfzrEy8DwRl7xkeofJ+Jh3g9FNw/jwhAjWptMXJbN1gvRSOr1LCt3U7zHx3fk1g94jH8/rcpACxtBP5lQyCXi5Q8S0SZKHN+DP/V7XQPAn7vGZOsTo31kKebyC+I8wZm/tDTWycCBPwkKEsSMWfUH55OZRykk3PYKvnWQdH0UrGKH/Arh9D46uEbckRY8/QBR6x1e/rUbhwhfkM3oql3PavSgMbBjSJ7haiv3Gv9Fvnrw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771914638; c=relaxed/relaxed;
	bh=aJnFllV8sc5HH69M+vVx3xOhhAroz7QXWl4LvdQTNRk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Bf3VRyHjTx9ZaaBTcL8PNPVikXlPYVZC51vJwji01rDXo58u4ywwdgE6bzMeXWxhm+Re+2MLZ9r5EvLPrQ5Kul/bTBNIDGb4AbEhqP4navumEUPXMjzDJzUWh4Iz+ea7mO4KCe1CFBQ4uilHjjET4l8izOgVylrDgvjuGLu6jD8H77aUzXRJMHfEXtnihfIQqBo6HGnwKLEDk1K/f/z4lAEiqXJc05cRmoyEu4a81t3xRWh3N4OxgUShG26asuxXcRCetPmr0Yo6h7Yh0aotZWUfwrWK7elxO4kS60/Gj6qQPqK/rfAMODXH1KTke74zSKVbfht59QR/TBH5r30ZaQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dIU0Hi+G; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=2Jnhv1q0; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dIU0Hi+G;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=2Jnhv1q0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKnsQ6sDLz3cFM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 17:30:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771914615; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q26Cm+jcbNkxDf2rDq4TsjmdoVtP5QfyjtEzLpCCzuGhuzxTvygitsgyOII4fp9duB
    WdiezGDaQU70SmFvauPoyIbHUZP8WU9fUFVVOJtQvqYQWykzjREbbuqeQlLUR+8jAh2t
    mt0wCbZOlAqKgKjMBmZZKo5f0CZu0Pu1qkOpxezfYzuvoFUjfpbDrCESwc+VmfrBrgO2
    Km3NUDdD4UwjX0bX7OQ77u4os4kMD9IFqPJ+S+fLf6Blcx4EL3uR+nXDRaoU7Jp494kg
    4TA0eQ7SpeA/kIJFXB1r+5xQUrLRdP92fwejx0aCQ06s6IU+WpKKW5R9BQloTmWvp3N0
    cD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771914615;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=aJnFllV8sc5HH69M+vVx3xOhhAroz7QXWl4LvdQTNRk=;
    b=iI3RxrBq20wlTIUJ8u/WeXAh8RV5H9ca9hmKoCIZIEgpHrrtB3hHlCoY9zrrBmBmPX
    GJopvncQypapfAZPGj8qh1Kn41xjMWCKcmI+QQ/Bla2hT/beUmOjtEn0QMjWKi1ZIU0o
    tnMuYPnOlHHPk60xR+kFLjWZz5zgdiuDPsVDqHMNUPdGjgFTN7V8lYgfkrnmMck7vAmo
    3y9o/OPyrPs8Vvla+nTu6WOQG1ei/QSusFFYFs8qlBNzGywasBjmXqdpQL8/GhgJvvpq
    Gi3Z6luWZbly3A/ib4ixBT8nv8N7nMoxSMkHvrszR7OMxszNdJ3SD36IVH4TT8XSuc9+
    oP1g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771914615;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=aJnFllV8sc5HH69M+vVx3xOhhAroz7QXWl4LvdQTNRk=;
    b=dIU0Hi+GdOJ+zxLDn63tecHJyi0+2BNn/ytQND/d1ZvsqC2tq+4Ds74SVO2x6ul7mx
    QxG66/DZ74P4TClBwdntPoRM1F7wF5UqHlN0JVF0Gmdc7Z1arPNT6gEynE/JbQlWXlGU
    tiE2XuB55iReUHGORNqUbnZgAvEpjOIy0YSSgbqLRMLSNkRQS4a4EoKGWfcwt1uL/nLg
    I26DiUC3T4vwgpUg1QKmbtPuKe1PWxrz2tf73l1HPdTYLqMdSuIkvGqP2027Hq4NCOOY
    VErDEzhoiNB2C6SOHJNJWxfWRV1/GbUY18Abi017aSbPtrbKIjvcpjYFHoxrQxfCQxth
    k0HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771914615;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=aJnFllV8sc5HH69M+vVx3xOhhAroz7QXWl4LvdQTNRk=;
    b=2Jnhv1q0GOHKoQqFiVqqvkimy10xbkEsJUdmAJMyB4ApemmC7J2Dh0Ff9fHYDi4mvh
    C992mMwrWck5TUqZzaDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+l6B7g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21O6UEjRA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Feb 2026 07:30:14 +0100 (CET)
Subject: Re: [Linux PPC] 7.0-rc1: e500_mmu.c:923:26: error: assignment to
 'struct tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *'
To: Kees Cook <kees@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, hypexed@yahoo.com.au, mad skateman
 <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
 <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
 <2cbd1e19-ac99-29c3-ab89-3c58a9863e5a@xenosoft.de>
 <2d2d4735-04e0-46a0-93c6-654507fe2ae1@kernel.org>
 <2536c3e7-18d2-47cb-88c6-36f94c61c1c6@kernel.org>
 <202602231439.FFDA50B@keescook>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <4b441394-6dd3-cc58-e9e4-6ff840fdcda5@xenosoft.de>
Date: Tue, 24 Feb 2026 07:30:14 +0100
X-Mailer: BrassMonkey/33.9.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <202602231439.FFDA50B@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-17088-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:chleroy@kernel.org,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,vger.kernel.org,xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,xenosoft.de:mid,xenosoft.de:dkim,xenosoft.de:email]
X-Rspamd-Queue-Id: A257D1826D8
X-Rspamd-Action: no action

On 23/02/26 23:40, Kees Cook wrote:
> On Mon, Feb 23, 2026 at 08:38:29PM +0100, Christophe Leroy (CS GROUP) wrote:
>>
>> Le 23/02/2026 à 19:07, Christophe Leroy (CS GROUP) a écrit :
>>> +Kees
>>>
>>> Hello,
>>>
>>> Le 23/02/2026 à 17:48, Christian Zigotzky a écrit :
>>>> Hello,
>>>>
>>>> Compiling issue for e5500 machines for the RC1 of kernel 7.0:
>>>>
>>>> arch/powerpc/kvm/e500_mmu.c: In function 'kvmppc_e500_tlb_init':
>>>> arch/powerpc/kvm/e500_mmu.c:923:26: error: assignment to 'struct
>>>> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [-
>>>> Werror=incompatible-pointer-types]
>>>>     923 |  vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
>>>>         |                          ^
>>>> arch/powerpc/kvm/e500_mmu.c:928:26: error: assignment to 'struct
>>>> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [-
>>>> Werror=incompatible-pointer-types]
>>>>     928 |  vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
>>>>
>>>> Temporary solution: # CONFIG_VIRTUALIZATION is not set
>>>>
>>>> Please solve this issue.
>>>>
>>> Must be one of:
>>>
>>> 189f164e573e Convert remaining multi-line kmalloc_obj/flex GFP_KERNEL uses
>>> bf4afc53b77a Convert 'alloc_obj' family to use the new default
>>> GFP_KERNEL argument
>>> 69050f8d6d07 treewide: Replace kmalloc with kmalloc_obj for non-scalar
>>> types
>>>
>> Can you try following change:
>>
>> diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
>> index 48580c85f23b..75ed1496ead5 100644
>> --- a/arch/powerpc/kvm/e500_mmu.c
>> +++ b/arch/powerpc/kvm/e500_mmu.c
>> @@ -920,12 +920,12 @@ int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500
>> *vcpu_e500)
>>   	vcpu_e500->gtlb_offset[0] = 0;
>>   	vcpu_e500->gtlb_offset[1] = KVM_E500_TLB0_SIZE;
>>
>> -	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
>> +	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_priv,
>>   					       vcpu_e500->gtlb_params[0].entries);
>>   	if (!vcpu_e500->gtlb_priv[0])
>>   		goto free_vcpu;
>>
>> -	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
>> +	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_priv,
>>   					       vcpu_e500->gtlb_params[1].entries);
>>   	if (!vcpu_e500->gtlb_priv[1])
>>   		goto free_vcpu;
> That looks like the correct fix to me. The old type was the correct size,
> but was just the wrong type. Sorry I missed it when doing my tree-wide
> multi-arch builds! What build target (or Kconfig) was needed to reach
> this code?
>
> Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
> Reviewed-by: Kees Cook <kees@kernel.org>
>
> Thanks!
>

It works. Thank you. Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


