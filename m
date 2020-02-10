Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03757157D54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 15:24:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GSpg3W7czDqCw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 01:24:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GSjY2KCNzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 01:20:15 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AEJEo7141577; Mon, 10 Feb 2020 09:20:09 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1u9p0enc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 09:20:09 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01AEK86n029753;
 Mon, 10 Feb 2020 14:20:08 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2y1mm69qj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 14:20:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01AEK8v713763156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2020 14:20:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20F9112405E;
 Mon, 10 Feb 2020 14:20:07 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3CEB12405B;
 Mon, 10 Feb 2020 14:20:04 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.70.51])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 10 Feb 2020 14:20:04 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2] libnvdimm: Update persistence domain value for
 of_pmem and papr_scm device
In-Reply-To: <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
Date: Mon, 10 Feb 2020 19:50:00 +0530
Message-ID: <87y2ta8qy7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_04:2020-02-10,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002100111
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, Feb 4, 2020 at 9:21 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Currently, kernel shows the below values
>>         "persistence_domain":"cpu_cache"
>>         "persistence_domain":"memory_controller"
>>         "persistence_domain":"unknown"
>>
>> "cpu_cache" indicates no extra instructions is needed to ensure the persistence
>> of data in the pmem media on power failure.
>>
>> "memory_controller" indicates platform provided instructions need to be issued
>
> No, it does not. The only requirement implied by "memory_controller"
> is global visibility outside the cpu cache. If there are special
> instructions beyond that then it isn't persistent memory, at least not
> pmem that is safe for dax. virtio-pmem is an example of pmem-like
> memory that is not enabled for userspace flushing (MAP_SYNC disabled).
>

Can you explain this more? The way I was expecting the application to
interpret the value was, a regular store instruction doesn't guarantee
persistence if you find the "memory_controller" value for
persistence_domain. Instead, we need to make sure we flush data to the
controller at which point the platform will take care of the persistence in
case of power loss. How we flush data to the controller will also be
defined by the platform.


>> as per documented sequence to make sure data get flushed so that it is
>> guaranteed to be on pmem media in case of system power loss.
>>
>> Based on the above use memory_controller for non volatile regions on ppc64.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 7 ++++++-
>>  drivers/nvdimm/of_pmem.c                  | 4 +++-
>>  include/linux/libnvdimm.h                 | 1 -
>>  3 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 7525635a8536..ffcd0d7a867c 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -359,8 +359,13 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>
>>         if (p->is_volatile)
>>                 p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
>> -       else
>> +       else {
>> +               /*
>> +                * We need to flush things correctly to guarantee persistance
>> +                */
>
> There are never guarantees. If you're going to comment what does
> software need to flush, and how?

Can you explain why you say there are never guarantees? If you follow the platform
recommended instruction sequence to flush data, we can be sure of data
persistence in the pmem media.


>
>> +               set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
>>                 p->region = nvdimm_pmem_region_create(p->bus, &ndr_desc);
>> +       }
>>         if (!p->region) {
>>                 dev_err(dev, "Error registering region %pR from %pOF\n",
>>                                 ndr_desc.res, p->dn);
>> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
>> index 8224d1431ea9..6826a274a1f1 100644
>> --- a/drivers/nvdimm/of_pmem.c
>> +++ b/drivers/nvdimm/of_pmem.c
>> @@ -62,8 +62,10 @@ static int of_pmem_region_probe(struct platform_device *pdev)
>>
>>                 if (is_volatile)
>>                         region = nvdimm_volatile_region_create(bus, &ndr_desc);
>> -               else
>> +               else {
>> +                       set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
>>                         region = nvdimm_pmem_region_create(bus, &ndr_desc);
>> +               }
>>
>>                 if (!region)
>>                         dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
>> index 0f366706b0aa..771d888a5ed7 100644
>> --- a/include/linux/libnvdimm.h
>> +++ b/include/linux/libnvdimm.h
>> @@ -54,7 +54,6 @@ enum {
>>         /*
>>          * Platform provides mechanisms to automatically flush outstanding
>>          * write data from memory controler to pmem on system power loss.
>> -        * (ADR)
>
> I'd rather not delete critical terminology for a developer / platform
> owner to be able to consult documentation, or their vendor. Can you
> instead add the PowerPC equivalent term for this capability? I.e. list
> (x86: ADR PowerPC: foo ...).

Power ISA doesn't clearly call out what mechanism will be used to ensure
that a load following power loss will return the previously flushed
data. Hence there is no description of details like Asynchronous DRAM
Refresh. Only details specified is with respect to flush sequence that ensures
that a load following power loss will return the value stored.

-aneesh
