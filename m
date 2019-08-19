Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8294932
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 17:53:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bz464vVSzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 01:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bz066bYHzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Bz0617Vjz8wNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:50:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Bz0563WRz9sND; Tue, 20 Aug 2019 01:50:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Bz0444Q8z9sN4
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 01:50:11 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JFmou2025573
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 11:50:07 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ufwgx3j00-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 11:50:07 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 19 Aug 2019 16:50:05 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Aug 2019 16:50:03 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7JFo1Df31326326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 15:50:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 974B642049;
 Mon, 19 Aug 2019 15:50:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84E544203F;
 Mon, 19 Aug 2019 15:49:59 +0000 (GMT)
Received: from [9.199.52.196] (unknown [9.199.52.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Aug 2019 15:49:59 +0000 (GMT)
Subject: Re: [PATCH v4 11/25] powernv/fadump: register kernel metadata address
 with opal
To: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327679568.27462.14864917663459855788.stgit@hbathini.in.ibm.com>
 <20190813104137.xsyommcjdrnpa6u6@in.ibm.com>
 <6d34b5d7-5183-6222-1bdb-5b1b7291fc0a@linux.ibm.com>
 <8d91f41e-c9c1-2397-1570-62de7a775093@linux.vnet.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Mon, 19 Aug 2019 21:19:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d91f41e-c9c1-2397-1570-62de7a775093@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081915-0020-0000-0000-00000361666B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081915-0021-0000-0000-000021B69323
Message-Id: <4b92da07-770e-6c18-c0d5-452274b45880@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190171
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/08/19 3:51 PM, Mahesh Jagannath Salgaonkar wrote:
> On 8/14/19 12:36 PM, Hari Bathini wrote:
>>
>>
>> On 13/08/19 4:11 PM, Mahesh J Salgaonkar wrote:
>>> On 2019-07-16 17:03:15 Tue, Hari Bathini wrote:
>>>> OPAL allows registering address with it in the first kernel and
>>>> retrieving it after MPIPL. Setup kernel metadata and register its
>>>> address with OPAL to use it for processing the crash dump.
>>>>
>>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>>> ---
[...]
>>
>>> What if kernel crashes before metadata area is initialized ?
>>
>> registered_regions would be '0'. So, it is treated as fadump is not registered case.
>> Let me
>> initialize metadata explicitly before registering the address with f/w to avoid any assumption...
> 
> Do you want to do that before memblock reservation ? Should we move this
> to setup_fadump() ?

Better here as failing early would mean we could fall back to KDump..

