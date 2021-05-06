Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D33757C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:41:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd9V6Zxbz3dGf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:41:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HmYgesH4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HmYgesH4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HmYgesH4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HmYgesH4; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd7q0PbTz3cmV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:40:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zt1CMVCYEfkxyd9UNysxUz4SpT8ZgoiU+x8AV2J3Qcc=;
 b=HmYgesH4zOZHiP2jS3YRke1g+9zU6IFtdcvgLDslYENOMT+6xwIgET0f2+dZUOJJ5rizYc
 i3NjoHH+BW2zMU8ACGngt3R2hbpF6KJxiRUcuVPoUPWcwOT4ocBtqNwoVGd0ArJreYnzT5
 Dwgj68IKLWH40WiaCkLf/iwJMFLchmY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zt1CMVCYEfkxyd9UNysxUz4SpT8ZgoiU+x8AV2J3Qcc=;
 b=HmYgesH4zOZHiP2jS3YRke1g+9zU6IFtdcvgLDslYENOMT+6xwIgET0f2+dZUOJJ5rizYc
 i3NjoHH+BW2zMU8ACGngt3R2hbpF6KJxiRUcuVPoUPWcwOT4ocBtqNwoVGd0ArJreYnzT5
 Dwgj68IKLWH40WiaCkLf/iwJMFLchmY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-OjOT98tWMgaiV8htBUYcyg-1; Thu, 06 May 2021 11:40:18 -0400
X-MC-Unique: OjOT98tWMgaiV8htBUYcyg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so2885586edr.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 08:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zt1CMVCYEfkxyd9UNysxUz4SpT8ZgoiU+x8AV2J3Qcc=;
 b=LxWh5xXNScLQbdstYqFjCqLMfEcoHeHakz1Q8KU8xUUJ032TxtQsUOX50A4ysP8eqO
 bZ0BLihWZnC6orZmmHIj0+s+k7WsiDkuEdJiVlwCuhpjAhg7jpy1HSmi5k0Z/QMtMFQj
 wgI2yCRNgqkejxRwhZFG88+TPnV0prgTDA4pbkL3IhjOE+ymPwg0LEaIx/6B953zRnmT
 wLlsWiHLgPgl0KJwJzSp3jExXPbz0Xg2Tddqhez6QDc8G/jKkC68B/VE+hFOiWwmnhmC
 a+njODB7RLalJkoUunw9wleE4y1XN4fM1XdEynoAqvBd1d5+MEnscaD02xNdVPg1Rf7s
 R/yw==
X-Gm-Message-State: AOAM530nB61NB+WOIF5LYSUGDj1BHk3gqKrU9kJjaw9k8dLJrg4ueT8f
 5s4pCASkUjGDU4pEJJ8jCoH5+41VLkl6W4ltrLK9nOLePBBzG7VeyfUYnIMH6dhqP93VGOPlBDS
 LDU1oHVwPTi0X4oYoV7LU2QJbmA==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr5915840edc.263.1620315617610; 
 Thu, 06 May 2021 08:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzk0LjFrMyClreAxpxpyn2/1+H3Xm8pkFKVU4ZpBXb5EXnGWXP797OFz3GwiryEOPHyCBR4Q==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr5915815edc.263.1620315617456; 
 Thu, 06 May 2021 08:40:17 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id k9sm1740567eje.102.2021.05.06.08.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 08:40:17 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
To: Zi Yan <ziy@nvidia.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
Date: Thu, 6 May 2021 17:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
>>> hotplug/hotremove subsection, but is not intended to be merged as is. It is
>>> there in case one wants to try this out and will be removed during the final
>>> submission.
>>>
>>> Feel free to give suggestions and comments. I am looking forward to your
>>> feedback.
>>
>> Please not like this.
> 
> Do you mind sharing more useful feedback instead of just saying a lot of No?

I remember reasoning about this already in another thread, no? Either 
you're ignoring my previous feedback or my mind is messing with me.

-- 
Thanks,

David / dhildenb

