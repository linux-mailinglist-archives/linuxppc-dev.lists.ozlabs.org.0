Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BBB5A12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 05:17:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y4sD5NXNzF49V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 13:17:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y4qK4DGmzF42h
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 13:15:25 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8I337og129021; Tue, 17 Sep 2019 23:15:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v39pnn2f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 23:15:18 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8I2xdJu016178;
 Wed, 18 Sep 2019 03:15:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2v37jvjfh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 03:15:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8I3FG5s46596572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 03:15:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6DE0AC065;
 Wed, 18 Sep 2019 03:15:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5175AC06A;
 Wed, 18 Sep 2019 03:15:15 +0000 (GMT)
Received: from [9.199.38.248] (unknown [9.199.38.248])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Sep 2019 03:15:15 +0000 (GMT)
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
To: Cameron Berkenpas <cam@neo-zeon.de>,
 Andrew Morton <akpm@linux-foundation.org>
References: <bug-204789-27@https.bugzilla.kernel.org/>
 <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
 <875zlw7q5s.fsf@linux.ibm.com> <87zhj85lac.fsf@linux.ibm.com>
 <a18615a4-be8b-4df0-addb-7841567923f6@neo-zeon.de>
 <28de8cb6-3213-56aa-8ed6-fbdb109ab3df@linux.ibm.com>
 <e45ab4aa-202f-b98a-e9cf-8945ea9391a8@neo-zeon.de>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <c5e52337-5ff1-79f0-8d36-baea0a105c58@linux.ibm.com>
Date: Wed, 18 Sep 2019 08:45:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e45ab4aa-202f-b98a-e9cf-8945ea9391a8@neo-zeon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=630 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180030
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/13/19 10:58 PM, Cameron Berkenpas wrote:
> Running against the kernel I built against 0034d395f89d and the problem 
> is still there.
> 
> However, running against the kernel I built against the previous commit, 
> a35a3c6f6065, and the system boots.
> 
> This being due to 0034d395f89d confirmed.


https://lore.kernel.org/linuxppc-dev/20190917145702.9214-1-aneesh.kumar@linux.ibm.com 


This series should help you.

-aneesh

