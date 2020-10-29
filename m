Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1B29E0BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 02:30:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM7D10CJYzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 12:30:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I5wVyzUM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM7BC36TMzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 12:28:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T11IjI175015; Wed, 28 Oct 2020 21:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8d3tL3+CWG6reyVHWOsX5v+g3AMRGFiqPzn7EwvoYgc=;
 b=I5wVyzUMz6OYb3aGV+CfyOohDqyn0zHNhJo51cIEn/U/tQtMT1EZVf9mbbhFs2GqOjFo
 W0LSS3A9nOz+gpwGRn3RA3C8VOW3L65yddYmCoP2sAznLW+19/L8yuoNiQ4CnArlJBnU
 mOlD9DYqFSTkX70u+2Vp7xwl7U6JUTczC1nZ9LabLkswCbPTDf2h5MYtTmAaTb/H0L+4
 TrVHZiYO/Jg+UvviVKmJgiF4pfmWVmQe//Jr29B/HQ3qqs3RwJ2d+SDr2io9kqFQhXm7
 5O1u6H7nCzCUNObXHfoEMYaVQDFz2Y0vodBVgAtiCuCKSB6BPw1loEIKbW9/hdXqA1qV vw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34feghhhhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 21:28:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T1QbdE016052;
 Thu, 29 Oct 2020 01:28:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 34etf94a4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 01:28:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T1SNAY14025070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 01:28:23 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07F7FC605A;
 Thu, 29 Oct 2020 01:28:23 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8228DC605D;
 Thu, 29 Oct 2020 01:28:21 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.55.172])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 01:28:21 +0000 (GMT)
Subject: Re: [PATCH] ibmvscsi: fix race potential race after loss of transport
To: Michael Ellerman <mpe@ellerman.id.au>,
 james.bottomley@hansenpartnership.com
References: <20201025001355.4527-1-tyreld@linux.ibm.com>
 <87o8knvsb1.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <d527dffd-1af2-7da0-d1f1-1f192a537aed@linux.ibm.com>
Date: Wed, 28 Oct 2020 18:28:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87o8knvsb1.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290000
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/20 10:21 PM, Michael Ellerman wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> After a loss of tranport due to an adatper migration or crash/disconnect from
>> the host partner there is a tiny window where we can race adjusting the
>> request_limit of the adapter. The request limit is atomically inc/dec to track
>> the number of inflight requests against the allowed limit of our VIOS partner.
>> After a transport loss we set the request_limit to zero to reflect this state.
>> However, there is a window where the adapter may attempt to queue a command
>> because the transport loss event hasn't been fully processed yet and
>> request_limit is still greater than zero. The hypercall to send the event will
>> fail and the error path will increment the request_limit as a result. If the
>> adapter processes the transport event prior to this increment the request_limit
>> becomes out of sync with the adapter state and can result in scsi commands being
>> submitted on the now reset connection prior to an SRP Login resulting in a
>> protocol violation.
>>
>> Fix this race by protecting request_limit with the host lock when changing the
>> value via atomic_set() to indicate no transport.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvscsi.c | 36 +++++++++++++++++++++++---------
>>  1 file changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> index b1f3017b6547..188ed75417a5 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> @@ -806,6 +806,22 @@ static void purge_requests(struct ibmvscsi_host_data *hostdata, int error_code)
>>  	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>>  }
>>  
>> +/**
>> + * ibmvscsi_set_request_limit - Set the adapter request_limit in response to
>> + * an adapter failure, reset, or SRP Login. Done under host lock to prevent
>> + * race with scsi command submission.
>> + * @hostdata:	adapter to adjust
>> + * @limit:	new request limit
>> + */
>> +static void ibmvscsi_set_request_limit(struct ibmvscsi_host_data *hostdata, int limit)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(hostdata->host->host_lock, flags);
>> +	atomic_set(&hostdata->request_limit, limit);
>> +	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>> +}
>> +
>>  /**
>>   * ibmvscsi_reset_host - Reset the connection to the server
>>   * @hostdata:	struct ibmvscsi_host_data to reset
> ...
>> @@ -2137,12 +2153,12 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>>  	}
>>  
>>  	hostdata->action = IBMVSCSI_HOST_ACTION_NONE;
>> +	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
> 
> You drop the lock ...
> 
>>  	if (rc) {
>> -		atomic_set(&hostdata->request_limit, -1);
>> +		ibmvscsi_set_request_limit(hostdata, -1);
> 
> .. then retake it, then drop it again in ibmvscsi_set_request_limit().
> 
> Which introduces the possibility that something else gets the lock
> before you can set the limit to -1.
> 
> I'm not sure that's a bug, but it's not obviously correct either?

Yeah, I'd already moved the request_limit update into its own function before I
got to this case which made me a bit uneasy when I realized I had to drop the
lock because my new function takes the lock. However, we only need to protect
ourselves from from racing with queuecommand() which is locked for its entire
call. Further, if we've gotten here it means we were either resetting or
re-enabling the adapter which would have already set request_limit to zero. At
this point the transport was already gone and we've further failed to reset it.
Also, we've blocked any new scsi requests at this point.

-Tyrel

> 
> cheers
> 
>>  		dev_err(hostdata->dev, "error after %s\n", action);
>>  	}
>> -	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>>  
>>  	scsi_unblock_requests(hostdata->host);
>>  }

