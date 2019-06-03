Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBA33BF8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:33:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hrvf1RxkzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:33:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HrtG4JtyzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:31:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53NM6vv089988; Mon, 3 Jun 2019 19:31:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swcx4gp2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 19:31:44 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x53NMfpX090962;
 Mon, 3 Jun 2019 19:31:44 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swcx4gp2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 19:31:44 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x53HYdGb030561;
 Mon, 3 Jun 2019 17:36:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 2suh093trb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2019 17:36:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x53NUR7H36110428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 23:30:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF4DAC060;
 Mon,  3 Jun 2019 23:30:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C153AC05F;
 Mon,  3 Jun 2019 23:30:26 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.191.102])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 23:30:25 +0000 (GMT)
Subject: Re: [PATCH] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20190531185306.41290-1-natechancellor@gmail.com>
 <87blzgnvhx.fsf@concordia.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Message-ID: <031eaca1-bb6d-a14f-bb66-a520219549e4@linux.vnet.ibm.com>
Date: Mon, 3 Jun 2019 16:30:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87blzgnvhx.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030157
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/02/2019 03:15 AM, Michael Ellerman wrote:
> Hi Nathan,
> 
> Nathan Chancellor <natechancellor@gmail.com> writes:
>> clang warns:
>>
>> drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
>> uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>>         case IBMVSCSI_HOST_ACTION_NONE:
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
>> here
>>         if (rc) {
>>             ^~
>>
>> Initialize rc to zero so that the atomic_set and dev_err statement don't
>> trigger for the cases that just break.
>>
>> Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/502
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> index 727c31dc11a0..6714d8043e62 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> @@ -2118,7 +2118,7 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
>>  static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>>  {
>>  	unsigned long flags;
>> -	int rc;
>> +	int rc = 0;
>>  	char *action = "reset";
>>  
>>  	spin_lock_irqsave(hostdata->host->host_lock, flags);
> 
> It's always preferable IMHO to keep any initialisation as localised as
> possible, so that the compiler can continue to warn about uninitialised
> usages elsewhere. In this case that would mean doing the rc = 0 in the
> switch, something like:
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index 727c31dc11a0..7ee5755cf636 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -2123,9 +2123,6 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>  
>         spin_lock_irqsave(hostdata->host->host_lock, flags);
>         switch (hostdata->action) {
> -       case IBMVSCSI_HOST_ACTION_NONE:
> -       case IBMVSCSI_HOST_ACTION_UNBLOCK:
> -               break;
>         case IBMVSCSI_HOST_ACTION_RESET:
>                 spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>                 rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
> @@ -2142,7 +2139,10 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>                 if (!rc)
>                         rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
>                 break;
> +       case IBMVSCSI_HOST_ACTION_NONE:
> +       case IBMVSCSI_HOST_ACTION_UNBLOCK:
>         default:
> +               rc = 0;
>                 break;
>         }
> 
> 
> But then that makes me wonder if that's actually correct?
> 
> If we get an action that we don't recognise should we just throw it away
> like that? (by doing hostdata->action = IBMVSCSI_HOST_ACTION_NONE). Tyrel?

On initial pass I was ok with this, but after thinking on it I think it is more
subtle.

The right approach is to set rc = 0 for HOST_ACTION_UNBLOCK as we want to fall
through. For HOST_ACTION_NONE and default we need to return directly from the
function.

-Tyrel

> 
> cheers
> 

