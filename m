Return-Path: <linuxppc-dev+bounces-9989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CFAEF85A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWj2s4tQzz309v;
	Tue,  1 Jul 2025 22:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751372837;
	cv=none; b=U1c5/xgYtIvp5W4wbuvn06A/tnr0zq9rqsfWR2Lqt1Te4BDgflsi2L227iEq1PnP6kFoUnK9tWEJugR8Gs792PMkIlHIBCITgtSzSWTnZ+ZlxaIvwkARjcZzWZaIku60Oyvl36tjIwJdBkALFUO6G+GVL8oDL6PtmBf83sHyJkb0J0T8IFLaTv8LLoYrs/g1f4h4an4zr68KdWQtN5ec7Uie2fFMkHBIcgWixFvkXS/GVH2ZYtVyJ+hZYxTvT+suuITneXiJyaYXpag+CkfwzD406Y6PPvYO/9fczWuPMA3hqSUVg7isboubQ67S8zaajFPwYML0KAbXvK8bIUwriA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751372837; c=relaxed/relaxed;
	bh=FEHfRalLuIEVVtsEsS9C6ifi6aMXwZRzg5zr/B5tJXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXLz5WI5HLD5UJOyDEOlEAdakZor7bksHPOAK9ya0RP/JGLJER4h56tmIhSYLDUSvT/ED+S3NAM0CZT8lzpqgGI4Sk7urMT2svUoTg++5wmynrQ1SvNUdxjurcHpCO3lFreO/0KmcQ2UVe+eUd8mPAXwc9QjgPWWrY45jhSIVcBPNIr3mHNC8cKLm0doVwOfIWcssvtynpSm2Ue56uTuZ4riMVW4sPRW8v5erbKRy7LMROLgDRjbQM4KL+IyR6LRBUw/AFKZsoX7R74N9YcVktz6tef3WGI9l4WZIdHTzpejkeiSM6G7kXmx6lq1YvGyJ327dzq8H4R+IYllffqriQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DZSM1svf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtVncwds; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DZSM1svf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtVncwds;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWj2r5pKjz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:27:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751372832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FEHfRalLuIEVVtsEsS9C6ifi6aMXwZRzg5zr/B5tJXU=;
	b=DZSM1svfSDVH1GmauixsmIG71lO3i9URo3C2PtO/2xD41hxo++zlPvnRdCAWLtpQId8/zb
	Okei86u1S+UnQonOYimGPNMhrbB5sxjd0VnzDQM+x4GFQbVPFMu7VgRIow+F0BN9nLh6fG
	ts+bLM0HEYs86Da9tPjSu1GT81V4+mQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751372833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FEHfRalLuIEVVtsEsS9C6ifi6aMXwZRzg5zr/B5tJXU=;
	b=XtVncwdsu1NXPU730J2+pKGM9aTQoOCuqEco8PlzoQzRa8MavqkrTty47bugaJb31cxggd
	vq3DnverOca2xZ0eYZatWDs8mESiqJxI0gNnV/nckl5GRiNI/0S0D9eDdznPcCvPimHWC4
	8cTsawKmWvZP7eGL3+BvgGTv3/d1R4Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-l1-iLcb0Nv2mtzurt0ESZw-1; Tue, 01 Jul 2025 08:27:11 -0400
X-MC-Unique: l1-iLcb0Nv2mtzurt0ESZw-1
X-Mimecast-MFC-AGG-ID: l1-iLcb0Nv2mtzurt0ESZw_1751372830
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso26761875e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 05:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372830; x=1751977630;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FEHfRalLuIEVVtsEsS9C6ifi6aMXwZRzg5zr/B5tJXU=;
        b=ezCmBfIRLvN65OisIU1z4kO34Ew0IO70Qcwrf2tgM5WFXnq4Ms201xqN6B9b/PfaBj
         9+v7jGWabIz1IBYQXtxEg1I0uqGLeFIhIJ/UTM4B3GcaKpmsWlnaM0O3uHuEgpS/xmsV
         hM9eluv47wVC+Ib8FWm3xJMd7pmmM0UXRDpDecFaesbbv76UKHIcOeT+E/Xhd0O54iWZ
         DM9FZXK7MCvVLoSMyKzVsh8JnKUQCsrnN9c+QBNTLFZhQIzo26tO4p4JgbMoxyodT/TT
         9KdEh8paXPMKnkyxBZk4SSKtk7UNqNZHK2OKZuaHeHG4ClXd1Aqv9KZ3+5pPnWr1/u8S
         nslA==
