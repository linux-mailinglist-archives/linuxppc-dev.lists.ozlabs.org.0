Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF32F3C7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 23:58:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFmGD4ckfzDrR3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:58:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kronnr2g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFm9l1wPDzDrQt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 09:54:44 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10CMfcBH081848; Tue, 12 Jan 2021 17:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VySuknCdRYrl/Kuiqjz7iBvWmozseQlh3kZ9bh90Zm0=;
 b=kronnr2g7UZOx0/ns/LbuSkG/pkCXeoJ3M+aG52UqpxyhjDt33yhiNInMK8Mx4Z+U3oW
 z4ZCkWZ6eHzh73VQPgTHTQlmcheVntCCXUCX55adBFlyuf3CaHHJDtGgPK4nEhenPUHC
 7sdQsjukH2jU+GiPBsjtv82XmbZ7wmc23bH9ocsF6BWQGkP5RZa9QffZitlVNXgizBug
 eYhoXeVcwT78j3raiFGjyiZW1wzMZj9K6mlN14GYeMdJrh0Fyr8cU1kwTE8E8bKgWojG
 5MMNRQwcsryYBhj+i379a3iGCEjzZzRnsIc2o+rkuhjkg30BFCyTTPnkL4ZrMBrkusI6 YQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 361mshr6ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 17:54:41 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10CMhVqm015346;
 Tue, 12 Jan 2021 22:54:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 35y4491a4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 22:54:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10CMscHC11534774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 22:54:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67D4B6E5B8;
 Tue, 12 Jan 2021 22:54:38 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D987D6E5B7;
 Tue, 12 Jan 2021 22:54:37 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.156.88])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jan 2021 22:54:37 +0000 (GMT)
Subject: Re: [PATCH v4 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
 <20210111231225.105347-2-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <0525bee7-433f-dcc7-9e35-e8706d6edee5@linux.vnet.ibm.com>
Date: Tue, 12 Jan 2021 16:54:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111231225.105347-2-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_19:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 clxscore=1011
 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120128
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 james.smart@broadcom.com, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/11/21 5:12 PM, Tyrel Datwyler wrote:
> Introduce several new vhost fields for managing MQ state of the adapter
> as well as initial defaults for MQ enablement.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
>  drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ba95438a8912..9200fe49c57e 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
>  	.max_sectors = IBMVFC_MAX_SECTORS,
>  	.shost_attrs = ibmvfc_attrs,
>  	.track_queue_depth = 1,
> +	.host_tagset = 1,

This doesn't seem right. You are setting host_tagset, which means you want a
shared, host wide, tag set for commands. It also means that the total
queue depth for the host is can_queue. However, it looks like you are allocating
max_requests events for each sub crq, which means you are over allocating memory.

Looking at this closer, we might have bigger problems. There is a host wide
max number of commands that the VFC host supports, which gets returned on
NPIV Login. This value can change across a live migration event. 

The ibmvfc driver, which does the same thing the lpfc driver does, modifies
can_queue on the scsi_host *after* the tag set has been allocated. This looks
to be a concern with ibmvfc, not sure about lpfc, as it doesn't look like
we look at can_queue once the tag set is setup, and I'm not seeing a good way
to dynamically change the host queue depth once the tag set is setup. 

Unless I'm missing something, our best options appear to either be to implement
our own host wide busy reference counting, which doesn't sound very good, or
we need to add some API to block / scsi that allows us to dynamically change
can_queue.

Thanks,

Brian


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

