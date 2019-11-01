Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AFEC540
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 16:01:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474QQ232FRzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 02:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="I8fTjuu/"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Q8L3Nd7zF783
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 01:49:47 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id w1so59985ilq.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OvG/qWeSbh1TxLgtmArlVNDYsoALFmkQsSm7UaGBE/U=;
 b=I8fTjuu/6Ne32KB3TzlkLHNc34FVVQHy/sTVoKvVYeIrGIs/zEWpPkdT4X2FTYZjfJ
 UM4GFAou96icNjK1AVI5vEOtitRVjbXgZfqaanuntVF/vhTirkZT/9E+CWJUq7E2TQj0
 StXEuMWcR5zlKYK8R7EGKhYIJ+Gb4ciY1IEMBuLWPRJg6NDyeWhuiAg3JUaKBbPDkQbL
 sElozNdk4t7DFMJr/2GTc4DXhCqAVsopLQpS5jb3DWebvxakkqFHF/FpNq1kpaMflaeM
 i/d5Nr3Kf7lOCXzSXk2CZXk0I+pfGJSDm0die6SS7xUqTydNbrFVI18tKwuFsQOAi/MB
 kf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OvG/qWeSbh1TxLgtmArlVNDYsoALFmkQsSm7UaGBE/U=;
 b=qn8EYov2vgmpIjRwbVBy23mnsUdJrWuiuybTF80anOOXrB1NOFsjyTTbRQXqkkCfea
 JjutD8bgMtspsSDqKZja8XFoa4E9Fwhu4t8hhXxISTZSpVfXrsRDoiHnpF+/qJpuw0L+
 /C/y+uijUaM8DJMyeWTjsS1kyaRZKC3qQ/58yasW9rZoBoI9e9TwBMIfl2ZwRB0Pe5Kr
 GiWkK7FwyS4NHR8piEWt+3n5dGg1HDJtNBKxME5WAQzX+Yjly1Tm3Lo6XHOLFyVlNqw5
 cZr7aIX9YDlzWxMOpWO0iQQdwqi9JqiZb3MSsALKoVNd0elPOY4K5aHnQXWExmyZTDzO
 2Txw==
X-Gm-Message-State: APjAAAVFuqEGEFgiCZu9sIC44dKWMOzu5eqbg/q41/AVhzIM5XbNUM3K
 9h2isuRnLGLooo16+sYIarE4Eg==
X-Google-Smtp-Source: APXvYqxr+bs1ScRWYKeCxmeXCSlj6Q4Lr6KXKYyS2zYjKblHkVBUMc7IPKJ+YzvkERiHaP9xr0/5Lg==
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr13331860ilg.173.1572619783709; 
 Fri, 01 Nov 2019 07:49:43 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id f73sm1107827ild.59.2019.11.01.07.49.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Nov 2019 07:49:42 -0700 (PDT)
Subject: Re: [PATCH 10/19] fs/io_uring: set FOLL_PIN via pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-11-jhubbard@nvidia.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <979ba2a3-ee04-fb12-204d-1b68c7b6e141@kernel.dk>
Date: Fri, 1 Nov 2019 08:49:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-11-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/19 4:49 PM, John Hubbard wrote:
> Convert fs/io_uring to use the new pin_user_pages() call, which sets
> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
> tracking of pinned pages, and therefore for any code that calls
> put_user_page().

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

