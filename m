Return-Path: <linuxppc-dev+bounces-13736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD7C30D58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d16MZ0ybNz3bfM;
	Tue,  4 Nov 2025 22:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762257306;
	cv=none; b=bcvPD3awi6qsaNwDEmv4SzoGNn6Oqhdw8pSpSDpiuKVaGFlx6oNP9lwfhJHuzvEba7L/qDjc2cSZCNhnXZAaYMLh3knoMMnXMfURDtpBKkXMqgo0um5X/zyJLJBFqodl/tshIBnUH3H3pWEALIZarmQMVqr6NjnD6c06/AI/ouJ1MFA4J20YqtM8sTCFtat32XDgcZgwKCcMdaj6aUvOECIPwaH9suaY+l/tIViq4UNUldz61R4oLZpyousGzkMyp0FoM2c+mDtaAf25l7d9fPMYiBuTHSUxIv2Xwsay+b7PBdOyvXnYsVrik9QdIZhZGGTXLtC6iFR4FoDYjWJrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762257306; c=relaxed/relaxed;
	bh=FvowAcvC8veNnfIagKTJiT6zHVzm/04aTlVqH5+9gAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuqCs1CgJTTXxUfax1bV8kTiHKiB8cn1CSSu+DzabB/cilLPDfYHbmi115Mv9GWokilKe3PjCLiB8EIYXHpd5SpnOA3DCr1gOTL9entt1dLVBKNVTPcpI6udVwZfTWzxTh2yoH5XA4Ds91DEEWLocNnoBGiqF2ZwxoSS8RgHgFOVi7ni5Db4bPeVmykL0blr7eA0fyQY5E5sVgbDd0g1VEV4BZODYIxbDZcN3wxE3VBC23CodcIojpx1SRzr2UtLhoSA+r3EMWwBrM0y0BYGc68cfWzAh75TwirvfBC1LdGV/S/UcOMW5Cfu7Vgh7Y5eoLmWuc2Z456BTaQxaYLAYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ny13fkKv; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ny13fkKv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 348 seconds by postgrey-1.37 at boromir; Tue, 04 Nov 2025 22:55:03 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d16MW42GBz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:55:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762257299; x=1762862099; i=markus.elfring@web.de;
	bh=FvowAcvC8veNnfIagKTJiT6zHVzm/04aTlVqH5+9gAw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ny13fkKvctMP3iC0fDuAY5uH5hO8uoyUa20xgIZ/dsfETEfKkGE3QLEZXZfx4F3X
	 73YxSnCUrlZYYSpQXoS1/Z4Tpylos9+d6/aXRzr5kEcx5Fmvi9Mv25jIOr0ePDapA
	 VkYKUc4xxGYT/r0/tLSCQ8RrIaZ2ew4Ku7oAQjFHuzQTHoPgcxETMz99jxCG3ASRE
	 gEV9XILUgYbheQEBrNir5ysTCmKatN+zmWr7DCqmWnyUZJUXNpxrG3pMMmaiuPygs
	 yE+dtKozZ47JKBl5gwT3T0p9INda/jVYVG0EraLLSyxZ2EXNoqWboklXjy8AK0DPv
	 BhW+XPAxkozdsj+Y4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.227]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mm9VU-1vy4jF0F9s-00aQha; Tue, 04
 Nov 2025 12:49:09 +0100
Message-ID: <36c855fe-9a04-4e83-8e0c-641e2d7e3df9@web.de>
Date: Tue, 4 Nov 2025 12:48:35 +0100
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
Subject: Re: [PATCH] powerpc/cputable: Use pointer from memcpy() call for
 assignment in set_cur_cpu_spec()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
References: <6c61cf90-5811-4450-b649-7a2c84584ee9@web.de>
 <3115e03a-1995-46f4-a902-47ba3cb99901@csgroup.eu>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <3115e03a-1995-46f4-a902-47ba3cb99901@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7+RRqGhBd2/z2HqHq1MqtyP9k9EOJTPbzT50PO1Sj8zYR1GdUlK
 t026HqJ1BRc4mPYN0JAIKQRPArlOJeO9auwWlBRa8KTWLN/P4jMc7FAftx85TvnKhbpP+og
 mD/brQwwcIFA7bm75Yb3/gONngUCcYiArSoBsC7EuhGSHLsK8gFrigoAmyGar1MPuAP0zBw
 pKpykaHC7jsW08CxgrFUA==
UI-OutboundReport: notjunk:1;M01:P0:DxayqqJNpxc=;i7N5ZVpR50FA5i5HmlxgYVLA+5+
 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
 hSwVg==
X-Spam-Status: No, score=2.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> A pointer was assigned to a variable. The same pointer was used for
>> the destination parameter of a memcpy() call.
>> This function is documented in the way that the same value is returned.
>> Thus convert two separate statements into a direct variable assignment =
for
>> the return value from a memory copy action.
>=20
> I can't see the added value of this change. For me it degrades readabili=
ty.

I dared to present another coding style view.


> Many places in cputable.c have that t =3D PTRRELOC(t) pattern,

Several assignment statements can occur.


> I can't see why that one should be changed while other ones remain.

Copy calls influenced the suggested source code transformation.


> Can you elaborate why this change is desirable ?

I imagine that selected variable assignments might be avoidable.

Regards,
Markus

