Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B041455B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 11:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDtYD6NYjz2ybD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 19:39:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=obcE+IFv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=obcE+IFv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDtXS6GGtz2xl7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 19:38:48 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M7Bpqu003500; 
 Wed, 22 Sep 2021 05:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wBR3iH/pCKboXzxbzFbyLCkG9b8bjRW68MF8REX75WY=;
 b=obcE+IFvfMXDAY1ljlmcRdVDZ6dvkUvUZA4hlPaoloyIVq9WgNGUvqgIvnm3YfUHYMo6
 Ujm7AP+EykvQPKEnPuUet0y8tM2OVGEkmwgCllKpiTcHTvxbPftAEahVEG62iFXUxxjQ
 az0g01Z1Y4UIfyMiQCzRgZ5jUFcl87n3KzDpSSlCi0zsiOjdVUv4f+llpIKySuePrpso
 vO0hPvrRv7O+FVh5kyjSC4SF0RhGeeE3pPqhTfx+Pmr054aL4fFruttUoWwcT4jNfoe5
 25kcTTkhmE63P8MKyzl3QeAjSO3gEab5M74Yh0GbSwi2h8gjEKoHQdfgBSs0SQNRSjal Fg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7yvn31v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 05:38:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18M9bs3p000979;
 Wed, 22 Sep 2021 09:38:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3b7q6nmvwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 09:38:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18M9ccYI53346780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 09:38:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF5444C040;
 Wed, 22 Sep 2021 09:38:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62A444C04A;
 Wed, 22 Sep 2021 09:38:37 +0000 (GMT)
Received: from [9.145.158.122] (unknown [9.145.158.122])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Sep 2021 09:38:37 +0000 (GMT)
Message-ID: <d2fd5a57-1b6f-5c96-338b-ac41073b2a4c@linux.ibm.com>
Date: Wed, 22 Sep 2021 11:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 7/7] ocxl: Use pci core's DVSEC functionality
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>
References: <20210921220459.2437386-1-ben.widawsky@intel.com>
 <20210921220459.2437386-8-ben.widawsky@intel.com>
 <CAPcyv4h4QHAQF+ogMvOXrkdyR5Jceo8yp7TQNN+836=v0QwdDw@mail.gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <CAPcyv4h4QHAQF+ogMvOXrkdyR5Jceo8yp7TQNN+836=v0QwdDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E65qROE8wVnv68vGTqwKemREe0_yjpCm
X-Proofpoint-ORIG-GUID: E65qROE8wVnv68vGTqwKemREe0_yjpCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_03,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220066
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
Cc: Alison Schofield <alison.schofield@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-cxl@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/09/2021 02:44, Dan Williams wrote:
> On Tue, Sep 21, 2021 at 3:05 PM Ben Widawsky <ben.widawsky@intel.com> wrote:
>>
>> Reduce maintenance burden of DVSEC query implementation by using the
>> centralized PCI core implementation.
>>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
>> Cc: Andrew Donnellan <ajd@linux.ibm.com>
>> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
>> ---
>>   drivers/misc/ocxl/config.c | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
>> index a68738f38252..e401a51596b9 100644
>> --- a/drivers/misc/ocxl/config.c
>> +++ b/drivers/misc/ocxl/config.c
>> @@ -33,18 +33,7 @@
>>
>>   static int find_dvsec(struct pci_dev *dev, int dvsec_id)
>>   {
>> -       int vsec = 0;
>> -       u16 vendor, id;
>> -
>> -       while ((vsec = pci_find_next_ext_capability(dev, vsec,
>> -                                                   OCXL_EXT_CAP_ID_DVSEC))) {
>> -               pci_read_config_word(dev, vsec + OCXL_DVSEC_VENDOR_OFFSET,
>> -                               &vendor);
>> -               pci_read_config_word(dev, vsec + OCXL_DVSEC_ID_OFFSET, &id);
>> -               if (vendor == PCI_VENDOR_ID_IBM && id == dvsec_id)
>> -                       return vsec;
>> -       }
>> -       return 0;
>> +       return pci_find_dvsec_capability(dev, PCI_VENDOR_ID_IBM, dvsec_id);
>>   }


That looks fine, thanks for spotting it. You can add this for the next 
revision:
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>



> 
> What about:
> 
> arch/powerpc/platforms/powernv/ocxl.c::find_dvsec_from_pos()
> 
> ...?  With that converted the redundant definitions below:
> 
> OCXL_EXT_CAP_ID_DVSEC
> OCXL_DVSEC_VENDOR_OFFSET
> OCXL_DVSEC_ID_OFFSET
> 
> ...can be cleaned up in favor of the core definitions.


That would be great. Are you guys willing to do it? If not, I could have 
a follow-on patch, if I don't forget :-)

Thanks,

   Fred

