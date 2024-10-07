Return-Path: <linuxppc-dev+bounces-1795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22762992A58
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 13:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMcbn5k2mz2yfm;
	Mon,  7 Oct 2024 22:38:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728285415;
	cv=none; b=je144TbCMAPAu/FBLTXuS8KOevI+6llGywdCWzS95ewOu0EU0UccwOHIJtOilZRzuZRDJQlu4B39D8JH09nO9KCx9XegzDwQrvJOUgEl4grFLfvaC5ggEEnIFI005n4zBsVBRXK4TbRaaf6/zNAZQSPZr/+zV6SDxWw+pni9c8Y11elqlVYGDnUT4Xqg4qfKaC8mz4XWmRi12m0b6jbbvy5eC8V2IPnMv6qJ1v2K7FfXPzWrF2j9BEMLOsiWRNHmspeOhX/x3bI4LU/CwzlQPd/mP0DKhMPAJPrLh8iz8sBK2DpMjCHkMAnG7xmRca4NMPKnOjRu96nBmPHnS9dHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728285415; c=relaxed/relaxed;
	bh=LfrIY+pHO/ZX6h42WD8AmA8x940CYl5/uS/Of9wHfV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8x1RuLEbV0QcwBCNxrbFxeO/2m38BqPvDn7+82b66EBQX7LOrOkcVNhdaJg9lMBEPGaVf/5x93YT1HKCl+pgii5pHaskmYgW++eEUq8spRsTqVfbhKloqKDahEYHNkzAZDCdBHiSIii5zDbsUT2jwOS2bmCC81lWow60pFBZyMTnZyxEsrD18QQLORffLFdAqLqPuOoWV4BI1zPgidP82giFwb0dIw2Pw0+4pUP+r4GN1LR3r+k7ywhJ4LNQWlJ4TfuPecUnU3+ygYrCMKXm2BFUxuMC82vxDMsb6uS3eEfwL7N252AZ/M1Z8RHJPPlTMrDsYh/OGrOSkqZeGfFQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=N4saO+fg; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=N4saO+fg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMVnv44Kcz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 18:16:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728285361; x=1728890161; i=markus.elfring@web.de;
	bh=LfrIY+pHO/ZX6h42WD8AmA8x940CYl5/uS/Of9wHfV0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=N4saO+fgvYoaTltoDC2V5qHcHc3aI51HVxxMC5jsmaAWCaAnndTUM7ge7dVWVahf
	 y0Rf2zvP7kGCHnn5LV14Hh/G4hM08wjo7AJ/Nu17tObvWmlyuDnULVfzck8K+ukWI
	 NdPKRmjW71FJD0ywjUZN6bJLXbnUTPvqtmdxXtcOOvCq1XeTfjNCti4erWxReHKha
	 ID8gM30UmTIMCcRCgE9bQokITKGdkM+OdB4rgGyhJZBtQR1diY24fooY4T9jqasZO
	 c+2YjDlJwKmdOx6HptPWjLHbxhcqK1bweM8W09gm/K00MwXmKfB08ZIOk1HwsRmJW
	 IGK6M9RRbef/CydXrw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLRYd-1tEYAU0U3H-00J2BO; Mon, 07
 Oct 2024 09:16:01 +0200
Message-ID: <f5bfdc01-05b1-4015-8fbe-d84417b69138@web.de>
Date: Mon, 7 Oct 2024 09:15:51 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powermac: Call of_node_put(bk_node) only once in
 pmac_has_backlight_type()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
 <34233c4c-1f61-4bc6-aeca-9f5faba8509e@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <34233c4c-1f61-4bc6-aeca-9f5faba8509e@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Imoe7ZEwCJyTawNAyPA70ApwEVLa20g7u9LEzf/ELxArBp1NIGW
 k7rL310fUUIVzHcvZY1mDW7djNPCpStml1KdeoMvyRzcS2wFF4M8tuDAmwgpm8Z7O/0sQ5+
 lD582KkFDiLMG2CCbNbcOFOxCyQXO+ywtUg+5xm/NBw3eHKMKaOUrReKlYNSo3KDNTEIxcZ
 wAB07N1+HNQSk9uOtpGOw==
UI-OutboundReport: notjunk:1;M01:P0:5AdduQQ23uY=;gRPrvDdYEt2bChq+CWEYWCgqc1K
 0WdHt/6k5kpY7vnwZuSCEf03Zs+rc6PpWzC1ENPMR+8wsHuSMQme/RkyjY391+qkbXtTFmB3k
 8KBTg9Mzmy46+OSyTJqI4fMM/jMghe/s8lIlCf5DGSFPm44bZ217s8g6x6aiCsIxanDiI663a
 OJu32/rBn6F9oicEpMrlbzt6f6eirjP/iqt+7w2dAo1h5ERGNxIOQj0M5YZAsEkiMEFkVHlRl
 JqJRK7qC1i3GOexvh/TWeAMeRFtdqfaOSA0ZmNtYAGkgH19talR+tKdY2qrqRRKkNIfCFcPg5
 KtrFmloBYyBKb3JFTtNe/zCxto6VgLI/KGtabTpCR+yosdF7Tvrvdc7ZRgZShB7O4uhFw7WMe
 zgN+4CB7RFYxLkiavBmPLmpuw2sjVqSwB/D54Au/HLIzx1Y2VZ0K5lU7MGhDGxwmvgV2trXtK
 ixSFKEcX4vUPAsqg/caW8WbOg0uPUKLDa3JyrcgHQvUfaiQYdAnIFKJ+cNVBZIROZR5fRCg86
 abgT/jc2iiGlaxKimlbnvLmY3F8aXMh379FgjJbMfUgZHn+klI7v7kXjAg034ZjXbweNZG+im
 VIzUvtW1mKKiEvNH7knu9idBAvOwqaCixq/ntxEmZg4pcAHfBIaCSHVXvO3v2U4Ika05zpQRe
 5rEd23d5HeEYT8aqNckhZxLoxWMFc11vRCMww9kn7tKDHqjmM5ZGBpd+jgJFjV7db9lDJqWJF
 IteBg900ZeC02iAfJS8Tz12fBjXGJfqMDXfb6rX7wIiB9rGJnF6Nau1fHVwV6p9x2IXkMsJWa
 OSJgpF8A6XejYWbabdImIakw==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> First of all, the change is wrong.  We can't dereference "prop" after ca=
lling
> of_node_put().
=E2=80=A6
> The of_get_property() function doesn't do a get as in get/put, it just f=
inds
> the property and returns it.  It doesn't bump the reference count.  It's=
 a
> confusing name in that way.  The The of_node_put() pairs with
> of_find_node_by_name().
Thanks for your information.

* Do you see opportunities for improving the software documentation accord=
ingly?

* How much can source code analysis tools influence development efforts?


Regards,
Markus

