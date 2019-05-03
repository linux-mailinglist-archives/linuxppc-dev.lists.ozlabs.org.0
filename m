Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CD1258E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 02:36:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wCqy4tPwzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:36:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wCpR4rJPzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 10:35:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x430Wde4106403
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 20:35:22 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s876pygrs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 20:35:22 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Fri, 3 May 2019 01:35:22 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 May 2019 01:35:19 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x430ZH4m5439934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 May 2019 00:35:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CDABC605F;
 Fri,  3 May 2019 00:35:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10CB0C6057;
 Fri,  3 May 2019 00:35:15 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.163.254])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 May 2019 00:35:15 +0000 (GMT)
Subject: Re: [PATCH 2/3] ibmvscsi: redo driver work thread to use enum action
 states
To: Brian King <brking@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20190502004729.19962-1-tyreld@linux.ibm.com>
 <20190502004729.19962-2-tyreld@linux.ibm.com>
 <5515ab01-f2d4-d925-76ff-7fa8416b86f8@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Thu, 2 May 2019 17:35:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5515ab01-f2d4-d925-76ff-7fa8416b86f8@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050300-0016-0000-0000-000009A99B6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011037; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197735; UDB=6.00628228; IPR=6.00978591; 
 MB=3.00026706; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-03 00:35:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050300-0017-0000-0000-0000430B2898
Message-Id: <8d298455-3326-4830-7944-3f3f4597fdeb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905030002
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
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/02/2019 02:43 PM, Brian King wrote:
> On 5/1/19 7:47 PM, Tyrel Datwyler wrote:
>> From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>>
>> The current implemenation relies on two flags in the drivers private host
>> structure to signal the need for a host reset or to reenable the CRQ after a
>> LPAR migration. This patch does away with those flags and introduces a single
>> action flag and defined enums for the supported kthread work actions. Lastly,
>> the if/else logic is replaced with a switch statement.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvscsi.c | 57 +++++++++++++++++++++-----------
>>  drivers/scsi/ibmvscsi/ibmvscsi.h |  9 +++--
>>  2 files changed, 45 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> index 1c37244f16a0..683139e6c63f 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
>> @@ -828,7 +828,7 @@ static void ibmvscsi_reset_host(struct ibmvscsi_host_data *hostdata)
>>  	atomic_set(&hostdata->request_limit, 0);
>>  
>>  	purge_requests(hostdata, DID_ERROR);
>> -	hostdata->reset_crq = 1;
>> +	hostdata->action = IBMVSCSI_HOST_ACTION_RESET;
>>  	wake_up(&hostdata->work_wait_q);
>>  }
>>  
>> @@ -1797,7 +1797,7 @@ static void ibmvscsi_handle_crq(struct viosrp_crq *crq,
>>  			/* We need to re-setup the interpartition connection */
>>  			dev_info(hostdata->dev, "Re-enabling adapter!\n");
>>  			hostdata->client_migrated = 1;
>> -			hostdata->reenable_crq = 1;
>> +			hostdata->action = IBMVSCSI_HOST_ACTION_REENABLE;
>>  			purge_requests(hostdata, DID_REQUEUE);
>>  			wake_up(&hostdata->work_wait_q);
>>  		} else {
>> @@ -2118,26 +2118,32 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
>>  
>>  static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>>  {
>> +	unsigned long flags;
>>  	int rc;
>>  	char *action = "reset";
>>  
>> -	if (hostdata->reset_crq) {
>> -		smp_rmb();
>> -		hostdata->reset_crq = 0;
>> -
>> +	spin_lock_irqsave(hostdata->host->host_lock, flags);
>> +	switch (hostdata->action) {
>> +	case IBMVSCSI_HOST_ACTION_NONE:
>> +		break;
>> +	case IBMVSCSI_HOST_ACTION_RESET:
>>  		rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
> 
> Looks like you are now calling ibmvscsi_reset_crq_queue with the host_lock held.
> However, ibmvscsi_reset_crq_queue can call msleep.

Good catch. I remember thinking that needed to run lockless, but clearly failed
to release and re-grab the lock around that call.

-Tyrel

> 
> This had been implemented as separate reset_crq and reenable_crq fields
> so that it could run lockless. I'm not opposed to changing this to a single
> field in general, we just need to be careful where we are adding locking.
> 
> Thanks,
> 
> Brian
> 

