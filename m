Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B31102509
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 13:59:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HQrH2yW0zDqRY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 23:59:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HQmD6fv6zDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 23:55:39 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJCqFJS140893
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 07:55:34 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2waygma57n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 07:55:34 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 19 Nov 2019 12:55:32 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Nov 2019 12:55:29 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJCtR9u12386542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 12:55:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86140A405B;
 Tue, 19 Nov 2019 12:55:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49951A4064;
 Tue, 19 Nov 2019 12:55:27 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 12:55:27 +0000 (GMT)
Subject: Re: [PATCH 02/11] powerpc/powernv/ioda: Protect PE list
To: "Alastair D'Silva" <alastair@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-3-fbarrat@linux.ibm.com>
 <8f5d581d8f1e8defaf8622cd79c40c98f18d3507.camel@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 19 Nov 2019 13:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8f5d581d8f1e8defaf8622cd79c40c98f18d3507.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111912-0012-0000-0000-000003681DBB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111912-0013-0000-0000-000021A3A7BA
Message-Id: <882c0d26-7931-a2e9-c99a-7732d32a6a2f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_03:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911190118
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2019 à 02:34, Alastair D'Silva a écrit :
> On Mon, 2019-09-09 at 17:45 +0200, Frederic Barrat wrote:
>> Protect the PHB's list of PE. Probably not needed as long as it was
>> populated during PHB creation, but it feels right and will become
>> required once we can add/remove opencapi devices on hotplug.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/pci-ioda.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c
>> b/arch/powerpc/platforms/powernv/pci-ioda.c
>> index 92767f006f20..3dbbf5365c1c 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -1080,8 +1080,9 @@ static struct pnv_ioda_pe
>> *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>>   	}
>>   
>>   	/* Put PE to the list */
>> +	mutex_lock(&phb->ioda.pe_list_mutex);
>>   	list_add_tail(&pe->list, &phb->ioda.pe_list);
>> -
>> +	mutex_unlock(&phb->ioda.pe_list_mutex);
>>   	return pe;
>>   }
>>   
>> @@ -3513,7 +3514,10 @@ static void pnv_ioda_release_pe(struct
>> pnv_ioda_pe *pe)
>>   	struct pnv_phb *phb = pe->phb;
>>   	struct pnv_ioda_pe *slave, *tmp;
>>   
>> +	mutex_lock(&phb->ioda.pe_list_mutex);
>>   	list_del(&pe->list);
>> +	mutex_unlock(&phb->ioda.pe_list_mutex);
>> +
>>   	switch (phb->type) {
>>   	case PNV_PHB_IODA1:
>>   		pnv_pci_ioda1_release_pe_dma(pe);
> 
> Hmm, the ioda.pe_list_mutex muxtex exists, and is inited, but there are
> no other users. It's position & naming in the struct suggests it
> belongs to ioda.pe_list, rather than pnv_ioda_pe.list (as suggested by
> the lock/unlock around the list del).


I don't quite understand the above. The mutex is already in use by the 
functions handling virtual functions, pnv_ioda_setup_vf_PE() and 
pnv_ioda_release_vf_PE(). The point of the list is to keep track of all 
the PEs used by the PHB, so it makes sense to have the mutex at that level.


> Do the other accessors of ioda.pe_list also need mutex protection?
> pnv_ioda_setup_bus_PE()
> pnv_pci_dma_bus_setup()
> pnv_pci_init_ioda_phb()
> pnv_pci_ioda_setup_PEs()


I think we could also use it there, it wouldn't hurt. Those functions 
are called when the kernel is building part of the PCI topology, and 
devices are not really active yet, so I don't think it's absolutely 
required.

I'm actually not sure my patch is needed either. With hotplug, the 
devices can come and go, whereas the PHB remains. So it feels right to 
start protecting the list when adding/removing a device. But I don't 
think we can really have concurrency and have 2 different operations 
adding/removing devices at the same time under the same PHB, at least 
for opencapi. Maybe for PCI, if we have multiple slots under the same 
PHB. Not sure.

   Fred



> If not, perhaps the metux should be removed from ioda and replaced with
> pe.list_mutex instead.
> 

