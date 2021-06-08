Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB139F4D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznnV3tTMz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:19:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NCgNublP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NCgNublP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NCgNublP; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NCgNublP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fznn34p1Zz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:19:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623151140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBLtrFhiRKeFc7Q7qn/8AZzS8tEb5Usg8INInZ6WYCs=;
 b=NCgNublPpUc65Nv9VMJ1ZXh7G8ulTDOg+GeMHxs5AdLA5wdvFcVbC1riX+BPiVNsB1FrsM
 bnC+0xwjq5QRyorxATrmLJeJ+9atPcJONYGUkeK4ty51NCsaD10GHwoNsQYLa0rZLMLaHb
 stXbO8E4RkU/aCKdNnYhnSeQhE4W4a0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623151140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBLtrFhiRKeFc7Q7qn/8AZzS8tEb5Usg8INInZ6WYCs=;
 b=NCgNublPpUc65Nv9VMJ1ZXh7G8ulTDOg+GeMHxs5AdLA5wdvFcVbC1riX+BPiVNsB1FrsM
 bnC+0xwjq5QRyorxATrmLJeJ+9atPcJONYGUkeK4ty51NCsaD10GHwoNsQYLa0rZLMLaHb
 stXbO8E4RkU/aCKdNnYhnSeQhE4W4a0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-wEmgU3r0OYKmd6x7F-azbQ-1; Tue, 08 Jun 2021 07:18:58 -0400
X-MC-Unique: wEmgU3r0OYKmd6x7F-azbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so9229231wrb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 04:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CBLtrFhiRKeFc7Q7qn/8AZzS8tEb5Usg8INInZ6WYCs=;
 b=PhmMugDd0/hFNyjawJSN1V01PBTN4OtXjmGyP7CmitF/iRPtg7jCZN+JjRi6kWgDLt
 doORgZFkjcgBEbCCyxa3vAI6GfRh9KcAd9URwle76j5Kfh7cVSrHbjA0g8xy2zqUpqMG
 c/JQ8qXqWq4gHzNF1pKux2sfrfx3eYqjwsVoSFjMjhcLPL4yfkNwFXmZAS8EEN592B0K
 WRBAeKUjOr/6+pLgtOkz2/FoUdanYZZRoATocch0l4daC/xgx6+lw7niAZc9KZfSixdz
 P6/SlarXmG1tn4Bn9u1zTZvt7CBeTwyQDyjmq+/aAYVm1OC1orN48UrJnSXFCGbmq04e
 JY0g==
X-Gm-Message-State: AOAM533AwTl0fNTDOv5OSygHxDOOkLGVpd3dLebgSR4dsVnJ25UvZf7f
 4R1N49UIvsGr3gfeN3NNFXO6spH+KrJzEIUTT8Czk1hzNOF54eifD7N7/95vitKeu907xY5Bpxt
 wxwYoZGeZPWOnwC3Rnbp6Yq3SaA==
X-Received: by 2002:adf:df86:: with SMTP id z6mr22061218wrl.255.1623151137733; 
 Tue, 08 Jun 2021 04:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrB9z1bqXKLNgH1xZgLenFDxAm/18wrzcUUIce09tn+BporQC3UeSbXcvGrkz4TceLSHiMMw==
X-Received: by 2002:adf:df86:: with SMTP id z6mr22061199wrl.255.1623151137577; 
 Tue, 08 Jun 2021 04:18:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c61cf.dip0.t-ipconnect.de. [91.12.97.207])
 by smtp.gmail.com with ESMTPSA id
 u2sm19236473wrn.38.2021.06.08.04.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 04:18:57 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] mm/memory_hotplug: remove nid parameter from
 remove_memory() and friends
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20210607195430.48228-1-david@redhat.com>
 <20210607195430.48228-6-david@redhat.com> <87y2bkehky.fsf@mpe.ellerman.id.au>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7463b3ed-07d3-7157-629d-a85a3ff558d6@redhat.com>
Date: Tue, 8 Jun 2021 13:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87y2bkehky.fsf@mpe.ellerman.id.au>
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
Cc: nvdimm@lists.linux.dev, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Hui Zhu <teawater@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Marek Kedzierski <mkedzier@redhat.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.06.21 13:11, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
>> There is only a single user remaining. We can simply try to offline all
>> online nodes - which is fast, because we usually span pages and can skip
>> such nodes right away.
> 
> That makes me slightly nervous, because our big powerpc boxes tend to
> trip on these scaling issues before others.
> 
> But the spanned pages check is just:
> 
> void try_offline_node(int nid)
> {
> 	pg_data_t *pgdat = NODE_DATA(nid);
>          ...
> 	if (pgdat->node_spanned_pages)
> 		return;
> 
> So I guess that's pretty cheap, and it's only O(nodes), which should
> never get that big.

Exactly. And if it does turn out to be a problem, we can walk all memory 
blocks before removing them, collecting the nid(s).

-- 
Thanks,

David / dhildenb

