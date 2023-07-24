Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115C75F65F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 14:30:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=goN0VTsC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B574OmUv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8fdd6KRlz30dn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 22:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=goN0VTsC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B574OmUv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8fck6y49z2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 22:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbmmUy5Hi3mO+nJRGGXHb2dLGAmwkNa4rS6kFDpNEZg=;
	b=goN0VTsCIaz1Z0mCE63kE1dau/1VRVNIMqwsv6pRqWm4aGnRBq1EnpEqUwNBJ4DH9+6e1l
	6O00hwMoRATWG0cyRb0xnuycrPRxFpxbbTl0AUPD5DK3WirioMGUrqs7dEjD1IbUd6DriQ
	FkxgC8bpwL9hgx3Q+ZTKrmmHrZn7FWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbmmUy5Hi3mO+nJRGGXHb2dLGAmwkNa4rS6kFDpNEZg=;
	b=B574OmUvXiTlqAvsmF8Wbcho4rzgk5fVvOJ+kEN/Fj5wxKdT0poPJhUFUtSPUA3mDUblEt
	cUB2BQUgMWxjIcgiVxeQ1OckG4ZJoyG/HGyjldbfvugR9Tfa52ZPp1HyLAfoctq5GQK/NI
	/OuQ2phWb2ewM8HlYNAxbDVyz6wd474=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Ah98K6giPea9NkyA4KOMAw-1; Mon, 24 Jul 2023 08:29:52 -0400
X-MC-Unique: Ah98K6giPea9NkyA4KOMAw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3176549261aso132867f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 05:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690201791; x=1690806591;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbmmUy5Hi3mO+nJRGGXHb2dLGAmwkNa4rS6kFDpNEZg=;
        b=Zc0TTiaUWGZ1aaXINki5WVuj50IKClINiqDriOcS+H1wwqYu7dqeohRTD/Q/ceNoCq
         B8vy5ogCTmnrcKs3MZpG9zj6J8669TUW7FB/8lvn3TSATuuxaRiTlL66Nyk9zRHmk9Tg
         wW/8nJKPXRAbKWfXTxsEC/rk2BQS/SVVaHfGlMmEi44PnCDs1PsLLKtqoWBjkSFrUp6Q
         nlUlKeFJ+VHjDqPHrcImZQM0geBx8UrTzfXg+W5QLgMZRZoCkbUXWy19wpLbzXBfJneh
         IXegJZslJjR/auH2nXAerMlpw761wvEgxciNSa0lPNLSHhraqcMrFaDeBxvPTa1H6FI6
         0KwA==
X-Gm-Message-State: ABy/qLZ/PALzkDsIAIlq9iyLvDaqbNoSGiTM3PqUXGQo3YjFm81k3Pp8
	UUhK6T8aSOw5116r8oMvITc4tCkm4IJafhj3MsihvQk7kJ9r9z2SLtAH8mrEe+ddtWf5VVjiE8S
	nf/UhwOd108ciYEKM2Yllc2ByWQ==
X-Received: by 2002:a5d:4b86:0:b0:314:3344:72f6 with SMTP id b6-20020a5d4b86000000b00314334472f6mr7405437wrt.32.1690201791221;
        Mon, 24 Jul 2023 05:29:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYz76PV7hkNLzkC3XUTBS03Y+taczSqrSuY0VYGY7SxI74gnEsIdDf7+a0L0J/PKW8ons1gg==
X-Received: by 2002:a5d:4b86:0:b0:314:3344:72f6 with SMTP id b6-20020a5d4b86000000b00314334472f6mr7405417wrt.32.1690201790785;
        Mon, 24 Jul 2023 05:29:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d4704000000b00313f9085119sm646021wrq.113.2023.07.24.05.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:29:50 -0700 (PDT)
Message-ID: <35c1cc83-d3c8-8fcc-8e68-201227c43236@redhat.com>
Date: Mon, 24 Jul 2023 14:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/6] mm/hotplug: Allow memmap on memory hotplug request
 to fallback
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-3-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230718024409.95742-3-aneesh.kumar@linux.ibm.com>
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.07.23 04:44, Aneesh Kumar K.V wrote:
> If not supported, fallback to not using memap on memmory. This avoids
> the need for callers to do the fallback.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

