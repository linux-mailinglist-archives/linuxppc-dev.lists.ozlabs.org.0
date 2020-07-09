Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BF219C0A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 11:25:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2W4g1ZSszDr5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 19:25:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lcnBjR/z; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2W0w2ZY8zDr3G
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 19:22:39 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so742124pgf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iobQ0M60TeMBf26048aqIcIF8lAPezs9OO4vJ31tPPY=;
 b=lcnBjR/z2ps+/aiZrmgO0ULSspVnfTp/fSYPISSHOvyKrlm9LdrU0pBl56YmMhJid/
 e58bJvfA2+z0YLAVyAaWE3tRefBw+p9PGpf8XRP/jFg8TGYxIv6rfsvUk6u6pNAzchhk
 tqspqeA0TgqJeffMRELjIu591ZpeiIBHHS8ityekpHnwMnMfaBBUIvGE5nqd2VURGItW
 keX+ffBMlDbb3UZm1uMo2N0+d+hPRGu6O+nHOYwQjhfvWBWEzZ4H33nnH4JRZsOIhHIO
 SNonNrOtAmWjG1cHTc2Ij7oB4WOCNLM7P/VGV8uG+pdW9/ihPZOaFjsU1rPPWGyPDoAj
 1HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=iobQ0M60TeMBf26048aqIcIF8lAPezs9OO4vJ31tPPY=;
 b=ZaeFi7mCagjgA4oShkffPQGUcxsy/zGejo2qyEptpRUtME810CVvU7WCRkMuySg0xX
 qeX2AhmHrl/8Fx1XXwGfpywZ3ujPi5V6IAYaZnUsbMRHTkNGiZdBT+h7z1aPngFAAmcL
 blmizeweYUI4jFNUghozNlKTFTf3AHQUON/3jEof6a4IBV8MEsexpzJoxd+05fh1ACg0
 pUVpH0qRyy7IcQquNJ/M+Tqc6rm7q32kD0omdZPo56ryuvRa55aK4Tg2/+L1YxAXBRTr
 9OwNG6qXSPCyS7JOXogfMf2tD+/VrwLxU6L159z0CU4cfndmvWRbzlReNvQzaUhaedQV
 hSdA==
X-Gm-Message-State: AOAM531H6SILEOJoHyq8cTYiaElWLuZYzTqmaEAjT3vTe0wTcNjy0N0N
 OmffIw9zFsbCOJ7pfI7ZBbZ40A==
X-Google-Smtp-Source: ABdhPJwFWuMst2KT5z9fy9rNuwQR0fdZ/zlJZ2ncycPzSla3w8FaofO+XW8xcF44rrbaOP0gFd0g5A==
X-Received: by 2002:a63:6643:: with SMTP id a64mr54391702pgc.246.1594286554924; 
 Thu, 09 Jul 2020 02:22:34 -0700 (PDT)
Received: from localhost ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id d14sm1960415pjc.20.2020.07.09.02.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 02:22:34 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH RESEND 2/2] papr/scm: Add bad memory ranges to nvdimm bad
 ranges
In-Reply-To: <d8fe2b1b-7779-ffee-e26b-858eb7cd3633@csgroup.eu>
References: <20200709075635.643740-1-santosh@fossix.org>
 <20200709075635.643740-2-santosh@fossix.org>
 <d8fe2b1b-7779-ffee-e26b-858eb7cd3633@csgroup.eu>
