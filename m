Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6605B33C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 06:05:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cYg428jQzDq6J
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 14:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aravinda@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cYdN1ddyzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 14:03:35 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6141TOc170121
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 00:03:30 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tfa6fs7p3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 00:03:30 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aravinda@linux.vnet.ibm.com>;
 Mon, 1 Jul 2019 05:03:29 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 05:03:27 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6143QPk56951218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 04:03:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6574C6057;
 Mon,  1 Jul 2019 04:03:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44CFBC605B;
 Mon,  1 Jul 2019 04:03:25 +0000 (GMT)
Received: from [9.124.31.66] (unknown [9.124.31.66])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 04:03:24 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries: Fix maximum memory value
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <156170480663.26214.11212383510892156924.stgit@aravinda>
 <87tvc9sjrb.fsf@linux.ibm.com>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Mon, 1 Jul 2019 09:33:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87tvc9sjrb.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070104-0012-0000-0000-0000174A94FF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011358; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01225722; UDB=6.00645232; IPR=6.01006934; 
 MB=3.00027534; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 04:03:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070104-0013-0000-0000-000057E56D31
Message-Id: <52df9ec5-4bca-697f-3d2a-9b720c346547@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010049
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Friday 28 June 2019 10:57 PM, Nathan Lynch wrote:
> Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
>> Calculating the maximum memory based on the number of lmbs
>> and lmb size does not account for the RMA region. Hence
>> use memory_hotplug_max(), which already accounts for the
>> RMA region, to fetch the maximum memory value. Thanks to
>> Nathan Lynch for suggesting the memory_hotplug_max()
>> function.
> 
> Well, I hope I haven't led you astray... will it give you the desired
> result on a kernel configured without memory hotplug support, booted in
> an LPAR with some huge pages configured?

Yes. I have tested the patch both with CONFIG_MEMORY_HOTPLUG set and not
set. It is working as expected.

Regards,
Aravinda

> 
> If so, then
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
> 
> It would likely help with review and future maintenance if the semantics
> and intended use of the MaxMem field are made a little more
> explicit. For example, is it supposed to include persistent memory?
> Perhaps a follow-up patch could address this. Or maybe I'm overthinking
> it.
> 

-- 
Regards,
Aravinda

