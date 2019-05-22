Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C526A25DBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 07:42:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4581k90FDJzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 15:42:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4581hq0VpPzDqK6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 15:41:30 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M5b2Uc097084
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:41:27 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2smygpa7d2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:41:27 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 22 May 2019 06:41:27 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 06:41:23 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4M5fMtp10748274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 05:41:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB98D7805F;
 Wed, 22 May 2019 05:41:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D9C7805C;
 Wed, 22 May 2019 05:41:21 +0000 (GMT)
Received: from [9.124.31.87] (unknown [9.124.31.87])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 May 2019 05:41:20 +0000 (GMT)
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
To: Dan Williams <dan.j.williams@intel.com>
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
 <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
 <CAPcyv4gOr8SFbdtBbWhMOU-wdYuMCQ4Jn2SznGRsv6Vku97Xnw@mail.gmail.com>
 <02d1d14d-650b-da38-0828-1af330f594d5@linux.ibm.com>
 <CAPcyv4jcSgg0wxY9FAM4ke9JzVc9Pu3qe6dviS3seNgHfG2oNw@mail.gmail.com>
 <87mujgcf0h.fsf@linux.ibm.com>
 <CAPcyv4j5Y+AFkbvYjDnfqTdmN_Sq=O0qfGUorgpjAE8Ww7vH=A@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Wed, 22 May 2019 11:11:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4j5Y+AFkbvYjDnfqTdmN_Sq=O0qfGUorgpjAE8Ww7vH=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19052205-8235-0000-0000-00000E9C8470
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011141; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206830; UDB=6.00633747; IPR=6.00987805; 
 MB=3.00026996; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-22 05:41:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052205-8236-0000-0000-000045ABA866
Message-Id: <d328ce41-4a65-c35e-72d7-74e722795428@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220040
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
Cc: Linux MM <linux-mm@kvack.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/19 9:37 PM, Dan Williams wrote:
> On Tue, May 21, 2019 at 2:51 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:


....

>>
>> Something like the below (Not tested). I am not sure what we will init the page_size
>> for minor version < 3. This will mark the namespace disabled if the
>> PAGE_SIZE and sizeof(struct page) doesn't match with the values used
>> during namespace create.
> 
> Yes, this is on the right track.
> 
> I would special-case page_size == 0 as 4096 and page_struct_size == 0
> as 64. If either of those is non-zero then the info-block version
> needs to be revved and it needs to be crafted to make older kernels
> fail to parse it.
> 

page_size = SZ_4K implies we fail to enable namesepaces created on ppc64 
till now. We do work fine with page_size = PAGE_SIZE. It is a few error 
check and pfn_sb->npfns that got wrong values. We do reserve the correct 
space for the required pfns even when we recorded wrong pfn_sb->npfs.


> There was an earlier attempt to implement minimum info-block versions here:
> 
> https://lore.kernel.org/lkml/155000670159.348031.17631616775326330606.stgit@dwillia2-desk3.amr.corp.intel.com/
> 
> ...but that was dropped in favor of the the "sub-section" patches.
> 

Ok i will pick that too.

-aneesh

