Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280747264
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 00:24:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RBq66j1tzDrMQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 08:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RBn74v6QzDrPt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 08:22:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5FMLdT5023056
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 18:22:46 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t55nrwm9a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 18:22:46 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Sat, 15 Jun 2019 23:22:45 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 15 Jun 2019 23:22:44 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5FMMgNn31850922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Jun 2019 22:22:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A091EC6059;
 Sat, 15 Jun 2019 22:22:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED1A0C6057;
 Sat, 15 Jun 2019 22:22:41 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.163.50])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 15 Jun 2019 22:22:41 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: fix oops in hotplug memory notifier
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
References: <20190607050407.25444-1-nathanl@linux.ibm.com>
 <629a9449-51c3-4c62-0b8c-9008061ee9ee@linux.vnet.ibm.com>
 <8736klm0cc.fsf@linux.ibm.com> <87a7el3rk3.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Sat, 15 Jun 2019 15:22:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87a7el3rk3.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061522-0016-0000-0000-000009C2C0B7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011269; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01218500; UDB=6.00640848; IPR=6.00999632; 
 MB=3.00027327; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-15 22:22:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061522-0017-0000-0000-000043A9E2D4
Message-Id: <3afe4a39-2fe8-4303-afc1-3b5ad7767c53@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-15_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=931 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906150212
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/13/2019 06:05 PM, Nathan Lynch wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
> 
>> Tyrel Datwyler <tyreld@linux.vnet.ibm.com> writes:
>>
>>> Maybe we are ok with this behavior as I haven't dug deep enough into the memory
>>> subsystem here to really understand what the memory code is updating, but it is
>>> concerning that we are doing it in some cases, but not all.
>>
>> I hope I've made a good case above that the notifier does not do any
>> useful work, and a counterpart for the v2 format isn't needed.  Do you
>> agree?
>>
>> If so, I'll send a patch later to remove the notifier altogether. In the
>> near term I would still like this minimal fix to go in.
> 
> Tyrel, ack?
> 

Sure, lets start with simple case to fix the crash.

-Tyrel

