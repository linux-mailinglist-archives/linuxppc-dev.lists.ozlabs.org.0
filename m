Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EBE5AD71D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 18:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLtkz5gyMz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 02:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFWYFgbu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOqP+/DR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFWYFgbu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOqP+/DR;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLtkJ5MKvz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 02:09:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662394148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvFO3QtE1Se36l/1RKgnERmp1CkIVhI/og6sBHbBfFQ=;
	b=VFWYFgbuVGG31EJ84Wb4xcOJSvMsTdj18yj9FrXODQYJu0JU3UaW+L8CASJYJrxJMbaEtD
	tgwZN2C0WYTTcemvATYwQccEENjYyKfjEQR/WU8vitt7Ws+qIFDzKqF94WCUVI2Izr8m11
	bVl3+gPFdr1QKxTkfwrHBrwMJ2SyPLs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662394149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvFO3QtE1Se36l/1RKgnERmp1CkIVhI/og6sBHbBfFQ=;
	b=DOqP+/DRXQMuciTFvUI0eHPGpa5nuMBbNgsbxLL7U0KoNidehZi8EpO6kk2xjzq3A9HGX9
	YuwLvy+ZOs7rO9mTFbRI0sRhAmzXY2JHBz3v5mpdtgpx9TspfuRZ82OQgJYW8LE2cDpr33
	d7vnObAFiqyY+VZhtTUuvtIKaB4qSEA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-PrxV-2ywMfCiJ67v4ynihg-1; Mon, 05 Sep 2022 12:09:07 -0400
X-MC-Unique: PrxV-2ywMfCiJ67v4ynihg-1
Received: by mail-wm1-f72.google.com with SMTP id n7-20020a1c2707000000b003a638356355so5543931wmn.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 09:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=HvFO3QtE1Se36l/1RKgnERmp1CkIVhI/og6sBHbBfFQ=;
        b=NAIXL550mbne09a1BExgSpnIn1muPUF27SIKNbnAV9NSQXKB9vdSyBMFibv1d/iKk0
         gZSt6GtoG0JqQJADFx/iFK9iaZM1whCvygujbw94y0wD4ZDp9d6sCIrOrK5CwIqGSX0b
         7HtRzm623D5GFoJ4oiiNCuyTqh1JrkTRZGCO/g7N6/JWBL2zJ4vaKFV4ZxSO2iPo7Ciy
         XZMEdXS+HsmS+ZlFEP+IgMJ6egm/QNwve2QE5zTQCcAu+6BclOho7ruSm/umx5g+4tke
         Uv9F4JS5f8NviGZzEUCQee4ZL9LqjOg4M9z42HWSVRbcpFUgvbj8LNYroWh7rhQbse0G
         K5zg==
X-Gm-Message-State: ACgBeo2zNUvs6l8XQz2kore0H4jAca9NsfKQs6uLoUpGkPSPkzkE3eJm
	WVUdByr9mf9LqvdODee6kGsxZ7iFRYc4IsuijsicBfTQQ3H00DZnfcM6ylmTCBRuzNmmYmxDf+j
	Jy2sbEefW53DRQut/NZPT5PpLsw==
X-Received: by 2002:adf:f6cf:0:b0:228:9b2f:c305 with SMTP id y15-20020adff6cf000000b002289b2fc305mr2572063wrp.427.1662394146165;
        Mon, 05 Sep 2022 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ohwqxY+wBtcsFagHz8bENdY8sctEHMZyiRaFAd2huipxEXx5fxFV3/e85Vn4JOXXyl4JJAQ==
X-Received: by 2002:adf:f6cf:0:b0:228:9b2f:c305 with SMTP id y15-20020adff6cf000000b002289b2fc305mr2572051wrp.427.1662394145900;
        Mon, 05 Sep 2022 09:09:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600018c300b002206203ed3dsm9771415wrq.29.2022.09.05.09.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:09:05 -0700 (PDT)
Message-ID: <362e6361-e2b7-16eb-83c8-203738f7b5d0@redhat.com>
Date: Mon, 5 Sep 2022 18:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
 <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
 <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
 <bb05ac8a-6847-0dcc-1f71-dc7c3f141f11@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <bb05ac8a-6847-0dcc-1f71-dc7c3f141f11@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Yes I think the assumption is correct for user pages hence for GUP.
> 
> By the way the discussion started with PTDUMP. For PTDUMP we need huge
> page directories to be taken into account. And for anything that
> involves kernel pages like VMAP or VMALLOC.

Yes, makes perfect sense to me now that you explained how/where hugepd 
is actually used -- thanks!

-- 
Thanks,

David / dhildenb

