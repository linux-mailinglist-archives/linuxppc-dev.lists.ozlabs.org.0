Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61523B7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 17:03:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4572G93LlGzDqFh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 01:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4572DZ06PVzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 01:02:05 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KF0Y7h008041
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 11:02:02 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2skvtp53yt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 11:02:02 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Mon, 20 May 2019 16:02:01 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 16:01:59 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4KF1wQi39387394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 15:01:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5947AC05F;
 Mon, 20 May 2019 15:01:57 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C91D2AC059;
 Mon, 20 May 2019 15:01:57 +0000 (GMT)
Received: from localhost (unknown [9.41.179.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 15:01:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Simplify cpu readd to use drc_index
In-Reply-To: <05a4295b-dea5-bea2-5fd3-c8fbee7bac48@linux.vnet.ibm.com>
References: <20190516023706.50118-1-tyreld@linux.ibm.com>
 <8736leky3x.fsf@linux.ibm.com>
 <05a4295b-dea5-bea2-5fd3-c8fbee7bac48@linux.vnet.ibm.com>
Date: Mon, 20 May 2019 10:01:57 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19052015-0072-0000-0000-000004307096
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011131; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206074; UDB=6.00633284; IPR=6.00987033; 
 MB=3.00026971; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-20 15:02:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052015-0073-0000-0000-00004C4B0D6B
Message-Id: <87tvdpjhju.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200098
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
Cc: mingming.cao@ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.vnet.ibm.com> writes:

> On 05/16/2019 12:17 PM, Nathan Lynch wrote:
>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>> The current dlpar_cpu_readd() takes in a cpu_id and uses that to look up
>>> the cpus device_node so that we can get at the ibm,my-drc-index
>>> property. The only user of cpu readd is an OF notifier call back. This
>>> call back already has a reference to the device_node and therefore can
>>> retrieve the drc_index from the device_node.
>> 
>> dlpar_cpu_readd is a hack to try to change the CPU-node relationship at
>> runtime without destabilizing the system. It doesn't accomplish that and
>> it should just be removed (and I'm working on that).
>> 
>
> I will politely disagree. We've done exactly this from userspace for
> years. My experience still suggests that memory affinity is the
> problem area, and that the work to push this all into the kernel
> originally was poorly tested.

Kernel implementation details aside, how do you change the cpu-node
relationship at runtime without breaking NUMA-aware applications? Is
this not a fundamental issue to address before adding code like this?

