Return-Path: <linuxppc-dev+bounces-1971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4B998879
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 15:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPWXy42Xtz2yx7;
	Fri, 11 Oct 2024 00:57:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728568658;
	cv=pass; b=aYZX2oX+HakgI/dOvykONqUqhz2mVRZCp23400AjbV/bi4xyaNWsf6ewCuY3OmfH9HgPAdqrf3JlXQpGZFQx+IqKYuZ6Sj+QR3tzhmD85SV2Hu7kzvBJLH2crwujNvj+HL4fIEJKBRzxjXkNPzW3F9B+Sd+PBNlu2LR5rUhrBTYYpVQlXAYo/D0vRzmYNPPb9gifiRGTXblaroSMwm1EmQYGoG3GFYrLCJAMS2FQeFlDTdGCE1TNGUSWbaNKWodiwD5vAnxZkKWIc2Jh4JJOY04XRtT2JiI3uvA5SsLLWkpKT97Ez168mZUBI73omhpn/4eyscre7GdaIAJk9b1gmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728568658; c=relaxed/relaxed;
	bh=nTmyN/S6mYtoNSRaOImOVWIvqfwSir4wwvzhSOMIxxk=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=UhshSM6jSSf8ld3Rp2hOCiIPv584BnMdM7ORDGzxt1RBlJ0wp+GO3jxtGuqmIMM89qssll+TI43EBfr40t7x7y+nstbySPHaxdFAy4Rr9nK6DNv0zX6mZuReKX/sy7qSJG9ci9giIy0ZtEPTrsohshwhNmjixdNvsBsp+KedUSQc2Vx5gvo+VmG4G48lcCVJmfeq2BDm2hqWRAxpmhhib8zrY/X0kPlNEDhJ4uKjjJNkWY8N6weMZeoOtedlZia0MkSQgNGGHhlbBQepU8vipNpGJ1STpa4WyBKGVIMkrAVS2vnKGSwKxdRVtCUmC/WxGceSz3izeWsKcD7G0hE1GQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=VGAqGt9y; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=MEv8I47T; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=VGAqGt9y;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=MEv8I47T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPWXs15ztz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:57:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728568640; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UHykHgXBqzJ8Eua0HGkvi0oTgVsZB91QlXNy05j2zkjTuQvDST5mnOIRaUHr7/dfto
    itWkks27uu/7ickJNHd1p9f4TThRfwPoMefXol/zF/YuSrYobMT6yDc62ZXRS5ll8NyU
    siBR9CtowyOrFluVntFWAi6HhxmmwSJCu1a/jMxyAKfBHnR/YXJb3pJ0FG9DTP05RTyi
    agxUATX2nRuizqg/EghIEvePpt5mZZEBJYUPB77Q4k6dZGdzMxQm4C/LE+lA1PEaQs8v
    fvHgZaZUTV/Sijhj1Gn3B2oX4s1vN4oT25nD4VX1Ct1OLg964v5VagAH09Zk7uS+NeBc
    LXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728568640;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nTmyN/S6mYtoNSRaOImOVWIvqfwSir4wwvzhSOMIxxk=;
    b=VM/fm8IYN8mLGPgrX9gO7zBcq9OCEb3u/shhlEE1KGfnd9L6qjHfQa/kGqFRjnFkAi
    Mm8D1kisCuI5S3MOo+GiNHEwV5C2fXlIOO/XgCBBs+eAD93WDdrlsXPbCO7raQMK5qAX
    L2AfgLdAA/atqgaQoyZZh9IxMMUuieJch5ee+BPUlDzy9Eet3CB0+ucFr3odK2rQ0FHx
    CNR3lUHlr7r05QfhrprPIoeRwl4W6fqsCdiGupgF7IRjo5gV075DRMFwUmh6MTr66tfB
    xYrqUssDAhLMndVmr/jGAmAqcp4dB+nPwCUVaQrxoKB4uBkoZAl2Pt5Ruk6cAyhQU1V4
    /wiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728568640;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nTmyN/S6mYtoNSRaOImOVWIvqfwSir4wwvzhSOMIxxk=;
    b=VGAqGt9yR2gG1vwBP5+rRa8GlTT34q0k8wabEgwe2kFovh3eZp/vnATpmIafYIf2St
    aAQskyv/T1Gcg2ccyboF7TtzidWK/1+AvoLDtktrs+OmKwS/MhyeEBIcMky11BSqaXBa
    foP16odqvzvDxmuMn1v3ePLv2HNaI1iTRY8ecIBXYpvw3GNPA/vYyAje4sOzcyq4GAO6
    xZawY4cBZs7zNxScUWbLEOrrYwCg3TeH6u+5UW0KZJYRe+MQVfBWp9vhhthPkwcARYIA
    TniIqkAzFOZF8KmIl4EzJnuBmnqPSUlzl0P4UhYAqkqZQc6Nw4tYX7czBnKH9wMehZFo
    GzOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728568640;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nTmyN/S6mYtoNSRaOImOVWIvqfwSir4wwvzhSOMIxxk=;
    b=MEv8I47TJyLa3v3C5pQjaNAahPf+Yj8yc+cWeFDyvgO3reII+pZoxqgbcXcDio8Hs1
    c3wBsyMoIddaUtk8gkBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i1s3PFXXvQIhef8w/WHZGY1bRFY7PZniOs3Ug="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a09ADvJvcw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 10 Oct 2024 15:57:19 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: [PATCHES] drm/radeon issues
