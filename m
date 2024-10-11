Return-Path: <linuxppc-dev+bounces-2106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4C99A13C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:25:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ2nq1XkWz3bsy;
	Fri, 11 Oct 2024 21:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728642335;
	cv=none; b=BdK5rwjuiSSFgWma7VRahybzQCgxpNj4g0bwQWMSLyMmZ3PDGHFLDG14c0Wb+8K7hMzOaN/1eBrhFB1BJj49+KDv2cMxJJDWMQoD43LQZez7GI37L7NRBmnRKmOS4YtoWrm8W++Zw5DDiz79qSbrzq0Ru8XuZoxHVeuGrvr7gMN6C3R872Q7C3zFDWIZfodBEFJ52VWv1Vixc1aPON/Wk7lFPsBCIUvVSX3yntPo3UQviuPI7pWlBrPXU9SXmiNk4lbuuuuXFvPWO3lvum/OKz2DllAnzy7fyshlPu/CkDlfWyXB9GVS73/YnGFl3Uv7mQ5y7pmoDluze8Rj42WWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728642335; c=relaxed/relaxed;
	bh=l88hfXjRWh3tvGREenC3v+lQcZl1EYid3S1eGgvAsKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPPSWD0S9kk5MJdX0BexnZX3UTdWT/+3lYJdbxvbiHMTwfck0CjUetxhMhC9+vVZYbVdLvm/9SGCiVo173TsYx4geNuzprSHSsskEGzjLhLPAp5F3EB69uhyTYBBHwYOyl0oTjjg5BELQ/4YP6pMt1QBke2RYC1Ohl1fAuUaFuTFp9vgRPGKeA/LzezkE3IbhAljYHwE5L3M1rmpIAYzMU37QjxDnXKOieBd4IrzjYdvTQO85iuCksiTqn/h6TxDdOn66RSM4TivO7GgStbg8tTXvdb4INS6i5tkalyq7sam/CUE0XDQ3Cy8nrARlQuIrJpXGSb/9sUw7mdz2H9bAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIcfZvM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIcfZvM; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIcfZvM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIcfZvM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ2nn73Qmz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:25:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728642328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l88hfXjRWh3tvGREenC3v+lQcZl1EYid3S1eGgvAsKg=;
	b=AGIcfZvMgkRscB7MoUbYoq6XHnXZCw4zrXEU9J41SrGZa8CaWx7L7Sbk70PPPMrIV9BBUK
	+Nfl03JT6Mw/wRSCkEPnw8iImIyTY3DSGj+S3cQ97cKT00GFJ7GGHoHJ9zBfkscKuX/rNo
	gA+1C+C/zR1GUm2SYssABRyCPVR8rws=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728642328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l88hfXjRWh3tvGREenC3v+lQcZl1EYid3S1eGgvAsKg=;
	b=AGIcfZvMgkRscB7MoUbYoq6XHnXZCw4zrXEU9J41SrGZa8CaWx7L7Sbk70PPPMrIV9BBUK
	+Nfl03JT6Mw/wRSCkEPnw8iImIyTY3DSGj+S3cQ97cKT00GFJ7GGHoHJ9zBfkscKuX/rNo
	gA+1C+C/zR1GUm2SYssABRyCPVR8rws=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-c5pgxhbPNGK8ws4kRNPStw-1; Fri, 11 Oct 2024 06:25:26 -0400
X-MC-Unique: c5pgxhbPNGK8ws4kRNPStw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4311a383111so6981685e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 03:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642325; x=1729247125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l88hfXjRWh3tvGREenC3v+lQcZl1EYid3S1eGgvAsKg=;
        b=wF00CqGgN866K1mituls8xZpc8QgGu2ANBiqOBR1b44yEtfOJw+LK8tD3uLq/YC8vp
         9MYQtfr/fpDiSHbVn05KlTzOVVuQlFmk3stny/UaDUoqgRcptvXFVBADVqw+LPHAA6wp
         akJvCzPsZDa7KuCaEO6o06RNqBTUS2+VSDT4qWiP0nh/YB9tg9QX91jakCbMCWf2DZMe
         ZVdfxB5zOIhx93zpjNnwMLr0yrrFH4UrOs3upRRADG4crs4m2Q6GSiSIK8IXyv4hSJG8
         FkLhDQKWZBvYH47nkmjQaAdABQL3cnC9nLyXCLIq4EgHPmRghkS3p04NPW7nrYf+YOhW
         /5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVJVttCT7cp5WM0iHd1sHuvdJvHA+BkNcj1y65YHrryNz9xuc6tRw9vndb5mlE8rPFuQv0yycXEEWMDik4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhyJicZrVTkgd9x0zGlD7ZafyOyFmUPTfzwlVZEnuMPvu9xwYN
	nzAjGyESt+tuc5Vm9l5s3uz1WF09WuDaXcdTCMotfQQ6SwGOhg6h8Xm/LUduri4USMeg8nBUlM/
	lt3muW1O4+jeOe4I8bx7uU6/R7YxmQn4Gwlg9mGFY0qRaINToXASHpEnRTd3On6M=
X-Received: by 2002:a05:600c:1c0b:b0:430:57f2:baef with SMTP id 5b1f17b1804b1-4311df8ca01mr16234945e9.32.1728642325666;
        Fri, 11 Oct 2024 03:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvrAkZsTs1JD4KYKodL5yuOZQpAOEOPQW4AUHdUxlr/YzaDUX1TYyjZhOLaR6UJiXB4opFBQ==
X-Received: by 2002:a05:600c:1c0b:b0:430:57f2:baef with SMTP id 5b1f17b1804b1-4311df8ca01mr16234675e9.32.1728642325131;
        Fri, 11 Oct 2024 03:25:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c749:9100:c078:eec6:f2f4:dd3b? (p200300cbc7499100c078eec6f2f4dd3b.dip0.t-ipconnect.de. [2003:cb:c749:9100:c078:eec6:f2f4:dd3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430541d7e6fsm72947275e9.0.2024.10.11.03.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 03:25:24 -0700 (PDT)
Message-ID: <be2a1166-9c8e-489f-8e95-b905a06fc9e5@redhat.com>
Date: Fri, 11 Oct 2024 12:25:23 +0200
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
Subject: Re: [RFC v2 0/4] cma: powerpc fadump fixes
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
 <87zfnb54fe.fsf@mail.lhotse>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <87zfnb54fe.fsf@mail.lhotse>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11.10.24 12:17, Michael Ellerman wrote:
> "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
>> Please find the v2 of cma related powerpc fadump fixes.
>>
>> Patch-1 is a change in mm/cma.c to make sure we return an error if someone uses
>> cma_init_reserved_mem() before the pageblock_order is initalized.
>>
>> I guess, it's best if Patch-1 goes via mm tree and since rest of the changes
>> are powerpc fadump fixes hence those should go via powerpc tree. Right?
> 
> Yes I think that will work.
> 
> Because there's no actual dependency on patch 1, correct?
> 
> Let's see if the mm folks are happy with the approach, and if so you
> should send patch 1 on its own, and patches 2-4 as a separate series.

Makes sense to me.

-- 
Cheers,

David / dhildenb