Date: Thu, 09 Jul 2020 14:52:32 +0530
Message-ID: <87mu49qbzb.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 09/07/2020 =C3=A0 09:56, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> Subscribe to the MCE notification and add the physical address which
>> generated a memory error to nvdimm bad range.
>>=20
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>>   arch/powerpc/platforms/pseries/papr_scm.c | 98 ++++++++++++++++++++++-
>>   1 file changed, 97 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pl=
atforms/pseries/papr_scm.c
>> index 9c569078a09fd..5ebb1c797795d 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -13,9 +13,11 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/delay.h>
>>   #include <linux/seq_buf.h>
>> +#include <linux/nd.h>
>>=20=20=20
>>   #include <asm/plpar_wrappers.h>
>>   #include <asm/papr_pdsm.h>
>> +#include <asm/mce.h>
>>=20=20=20
>>   #define BIND_ANY_ADDR (~0ul)
>>=20=20=20
>> @@ -80,6 +82,7 @@ struct papr_scm_priv {
>>   	struct resource res;
>>   	struct nd_region *region;
>>   	struct nd_interleave_set nd_set;
>> +	struct list_head region_list;
>>=20=20=20
>>   	/* Protect dimm health data from concurrent read/writes */
>>   	struct mutex health_mutex;
>> @@ -91,6 +94,9 @@ struct papr_scm_priv {
>>   	u64 health_bitmap;
>>   };
>>=20=20=20
>> +LIST_HEAD(papr_nd_regions);
>> +DEFINE_MUTEX(papr_ndr_lock);
>> +
>>   static int drc_pmem_bind(struct papr_scm_priv *p)
>>   {
>>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> @@ -759,6 +765,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_pri=
v *p)
>>   		dev_info(dev, "Region registered with target node %d and online node=
 %d",
>>   			 target_nid, online_nid);
>>=20=20=20
>> +	mutex_lock(&papr_ndr_lock);
>> +	list_add_tail(&p->region_list, &papr_nd_regions);
>> +	mutex_unlock(&papr_ndr_lock);
>> +
>>   	return 0;
>>=20=20=20
>>   err:	nvdimm_bus_unregister(p->bus);
>> @@ -766,6 +776,70 @@ err:	nvdimm_bus_unregister(p->bus);
>>   	return -ENXIO;
>>   }
>>=20=20=20
>> +static void papr_scm_add_badblock(struct nd_region *region,
>> +				  struct nvdimm_bus *bus, u64 phys_addr)
>> +{
>> +	u64 aligned_addr =3D ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
>> +
>> +	if (nvdimm_bus_add_badrange(bus, aligned_addr, L1_CACHE_BYTES)) {
>> +		pr_err("Bad block registration for 0x%llx failed\n", phys_addr);
>> +		return;
>> +	}
>> +
>> +	pr_debug("Add memory range (0x%llx - 0x%llx) as bad range\n",
>> +		 aligned_addr, aligned_addr + L1_CACHE_BYTES);
>> +
>> +	nvdimm_region_notify(region, NVDIMM_REVALIDATE_POISON);
>> +}
>> +
>> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
>> +			 void *data)
>> +{
>> +	struct machine_check_event *evt =3D data;
>> +	struct papr_scm_priv *p;
>> +	u64 phys_addr;
>> +	bool found =3D false;
>> +
>> +	if (evt->error_type !=3D MCE_ERROR_TYPE_UE)
>> +		return NOTIFY_DONE;
>> +
>> +	if (list_empty(&papr_nd_regions))
>> +		return NOTIFY_DONE;
>> +
>> +	/*
>> +	 * The physical address obtained here is PAGE_SIZE aligned, so get the
>> +	 * exact address from the effective address
>> +	 */
>> +	phys_addr =3D evt->u.ue_error.physical_address +
>> +		(evt->u.ue_error.effective_address & ~PAGE_MASK);
>
> Not properly aligned

Will fix it.

>
>> +
>> +	if (!evt->u.ue_error.physical_address_provided ||
>> +	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
>> +		return NOTIFY_DONE;
>> +
>> +	/* mce notifier is called from a process context, so mutex is safe */
>> +	mutex_lock(&papr_ndr_lock);
>> +	list_for_each_entry(p, &papr_nd_regions, region_list) {
>> +		struct resource res =3D p->res;
>
> Is this local struct really worth it ? Why not use p->res below directly ?
>

Right, not really needed. I can fix that in v2.

>> +
>> +		if (phys_addr >=3D res.start && phys_addr <=3D res.end) {
>> +			found =3D true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (found)
>> +		papr_scm_add_badblock(p->region, p->bus, phys_addr);
>> +
>> +	mutex_unlock(&papr_ndr_lock);
>> +
>> +	return found ? NOTIFY_OK : NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block mce_ue_nb =3D {
>> +	.notifier_call =3D handle_mce_ue
>> +};
>> +
>>   static int papr_scm_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *dn =3D pdev->dev.of_node;
>> @@ -866,6 +940,10 @@ static int papr_scm_remove(struct platform_device *=
pdev)
>>   {
>>   	struct papr_scm_priv *p =3D platform_get_drvdata(pdev);
>>=20=20=20
>> +	mutex_lock(&papr_ndr_lock);
>> +	list_del(&(p->region_list));
>> +	mutex_unlock(&papr_ndr_lock);
>> +
>>   	nvdimm_bus_unregister(p->bus);
>>   	drc_pmem_unbind(p);
>>   	kfree(p->bus_desc.provider_name);
>> @@ -888,7 +966,25 @@ static struct platform_driver papr_scm_driver =3D {
>>   	},
>>   };
>>=20=20=20
>> -module_platform_driver(papr_scm_driver);
>> +static int __init papr_scm_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret =3D platform_driver_register(&papr_scm_driver);
>> +	if (!ret)
>> +		mce_register_notifier(&mce_ue_nb);
>> +
>> +return ret;
>
> Not properly aligned.

will fix it.

Thanks for the review!

Thanks,
Santosh
>
>> +}
>> +module_init(papr_scm_init);
>> +
>> +static void __exit papr_scm_exit(void)
>> +{
>> +	mce_unregister_notifier(&mce_ue_nb);
>> +	platform_driver_unregister(&papr_scm_driver);
>> +}
>> +module_exit(papr_scm_exit);
>> +
>>   MODULE_DEVICE_TABLE(of, papr_scm_match);
>>   MODULE_LICENSE("GPL");
>>   MODULE_AUTHOR("IBM Corporation");
>>=20
>
> Christophe
