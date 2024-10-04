Return-Path: <linuxppc-dev+bounces-1758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7098FF81
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 11:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKjkd3bP9z3bbS;
	Fri,  4 Oct 2024 19:22:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728026673;
	cv=none; b=kImWCMuA5i7S2qLR1TXNEeQjvVroJ7OL+ra9zAtu0EwaUo09LMtfcegGfIS3aMGdIntmKm6mWIJo+2AOukRnfEAexJ1K324+W1Ucr6UMgT7ELwAJlZ23SUf9zVyiPdiCdGHGZ0sHcUDy5rnaa8XOzUMR8DnaVl6bBq24g2Adiq+D9G33lLJujbu69rx47n112tDTSMU9SsMvVsaWvqK6a7vuqlIGqveaxsUaAgWDeYMp1wrUCZwyUastkqPqSOdLHRXwUDXpIe5f1ZN03jcegDJ6ukC+ijK9gtkMFuwSHhVt6R8nfFaHBSUNMMFnNlzkMe2b7jXD1OAi6tfYsoVfag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728026673; c=relaxed/relaxed;
	bh=I+g3k1LDrBFuIHfv//C/9Lzybu9R4yvEHlNDT3V4Kig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mi+doWSGHYObNQS8xAFpWhvAnxjMXZ0RAVTuQFK0m9U1LhhuLtpROwtp9wq0lFWAXZRDwpDCdVKjtiiiw+ShJqH/kLPTnymsBRouu6aZmZTUd8bHsEipDh9FkQx/fMBJbANuBk0p1PUmO9zEZ+FhSdeOn1zYWJ5KwKNEnCpo6EuBYX7BX1mafwyqC+5bc0yIi2a+89c4mKyqvPTZMWsVdSQq89POEruwyXBrDb3/fpioqMVkBhBt0AQz9eAN9PEsDDmdJK/cJeusG+Ro4/iGvqX9U9E1Ky5L6l9JeaqGPpvOwRkki8mpp6mHng9t7FqrFR7LHbb9YEnANIpC5RdmQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MdHuP54l; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MdHuP54l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKg663GHxz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 17:24:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728026634; x=1728631434; i=markus.elfring@web.de;
	bh=I+g3k1LDrBFuIHfv//C/9Lzybu9R4yvEHlNDT3V4Kig=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MdHuP54lv3a+OhlbtVKyguI622KLMrLcXACTk3I5ImxNCgpn7C/+ClWWa4lXLCfm
	 DS+ixFnFvgC6VkWYDJNLfdnlcIHZQY7aLSe+1Zx7M2Mvk1x0D0yJSpzOfommg2fk5
	 Xv5fuaKn1nkndHVhrYw8Y5ZJGK4Y9ao6eOWmM3hptIZSgdfu94Mtu7NcKNAW2cgCD
	 f7DMm51IbkBYh8KhohJ9ge9O1U68qa31Ud8HQp1FHTASnMm6wbc6Qgcs5MjPZtEY+
	 LGwF1e0zhc8dNpoM/vMUDXR0iZe1rRviNZrqhdacNDX1vgh0fXnmZeTf6YUWpOsHT
	 kAGgnpxzHB6e2EueYg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBRn-1sHV9w3j41-00hh4H; Fri, 04
 Oct 2024 09:23:53 +0200
Message-ID: <6d4240ab-b432-4753-bb6e-de0697f8db69@web.de>
Date: Fri, 4 Oct 2024 09:23:45 +0200
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
Subject: Re: [v2 1/2] powerpc/pseries: Do not pass an error pointer to
 of_node_put() in pSeries_reconfig_add_node()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <8949eefb-30d3-3c51-4f03-4a3c6f1b15dc@web.de>
 <434320e1-2a30-4362-9212-ca17cdde8b31@web.de>
 <9dfb5d24-f05c-4a67-b86c-7f157f633fb9@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9dfb5d24-f05c-4a67-b86c-7f157f633fb9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cOf4DD9kuzKnBYdmw6NcXUSvbOP9sAzC9p5qTgB+bGyU7sJcs63
 QiMSjOujc9hiccxuIXqHaRZLnUJsdU6ykSuv5ytZ74uWVnAwPLBYyOJj343c2VT8S9Y0Boy
 XMoKO/CvstmKZrD+uYN54Gmjsaz8CDNnDLudkSsQM48q6FB0olfOotKL0kJ4ATs/IEkIw2o
 VX191Yqz9Pq2ESV7BohcA==
