Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C075FE6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:47:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3BkXXBc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3BkXXBc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8ngS1xf4z3fjR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3BkXXBc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3BkXXBc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8ndY1yqlz3gYT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:46:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690220766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FRWZJ/fDw36fFqA2tPcKXhBoI/uBj001G4LAAA214E=;
	b=F3BkXXBc4svWnczmP38/0l2kYSg1oQ45tHU83inqm5kXfC4nl996HFqKwymzDIYhUa8cwk
	zutt4w2SK7U9yqPDb6H+PCcDrnGkz3AnXMAFT2HqwF1DpHI8hvB9NFXkgMPC1ZpLHjPQ3k
	6hl2CM33rj/ZrlZELasYUcjUL2vBraI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690220766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FRWZJ/fDw36fFqA2tPcKXhBoI/uBj001G4LAAA214E=;
	b=F3BkXXBc4svWnczmP38/0l2kYSg1oQ45tHU83inqm5kXfC4nl996HFqKwymzDIYhUa8cwk
	zutt4w2SK7U9yqPDb6H+PCcDrnGkz3AnXMAFT2HqwF1DpHI8hvB9NFXkgMPC1ZpLHjPQ3k
	6hl2CM33rj/ZrlZELasYUcjUL2vBraI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-8tklTbt6OR-eDnqybyCz9A-1; Mon, 24 Jul 2023 13:46:04 -0400
X-MC-Unique: 8tklTbt6OR-eDnqybyCz9A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fc08d6a40cso22603785e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 10:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690220763; x=1690825563;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FRWZJ/fDw36fFqA2tPcKXhBoI/uBj001G4LAAA214E=;
        b=kIhsF8oephZ9gSvZm2ko5jo1jFEOff6PWijYPBQ/iBUCWaW8buBfy11/Phw13r+kRJ
         Bp2MKHWoLXlB1fQsJoA/U3ahAWqQgEQRkA5X4Ws3KecRQYKIW9mu/Oe6QPrZs+ERRmql
         vfr5IyCD16DT84ealMtdfA7qodNdRcW5YWMXDdsPAMaMm+70HkmiPwsnG2Jl/SN7czAB
         4HSGLtGiknhHdpLxbaOqOGqF3h2JnPgolGvS9Itz90/Y42Kf03XazJjm9ED3joRkh1j5
         zD1prTinZYPmRwUTJePGRhdv6KopD2jClFWTLtiu+dCXTT0HBaYMhOQBq/GfhloF/0AS
         69xQ==
X-Gm-Message-State: ABy/qLbWSKK1ShLiqdYgtEWRsKMMUhYMOr/L5vlNFr8aFCYgBC7xU7g/
	EnuAGg0qxiDHvB3Y3+bZhrINCRZ1IK6Dk3qb68bVh+AG0PBlHEvjLk2KmiMBUJEi+0Ecs2tLF6v
	p+EnYReaAQqAYxnEsD25+t4xxXA==
X-Received: by 2002:a1c:7708:0:b0:3fb:b299:6eba with SMTP id t8-20020a1c7708000000b003fbb2996ebamr6772974wmi.4.1690220763701;
        Mon, 24 Jul 2023 10:46:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5EDHbgFb6RXGK3wM5neBkQri14lj+/TEWEXiAVsZh2WU/Hcxoi/qkpo7XoIBkcGerhboyQg==
X-Received: by 2002:a1c:7708:0:b0:3fb:b299:6eba with SMTP id t8-20020a1c7708000000b003fbb2996ebamr6772952wmi.4.1690220763254;
        Mon, 24 Jul 2023 10:46:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id o5-20020adfcf05000000b003172510d19dsm13752366wrj.73.2023.07.24.10.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 10:46:02 -0700 (PDT)
Message-ID: <020d06cf-29ec-d292-8cf1-19a4af649d67@redhat.com>
Date: Mon, 24 Jul 2023 19:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mm/hotplug: Enable runtime update of memmap_on_memory
 parameter
To: Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20230721131951.306706-1-aneesh.kumar@linux.ibm.com>
 <20230724103109.37e166fefa57f918492b1fa8@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230724103109.37e166fefa57f918492b1fa8@linux-foundation.org>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.07.23 19:31, Andrew Morton wrote:
> On Fri, 21 Jul 2023 18:49:50 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>> This is dependent on patches posted at
>> https://lore.kernel.org/linux-mm/20230718024409.95742-1-aneesh.kumar@linux.ibm.com/
> 
> It appears that the above-linked series is to be updated, so
> would it be appropriate to append this patch to that series?
> 
> If not, please resend this once the above-linked series has landed
> in mm-unstable, thanks.
> 

Yes, let's include that patch in that series.

In general, LGTM. Toggling it at runtime, however, makes it harder for a 
driver to stabilize on the value. In the context of virtio-mem this 
would get important (once supporting memmap_on_memory).

-- 
Cheers,

David / dhildenb

