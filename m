Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D001C1A6900
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 17:40:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491CWR6Lk7zDqNk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 01:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VC/dgjCr; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491CRx3GwnzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 01:37:49 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id ay1so3520404plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DRPQ319+DRXWj2YOYiRuSIhim1U4VpTC56vtkIAzqgQ=;
 b=VC/dgjCrSlM1+hnpXbtUlsfAsTzh+sMukide4Kf/B//xrQ1nW/XTjrw+LJsKN77CMk
 02ebmmlFE5khBGZ0OTcNR1C69+rLjZvHVMyzQ3vLK5uPbRGsJIIaGTd4+i7av1LZoh9x
 9/dSUUdIyRA7HEBKnbXECv/7spzDZ0ZR8QiXY0BMh/LDvdFoHmQVvhhgyywwWjAPPRQn
 F0vJ1XT+X5KJLFzGtlbwDf4lTeZ48jjza9FGJqbt3oHe6zPMVz37enGj4+Brj2L15TbI
 wB/PdmV/35Lz9efN1eEkBbhJwdEgcP4qmEyJGN1EtT5TCW1lrymhNQtGnmrrt7B1jLIu
 YS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DRPQ319+DRXWj2YOYiRuSIhim1U4VpTC56vtkIAzqgQ=;
 b=Yj/VNqJicGr0rdbLDnWi059DF0IcNv/poCDFIiKu0exJQNvJQBKKmfundNukvwVZ5n
 kWbbv0/WDwTPf1IRFkdawL5XxSvFdli33YnYZkanR+yWi6HkclP58zv3a5iPJ+gxru+7
 F4fX9NwMG2AvqdCCFuy/XvwKLnZ+XB/OOigqCfCKJrK7kyLAtT4O2KA9khzwhhwmQbId
 k5/mYsSnzJ7nOgiCu/sJqhTgnTznbJ4ollSupiboYUxoxHH8OaG5oVZ04pdUS+zabD54
 z6G8Fu8nbEh2/krJuz2e5Hnk7EiYb2brbBZJMe8Np5TslrqlETonCTGASzLq8j8+1cwO
 aLEw==
X-Gm-Message-State: AGi0Pub/xOop1EBM4ziBvupH3pjMz1qc0OgiP8TZcocQgemRFbZGi+nJ
 sSEOTYVXU2YAiEzfoxYRq8xhlQ==
X-Google-Smtp-Source: APiQypJeVGS3pyuFALPb3DWaQuGZ0saAwi9j1c9ba7PEcoLnjFceXrOmLBkGgnhXNV+Bgc+e4fBkKw==
X-Received: by 2002:a17:90a:858a:: with SMTP id
 m10mr19766947pjn.178.1586792265552; 
 Mon, 13 Apr 2020 08:37:45 -0700 (PDT)
Received: from localhost ([2401:4900:360d:80fd:f85c:bf4e:4685:22fb])
 by smtp.gmail.com with ESMTPSA id h6sm8885855pfq.200.2020.04.13.08.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 08:37:44 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: mahesh@linux.ibm.com
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
In-Reply-To: <20200413142446.abccjt223vrhfgot@in.ibm.com>
References: <20200401074741.1562361-1-santosh@fossix.org>
 <20200413142446.abccjt223vrhfgot@in.ibm.com>
Date: Mon, 13 Apr 2020 21:07:38 +0530
Message-ID: <875ze3iegt.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Oliver <oohall@gmail.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:

> On 2020-04-01 13:17:41 Wed, Santosh Sivaraj wrote:
>> Subscribe to the MCE notification and add the physical address which
>> generated a memory error to nvdimm bad range.
>> 
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>> 
>> This patch depends on "powerpc/mce: Add MCE notification chain" [1].
>> 
>> Unlike the previous series[2], the patch adds badblock registration only for
>> pseries scm driver. Handling badblocks for baremetal (powernv) PMEM will be done
>> later and if possible get the badblock handling as a common code.
>> 
>> [1] https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
>> [2] https://lore.kernel.org/linuxppc-dev/20190820023030.18232-1-santosh@fossix.org/
>> 
>> arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-
>>  1 file changed, 95 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 0b4467e378e5..5012cbf4606e 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> [...]
>> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
>> +			 void *data)
>> +{
>> +	struct machine_check_event *evt = data;
>> +	struct papr_scm_priv *p;
>> +	u64 phys_addr;
>> +	bool found = false;
>> +
>> +	if (evt->error_type != MCE_ERROR_TYPE_UE)
>> +		return NOTIFY_DONE;
>> +
>> +	if (list_empty(&papr_nd_regions))
>> +		return NOTIFY_DONE;
>
> Do you really need this check ?

Quite harmless I guess, atleast it saves a branch and mutex_lock/unlock.

>
>> +
>> +	phys_addr = evt->u.ue_error.physical_address +
>> +		(evt->u.ue_error.effective_address & ~PAGE_MASK);
>> +
>> +	if (!evt->u.ue_error.physical_address_provided ||
>> +	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
>> +		return NOTIFY_DONE;
>> +
>> +	/* mce notifier is called from a process context, so mutex is safe */
>> +	mutex_lock(&papr_ndr_lock);
>> +	list_for_each_entry(p, &papr_nd_regions, region_list) {
>> +		struct resource res = p->res;
>> +
>> +		if (phys_addr >= res.start && phys_addr <= res.end) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&papr_ndr_lock);
>> +
>> +	if (!found)
>> +		return NOTIFY_DONE;
>> +
>> +	papr_scm_add_badblock(p->region, p->bus, phys_addr);
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block mce_ue_nb = {
>> +	.notifier_call = handle_mce_ue
>> +};
>> +
> [...]
>> -module_platform_driver(papr_scm_driver);
>> +static int __init papr_scm_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = platform_driver_register(&papr_scm_driver);
>> +	if (!ret)
>> +		mce_register_notifier(&mce_ue_nb);
>> +
>> +	return ret;
>> +}
>> +module_init(papr_scm_init);
>> +
>> +static void __exit papr_scm_exit(void)
>> +{
>> +	mce_unregister_notifier(&mce_ue_nb);
>> +	platform_driver_unregister(&papr_scm_driver);
>> +}
>> +module_exit(papr_scm_exit);
>
> Rest Looks good to me.
>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks for the review.

Santosh
>
> Thanks,
> -Mahesh.
>
>> +
>>  MODULE_DEVICE_TABLE(of, papr_scm_match);
>>  MODULE_LICENSE("GPL");
>>  MODULE_AUTHOR("IBM Corporation");
>> -- 
>> 2.25.1
>> 
>
> -- 
> Mahesh J Salgaonkar