UI-OutboundReport: notjunk:1;M01:P0:xq5kUmhz/C0=;EHOq5dN2pU7VW7prVUe4HmKd3Cq
 WLbiil794B2VtL6Mj2+aYkkps5TLz5oe9JuvauRVC7zo6qYK1hV9ewjbsWOG5b/71DpyvyEQZ
 mxBuM3EVRmETUQA0s5kbw0ZQDAiuc9UsFZDdeuhgBrXvvsqHEGd+bp4kfYFo9NUFbDSomgmxY
 iRrzj0NtmeK/RDAt5RTzbjluRTs9p07JbKDlZnNIDSxF3iOoWQBtf9pE5CA8plRhd/7hArg8T
 z1j/i7tAxmG7bphOpkGUNNBKdpN2L+7J20HqKyWViEA2gBmFE4CgfiLck9oXGiHKpTnzBNVd4
 T84cR/1xcTKFSre4h2XsGc7Ydlrff2HGkHP0BYF5FlkzBbpa66o1lz8RYL9gxeESqrydxu/zn
 l+UJOLSsh5p4CwV6SE4oaGKvDu1bBmqEiavyk9SFhyTmSdbQOLkOOMHCvLPLeA+Mz49SHVIHH
 WLSJwZiq/5yUTkWGRGGVF7XTqRY8E6jy5/w2kp9OEgml6qocLQrSfzQFddhvw0FRNZOFU2rA3
 kbUwf1B7V/+eUOWUz7Hi6gDtJ5NDSYWPCIuX8K+See+yELI6IgIXfsuZhI6i/W4VWkUejq9VO
 ZA3uB0yZcoY6lrKl7IbAk5XU/mCFgxoLp7HchSXaYP01Tpjsz0zoAYCLSrQr4IjNWLfVlnUfa
 SUk7aMQP80QMm9PsMe4WekAVGp7K/KhEbiprpwK1kUAdMJyq8igQZYtf+y1KVpHXCdKvCtjCw
 nvR7ys0XpEkE+BcJzhi3pe9+Hw24QUK3l+JMU90GNbPgOt/OjnUbDRrZcfrL3VJXktIIyTKIH
 5XUwx5vxocfmzbbHfssHf65g==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

>> I was notified also about the following adjustment.
>>
>> =E2=80=A6
>> =C2=A0 * linuxppc-dev: [resent,v2,1/2] powerpc/pseries: Do not pass an =
error pointer to of_node_put() in pSeries_reconfig_add_node()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - https://eur01.safelinks.protection.out=
look.com/?url=3Dhttp%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev=
%2Fpatch%2Ff5ac19db-c7d5-9a94-aa37-9bb448fe665f%40web.de%2F&data=3D05%7C02=
%7Cchristophe.leroy%40csgroup.eu%7Cab19d1c85de343f5474908dce3cd8c02%7C8b87=
af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638635719164841772%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C0%7C%7C%7C&sdata=3D8b7APXbglDf13PvZ4nVh5Z92bEft2RBqU3LfKsUETOI%3D&reser=
ved=3D0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - for: Linux PPC development
>> =C2=A0=C2=A0=C2=A0=C2=A0 was: New
>> =C2=A0=C2=A0=C2=A0=C2=A0 now: Changes Requested
>> =E2=80=A6
>>
>> It seems that I can not see so far why this status update happened
>> for any reasons.
>> Will further clarifications become helpful here?
>
> Sorry I forgot to send the email. It is the same kind of problem as the =
other series: Message IDs and/or In-Reply-To headers are messed up

Three mailing list archive interfaces can present a mostly consistent view=
 for
the involved message threads, can't they?


> and b4 ends up applying an unrelated patch instead of applying the serie=
s as you can see below:
>
> $ b4 shazam f5ac19db-c7d5-9a94-aa37-9bb448fe665f@web.de
=E2=80=A6

This development tool is also still evolving.
Are you looking for corresponding software extensions?
https://b4.docs.kernel.org/en/latest/#getting-help

How do you think about to start with the desired cover letter from the pro=
vided patch series
for another integration attempt?

Regards,
Markus

