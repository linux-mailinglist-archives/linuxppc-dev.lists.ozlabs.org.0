Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 313032CF620
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 22:29:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnm6m62SfzDrX4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M5zpngFj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnm4y4C52zDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 08:27:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4L8EJK054643; Fri, 4 Dec 2020 16:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GwEwKUm9A9v7FngAYISLrNg1kRHE9dxNhDgV0n7dmXY=;
 b=M5zpngFjE3nCdxFA1vn6mEB1EToWtjgx/uXYF4flAXEvhkd3w9/x1/LKkQoe66HA7cI3
 yCi2g9enAujYHU8eA+ozAnrZyAnzBeNQy3DNNyfHNUjkmUclzdAwirv/aNrLBNrrbMzk
 lI1DWaCwXNFHOs55z/YWGHorUons4oqjL2ecUBqzIf08Ha4B0y6beZZqm8A4rEmEvLBy
 G3bITgZDmK3xhgdQ95YWi+4Q/fwklJKgg8a/czqil9n1/OL0QmGZSA4tLja2kOh1mKjB
 33kqZcWJN7qg8LYPfjZf/5zWL4bF0zEnssfEHHyvt+r0O9z3wvzEgleMUGDZtmI30/Ww YQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357vdu8s8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 16:27:25 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4LLqEt003053;
 Fri, 4 Dec 2020 21:27:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 355vrgdw7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 21:27:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4LQ9g17013006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 21:26:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5119212405A;
 Fri,  4 Dec 2020 21:26:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BB1F124055;
 Fri,  4 Dec 2020 21:26:08 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.73.174])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 21:26:08 +0000 (GMT)
Subject: Re: [PATCH v3 15/18] ibmvfc: send Cancel MAD down each hw scsi channel
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
 <20201203020806.14747-16-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <f0fde914-c9e5-4e15-9920-1fb250d28e3e@linux.vnet.ibm.com>
Date: Fri, 4 Dec 2020 15:26:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203020806.14747-16-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_09:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040117
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

