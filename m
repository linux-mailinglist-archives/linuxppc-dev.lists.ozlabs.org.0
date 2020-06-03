Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C30721EC7AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 05:03:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cDHy4SJCzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 13:03:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cDFs1hH5zDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 13:01:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ezkeEDVo; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cDFr0mZBz9sTD;
 Wed,  3 Jun 2020 13:01:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591153296;
 bh=oNX5+B3yN7rD8ZhFo8Gqpc+HpYbEV/fR85vMqUwAnmA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ezkeEDVoIrEXgihjwswT53YYSm9b7aQCc+/JKPjZpEmY1rvyJIiesqBN14sEIS1Nj
 BOp7gC6V9J6tMJj1elQfy6mN714ToP2lD9LDGXcHbBdtwSRmo6gV00sOILCOrQ4A4k
 bqUqjTvGWHvx7dwn2iD5CJjeDExgLjOr29A8ItNC1D6hjHwvCtSp/4zauh4PI30Gui
 vCLInUu5PGr4veb3dqsHKFTMiNW57iveP4Jg4hKKqJXo/qfXy2tBDnfZJvpNh3+zNo
 ofutgsqEpo3kc0rHtz+QIKbMZ/SNf4j/UCv+lmscprOxnTm1URoX1hasM2WsfeBk/N
 fSMMHk1LRk9IQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "wanghai \(M\)" <wanghai38@huawei.com>,
 Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
In-Reply-To: <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
Date: Wed, 03 Jun 2020 13:02:00 +1000
Message-ID: <877dwoj1hz.fsf@mpe.ellerman.id.au>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"wanghai (M)" <wanghai38@huawei.com> writes:
> =E5=9C=A8 2020/6/3 1:20, Markus Elfring =E5=86=99=E9=81=93:
>>> Fix it by adding a call to kobject_put() in the error path of
>>> kobject_init_and_add().
>> Thanks for another completion of the exception handling.
>>
>> Would an other patch subject be a bit nicer?
> Thanks for the guidance, I will perfect this description and send a v2
>>
>> =E2=80=A6
>>> +++ b/drivers/misc/cxl/sysfs.c
>>> @@ -624,7 +624,7 @@ static struct afu_config_record *cxl_sysfs_afu_new_=
cr(struct cxl_afu *afu, int c
>>>   	rc =3D kobject_init_and_add(&cr->kobj, &afu_config_record_type,
>>>   				  &afu->dev.kobj, "cr%i", cr->cr);
>>>   	if (rc)
>>> -		goto err;
>>> +		goto err1;
>> =E2=80=A6
>>
>> Can an other label be more reasonable here?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/coding-style.rst?id=3Df359287765c04711ff54fbd11645271=
d8e5ff763#n465
> I just used the original author's label, should I replace all his labels=
=20
> like'err','err1' with reasonable one.

No.

cheers
