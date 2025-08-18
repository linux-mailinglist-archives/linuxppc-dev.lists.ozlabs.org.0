Return-Path: <linuxppc-dev+bounces-11081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BCB29E01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 11:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56yB34Dhz3cR8;
	Mon, 18 Aug 2025 19:35:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755506078;
	cv=none; b=IFv29wTg2D+k86PU9vvLfixrNQcdoKyJET76pKBfah5f94v4RI6rC79lfcWaPXnLCMXOiOQIims1+XCELl5lZoqijBsKezLsR/C6XTwCFkz6lc7obtIiQ9I8DA6QTDha164wAXbCI8H8e7BJYDSk+shG7xSzIyPJxvWp5/id8IPdKYcEywA3x5u3t4TDzQBHCQzLRbGo8w0ecY+WVu/GxWqrVFAa48J4G+XKGAQ1eIGxtSIML6CTZgyvpNE3Q96lmb4dEN0eXZAu69HopiC/ExCvW0/RDJp0qv9UPWGDbCi/8aqb3fqlU1NwRMqrqwwCRGDUIC51WVmpTgnCZOHeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755506078; c=relaxed/relaxed;
	bh=YKnYr324eUUhj+QvrdVq/1e4Gz0w8e7EzwXqGsvWiSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bt9R5xBsO62S/BDvLou+td/7FNhCkzY54Dm3gVVrkxpFU+OP7cdjlnLJpp1iZHJ3mHMn1K1IDWI5Rt5IKIQjkss8DoqiZllfHJVkxQ6QGsw8ZdHZuru9qsvAxz8lCHpw90y4uWdfEVQk+4ZAJzFoyvhBIR21mEuqx8saRJ2RPZtuWvaHceF1Ws06hOI+QMR+MMHeTN/RVn06ejGj9I2d4UDuIeGqJ4eQPLFB16KMGU7LKIpD8pS43pOlcEnJX3POt5HIoa//7CHcjMDdHkH9N7KmZQEqPwP6nCw8WYioerE2KIaWV6fbx2Fw/08PD+LMaTO9rN21nj7ZUYYhM4BXKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aze4Y5K8; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aze4Y5K8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 398 seconds by postgrey-1.37 at boromir; Mon, 18 Aug 2025 18:34:37 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c55cF2wl3z3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 18:34:36 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Uv9f017344
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 08:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKnYr324eUUhj+QvrdVq/1e4Gz0w8e7EzwXqGsvWiSk=; b=Aze4Y5K8XQlzwnRF
	KS2Vkdxd7n2qp5VewK8A0a6hxTVqbzMOozD5we+cTVDCFI/JgzI4KiILotlO/UDT
	5nep91KwnnHHqgiAzY1H8M3CWe1zTEmZYyWHunj4Ox0D6WSd5grZgkLGRwPg1VDC
	AV7KF5nJZeWoctIPiE0ufDcHdCnyV7xMUGfrwbXbmIslahVPylvI9zmR1/9esOJY
	AFEx5vpmQjcRyyhWxPm+CoJZ5aqsnT0c5D/yh/yGTOu1npeEZWylk1LpzGMfAn+L
	zrROeF6fcgqEzADtHMgH4NoIVLArFoA6z69DOF0yue7AxwnGRTjpFvxh/tfVJGe1
	wi1rZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyby26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 08:34:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581950a1so43849685ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506073; x=1756110873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKnYr324eUUhj+QvrdVq/1e4Gz0w8e7EzwXqGsvWiSk=;
        b=srWd2R/pDyw+iQRzmstKPngYS75AY7wzm8Uh4RpP30bXtsvRcbFbwSOfVfQdAu3y0d
         LmYnN4LP7nf+MdZbfxCMuOR/LkGO3wpycqz9nMJBXaq+gbnjch+gpe+GQE9Hnk/AvOjp
         KkPftmV7y9auTNJTqcpdJSDMbH+mmvsk93KgT36xDadUFWwISxN7kXzQO3jdaQ/8Bxbu
         x2/zgww3hciqk0hSqrkICm97BKlGZMio3JVMWEKV7v8L9NynLzj4qiDaiLxGM3LH+2kD
         d8oT7t8Ho8ox6KrtPxun9wEuC1ULM56QLvmiOOIsVpGC495/umr5ZbYJae6MQ/bj7P+7
         aJIw==
X-Forwarded-Encrypted: i=1; AJvYcCUXo+M4nQZ+kWBwSnp+tGpdcnXUBmAMwDI2I5xr1yS3SbbtbHbhtub5kH/wwgfUSMNdfHbOJ2Mh6Gj98ZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVM29mq9YECGHGiV6k83bijgPmUrgfMdL4YSsBm8WHLvr+/dMS
	e7Oex9DQ6FodZyYL4EYP5b+g0Im60xls9SfAfEIfrSFv5NT+IJx+Lqd+j/Iv6+oQrY2Rn/SCsdV
	b6rwpJ3f1XUMsqVy/cEeX0EJoR7WZmkLauiCYbl2arjOEHHn/5botYVNAtz22NiiQFWcOlYUdNQ
	SFsVGoczqDw201MuaIrcX81CJ9pNVJnlNjhzffYlLx6GQ=
