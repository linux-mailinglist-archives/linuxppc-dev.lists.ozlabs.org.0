Return-Path: <linuxppc-dev+bounces-9151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D3ACDF17
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 15:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC7kQ06wpz305n;
	Wed,  4 Jun 2025 23:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749043837;
	cv=none; b=dI5Ies8oTZSefH/yan7JckHQm3xOVD8aQOVQ7rStrTeJfaMdEU3xxB0OqX7OSdSqYCULSIpI9Sl+B+khjFre677eav7I1e/Dwn+tP/wb/hn11GiLkeC2azV1d65TLVVBl5E+4ZVgBMFWPo3ZqfIxTBD6ernYQdbrM2N/qGy4ENTdf8/wz8uJ8oauoU1eh0/H27RZgLveBpBizQmln8LD2UK6Scj4D1tYC3hiAUaVx9wnlnuq6wuBGxGLP2VdKznAsEGD/G2crWJKapfDqZqSdsoH0QTGosdEvsEuZY8TF+N7wARqnkUa6iDWUmgM1M0uiZzE+hUHsL2jE6BBeOqK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749043837; c=relaxed/relaxed;
	bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKOGnxpLtECDiFCKcaV/c4s/yDELfv3jMjFRU328e9DJJIGKsnVd+pnk0GrMd3JIE+dpZ7E/6bYeSeZdGaZSjcZhV1UPVNaFD8d9fz+Wwc162/wGI7sE+vPlxefmHtUkzy1+sgBqWv3ydGlZZnBQ3rxRLBQBlZBB3FcYDF6h4rdTt7h0KdswqDFvYvosw3B5/hA4sOUXlKkkxf0k88wgFc065VlqUW2JuH6Jr6w1ypj+6k3SI+9P21ZXquDoPZdB87JtZrOnBRDgtpth8f3deTrN1MOehJPSr2ZmZGiwnNf2AujqnkDtDdNP6d3Rw1Xgpfz/Y4Yq7EUq/aj/j3j4aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Np+Yj+Cp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Np+Yj+Cp; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Np+Yj+Cp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Np+Yj+Cp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC7kP1H8yz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 23:30:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
	b=Np+Yj+Cpb5eZvlhGMNWyqDTgEiuLlAuo1RgyV18fZDFv2zr9nDzRpi0oXn/SBorIll5TGB
	qK94DIzmJSz9nVk6wUUcnIePIrDYaAWqzMO0zWg+IL9GmEicb1RDshV10DLFC5X5T4pw/C
	JLza0CseFyRzQP7GzZKHpvD1LnHbCbM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
	b=Np+Yj+Cpb5eZvlhGMNWyqDTgEiuLlAuo1RgyV18fZDFv2zr9nDzRpi0oXn/SBorIll5TGB
	qK94DIzmJSz9nVk6wUUcnIePIrDYaAWqzMO0zWg+IL9GmEicb1RDshV10DLFC5X5T4pw/C
	JLza0CseFyRzQP7GzZKHpvD1LnHbCbM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Ef4I6__xMc6J7K40p4j39g-1; Wed, 04 Jun 2025 09:30:32 -0400
X-MC-Unique: Ef4I6__xMc6J7K40p4j39g-1
X-Mimecast-MFC-AGG-ID: Ef4I6__xMc6J7K40p4j39g_1749043831
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442f90418b0so37175725e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Jun 2025 06:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043831; x=1749648631;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
        b=wsxtXuXVruUgmadlPfCwtB3u44hjdW4H98O+eyz/2dsXMi8U6RTC7Bh872uV5YjsR6
         BVzyHRw9018OfdFbUHp/WEOJRS6r3JR6H2ArnnZe/aly8mflYuxhW/nydI4h+m4FZqvw
         cYaiTqhbjlYaRzRfDxVmaHFHblmJCyogWZsusIK/cQ9dJ7yoDpr8EZ/Ys08HxCfwG6X7
         Iu8ZmbL98KkdfaWlnpMxwSpKoX0Z0tcqmkaeqYBW6xqWLZAonUk//rB3kHn/WipIh+MQ
         YMTpnbZ02Va0OYl14JTmnh8gW0vfW9arW2ziYTjb7kUUlewZEe5KC+hZG0ka9qxQX/c/
         ZQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCXs2nYi3i1h4uakyC1k9nF+v9qcfl5B5jfx2zBbogmqYW0OYmQjdXnP4zTuk6yliXgLKxO66OT5YnzEhgw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxU2rL2c6CgvIQDGTdzAL5rExh0DdNRQqMwF6PAJi62IotqOzxu
	IH6it0Ppzwn7UiIUU5VWphfvtlidVrnvEP0O0Kkw3yb1c28OmcplGesQyrRAI3fRljbZq72O0rz
	Gx7WZpkvBpARW9LjfKHHs8/0Uwu9Pamb7WLAXEvsI5EPG2kpLkXyfPa8M3XIj/GhIzTA=
X-Gm-Gg: ASbGncsEAoye6n5WKdP9NB9TltnTClHaaJyK+ZEhk0j1ZN5WCgyww9rsTDYSt1Bv46f
	pUJYKFLaJEvnVrpLkK3kvA+SbcBdO//VlYW+2kx1Oe0Ub9NT1H8H068z/UABVnckL3zpw5EF87a
	f0v0sgGdhOMbSodwCSqCyjocn3w6j2a35tpw35IgSuYOF+P8si08mo/gJoBqmGOW1hW2fACqPuX
	OrqjJW1I275ku4bx1agmYIvPXxAEmOiiJhDrEXzZggidKMH2Y8yCGLNe1rma4NbIENXZ7C/iK/T
	goScSxPFydjAKu+WuYt+cVnkZwDvo6QRftM/t21GO0J/6SWgII5Yc0Q98uipnOLlevCEMIARHkZ
	nb80Afx3fSDr+VX+CWevTzQUhgIrkD50SPz97EdM=
X-Received: by 2002:a05:6000:178f:b0:3a2:ffbe:3676 with SMTP id ffacd0b85a97d-3a51d975b8bmr2460453f8f.49.1749043831559;
        Wed, 04 Jun 2025 06:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpcxAjAVL4GX5/4qPkj9qmsXJ/nEQtr6a+UPbPxY3tj6mbKjE9dQy9GiHzcIDrG79/3qURZg==
X-Received: by 2002:a05:6000:178f:b0:3a2:ffbe:3676 with SMTP id ffacd0b85a97d-3a51d975b8bmr2460422f8f.49.1749043831138;
        Wed, 04 Jun 2025 06:30:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5253a7aeesm354307f8f.1.2025.06.04.06.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:30:30 -0700 (PDT)
Message-ID: <106e83b1-7738-4c98-9095-84cfc1017b73@redhat.com>
Date: Wed, 4 Jun 2025 15:30:29 +0200
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
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <96f7d3a2-2d85-442c-a9f7-e558d4a2ba06@redhat.com>
 <de209828-d237-4912-905b-8c7de7e5734d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <de209828-d237-4912-905b-8c7de7e5734d@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RZY4kv9dJbMyGN_cxRBVmc5Vr8HtSIjGUfASJsWQnuc_1749043831
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> 
> Thank you David
> 
> I’ll make the change and send the next revision.

Feel free to only send a fixup on top of this patch.

-- 
Cheers,

David / dhildenb