On 12/2/20 8:08 PM, Tyrel Datwyler wrote:
> In general the client needs to send Cancel MADs and task management
> commands down the same channel as the command(s) intended to cancel or
> abort. The client assigns cancel keys per LUN and thus must send a
> Cancel down each channel commands were submitted for that LUN. Further,
> the client then must wait for those cancel completions prior to
> submitting a LUN RESET or ABORT TASK SET.
> 
> Add a cancel event pointer and cancel rsp iu storage to the
> ibmvfc_sub_queue struct such that the cancel routine can assign a cancel
> event to each applicable queue. When in legacy CRQ mode we fake treating
> it as a subqueue by using a subqueue struct allocated on the stack. Wait
> for completion of each submitted cancel.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 104 ++++++++++++++++++++++-----------
>  drivers/scsi/ibmvscsi/ibmvfc.h |  38 ++++++------
>  2 files changed, 90 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ec3db5a6baf3..e353b9e88104 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -2339,67 +2339,103 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
>  {
>  	struct ibmvfc_host *vhost = shost_priv(sdev->host);
>  	struct ibmvfc_event *evt, *found_evt;
> -	union ibmvfc_iu rsp;
> -	int rsp_rc = -EBUSY;
> +	struct ibmvfc_sub_queue *scrqs;
> +	struct ibmvfc_sub_queue legacy_crq;
> +	int rsp_rc = 0;
>  	unsigned long flags;
>  	u16 status;
> +	int cancel_cnt = 0;
> +	int num_hwq;
> +	int ret = 0;
> +	int i;
>  
>  	ENTER;
>  	spin_lock_irqsave(vhost->host->host_lock, flags);
> -	found_evt = NULL;
> -	list_for_each_entry(evt, &vhost->sent, queue) {
> -		if (evt->cmnd && evt->cmnd->device == sdev) {
> -			found_evt = evt;
> +	if (vhost->using_channels && vhost->scsi_scrqs.active_queues) {
> +		num_hwq = vhost->scsi_scrqs.active_queues;
> +		scrqs = vhost->scsi_scrqs.scrqs;
> +	} else {
> +		/* Use ibmvfc_sub_queue on the stack to fake legacy CRQ as a subqueue */
> +		num_hwq = 1;
> +		scrqs = &legacy_crq;
> +	}
> +
> +	for (i = 0; i < num_hwq; i++) {
> +		scrqs[i].cancel_event = NULL;
> +		found_evt = NULL;
> +		list_for_each_entry(evt, &vhost->sent, queue) {
> +			if (evt->cmnd && evt->cmnd->device == sdev && evt->hwq == i) {
> +				found_evt = evt;
> +				cancel_cnt++;
> +				break;
> +			}
> +		}
> +
> +		if (!found_evt)
> +			continue;
> +
> +		if (vhost->logged_in) {
> +			scrqs[i].cancel_event = ibmvfc_init_tmf(vhost, sdev, type);
> +			scrqs[i].cancel_event->hwq = i;
> +			scrqs[i].cancel_event->sync_iu = &scrqs[i].cancel_rsp;
> +			rsp_rc = ibmvfc_send_event(scrqs[i].cancel_event, vhost, default_timeout);
> +			if (rsp_rc)
> +				break;

It looks like if you have two outstanding commands, on two different hwqs, and you succeed
in sending a cancel for the first hwq but fail sending it for the second hwq due to
something happening like a xport event of some sort, then you would end up falling down
into free_events where you'd call ibmvfc_free_event which will do a list_add_tail to add
the event to the free list without having even pulled the event off the sent list, which
will result in list corruption as now the free list and sent list will be intermingled.
It would probably be better to only free the events if you never sent them or if you
are sure they completed. So, you might need to have to wait for the completion of
the cancel events that did get sent, which would likely be completed via purge_all.


> +		} else {
> +			rsp_rc = -EBUSY;
>  			break;
>  		}
>  	}
>  
> -	if (!found_evt) {
> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> +
> +	if (!cancel_cnt) {
>  		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
>  			sdev_printk(KERN_INFO, sdev, "No events found to cancel\n");
> -		spin_unlock_irqrestore(vhost->host->host_lock, flags);
>  		return 0;
>  	}
>  
> -	if (vhost->logged_in) {
> -		evt = ibmvfc_init_tmf(vhost, sdev, type);
> -		evt->sync_iu = &rsp;
> -		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
> -	}
> -
> -	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> -
>  	if (rsp_rc != 0) {
>  		sdev_printk(KERN_ERR, sdev, "Failed to send cancel event. rc=%d\n", rsp_rc);
>  		/* If failure is received, the host adapter is most likely going
>  		 through reset, return success so the caller will wait for the command
>  		 being cancelled to get returned */
> -		return 0;
> +		goto free_events;
>  	}
>  
>  	sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands.\n");
>  
> -	wait_for_completion(&evt->comp);
> -	status = be16_to_cpu(rsp.mad_common.status);
> -	spin_lock_irqsave(vhost->host->host_lock, flags);
> -	ibmvfc_free_event(evt);
> -	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> +	for (i = 0; i < num_hwq; i++) {
> +		if (!scrqs[i].cancel_event)
> +			continue;
>  
> -	if (status != IBMVFC_MAD_SUCCESS) {
> -		sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
> -		switch (status) {
> -		case IBMVFC_MAD_DRIVER_FAILED:
> -		case IBMVFC_MAD_CRQ_ERROR:
> -			/* Host adapter most likely going through reset, return success to
> -			 the caller will wait for the command being cancelled to get returned */
> -			return 0;
> -		default:
> -			return -EIO;
> -		};
> +		wait_for_completion(&scrqs[i].cancel_event->comp);
> +		status = be16_to_cpu(scrqs[i].cancel_rsp.mad_common.status);
> +
> +		if (status != IBMVFC_MAD_SUCCESS) {
> +			sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
> +			switch (status) {
> +			case IBMVFC_MAD_DRIVER_FAILED:
> +			case IBMVFC_MAD_CRQ_ERROR:
> +				/* Host adapter most likely going through reset, return success to
> +				 the caller will wait for the command being cancelled to get returned */
> +				goto free_events;

Similar comment here... What about the rest of the outstanding cancel commands? Do you need
to wait for those to complete before freeing them?

> +			default:
> +				ret = -EIO;
> +				goto free_events;
> +			};
> +		}
>  	}
>  
>  	sdev_printk(KERN_INFO, sdev, "Successfully cancelled outstanding commands\n");
> -	return 0;
> +free_events:
> +	spin_lock_irqsave(vhost->host->host_lock, flags);
> +	for (i = 0; i < num_hwq; i++)
> +		if (scrqs[i].cancel_event)
> +			ibmvfc_free_event(scrqs[i].cancel_event);
> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> +
> +	return ret;
>  }
>  
>  /**



-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

