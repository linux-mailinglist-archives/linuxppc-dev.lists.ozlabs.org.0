Return-Path: <linuxppc-dev+bounces-11082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB530B29E09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 11:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56yj5SZvz3cYN;
	Mon, 18 Aug 2025 19:35:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755507842;
	cv=none; b=mRdKFyW+VWttcydjV8JOSm0jW1yraMIty98Lwqkqky6DDy6C1SXpI5ZYfKu61HzKJ44NY+iFp2l5UEl/KZMbQTxbziKtJBYCJkWzHaSiRfcLKNR7VwkekHKB54AE2gniofjXaTZedyrVdjBAASycJib6ZO9PmwshaUenhqS2Pw2XDyviu1bnotioW7VWpRZIZ8P0drmSM1nxppKP5Uaf99VZcO40YPmDG3m0WQXKjEA/erl+M9IkKH0K8HjtRDy02kADL9FCWI2W4oqDOQLKMNcu8j2iiHpwTCsQnYYQRwEM1Cwq1kPJDvT7RQMrmPT9qJ5Wr2BjEKwVtSKDXeIZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755507842; c=relaxed/relaxed;
	bh=rq6946DzumILvEIR5XWexmQkysEBR7GbvltHkcSl6YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T15QJzyn8Z1deHhF2Q3f7kapu+NAzte+sYgjENCc2t6IFxTGbOnH+lIQdushPjx1EogzJHHYb4pT5Sm6cCJ5uxLYfRCIYhX3e/lQThDTifJpzqHZTnxIj5ZDGXPV8785BcdklbK3fzFoQzLnbcSzD+g9mOGcSGyFRqprvA6D5SGiMHOyrvGShuGXAkFXMGRYvEI937KvhDyuU0CIEogwr9zHgA9TbdEGTDAqtqgVoSrH3w/HdQKgD3n57PnUrUHj7e+g4oMr2aYYjF/3bkR3gwCMwv4SIa5MkFJb4wqok77Jk2vWfbOY5qqjVb/OPj/NoxyBTmtYKB1C7TKaXkm0mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH0jjYJT; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH0jjYJT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c56G92r1rz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 19:04:00 +1000 (AEST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HM02xk021396
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 08:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rq6946DzumILvEIR5XWexmQkysEBR7GbvltHkcSl6YA=; b=pH0jjYJTAl7re29P
	eDXYy6doYRSC9/QrUBVDRGmaKfPZCRnt/27BpOESnbmKcDWYQWQE0TN4RjZHB26p
	r31MIs4hA2/C4q4WvJs0F/TcGgCHu/dmVO2NTsFUfLgXGYc273YerMZN4+uFW9F7
	hypGSTOfjNaHRAfD5yZE9ln9D4CBCF4ZoWT6/s894AJcWj4w2Ceci1tqrMg7FZ7T
	8nC/lLMKExRJTWRCvcqmfiA5ilpDfF1xh3HEHJXusTG+HZ4HJHr6VZH5d8Jd3MdY
	0E5ihcuWt8hBw0jAUsx0ZEQNIeQ0WCoiOmTnd4PZxYXj0A6xg9y5MRgUrzX0TcRD
	r1n2kA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh073xk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 08:27:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4716fc56a9so6706505a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 01:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505673; x=1756110473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rq6946DzumILvEIR5XWexmQkysEBR7GbvltHkcSl6YA=;
        b=hmuGOswtm/hszvsA/gqwESLFs1r/InnfRtG8dZ/zOtovbhKH8KMA7tPJapELPooG6M
         nlKCczoSeKgL9WSEbtNygzdQ/InxuKo3QVWVm/6Pq90LKJDTjO+ukULhc5nGI6sUxNPy
         5vcW1fg7sSv4vt4dD5L6I7v1lBaTSPkq4jMCC8dHKbgfjAdHBywMwQDKn1Hf/WJHnBo4
         9QxygQZS86cnMHq4kMA8WaUd2J+3yi0jhPJ4bs1ZJf8vZhAi2InSX1oTxu7rKDO4sT7z
         Gr37CfWcGT96x5ngBYqXidOGbP/nKLoksAh3PI5aCzfaB4Upp79AXY5p+cHiEc3CU6pG
         ySbw==
X-Forwarded-Encrypted: i=1; AJvYcCWak728/5TWXgUevfizDjClXinkt0rn5YyTvr32SyHsjZLeWYbJETMJ5csDJl5y7XuZdrBefGsU+5AfTwg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5YBwH5K4B+hN8aZ9o9sWNwtcA+6XRbZXugd56YwmOjTv9LsEZ
	o8QdeiYBLbKbQxpjtXTKwNQCC7rFAhUhSsKUr9cp+Znp/lwwdD1crVeUUiE0f7oNq7I1sW9lNse
	1LKLRqdfITsbUuHxefRmbBurQhnTU2R25GMNABEpE5Dv+Q7mmA4QWtn7YQw0UtS6UMX4QTWjkzw
	qI+MsdgsQCqdBcvT97p9flX/ve1KCYQITD7Ouu0b5y834=
X-Gm-Gg: ASbGncuXuXIWv/e49NZs49kF9GXRM3qXr1c9Uf6cCYaQjfbe7b7A51QCnXuPUD7QdrM
	+Z/4KPP7WIfxugi0/Q5vfbjuFo+uJ5egqq9epUZUV9NpPFUMuAaugKPMOsmctNBZaCi8PU1GYCl
	lfXwry7Gd5cmBIxAkV8gAyJw==
X-Received: by 2002:a17:902:e842:b0:235:ed01:18cd with SMTP id d9443c01a7336-2446d99e6acmr165826725ad.44.1755505673474;
        Mon, 18 Aug 2025 01:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxmEX0bC4rGj0GsL0Ofny3nTaPHYYQ7bo5uu9L4GZIVv1jBDAAlTveYAPi+e7gAhEyyevMd3DrrsmVZDn0oyA=
X-Received: by 2002:a17:902:e842:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-2446d99e6acmr165826455ad.44.1755505673065; Mon, 18 Aug 2025
 01:27:53 -0700 (PDT)
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
References: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com> <d7cdb65d-c241-478c-aa01-bc1a5f188e4f@redhat.com>
In-Reply-To: <d7cdb65d-c241-478c-aa01-bc1a5f188e4f@redhat.com>
From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:57:41 +0530
X-Gm-Features: Ac12FXzcSoeiNhok4BzoYQfoalKvL5KSge90N69qQ3e47Ph8xq7Ih6FtZXa_xiM
Message-ID: <CALzOmR0C8BFY+-u-_aprVeAhq4uPOQa+f2L5m+yZH+=XZ2cv_w@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: uj1ERgJZ8FOfbcKD7n_VFyXpe5miX_9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX7nVTBIKAiKhV
 ijiK/vDo4v4RCtG1O9WDPsmnw3XM30gOsFowoFRZ3uAhJqwIJ674Z+WMJFlhDskxI/CPPpby2OU
 lVGTfW40tkh7XYey+iugi7cgXjmxU1nbVImRPRqtdeByz8iMxzqrMHxMZUwqxbF9pFV9Mlu4Snb
 4Yesutublkv1gUVHfL3ybRHADqsTOtaqNhjJS2DCLAH2FdyoQYxuzBkdSs7nIc38Q3CxuFdNf0+
 guZITvblENxIT3Kg3L1T/tmTGyrjX/2+5uiv9nCWhBraHM1XJ92vx3b2QeMrnUYRaC1PA5mcyGi
 Dvd/TePH5LDo8NdlSA+vBQrZHCZzTmmZ+0y+IZhy5CHsC9Zb7eapA0Kj96IwjLfNU0gB3hRrJi4
 XrXDjxF1
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a2e40a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=uSFNSxTeKwDZCnUuY58A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uj1ERgJZ8FOfbcKD7n_VFyXpe5miX_9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 12:29=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 18.08.25 08:41, pratyush.brahma@oss.qualcomm.com wrote:
> > From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> >
> > The function `memory_add_physaddr_to_nid` seems a misnomer.
> > It does not to "add" a physical address to a NID mapping,
> > but rather it gets the NID associated with a given physical address.
>
> You probably misunderstood what the function is used for: memory hotplug
> aka "memory_add".
Thanks for your feedback. I get the part about memory hotplug here but
using memory_add still seems a little odd as it doesn't truly reflect
what this api is doing.
However, I agree that my current suggestion
may not be the perfect choice for the name, so I'm open to suggestions.

Perhaps, something like "memory_add_get_nid_by_phys" may work here?
>
> This patch is making matters worse by stripping that detail, unfortunatel=
y.
>
>
> --
> Cheers
>
> David / dhildenb
>
Thanks and Regards
Pratyush

