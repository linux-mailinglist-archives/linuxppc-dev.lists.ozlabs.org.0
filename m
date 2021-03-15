Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FE33ACD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 08:53:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTDz5Zr6z30C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQYNCcJD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQYNCcJD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=eric.auger@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=gQYNCcJD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQYNCcJD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTDF55vNz2yxq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 18:52:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615794760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3VcyCK15wuo7OnaOdUlq2bza4tGVkBBmoXXTmML6Bg=;
 b=gQYNCcJDq6jNQBDml8OiKNd03KM/MieEqftCwZDFSK1YN0P22L7Gly+2SoB0etwh2K8XkL
 axR19P0bX2KIvJqTIEEHIzEX+UMUkC+ZcB33jsujtfgVdC5L7Lea6GUcVDQmKYxwuMP6S7
 q9HiHZrTpJ2jkCUhDVpoDzSPFOeCBg4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615794760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3VcyCK15wuo7OnaOdUlq2bza4tGVkBBmoXXTmML6Bg=;
 b=gQYNCcJDq6jNQBDml8OiKNd03KM/MieEqftCwZDFSK1YN0P22L7Gly+2SoB0etwh2K8XkL
 axR19P0bX2KIvJqTIEEHIzEX+UMUkC+ZcB33jsujtfgVdC5L7Lea6GUcVDQmKYxwuMP6S7
 q9HiHZrTpJ2jkCUhDVpoDzSPFOeCBg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-QbWxkMulMV6r7TYiz1r-2A-1; Mon, 15 Mar 2021 03:52:35 -0400
X-MC-Unique: QbWxkMulMV6r7TYiz1r-2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C5983DD26;
 Mon, 15 Mar 2021 07:52:33 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B094410023BE;
 Mon, 15 Mar 2021 07:52:29 +0000 (UTC)
Subject: Re: [PATCH 15/17] iommu: remove DOMAIN_ATTR_NESTING
To: Christoph Hellwig <hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-16-hch@lst.de>
 <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
 <20210314155813.GA788@lst.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3a1194de-a053-84dd-3d6a-bff8e01ebcd3@redhat.com>
Date: Mon, 15 Mar 2021 08:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210314155813.GA788@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-msm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 3/14/21 4:58 PM, Christoph Hellwig wrote:
> On Sun, Mar 14, 2021 at 11:44:52AM +0100, Auger Eric wrote:
>> As mentionned by Robin, there are series planning to use
>> DOMAIN_ATTR_NESTING to get info about the nested caps of the iommu (ARM
>> and Intel):
>>
>> [Patch v8 00/10] vfio: expose virtual Shared Virtual Addressing to VMs
>> patches 1, 2, 3
>>
>> Is the plan to introduce a new domain_get_nesting_info ops then?
> 
> The plan as usual would be to add it the series adding that support.
> Not sure what the merge plans are - if the series is ready to be
> merged I could rebase on top of it, otherwise that series will need
> to add the method.
OK I think your series may be upstreamed first.

Thanks

Eric
> 

