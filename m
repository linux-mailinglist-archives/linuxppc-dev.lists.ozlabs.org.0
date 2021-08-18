Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7563F02BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 13:29:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqQfb2gx8z3cWx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 21:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqQf82yMmz307x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 21:29:18 +1000 (AEST)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GqQcz6wVqz6BHQS;
 Wed, 18 Aug 2021 19:28:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 13:29:12 +0200
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 12:29:11 +0100
Subject: Re: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
To: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
 <yq14kbnmqoh.fsf@ca-mkp.ca.oracle.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <69c51e23-48b9-4672-e559-d2e257ade29f@huawei.com>
Date: Wed, 18 Aug 2021 12:29:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <yq14kbnmqoh.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
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
Cc: tyreld@linux.ibm.com, bvanassche@acm.org, linux-scsi@vger.kernel.org,
 sfr@canb.auug.org.au, jejb@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, paulus@samba.org, hare@suse.de,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Martin,

> 
>> Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.
> 
> Applied to 5.15/scsi-staging and rebased for bisectability.
> 

Thanks, and sorry for the hassle. But I would still like the maintainers 
to have a look, as I was curious about current usage of scsi_cmnd.tag in 
that driver.

> Just to be picky it looks like there's another scsi_cmmd tag lurking in
> qla1280.c but it's sitting behind an #ifdef DEBUG_QLA1280.
> 

That driver does not even compile with DEBUG_QLA1280 set beforehand. 
I'll fix that up and send as separate patches in case you want to 
shuffle the tag patch in earlier, which is prob not worth the effort.

I've done a good few more x86 randconfigs and tried to audit the code 
for more references, so hopefully that's the last.

Thanks
