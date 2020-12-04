Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2F2CF012
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:53:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnbLb0wGdzDrgP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BVY6HWM8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnbJL49R5zDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:51:46 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4EpAtC131585; Fri, 4 Dec 2020 09:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ai6L4sa0RgQ9M3WKqdb91X2AvRLvdJvZHP9oZzdHkKU=;
 b=BVY6HWM8bpj9i21VQwmOSnoyxFcyHkd6WPnTqvr3yDdJ3tZjPW+2b8lPNXqmOMDRJrv6
 EsbcZg53CIY79VE3Ve5xyYl9+IArsWhExi9Z32XLbxehkWEM3Ty0y3Vbj4ld5BC0TguI
 +QiLCh4VpuKmB0q2YJ38IYetEBkrBLVFlon4LGZKfnD4g9Bcsdiuyu8wVm0GUSGH/2pM
 j8nc5EAQ4Rm/8UYBq3BjOjr7keQDipRbJ114na0PzAc1Q9U8Xbmrl+VTJBt1b0iUTd7Q
 kanJR2c/v0Lzx2t7JJ/shbwwBMslFMTldey0+OvWT4F+JJvRao2TYmECB8VJrxfdND4Y /w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357pt9rwxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 09:51:43 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4EojeM028563;
 Fri, 4 Dec 2020 14:51:41 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 355vrgb7yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:51:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4Epds019530226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 14:51:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB55A78064;
 Fri,  4 Dec 2020 14:51:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BAE37805C;
 Fri,  4 Dec 2020 14:51:39 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.73.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 14:51:39 +0000 (GMT)
Subject: Re: [PATCH v3 06/18] ibmvfc: add handlers to drain and complete
 Sub-CRQ responses
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
 <20201203020806.14747-7-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <3fe8683a-47f6-8713-762a-02c57c2e4ec2@linux.vnet.ibm.com>
Date: Fri, 4 Dec 2020 08:51:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203020806.14747-7-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_04:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040080
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

On 12/2/20 8:07 PM, Tyrel Datwyler wrote:
> The logic for iterating over the Sub-CRQ responses is similiar to that
> of the primary CRQ. Add the necessary handlers for processing those
> responses.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 80 ++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index e082935f56cf..b61ae1df21e5 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -3381,6 +3381,86 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_sub_queue *scrq, int enable)
>  	return rc;
>  }
>  
> +static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
> +{
> +	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
> +	unsigned long flags;
> +
> +	switch (crq->valid) {
> +	case IBMVFC_CRQ_CMD_RSP:
> +		break;
> +	case IBMVFC_CRQ_XPORT_EVENT:
> +		return;
> +	default:
> +		dev_err(vhost->dev, "Got and invalid message type 0x%02x\n", crq->valid);
> +		return;
> +	}
> +
> +	/* The only kind of payload CRQs we should get are responses to
> +	 * things we send. Make sure this response is to something we
> +	 * actually sent
> +	 */
> +	if (unlikely(!ibmvfc_valid_event(&vhost->pool, evt))) {
> +		dev_err(vhost->dev, "Returned correlation_token 0x%08llx is invalid!\n",
> +			crq->ioba);
> +		return;
> +	}
> +
> +	if (unlikely(atomic_read(&evt->free))) {
> +		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
> +			crq->ioba);
> +		return;
> +	}
> +
> +	del_timer(&evt->timer);
> +	list_del(&evt->queue);
> +	ibmvfc_trc_end(evt);> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);

You can't do this here... You are grabbing the host lock in ibmvfc_drain_sub_crq
and saving the irqflags to a local in that function, then doing a spin_unlock_irqrestore
and restoring irqflags using an uninitialized local in this function...

I'm assuming this will get sorted out with the locking changes we've been discussing off-list...


> +	evt->done(evt);
> +	spin_lock_irqsave(vhost->host->host_lock, flags);
> +}
> +
> +static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_sub_queue *scrq)
> +{
> +	struct ibmvfc_crq *crq;
> +
> +	crq = &scrq->msgs[scrq->cur].crq;
> +	if (crq->valid & 0x80) {
> +		if (++scrq->cur == scrq->size)
> +			scrq->cur = 0;
> +		rmb();
> +	} else
> +		crq = NULL;
> +
> +	return crq;
> +}
> +
> +static void ibmvfc_drain_sub_crq(struct ibmvfc_sub_queue *scrq)
> +{
> +	struct ibmvfc_crq *crq;
> +	unsigned long flags;
> +	int done = 0;
> +
> +	spin_lock_irqsave(scrq->vhost->host->host_lock, flags);
> +	while (!done) {
> +		while ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
> +			ibmvfc_handle_scrq(crq, scrq->vhost);
> +			crq->valid = 0;
> +			wmb();
> +		}
> +
> +		ibmvfc_toggle_scrq_irq(scrq, 1);
> +		if ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
> +			ibmvfc_toggle_scrq_irq(scrq, 0);
> +			ibmvfc_handle_scrq(crq, scrq->vhost);
> +			crq->valid = 0;
> +			wmb();
> +		} else
> +			done = 1;
> +	}
> +	spin_unlock_irqrestore(scrq->vhost->host->host_lock, flags);
> +}
> +
>  /**
>   * ibmvfc_init_tgt - Set the next init job step for the target
>   * @tgt:		ibmvfc target struct
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

