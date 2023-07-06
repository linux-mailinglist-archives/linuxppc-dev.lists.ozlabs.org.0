Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104374982E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:20:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oyx8kElt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PQjG3G1B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxWGk0f9Xz3bmy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:20:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oyx8kElt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PQjG3G1B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWFX44CPz3bwZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:19:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEvYguDfY+Mp4KrdEEXfAOL6aMrfvU4QoTMKpCYd59A=;
	b=Oyx8kEltimxKRSHxAPbrVLhNcNcUHNjHqjLH9lY9Yb9pw1JY8ivtDEFGqQsbqimqydrjAO
	6FCTQIqolGMo3yHeR8CDccMRKu09lLcWqXt2UeC4xmSgjvSLp7OnVG0gsNDODIPLV6CR0N
	QBE7nnh/H6IDmkPlCorQnbWrHns7vG0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEvYguDfY+Mp4KrdEEXfAOL6aMrfvU4QoTMKpCYd59A=;
	b=PQjG3G1BB8X1KINDYCiRAknEPVeqddS20VqIhhdwEBwR0KoMQ5TfNXCWC0BLSvasj4tJOc
	E8vj334UFPlqEBM7P3UMZHhJcnQiVgCxFBKs2jNACImBRegOzr2k0WRrKRHTaAwEEE+Db5
	lidH0zAUdAZIBSa5v0W5i8IrFa9MQhg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-bPwqT9HXNambMM754LT0DQ-1; Thu, 06 Jul 2023 05:19:39 -0400
X-MC-Unique: bPwqT9HXNambMM754LT0DQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fb913e8cddso232820e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 02:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635177; x=1691227177;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEvYguDfY+Mp4KrdEEXfAOL6aMrfvU4QoTMKpCYd59A=;
        b=QAyQlRMIFxeKyXrApyrDsQOhzy2tBAEU5/gA4F2gNQRiwqHexhW9714i1nS7ADi9hj
         8BX1/wgk/qH1VMKMxcSMcefC0FSIh2TMbssVse0Aq1XN4OP9gKv/Zq8PgIqsaxP6ZgII
         EOIHgpOUv/jlfl3Yy8RcbP/pGkQJ7eqMnilj0C097wa9yZxCuodHLiorNx99vrBT1uIo
         XgoMWxAhsOAOhYVnuBWg3u0LQuhWixgd6YlVTe9GlyIUgE8/g0wIADdNs7BD48re0dBp
         EeVvZyczftMd1f03CchaIYPfdYTVs/MHv8QK315n1+xfAz+np70zWKeIH6YVYN6/Q6yN
         iarQ==
X-Gm-Message-State: ABy/qLb+Jhawbuh0rybhA7R8eiqBaORFPNDFfkftU6Rm3N3nT0FN+zVf
	lOubo4TyRMVkvjlO1l8CV74FfJPwSm6ooKqrKDRTbDWdzX+kettzh0e9UdLR3rvqNIf4JUImiQn
	A3k9pPglGhslQVTwejtjlAaVGRg==
X-Received: by 2002:a05:6512:524:b0:4fb:8585:eefe with SMTP id o4-20020a056512052400b004fb8585eefemr944782lfc.57.1688635177636;
        Thu, 06 Jul 2023 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFqMeIF2cMZUQ7fAShjCf8Z+1xgC8NcamfV8klHi0RWMAYvGphlkhDcZJEKJeQJaT+GA4Vy4Q==
X-Received: by 2002:a05:6512:524:b0:4fb:8585:eefe with SMTP id o4-20020a056512052400b004fb8585eefemr944764lfc.57.1688635177303;
        Thu, 06 Jul 2023 02:19:37 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003fa9a00d74csm5352253wmo.3.2023.07.06.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 02:19:36 -0700 (PDT)
Message-ID: <2190efc4-0cfe-d636-6254-60bb39dd02d3@redhat.com>
Date: Thu, 6 Jul 2023 11:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/5] mm/hotplug: Allow architecture override for memmap
 on memory feature
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-3-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230706085041.826340-3-aneesh.kumar@linux.ibm.com>
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

On 06.07.23 10:50, Aneesh Kumar K.V wrote:
> Some architectures like ppc64 wants to enable this feature only with radix
> translation and their vemmap mappings have different alignment
> requirements. Add overrider for mhp_supports_memmap_on_memory() and also
> use altmap.reserve feature to adjust the pageblock alignment requirement.
> 
> The patch also fallback to allocation of memmap outside memblock if the
> alignment rules are not met for memmap on memory allocation. This allows to
> use the feature more widely allocating memmap as much as possible within
> the memory block getting added.
> 
> A follow patch to enable memmap on memory for ppc64 will use this.

See my other reply. Rather have another arch check then overriding it 
completely.

-- 
Cheers,

David / dhildenb

