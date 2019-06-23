Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 554314F97E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 04:15:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Wbcl2SbKzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 12:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WbZt5bb9zDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 12:14:13 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5N2BeKs004126
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 22:14:10 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t9wrykj9c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 22:14:10 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <arbab@linux.ibm.com>;
 Sun, 23 Jun 2019 03:14:09 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 23 Jun 2019 03:14:05 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5N2E4F953608892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Jun 2019 02:14:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D60C6055;
 Sun, 23 Jun 2019 02:14:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D5FDC605B;
 Sun, 23 Jun 2019 02:14:04 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.85.182.131])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 23 Jun 2019 02:14:04 +0000 (GMT)
Received: from arbab-vm (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTP id CF0F01001AC;
 Sat, 22 Jun 2019 21:14:01 -0500 (CDT)
Date: Sat, 22 Jun 2019 21:14:01 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Subject: Re: [PATCH 05/13] powerpc/mce: Allow notifier callback to handle MCE
References: <cover.1561020760.git.santosh@fossix.org>
 <196df6a74f259c041a4269e6cba026a1248ed4af.1561020760.git.santosh@fossix.org>
 <d0a93aa6-be25-f0ed-21f5-f2929139a414@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d0a93aa6-be25-f0ed-21f5-f2929139a414@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19062302-8235-0000-0000-00000EABEA4C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011312; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01221927; UDB=6.00642910; IPR=6.01003066; 
 MB=3.00027427; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-23 02:14:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062302-8236-0000-0000-0000461E0E78
Message-Id: <20190623021401.al2iyyhxvkf7csep@arbab-vm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=461 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906230018
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mahesh,

On Fri, Jun 21, 2019 at 12:35:08PM +0530, Mahesh Jagannath Salgaonkar wrote:
>On 6/21/19 6:27 AM, Santosh Sivaraj wrote:
>> -	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
>> +	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
>> +	if (rc & NOTIFY_STOP_MASK) {
>> +		evt->disposition = MCE_DISPOSITION_RECOVERED;
>> +		regs->msr |= MSR_RI;
>
>What is the reason for setting MSR_RI ? I don't think this is a good
>idea. MSR_RI = 0 means system got MCE interrupt when SRR0 and SRR1
>contents were live and was overwritten by MCE interrupt. Hence this
>interrupt is unrecoverable irrespective of whether machine check handler
>recovers from it or not.

Good catch! I think this is an artifact from when I was first trying to 
get all this working.

Instead of setting MSR_RI, we should probably just check for it. Ie,

	if ((rc & NOTIFY_STOP_MASK) && (regs->msr & MSR_RI)) {
		evt->disposition = MCE_DISPOSITION_RECOVERED;

-- 
Reza Arbab

