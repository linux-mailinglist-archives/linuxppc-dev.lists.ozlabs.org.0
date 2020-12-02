Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AAB2CC508
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 19:30:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmSFQ5SZmzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 05:30:18 +1100 (AEDT)
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
 header.s=pp1 header.b=cUapUli4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmSBS33nMzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 05:27:43 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2I9hmh099761; Wed, 2 Dec 2020 13:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5LaODwLC6YPp/x+bscelk6pXJv+ND+Uc0TuABB3Q0y0=;
 b=cUapUli4OjiIIc6L9xUU7EJRWm6eb2uU/adSMJ5XHHsnDA81Za7GHJ09RZcgn74VnVKe
 WwGuq04nH609M3GuTpgFOTofBYPoEDu/K5guJ+h+ui9gJOXbzavtAUR4rr3Kbw60ImZn
 H6QDs8l//IGeXp5wCbJrzZDfHcebIdn5CPm1pS+AxLsL/a092hg8dCzHipKas13owcQE
 iw9afu2CC8r2XSvYyIIOTYpwH6mtnb2k2ZpZln6M7FaplPOqbgE26QbbJSfWOkivRvQT
 iBwdgUg4isnxrQ/AVHscGukV3dmqDbCjhZtM6O0SbScqD83XSb5TjTcnP7Le4iaDswHS cA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 356741k3m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 13:27:39 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2IRWme031494;
 Wed, 2 Dec 2020 18:27:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 354ysukhc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:27:38 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2IRcl81835644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 18:27:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A6C2124052;
 Wed,  2 Dec 2020 18:27:38 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9AD124053;
 Wed,  2 Dec 2020 18:27:37 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.78.151])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 18:27:37 +0000 (GMT)
Subject: Re: [PATCH v2 15/17] ibmvfc: send Cancel MAD down each hw scsi channel
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-16-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <21a7c970-2184-0524-5b42-1920eaa422a2@linux.vnet.ibm.com>
Date: Wed, 2 Dec 2020 12:27:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005329.4538-16-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020103
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

On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
> In general the client needs to send Cancel MADs and task management
> commands down the same channel as the command(s) intended to cancel or
> abort. The client assigns cancel keys per LUN and thus must send a
> Cancel down each channel commands were submitted for that LUN. Further,
> the client then must wait for those cancel completions prior to
> submitting a LUN RESET or ABORT TASK SET.
> 
> Allocate event pointers for each possible scsi channel and assign an
> event for each channel that requires a cancel. Wait for completion each
> submitted cancel.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 106 +++++++++++++++++++++------------
>  1 file changed, 68 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 0b6284020f06..97e8eed04b01 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -2339,32 +2339,52 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
>  {
>  	struct ibmvfc_host *vhost = shost_priv(sdev->host);
>  	struct ibmvfc_event *evt, *found_evt;
> -	union ibmvfc_iu rsp;
> -	int rsp_rc = -EBUSY;
> +	struct ibmvfc_event **evt_list;
> +	union ibmvfc_iu *rsp;
> +	int rsp_rc = 0;
>  	unsigned long flags;
>  	u16 status;
> +	int num_hwq = 1;
> +	int i;
> +	int ret = 0;
>  
>  	ENTER;
>  	spin_lock_irqsave(vhost->host->host_lock, flags);
> -	found_evt = NULL;
> -	list_for_each_entry(evt, &vhost->sent, queue) {
> -		if (evt->cmnd && evt->cmnd->device == sdev) {
> -			found_evt = evt;
> -			break;
> +	if (vhost->using_channels && vhost->scsi_scrqs.active_queues)
> +		num_hwq = vhost->scsi_scrqs.active_queues;
> +
> +	evt_list = kcalloc(num_hwq, sizeof(*evt_list), GFP_KERNE> +	rsp = kcalloc(num_hwq, sizeof(*rsp), GFP_KERNEL);

Can't this just go on the stack? We don't want to be allocating memory
during error recovery. Or, alternatively, you could put this in the
vhost structure and protect it with a mutex. We only have enough events
to single thread these anyway.

> +
> +	for (i = 0; i < num_hwq; i++) {
> +		sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands on queue %d.\n", i);

Prior to this patch, if there was nothing outstanding to the device and cancel_all was called,
no messages would get printed. This is changing that behavior. Is that intentional? Additionally,
it looks like this will get a lot more vebose, logging a message for each hw queue, regardless
of whether there was anything outstanding. Perhaps you want to move this down to after the check
for !found_evt?

> +
> +		found_evt = NULL;
> +		list_for_each_entry(evt, &vhost->sent, queue) {
> +			if (evt->cmnd && evt->cmnd->device == sdev && evt->hwq == i) {
> +				found_evt = evt;
> +				break;
> +			}
>  		}
> -	}
>  



-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

