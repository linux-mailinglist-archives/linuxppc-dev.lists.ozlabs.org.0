Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE847C6EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 19:48:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJQTf28h5z3bT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 05:48:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AAtjTDv6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIqntcUs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AAtjTDv6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIqntcUs; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJQSv6MTCz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 05:48:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640112489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApCM5FDIkN6wcdWQlo5Fb9oQyPzV2PmMtY5gbkT6Jr8=;
 b=AAtjTDv6Udt8Nuya8B3rErDTRFCBwhAJXtQLLNbRTJM4cNFGe5vGbqvol/LvsDrqjCcu/4
 mBpQ4Uou+SvlK2q0JuyNjvWoC3Isooyk34Fo6mULXram8F7WXZ+EopBgoAcDo8CSsxMDUp
 +QNREKVoJq2Nm7UOGq43B6mrGDKVTno=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640112490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApCM5FDIkN6wcdWQlo5Fb9oQyPzV2PmMtY5gbkT6Jr8=;
 b=RIqntcUstUmT30N8ri1dmzSVi5sQD+OhWP4zm+iyoNl7/Npw2gSZZJe9r0RNIu5052FRKG
 FTxp/dgDwATyGOy/gWvLL82SUfh4CKD7Or87m8j764Vbx4uGPAoTjHnpuaZprLyKBZOQ25
 ddDRHv1XGQcZGD4BlQYUkQhp3/lWUDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-uQ9VoS_AMWu8COyrQvRKkw-1; Tue, 21 Dec 2021 13:48:08 -0500
X-MC-Unique: uQ9VoS_AMWu8COyrQvRKkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso929273wmb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 10:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ApCM5FDIkN6wcdWQlo5Fb9oQyPzV2PmMtY5gbkT6Jr8=;
 b=damgEqBBH5AexB7Sd/NRh9W52G2l4ilSUHhoBtOwoiBvuRbAehkJrCJu3tzzjN0OG9
 dKtey0OBfX5Z8ElF0FDVK9XZ8g8El7ZmaAoTxGzt332M5NM8lcTCMsEvfHD4zOlH1Wg1
 WsV2JHwr1ojUhNG1OH5RYwYQwRwJgUK/8vnl9oNrUAD0J8gIz7D75bxOOE8S0wzAUK6o
 26hQjurTYlhh9LEdY5EWe7QdnNCd2iIdNMG9MZjlq9MS+Y5CthsF506fNM6ZuxEV1394
 ZCxQeisz2HhHZyA9QIx0puh/cSSgoUa4en5Pas2m3hK1gpLdNL04DELr0gVUngJpMyjM
 73AA==
X-Gm-Message-State: AOAM533ulOxoFWmwZKzb+aA6tYfubKqwTYGYg2lQosbgJmPbQqZHJ+Zw
 JTNonrgCCIyCYtAxtLJ87elOhEymvvqdPnH30wB0PbUjIymRRMyKwRol6gmV1Buk3lOpBZ7syRW
 n78hOECSbkRfqVlTquy+vxjHIVg==
X-Received: by 2002:adf:a352:: with SMTP id d18mr3632074wrb.317.1640112487216; 
 Tue, 21 Dec 2021 10:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyj+jxWHa2f8tG1SLyuIY/7Tsh5R54J4qdY0f08RvcopLcUlMBSjbsAxj3mzIghcxt2WLgcQ==
X-Received: by 2002:adf:a352:: with SMTP id d18mr3632064wrb.317.1640112487046; 
 Tue, 21 Dec 2021 10:48:07 -0800 (PST)
Received: from [192.168.3.132] (p5b0c64a4.dip0.t-ipconnect.de. [91.12.100.164])
 by smtp.gmail.com with ESMTPSA id p22sm5051867wms.2.2021.12.21.10.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 10:48:06 -0800 (PST)
Message-ID: <e4748b18-3de3-b3f9-464a-e5cfcf9f05d4@redhat.com>
Date: Tue, 21 Dec 2021 19:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] mm/cma: provide option to opt out from exposing pages
 on activation failure
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20211220193419.104242-1-hbathini@linux.ibm.com>
 <20211220193419.104242-2-hbathini@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211220193419.104242-2-hbathini@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20.12.21 20:34, Hari Bathini wrote:
> Commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
> activation of an area fails") started exposing all pages to buddy
> allocator on CMA activation failure. But there can be CMA users that
> want to handle the reserved memory differently on CMA allocation
> failure. Provide an option to opt out from exposing pages to buddy
> for such cases.

Can you elaborate why that is important and what the target user can
actually do with it?

It certainly cannot do CMA allocations :)

-- 
Thanks,

David / dhildenb