X-Forwarded-Encrypted: i=1; AJvYcCWAwEIzep0U4I3Lz5xJwywyJ+jmpLQyRkRaIo6LFvd0/L47aV+wdVDBRcJZ+PWhpH+wFrkcWqvXGFUKWTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIbCcczn5AhAJnai8anTlgwR1rkuU/3kYnwREquOKnm79Fs5Io
	kVgKW3/GYxZ8MVOXxe9l6FfL2si1l74M8NxZJk8xoGmfuiujHdTH1ECXbOxqj/tU9Kz731HRUqH
	McCmOkjzPdC5Q8BQydh9Z16nhIFcIswu8htD9PfchqLX6l8bhb1Zg8N41FZTwUlDvjMc=
X-Gm-Gg: ASbGnctAR77RfjzFmdwcf4zZtHD0Sow8AFQZdpkZiSJGAiFiVGnUEccqiJ2iLlK79jg
	eGqIN/xJ2sdOlk3O2IaLSG+hnXMcod/ge2LDfhVmm0a0y2pFnfPs4wjPqrZStQR06toKtoBrNc8
	em8RHxiTquWcvkt/qbrQhYaa92TyYn1afJXbEcvlDQtvMI+javhwpm9ywMPhuDsX9h4EBY4fJKz
	+o4CpOj2hN7l1dw7dvCEvk8sjzs56BPROjYzk3voxqipabf7H8FBcBMS3X4sngLRQx9sr3cs+5J
	9V0mL1g4Tu0GJ9eJoY2F+yPH6gyrw+ySjx/dWaRkSxLhJimPPecA3g6RvifEgG7CwqPLcIwWbAD
	NwhcKKZDpw7bEg1Ibuz86HoLmntP/xA/WiakKxVcfn/OVW9Uuyw==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr148237605e9.6.1751372830046;
        Tue, 01 Jul 2025 05:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSJU2Sf5R53h48rrobFaZHNRWjQKFRP9ItDNhMojifotwoNth3ly8lc9eWoZidBApRccIuBQ==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr148236605e9.6.1751372829433;
        Tue, 01 Jul 2025 05:27:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a421434sm166408505e9.37.2025.07.01.05.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:27:08 -0700 (PDT)
Message-ID: <04e99b47-055f-4555-be11-76afb2065b0c@redhat.com>
Date: Tue, 1 Jul 2025 14:27:06 +0200
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
Subject: Re: [PATCH v1 15/29] mm/migration: remove PageMovable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-16-david@redhat.com>
 <38e19e3a-e46b-4a50-8a34-dc04fc4a3c3c@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <38e19e3a-e46b-4a50-8a34-dc04fc4a3c3c@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khrRPy50g14T3WBvt7v1J0IjDNOHpn3_TY7p-RqDAoY_1751372830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 12:50, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:56PM +0200, David Hildenbrand wrote:
>> As __ClearPageMovable() is gone that would have only made
>> PageMovable()==false but still __PageMovable()==true, now
>> PageMovable() == __PageMovable().
> 
> I think this could be rephrased to be clearer, something like:
> 
> 	Previously, if __ClearPageMovable() were invoked on a page, this would
> 	cause __PageMovable() to return false, but due to the continued
> 	existance of page movable ops, PageMovable() would have returned true.
> 

"existence", yes will use that, thanks!

-- 
Cheers,

David / dhildenb


