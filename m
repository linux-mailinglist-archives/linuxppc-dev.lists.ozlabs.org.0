Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A757A500EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 07:21:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XHgz0bFmzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 15:21:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XHf75mWgzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 15:19:26 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5O5H8O9142976
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 01:19:22 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2taqua0ssn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 01:19:22 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 24 Jun 2019 06:19:20 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 06:19:16 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5O5JE6634406676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 05:19:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB2244C04A;
 Mon, 24 Jun 2019 05:19:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CED234C040;
 Mon, 24 Jun 2019 05:19:12 +0000 (GMT)
Received: from [9.109.198.148] (unknown [9.109.198.148])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 05:19:12 +0000 (GMT)
Subject: Re: [PATCH 05/13] powerpc/mce: Allow notifier callback to handle MCE
To: Reza Arbab <arbab@linux.ibm.com>
References: <cover.1561020760.git.santosh@fossix.org>
 <196df6a74f259c041a4269e6cba026a1248ed4af.1561020760.git.santosh@fossix.org>
 <d0a93aa6-be25-f0ed-21f5-f2929139a414@linux.vnet.ibm.com>
 <20190623021401.al2iyyhxvkf7csep@arbab-vm>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Date: Mon, 24 Jun 2019 10:49:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190623021401.al2iyyhxvkf7csep@arbab-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062405-4275-0000-0000-000003450065
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062405-4276-0000-0000-0000385536EE
Message-Id: <8eb93794-fdbc-5f24-08d7-d698b6ce6f06@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=556 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240044
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

On 6/23/19 7:44 AM, Reza Arbab wrote:
> Hi Mahesh,
> 
> On Fri, Jun 21, 2019 at 12:35:08PM +0530, Mahesh Jagannath Salgaonkar
> wrote:
>> On 6/21/19 6:27 AM, Santosh Sivaraj wrote:
>>> -    blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
>>> +    rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
>>> +    if (rc & NOTIFY_STOP_MASK) {
>>> +        evt->disposition = MCE_DISPOSITION_RECOVERED;
>>> +        regs->msr |= MSR_RI;
>>
>> What is the reason for setting MSR_RI ? I don't think this is a good
>> idea. MSR_RI = 0 means system got MCE interrupt when SRR0 and SRR1
>> contents were live and was overwritten by MCE interrupt. Hence this
>> interrupt is unrecoverable irrespective of whether machine check handler
>> recovers from it or not.
> 
> Good catch! I think this is an artifact from when I was first trying to
> get all this working.
> 
> Instead of setting MSR_RI, we should probably just check for it. Ie,
> 
>     if ((rc & NOTIFY_STOP_MASK) && (regs->msr & MSR_RI)) {
>         evt->disposition = MCE_DISPOSITION_RECOVERED;

Yup, looks good to me.

Thanks,
-Mahesh.

