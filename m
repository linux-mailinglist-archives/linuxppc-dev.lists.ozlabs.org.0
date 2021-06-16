Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3A3AA1D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 18:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4rpQ1L5tz3btt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 02:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.170;
 helo=mail-pl1-f170.google.com; envelope-from=bart.vanassche@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4rp353KRz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 02:52:26 +1000 (AEST)
Received: by mail-pl1-f170.google.com with SMTP id 69so1420396plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 09:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8MKUHbuhcvvAbyVmhGO6tF9OydsRY8Yh0Heff4psMcU=;
 b=kjvUenvqJ/ZuS7zLG9V4mvHjUgVohR10o0TzyPvDu7hgsuyeOd9zdZp+20PZY69sL0
 nSR4Y85HeaUNzsoro16m/D499M+u2fedLBN87dO1sVvXCPJ7PHNFyWv58JB3f6ZT/Q7G
 0LLmTP6oFcGVBWC7I/gtSC6KQfNijJ4rHva7q1ntOmP2OXagjUhBlZ1lSEpJk4DcaP10
 xFwAIaq1VYgUHL/jgALuSOngYGcGEIME8DGB9JAOJlSsDAVCR/FKtAXVLQTosqXwJmr2
 NEF70mFYncxbnvSKz9AifgbTOwA69KeKo+mtsAzgkmEMPfi6GNTffuIexIsOKl6tp4vi
 ufuQ==
X-Gm-Message-State: AOAM531q2coNvtGgsdkZj3zYtcgSVGtMO+V77Ls1YBZ4uDfKxFiyveiy
 88MC6J5zjCqT4/ksSfhKYjI=
X-Google-Smtp-Source: ABdhPJyzx+UQa7eUy6fLX7IIzx1UxFuf2kpE8zutUL05jvc6Tbl3mGv+6//eteoO9Q90ulyVAqOUPQ==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr457172plk.57.1623862342073; 
 Wed, 16 Jun 2021 09:52:22 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id w7sm2574738pjy.11.2021.06.16.09.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:52:21 -0700 (PDT)
Subject: Re: [dm-devel] [PATCH 06/18] bvec: add a bvec_kmap_local helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20210615132456.753241-1-hch@lst.de>
 <20210615132456.753241-7-hch@lst.de>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <244b92f2-7921-7f33-b83f-66f3fff57696@acm.org>
Date: Wed, 16 Jun 2021 09:52:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615132456.753241-7-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 Ira Weiny <ira.weiny@intel.com>, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/15/21 6:24 AM, Christoph Hellwig wrote:
> +/**
> + * bvec_kmap_local - map a bvec into the kernel virtual address space
> + * @bvec: bvec to map
> + *
> + * Must be called on single-page bvecs only.  Call kunmap_local on the returned
> + * address to unmap.
> + */
> +static inline void *bvec_kmap_local(struct bio_vec *bvec)
> +{
> +	return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
> +}

Hi Christoph,

Would it be appropriate to add WARN_ON_ONCE(bvec->bv_offset >=
PAGE_SIZE) in this function?

Thanks,

Bart.
