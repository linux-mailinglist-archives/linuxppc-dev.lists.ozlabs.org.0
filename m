Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0F1026F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 15:38:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HT3619h7zDqfp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 01:38:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HT0w6K5JzDq9y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 01:36:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJELvpW007080
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:36:46 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wadmx19ba-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:36:41 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 19 Nov 2019 14:36:30 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Nov 2019 14:36:28 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJEaRUw56098858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 14:36:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E591A405B;
 Tue, 19 Nov 2019 14:36:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C7E1A405C;
 Tue, 19 Nov 2019 14:36:27 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 14:36:26 +0000 (GMT)
Subject: Re: [PATCH 02/11] powerpc/powernv/ioda: Protect PE list
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-3-fbarrat@linux.ibm.com>
 <8f5d581d8f1e8defaf8622cd79c40c98f18d3507.camel@au1.ibm.com>
 <882c0d26-7931-a2e9-c99a-7732d32a6a2f@linux.ibm.com>
 <CAOSf1CHstMRhC9dqsuvZnQuRyLwMrQkcuMYFDobq59KvYG1hEQ@mail.gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 19 Nov 2019 15:36:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHstMRhC9dqsuvZnQuRyLwMrQkcuMYFDobq59KvYG1hEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111914-4275-0000-0000-00000382647D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111914-4276-0000-0000-00003895D8DE
Message-Id: <fc7e1bd8-5481-db47-1382-3036099e62ef@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=806 impostorscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911190133
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
Cc: Christophe Lombard <clombard@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/11/2019 à 14:22, Oliver O'Halloran a écrit :
> On Tue, Nov 19, 2019 at 11:57 PM Frederic Barrat <fbarrat@linux.ibm.com> wrote:
>>
>>> Do the other accessors of ioda.pe_list also need mutex protection?
>>> pnv_ioda_setup_bus_PE()
>>> pnv_pci_dma_bus_setup()
>>> pnv_pci_init_ioda_phb()
>>> pnv_pci_ioda_setup_PEs()
>>
>>
>> I think we could also use it there, it wouldn't hurt. Those functions
>> are called when the kernel is building part of the PCI topology, and
>> devices are not really active yet, so I don't think it's absolutely
>> required.
>>
>> I'm actually not sure my patch is needed either. With hotplug, the
>> devices can come and go, whereas the PHB remains. So it feels right to
>> start protecting the list when adding/removing a device. But I don't
>> think we can really have concurrency and have 2 different operations
>> adding/removing devices at the same time under the same PHB, at least
>> for opencapi. Maybe for PCI, if we have multiple slots under the same
>> PHB. Not sure.
> 
> Creation of new pci_dev's is serialised by the global pci rescan and
> remove lock so on the creation side it's not an issue. However, we can
> release IODA PEs in the pci_dev's release function which might be
> called without that lock held. It's pretty hard to hit that case
> though since it require something to be holding a ref to the pci_dev
> even after the driver's ->remove() function has been called.


Thanks for clarifying it! Indeed, the pci_rescan_remove_lock in hotplug 
helps for the PCI case. I guess we can keep this patch for that hard to 
hit case, just in case it doesn't blow up somewhere else.

   Fred

