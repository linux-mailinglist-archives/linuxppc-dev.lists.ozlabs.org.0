Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A072209B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 01:00:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455Nzj4WZjzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 09:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455NyP2SgMzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 08:59:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HMj5Td012959
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 18:59:04 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sj3915nvb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 18:59:04 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Fri, 17 May 2019 23:59:03 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 23:59:01 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HMx0Hd34144398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 22:59:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0333124053;
 Fri, 17 May 2019 22:58:59 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 293E1124052;
 Fri, 17 May 2019 22:58:59 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.200.22])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 22:58:58 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/pseries: Simplify cpu readd to use drc_index
To: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <20190516023706.50118-1-tyreld@linux.ibm.com>
 <8736leky3x.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Fri, 17 May 2019 15:58:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8736leky3x.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051722-2213-0000-0000-000003911834
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011114; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01204818; UDB=6.00632518; IPR=6.00985753; 
 MB=3.00026939; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 22:59:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051722-2214-0000-0000-00005E7AAE76
Message-Id: <05a4295b-dea5-bea2-5fd3-c8fbee7bac48@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170137
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

On 05/16/2019 12:17 PM, Nathan Lynch wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> The current dlpar_cpu_readd() takes in a cpu_id and uses that to look up
>> the cpus device_node so that we can get at the ibm,my-drc-index
>> property. The only user of cpu readd is an OF notifier call back. This
>> call back already has a reference to the device_node and therefore can
>> retrieve the drc_index from the device_node.
> 
> dlpar_cpu_readd is a hack to try to change the CPU-node relationship at
> runtime without destabilizing the system. It doesn't accomplish that and
> it should just be removed (and I'm working on that).
> 

I will politely disagree. We've done exactly this from userspace for years. My
experience still suggests that memory affinity is the problem area, and that the
work to push this all into the kernel originally was poorly tested.

-Tyrel

