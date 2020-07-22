Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88040228D3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 02:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBH8D6wyczDqHl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 10:55:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBH585YqbzDqlJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 10:53:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M0VdrU023222; Tue, 21 Jul 2020 20:52:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wkfphv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 20:52:57 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M0WM7V025442;
 Tue, 21 Jul 2020 20:52:56 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wkfphm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 20:52:56 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M0p2gV000691;
 Wed, 22 Jul 2020 00:52:56 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 32brq97rdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 00:52:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M0qt7o35193214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 00:52:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB3E7112064;
 Wed, 22 Jul 2020 00:52:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B25BB112061;
 Wed, 22 Jul 2020 00:52:54 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.65.219.47])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 00:52:54 +0000 (GMT)
Subject: Re: [PATCH v4 5/7] powerpc/iommu: Move iommu_table cleaning routine
 to iommu_table_clean
To: Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-6-leobras.c@gmail.com>
 <51235292-a571-8792-c693-d0dc6faeb21c@ozlabs.ru>
 <0f4c2d84d0958e98e7ada53c25750fe548cadf0b.camel@gmail.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <d6078fce-bb5f-f829-5de2-5bce3cee2bd5@linux.vnet.ibm.com>
Date: Tue, 21 Jul 2020 19:52:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0f4c2d84d0958e98e7ada53c25750fe548cadf0b.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_15:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=25 bulkscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210152
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/21/20 5:13 PM, Leonardo Bras wrote:
> On Tue, 2020-07-21 at 14:59 +1000, Alexey Kardashevskiy wrote:
>>
>> On 16/07/2020 17:16, Leonardo Bras wrote:
>>> Move the part of iommu_table_free() that does struct iommu_table cleaning
>>> into iommu_table_clean, so we can invoke it separately.
>>>
>>> This new function is useful for cleaning struct iommu_table before
>>> initializing it again with a new DMA window, without having it freed and
>>> allocated again.
>>>
>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>> ---
>>>  arch/powerpc/kernel/iommu.c | 30 ++++++++++++++++++------------
>>>  1 file changed, 18 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>> index 9704f3f76e63..c3242253a4e7 100644
>>> --- a/arch/powerpc/kernel/iommu.c
>>> +++ b/arch/powerpc/kernel/iommu.c
>>> @@ -735,21 +735,10 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>>>  	return tbl;
>>>  }
>>>  
>>> -static void iommu_table_free(struct kref *kref)
>>> +static void iommu_table_clean(struct iommu_table *tbl)
>>
>> iommu_table_free() + iommu_init_table() + set_iommu_table_base() should
>> work too, why new helper?
> 
> iommu_table_free() also frees the tbl, which would need allocate it
> again (new address) and to fill it up again, unnecessarily. 
> I think it's a better approach to only change what is needed.
> 
>> There is also iommu_table_clear() which does a different thing so you
>> need a better name.
> 
> I agree.
> I had not noticed this other function before sending the patchset. What
> would be a better name though? __iommu_table_free()? 
> 
>> Second, iommu_table_free
>> use and it would be ok as we would only see this when hot-unplugging a
>> PE because we always kept the default window.
>> Btw you must be seeing these warnings now every time you create DDW with
>> these patches as at least the first page is reserved, do not you?
> 
> It does not print a warning.
> I noticed other warnings, but not this one from iommu_table_free():
> /* verify that table contains no entries */
> if (!bitmap_empty(tbl->it_ma
> p, tbl->it_size))
> 	pr_warn("%s: Unexpected TCEs\n", __func__);
> 
> Before that, iommu_table_release_pages(tbl) is supposed to clear the 
> bitmap, so this only tests for a tce that is created in this short period.
> 
>> Since we are replacing a table for a device which is still in the
>> system, we should not try messing with its DMA if it already has
>> mappings so the warning should become an error preventing DDW. It is
>> rather hard to trigger in practice but I could hack a driver to ask for
>> 32bit DMA mask first, map few pages and then ask for 64bit DMA mask, it
>> is not illegal, I think. So this needs a new helper - "bool
>> iommu_table_in_use(tbl)" - to use in enable_ddw(). Or I am overthinking
>> this?... Thanks,
> 
> As of today, there seems to be nothing like that happening in the
> driver I am testing. 
> I spoke to Brian King on slack, and he mentioned that at the point DDW
> is created there should be no allocations in place.

I think there are a couple of scenarios here. One is where there is a DMA
allocation prior to a call to set the DMA mask. Second scenario is if the
driver makes multiple calls to set the DMA mask. I would argue that a properly
written driver should tell the IOMMU subsystem what DMA mask it supports prior
to allocating DMA memroy. Documentation/core-api/dma-api-howto.rst should
describe what is legal and what is not.

It might be reasonable to declare its not allowed to allocate DMA memory
and then later change the DMA mask and clearly call this out in the documentation
if its not already.

-Brian


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

