Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73712B6F53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 00:23:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YZHb4FZHzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 08:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZFp0LyFzF4SM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 08:21:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8IMCWtc084362; Wed, 18 Sep 2019 18:21:27 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdnhkyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 18:21:27 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8IM9oEk011017;
 Wed, 18 Sep 2019 22:21:26 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2v3vbu8e2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 22:21:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8IMLP128913546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 22:21:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE9A312405A;
 Wed, 18 Sep 2019 22:21:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B244124055;
 Wed, 18 Sep 2019 22:21:25 +0000 (GMT)
Received: from juliets-mbp.austin.ibm.com (unknown [9.41.174.202])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Sep 2019 22:21:25 +0000 (GMT)
Subject: Re: [PATCH v3 2/2] net/ibmvnic: prevent more than one thread from
 running in reset
To: Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org
References: <20190917171552.32498-1-julietk@linux.vnet.ibm.com>
 <20190917171552.32498-3-julietk@linux.vnet.ibm.com>
 <87ef0ew2so.fsf@mpe.ellerman.id.au>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <8afbe58f-4a4a-2b3b-37b7-90dad11de873@linux.vnet.ibm.com>
Date: Wed, 18 Sep 2019 17:21:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ef0ew2so.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180187
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
Cc: linuxppc-dev@lists.ozlabs.org, tlfalcon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/18/19 1:12 AM, Michael Ellerman wrote:
> Hi Juliet,
>
> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
>> ---
>>  drivers/net/ethernet/ibm/ibmvnic.c | 23 ++++++++++++++++++++++-
>>  drivers/net/ethernet/ibm/ibmvnic.h |  3 +++
>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
>> index ba340aaff1b3..f344ccd68ad9 100644
>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>> @@ -2054,6 +2054,13 @@ static void __ibmvnic_reset(struct work_struct *work)
>>  
>>  	adapter = container_of(work, struct ibmvnic_adapter, ibmvnic_reset);
>>  
>> +	if (adapter->resetting) {
>> +		schedule_delayed_work(&adapter->ibmvnic_delayed_reset,
>> +				      IBMVNIC_RESET_DELAY);
>> +		return;
>> +	}
>> +
>> +	adapter->resetting = true;
>>  	reset_state = adapter->state;
> Is there some locking/serialisation around this?
>
> Otherwise that looks very racy. ie. two CPUs could both see
> adapter->resetting == false, then both set it to true, and then continue
> executing and stomp on each other.
>
> cheers

I agree there may be a race here. Thank you for reviewing.

I will address it in the next version.

