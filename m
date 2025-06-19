Return-Path: <linuxppc-dev+bounces-9516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A052ADFB56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 04:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN4hV0J2Sz2yKq;
	Thu, 19 Jun 2025 12:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750301097;
	cv=none; b=a3D5BiNUkX+Lm95zKl9p+BavEQXNrasgDPESecUlAtvRs3frbwr6ueiNV1PQ+uIkyw2sO9E3fD+HsyG7Hw3mI9ozFOCkLsgc/FoVJbY5ZXuKfpaerZRk2pDaPzLve6dhhxbiERTyz3i8pWir5okYeExyY/q90xiendKryaVwjlCFF1bKsZwnNgkTReBQCUJzPRGLjQZa0xpZAeJcnKnVfy5Mpba4Mjju+IPnPwPlSl6U5Mp3Tt64QD1zsep9SmrjonyRkciZrNaxBQpulznm5qeg1Z7LfmyeXhtFsPjN89E774mHtCbGs9LbZp95jWCIlVXSAnscpJ/PCk6v8Z0+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750301097; c=relaxed/relaxed;
	bh=NGiV4ZITlSkGta2ar3rISknYHCyA9ON09GdNG8pubLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INJD35HPTuXDhvmAxsGNDPhoMf3WkZVPW7VsuAbDtdKS35MR9DfqKcv3ennD4tqi78cHXilALEvcX/5RE3cAFlq1GaTmx/XHR5mKaXN1rfJJ4ti1GSQC0Grw6rpIeyMkAS+KdhQLHWzufW8y+kJI6ibu8IYbZIZihR/qKZsN2lGvGkAHfOaYB6JK3syqSRNobHnCmC8ZL8UJizzO2aF98LJej9l+wRKposLF2AcYZwRNco8yQ8zdMB4MU8WMiv99vtDWELeohzsMD31YCM8Kwg9gCTn8bbMcPIWGOJa8eNDz99PQwacy/7Y7PR+jAuYroYIIxegSKVErWZLudhPFZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dh5NV4Zj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dh5NV4Zj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN4hS0yCdz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 12:44:54 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7487d2b524eso152180b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 19:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301092; x=1750905892; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGiV4ZITlSkGta2ar3rISknYHCyA9ON09GdNG8pubLA=;
        b=dh5NV4ZjIj1FY89p+DiO1W5BwD9nX74Yr99u8EM+J1gEIWAY6sEz/P0WEBebwCeAju
         LoMjUMTVJ8Hex2JoyDubRKGBrNrzJjKdYWnxD24rnf0+Fdp+Giusv8Ct/iN1diYdIlb1
         OcWSHtiLXd2vR+GRacPMrvmtHVQPMHTUfjUE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301092; x=1750905892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGiV4ZITlSkGta2ar3rISknYHCyA9ON09GdNG8pubLA=;
        b=ZYKJSKhWsbvX1fWBtQ4oWLFueK68Bm4i4CAOi/ND7BtURF2lx7SJ46mPEcyOObaq3U
         vxYKfpkTf9TwraNYH9+SFok287JAD0uBZVYwgsqRBtZM0y2NhOrrBvKoRZC7nsv5f1GS
         Lu/6iFqy6lQt/UwdVUMBAusD6tD9vvK5NjkzlEPs4FGq6zxqqfCBeXl97jgeVWuV1szN
         8LBChiTgIjQV+z7fGw3oHY0hJO21A1FyjR7RWpmmvr9vDBO/h9IP1H0i6M/Ors/UUayz
         pRadsaQK85QMCP3W8l5d/JFd/0pSvinFYHvuTXBXMqnFnQ/8kK7fvbMKHQLvMqXZ0/Tg
         nuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPM5BpDlPtHT+pR1JYqFcjPA+ocLUiuWAPUueBoXppfE1/acYdljb2cMlpIEFC69wPQ6PWMI0p/TsbXVk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKPBzqTZNTADPbglifdNPvUD+IfxMGaKcfsQykDFt5Iuz3Jq3/
	lDtP+Tol/TWn4NpmU1tLoZ1kfLVnTqGBclddlaMonOfXKlf/rFsbIg2HcahMm23E6A==
X-Gm-Gg: ASbGncu76QqcZs0TY8lQ3Zl7X6zr7tmePEd6AzhUhil86g/YlcOEDToZu7aWFloEuqe
	N1Hif196JNRuEoPRnPQvBVvUI5V6hzLoEkOgIYq4IceQdHDSjf7QUNlE3gR+vP/ye/WJ6X0RB0U
	V9ib+UVc6+y0ilE+e0l3Fo3Y79fQZj9ziIKDiG7Y3K25XizWY4W+skpMj36u0n0TN9uMloUhlYI
	TYRdFjAgeGqUy0du+4ZfLbQsUV5fHuNx5g+h47yN/g58m9Zb28lpoWB8JQRUUnUXdZApFcVs0C0
	Az/6Z0zAuMaHlH7srBi3y3FZ8ZHGrnyRN2YBBp5LIvL1ScoOxqlztzMEtUbp5fdKFg==
X-Google-Smtp-Source: AGHT+IG6keXC3NsOp2Ins+/oPh724/MxHSdE1WbIS33oc9s9zagcbgJChxdFiOB1royOBlBoftNKog==
X-Received: by 2002:a05:6a00:1d15:b0:748:e4f6:ff31 with SMTP id d2e1a72fcca58-748e4f7091emr9593788b3a.8.1750301091998;
        Wed, 18 Jun 2025 19:44:51 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748ff646231sm44607b3a.146.2025.06.18.19.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:44:51 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:44:40 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 03/29] mm/zsmalloc: drop PageIsolated() related
 VM_BUG_ONs
Message-ID: <ved33aqy5rlayhagg3x6xcry3cyadw6eponaj6dfwkt7xmbep6@dpcvwrfgrjxx>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-4-david@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618174014.1168640-4-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/06/18 19:39), David Hildenbrand wrote:
> Let's drop these checks; these are conditions the core migration code
> must make sure will hold either way, no need to double check.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

