Return-Path: <linuxppc-dev+bounces-13690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BAC2A40F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 08:11:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0N7J0t3yz30RJ;
	Mon,  3 Nov 2025 18:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762153916;
	cv=none; b=b8r5RfcZDnLvAwwtcqLsA2aQt8Bguh3MCQ9yXsNBlboy+qKQFafhsM2kqXviRMsIo63Ts2t+8krUKr5234MGm4K5/4OsPZjcoepkakWebwXOz7zT9DSVXzmwGneXmcAZaniP4w8mFQrCDIjSZwoQKTx99hOwhPJgZ8RiLFd3kN9TQ+672bkk6P5GJR58pAI2kbBkwARMoZb2P9khcjt91h/eLe7BAngPhDqKOlZamW344nxKhADgjRhln0oKo4zo+Myh5Y9d0u7yEy8YOSLcnlnj8FS4wfssvA5mx1/4yUSPjB6kXck7NUiYiMLt+OvVLzVXTJxuqRIUncG9+hQZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762153916; c=relaxed/relaxed;
	bh=TLo2uh7YIFDjJm6H7GOQCqAqlPJ9LZJnCIjcM3aB7B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfHRhSbzmqwN5ReNKuuL7hqQ4Vh+DqpBec9xOHTl6FU08uUMCW2HsnlmjbDjkz3jtbY26qnOwvcRMUwOde0lNYYtZ/yVm38VHuqpmGdlD8EfZ/kI6Ff/6Bdyd0qXJbsNYzh1EnfCu9YprHhVpusqJEbpr2X0eWTaEIUIK2cCbBSoB/ofTwD/9OzByivbz2/ED7HrkfnLRLW8qQVqyAtivYQL5G6BavGq6cirFogAgDRJYA1v6cQEibwXthNJKR2LyLhRZ0aU8bWbyVndLS44W43XLbZ0XFu+mIorSD40HmEfoST8XRYD22ibaAxinpWwhRKzuPFrUbHiAJrRmBFlDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KyiQxixi; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KyiQxixi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0N7F0Sr7z2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 18:11:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762153897; x=1762758697; i=markus.elfring@web.de;
	bh=TLo2uh7YIFDjJm6H7GOQCqAqlPJ9LZJnCIjcM3aB7B4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KyiQxixiGmypEgQb/4tGabpoSzNq9Jp8i/qLcHgC33EGf/of+gB3aD8y4iXSkruz
	 eBkxe/pGFXErr3KlQ0j/VBhAE6r7qTICMf4g86yu7jkGwOwj2KtNovHN8Qsxwyh7f
	 IMGLOj8ImjfjtSkD05J3ByAZQQnfqXRb5McHITxBI3HpK5J42ryZxrrA0wtUz9sLO
	 3Ey6Mn5O7aaQnFI8/66pVXWFOg7JJkgfO0xLSfhwFoggGgs3zue4iFmYbMdbY9/n5
	 /9diMyV2bPAIvJ4PrYg69HKOSQ4ZLODoRQVoy+uiJqlIct+xiWoqJLERO+gIPfVN9
	 JDJPexEu4HOsmFVLkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5Ug4-1wIG8o3Kuo-00zA61; Mon, 03
 Nov 2025 08:11:36 +0100
Message-ID: <7d3339b1-9088-4e46-b6c5-7d2ff075aa3c@web.de>
Date: Mon, 3 Nov 2025 08:11:33 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment
 in kvmppc_kvm_pv()
To: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org
Cc: Alexander Graf <agraf@suse.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
References: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
 <aQg7msPQvAZbXs_u@Gautams-MacBook-Pro.local>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aQg7msPQvAZbXs_u@Gautams-MacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0rtqKsFMv9G8Q33jBbryDOQ4ioUxdH7cv0NZfScFXpDp9we4iYA
 o617FVWw5yObI/+AQ+Sy0fnnR5gWaIJTxewh1H1rQgZwWtYAMX1pxAxSPC7CZvna9HpvBb3
 EPyyxHnwC+gCbAT1XyoOWay4+eP/1vkQduJUPSls/VqlPk/WstDWts7QF4ZHlLElzaMeO8y
 gH+c8EyIL06A9gl3zX5NQ==
UI-OutboundReport: notjunk:1;M01:P0:aPSOeolwByg=;ua/Kx3V8sdXucPB9+J4sUhlNCIz
 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
 gxnIprC+dXzVLANybkqL/ubuow=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> A pointer was assigned to a variable. The same pointer was used for
>> the destination parameter of a memcpy() call.
>> This function is documented in the way that the same value is returned.
>> Thus convert two separate statements into a direct variable assignment =
for
>> the return value from a memory copy action.
=E2=80=A6>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -216,8 +216,7 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
>> =20
>>  			shared &=3D PAGE_MASK;
>>  			shared |=3D vcpu->arch.magic_page_pa & 0xf000;
>> -			new_shared =3D (void*)shared;
>> -			memcpy(new_shared, old_shared, 0x1000);
>> +			new_shared =3D memcpy(shared, old_shared, 0x1000);
>>  			vcpu->arch.shared =3D new_shared;
>>  		}
>>  #endif
>=20
> This patch does not compile
=E2=80=A6> arch/powerpc/kvm/powerpc.c: In function `kvmppc_kvm_pv=C2=B4:
> arch/powerpc/kvm/powerpc.c:219:45: error: passing argument 1 of `__built=
in_dynamic_object_size=C2=B4 makes pointer from integer without a cast [-W=
int-conversion]
=E2=80=A6

Will another subsequent patch variant become relevant for the proposed
source code transformation approach?

Regards,
Markus

