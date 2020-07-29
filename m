Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DB2327A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 00:40:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH7m557sjzDqkf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 08:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH7j15nBBzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 08:37:41 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TMXBOl022754; Wed, 29 Jul 2020 18:37:39 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32k2sbsber-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 18:37:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TMZvHD009671;
 Wed, 29 Jul 2020 22:37:37 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 32gcycwd03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 22:37:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TMbaWJ3343010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 22:37:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FA64BE056;
 Wed, 29 Jul 2020 22:37:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8DBBBE054;
 Wed, 29 Jul 2020 22:37:35 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.109.59])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 22:37:35 +0000 (GMT)
Subject: Re: [PATCH net] ibmvnic: Fix IRQ mapping disposal in error path
To: Jakub Kicinski <kuba@kernel.org>
References: <1596058592-12025-1-git-send-email-tlfalcon@linux.ibm.com>
 <20200729152820.79c00fe7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <e8d8d91d-2fd6-27af-9fec-2f855e581b78@linux.ibm.com>
Date: Wed, 29 Jul 2020 17:37:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729152820.79c00fe7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_14:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=942 spamscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290151
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
Cc: drt@linux.ibm.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/29/20 5:28 PM, Jakub Kicinski wrote:
> On Wed, 29 Jul 2020 16:36:32 -0500 Thomas Falcon wrote:
>> RX queue IRQ mappings are disposed in both the TX IRQ and RX IRQ
>> error paths. Fix this and dispose of TX IRQ mappings correctly in
>> case of an error.
>>
>> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> Thomas, please remember about Fixes tags (for networking patches,
> at least):
>
> Fixes: ea22d51a7831 ("ibmvnic: simplify and improve driver probe function")

Sorry, Jakub, I will try not to forget next time. Thanks.

