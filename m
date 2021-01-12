Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3DA2F2E51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 12:48:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFTNg6fzYzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 22:48:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFTJN3nXqzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 22:44:30 +1100 (AEDT)
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DFTBH5127z67Zll;
 Tue, 12 Jan 2021 19:39:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 12 Jan 2021 12:44:24 +0100
Received: from [10.210.171.61] (10.210.171.61) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 12 Jan 2021 11:44:23 +0000
Subject: Re: [PATCH v4 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 <james.bottomley@hansenpartnership.com>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
 <20210111231225.105347-2-tyreld@linux.ibm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <b9b2f3c0-0d88-6c64-8b45-fe2ce6d581fd@huawei.com>
Date: Tue, 12 Jan 2021 11:43:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210111231225.105347-2-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.171.61]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
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

On 11/01/2021 23:12, Tyrel Datwyler wrote:
> Introduce several new vhost fields for managing MQ state of the adapter
> as well as initial defaults for MQ enablement.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>   drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
>   drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ba95438a8912..9200fe49c57e 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
>   	.max_sectors = IBMVFC_MAX_SECTORS,
>   	.shost_attrs = ibmvfc_attrs,
>   	.track_queue_depth = 1,
> +	.host_tagset = 1,

Good to see another user :)

I didn't check the whole series very thoroughly, but I guess that you 
only need to set this when shost->nr_hw_queues > 1. Having said that, it 
should be fine when shost->nr_hw_queues = 0 or 1.

Thanks,
John

>   };
>   
>   /**
> @@ -5290,6 +5291,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>   	shost->max_sectors = IBMVFC_MAX_SECTORS;
>   	shost->max_cmd_len = IBMVFC_MAX_CDB_LEN;
>   	shost->unique_id = shost->host_no;
> +	shost->nr_hw_queues = IBMVFC_MQ ? IBMVFC_SCSI_HW_QUEUES : 1;
>   
>   	vhost = shost_priv(shost);
>   	INIT_LIST_HEAD(&vhost->targets);
> @@ -5300,6 +5302,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>   	vhost->partition_number = -1;
>   	vhost->log_level = log_level;
>   	vhost->task_set = 1;
> +
> +	vhost->mq_enabled = IBMVFC_MQ;
> +	vhost->client_scsi_channels = IBMVFC_SCSI_CHANNELS;
> +	vhost->using_channels = 0;
> +	vhost->do_enquiry = 1;
> +
>   	strcpy(vhost->partition_name, "UNKNOWN");
>   	init_waitqueue_head(&vhost->work_wait_q);
>   	init_waitqueue_head(&vhost->init_wait_q);
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
> index 632e977449c5..dd6d89292867 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.h
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.h
> @@ -41,6 +41,11 @@
>   #define IBMVFC_DEFAULT_LOG_LEVEL	2
>   #define IBMVFC_MAX_CDB_LEN		16
>   #define IBMVFC_CLS3_ERROR		0
> +#define IBMVFC_MQ			0
> +#define IBMVFC_SCSI_CHANNELS		0
> +#define IBMVFC_SCSI_HW_QUEUES		1
> +#define IBMVFC_MIG_NO_SUB_TO_CRQ	0
> +#define IBMVFC_MIG_NO_N_TO_M		0
>   
>   /*
>    * Ensure we have resources for ERP and initialization:
> @@ -840,6 +845,10 @@ struct ibmvfc_host {
>   	int delay_init;
>   	int scan_complete;
>   	int logged_in;
> +	int mq_enabled;
> +	int using_channels;
> +	int do_enquiry;
> +	int client_scsi_channels;
>   	int aborting_passthru;
>   	int events_to_log;
>   #define IBMVFC_AE_LINKUP	0x0001
> 

