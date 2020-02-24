Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A388E169D72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:20:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qr3r5fD2zDqKb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qr1W01h8zDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:18:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O59OZx104331; Mon, 24 Feb 2020 00:17:47 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb008u9qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 00:17:47 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01O59sY1105216;
 Mon, 24 Feb 2020 00:17:46 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb008u9qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 00:17:46 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01O5HWeE001053;
 Mon, 24 Feb 2020 05:17:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 2yaux60rah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 05:17:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O5HiuW54133038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 05:17:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D20B52805C;
 Mon, 24 Feb 2020 05:17:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37CE328060;
 Mon, 24 Feb 2020 05:17:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.31.35])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 05:17:38 +0000 (GMT)
Subject: Re: [PATCH v2 1/8] powerpc/perf/hv-24x7: Fix inconsistent output
 values incase multiple hv-24x7 events run
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
References: <20200221061022.3047-1-kjain@linux.ibm.com>
 <20200221061022.3047-2-kjain@linux.ibm.com>
 <20200223025119.GA17174@us.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <699d0e3f-47a9-3ee6-7055-08509c635294@linux.ibm.com>
Date: Mon, 24 Feb 2020 10:47:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200223025119.GA17174@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-23_07:2020-02-21,
 2020-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240043
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, acme@kernel.org, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/23/20 8:21 AM, Sukadev Bhattiprolu wrote:
> Kajol Jain [kjain@linux.ibm.com] wrote:
>> Commit 2b206ee6b0df ("powerpc/perf/hv-24x7: Display change in counter
>> values")' added to print _change_ in the counter value rather then raw
>> value for 24x7 counters. Incase of transactions, the event count
>> is set to 0 at the beginning of the transaction. It also sets
>> the event's prev_count to the raw value at the time of initialization.
>> Because of setting event count to 0, we are seeing some weird behaviour,
>> whenever we run multiple 24x7 events at a time.
> 
> Interesting. Are we taking delta of a delta and ending up with large
> negative values in the -I case?  However...
> 

Hi Sukadev,
       That's right, we are ending up in calculating delta of delta which may give us negative values
because of which we are getting these large values in -I case.

> <snip>
> 
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 573e0b309c0c..6dbbf70232aa 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -1409,7 +1409,7 @@ static void h_24x7_event_read(struct perf_event *event)
>>  			 * that would require issuing a hcall, which would then
>>  			 * defeat the purpose of using the txn interface.
>>  			 */
>> -			local64_set(&event->count, 0);
>> +			local64_add(0, &event->count);
> 
> ... not sure, how adding zero to the count helps. Should we just remove the
> line (and the comment block above it)?  Or does it help to clear the event
> count in ->start_txn() rather than on read()?

Its not impacting much as we are just adding and not setting event count.I think we can remove that line
with the comment added. Will it be ok if I remove that whole part?

> 
> How does the change impact the counts when run without the -I?

There won't be much impact because from my understanding you did add 
`(void)local64_xchg(&event->hw.prev_count, ct);`, to print change value in your
Commit 2b206ee6b0df in function 'h_24x7_event_init()'.
And we will go through this path in case of 'without -I'. Please let me know if my
understanding is correct.

Thanks,
Kajol

> 
> Thanks for chasing this down.
> 
> Sukadev
> 