Date: Thu, 10 Oct 2024 15:57:08 +0200
Message-Id: <6C389917-EF59-444B-9C33-C3F9A9AD3921@xenosoft.de>
References: <EE14413A-3528-4646-A353-DB5131E56BA2@xenosoft.de>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexdeucher@gmail.com>,
 alexander.deucher@amd.com
In-Reply-To: <EE14413A-3528-4646-A353-DB5131E56BA2@xenosoft.de>
To: "R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

There is another issue with the Radeon DRM driver but there is already a pat=
ch available for this issue.

Link: https://lists.freedesktop.org/archives/dri-devel/2024-October/473314.h=
tml

I compiled a new RC2 of kernel 6.12 with this patch for the X1000 and X5000 t=
oday.

Download: https://github.com/chzigotzky/kernels/releases/tag/v6.12.0-rc2-2

We need 3 patches for the Radeon DRM driver currently.

Please test it.

Thanks,
Christian


> On 08 October 2024 at 11:00am, Christian Zigotzky <chzigotzky@xenosoft.de>=
 wrote:
>=20
> =EF=BB=BFHi All,
>=20
> I have released the RC2 of kernel 6.12 with Christian Koenig=E2=80=99s pat=
ch for the X1000 and X5000.
>=20
> Download and further information: https://github.com/chzigotzky/kernels/re=
leases/tag/v6.12.0-rc2
>=20
> Please test the kernels because of the second Radeon DRM driver issue.
>=20
> Thanks,
> Christian
>=20
>> Am 07.10.2024 um 20:36 schrieb Alex Deucher <alexdeucher@gmail.com>:
>>=20
>> =EF=BB=BFAdd a few people.
>>=20
>> This should fix the radeon ttm gem conversion.
>>=20
>> Alex
>>=20
>>=20
>>=20
>>> On Mon, Oct 7, 2024 at 2:33=E2=80=AFPM Christian K=C3=B6nig
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>=20
>>> Make sure to always set the GEM function pointer even for in kernel
>>> allocations. This fixes a NULL pointer deref caused by switching to GEM
>>> references.
>>>=20
>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Fixes: fd69ef05029f ("drm/radeon: use GEM references instead of TTMs")
>>> ---
>>> drivers/gpu/drm/radeon/radeon_gem.c    | 3 ---
>>> drivers/gpu/drm/radeon/radeon_object.c | 1 +
>>> 2 files changed, 1 insertion(+), 3 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeo=
n/radeon_gem.c
>>> index 9735f4968b86..bf2d4b16dc2a 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -44,8 +44,6 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct d=
rm_gem_object *obj);
>>> int radeon_gem_prime_pin(struct drm_gem_object *obj);
>>> void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>>>=20
>>> -const struct drm_gem_object_funcs radeon_gem_object_funcs;
>>> -
>>> static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
>>> {
>>>       struct ttm_buffer_object *bo =3D vmf->vma->vm_private_data;
>>> @@ -132,7 +130,6 @@ int radeon_gem_object_create(struct radeon_device *r=
dev, unsigned long size,
>>>               return r;
>>>       }
>>>       *obj =3D &robj->tbo.base;
>>> -       (*obj)->funcs =3D &radeon_gem_object_funcs;
>>>       robj->pid =3D task_pid_nr(current);
>>>=20
>>>       mutex_lock(&rdev->gem.mutex);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/ra=
deon/radeon_object.c
>>> index d0e4b43d155c..7672404fdb29 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>>> @@ -151,6 +151,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>>>       if (bo =3D=3D NULL)
>>>               return -ENOMEM;
>>>       drm_gem_private_object_init(rdev_to_drm(rdev), &bo->tbo.base, size=
);
>>> +       bo->tbo.base.funcs =3D &radeon_gem_object_funcs;
>>>       bo->rdev =3D rdev;
>>>       bo->surface_reg =3D -1;
>>>       INIT_LIST_HEAD(&bo->list);
>>> --
>>> 2.34.1
>>>=20