X-Gm-Gg: ASbGncu0dPj35s9pueJdKBpRIoIdeEz+y6VQrMQsMPSZEkuFp/Lze4vAvF0MqsUV0Bl
	zQe/nO0QDYpv8uOwygbZnMW4ETsuwPr22/0yYtZqcTKgwjh40MdjxMqbTgZfMBlU1ORFiWhYfGx
	QBOHWN2C3mD8riYNaL0gKsOA==
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-2446d745130mr162002095ad.22.1755506072930;
        Mon, 18 Aug 2025 01:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0iaKkOx5HF+G/2fDa+4Vn+rw7qYZXEvgZcGmIZ96t7UkZ4Y6iVl499qKwZ/lWHVbWQiw75ZkO9MQbjWLb6hM=
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-2446d745130mr162001485ad.22.1755506072460; Mon, 18 Aug 2025
 01:34:32 -0700 (PDT)
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
References: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com>
 <d7cdb65d-c241-478c-aa01-bc1a5f188e4f@redhat.com> <CALzOmR0C8BFY+-u-_aprVeAhq4uPOQa+f2L5m+yZH+=XZ2cv_w@mail.gmail.com>
 <63082884-1fe2-4740-8e6a-e1d06aa5e239@redhat.com>
In-Reply-To: <63082884-1fe2-4740-8e6a-e1d06aa5e239@redhat.com>
From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 14:04:20 +0530
X-Gm-Features: Ac12FXzX5PzSlv6roYThUOo89xclaREe5qOUHnsYKt7fIrY-t8kJ9YEJL5m2flQ
Message-ID: <CALzOmR0MJv8EgPiFTvvbdkk8H_0BEDA4QQXKyqRPOCwwzGwjsw@mail.gmail.com>
Subject: Re: [PATCH] mm/numa: Rename memory_add_physaddr_to_nid to memory_get_phys_to_nid
To: David Hildenbrand <david@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-acpi@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org,
        linux-cxl@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: JZ6i4LKWDBmClenYOMXuHMJdN4B8WRVI
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a2e59a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=AFlVVsuRyXfiT6IdkpsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JZ6i4LKWDBmClenYOMXuHMJdN4B8WRVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX15pc0aYhdhYl
 2TyBro+3UEF9b83J6BlewESajO/wFj5Vmw4KnWwGa8/LQWCW4K04/uiApLsN7nA+zUgNxhYqVi+
 0bhPayYbCcRI/R97SeWXpd1BwKGxOCoXSXMGa3OYB2zWwgLC96RZugikGd+C0VkFY8hQrDrqxX3
 lE09ZsJbLjOFllYMav0QnMeASog4yMuCLNpioiRQzIYntO3BmNy2YK9Ig6O6HwSZXUe/5Irq5DB
 6H29dphIdpLcohoht6FN+DwUUk3EZPRF5c+3MSbyFnWEZ2L85NIRooHbbd9+qnKbh3R4hJLQDYJ
 mYOk3gOo5SP/g2LEbQVfrobJYzhOr628713qG/1UKZ2duFNU5c2Zi+ZIuOqI8++W3fQjbcC/6QL
 ongTTxHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 2:01=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 18.08.25 10:27, Pratyush Brahma wrote:
> > On Mon, Aug 18, 2025 at 12:29=E2=80=AFPM David Hildenbrand <david@redha=
t.com> wrote:
> >>
> >> On 18.08.25 08:41, pratyush.brahma@oss.qualcomm.com wrote:
> >>> From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> >>>
> >>> The function `memory_add_physaddr_to_nid` seems a misnomer.
> >>> It does not to "add" a physical address to a NID mapping,
> >>> but rather it gets the NID associated with a given physical address.
> >>
> >> You probably misunderstood what the function is used for: memory hotpl=
ug
> >> aka "memory_add".
> > Thanks for your feedback. I get the part about memory hotplug here but
> > using memory_add still seems a little odd as it doesn't truly reflect
> > what this api is doing.
> > However, I agree that my current suggestion
> > may not be the perfect choice for the name, so I'm open to suggestions.
> >
> > Perhaps, something like "memory_add_get_nid_by_phys" may work here?
>
> I don't think this name is really any better and worth the churn :(
>
Sure. Thanks for taking a look. Will drop this.
> --
> Cheers
>
> David / dhildenb
>
Thanks & Regards
Pratyush

