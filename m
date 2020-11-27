Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C52C6B3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 19:04:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjMw615tbzDr8g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 05:04:38 +1100 (AEDT)
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
 header.s=pp1 header.b=Qg2MvVVb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjMb33HGdzDsMM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 04:49:51 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ARHWHC8191202; Fri, 27 Nov 2020 12:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lw//1hnaHCw0Ms3v96DBZHMj7zAqVVcPjJ5bPnOhKw4=;
 b=Qg2MvVVb40przIPQm769Fp84wImYTZWXN29RPgiwEngL2VA2QrE16kzo+tBL1k0i0gWj
 WeblsDZa2D4Uk/bylofl50nMlxy0nl5oSztBRIptE/z99l19hxDkl+9x5lH0MnOA29lt
 A7zx9M6uDoABxuhn+0ypNPmyVlhyznhQ4jcWrnigQZtfDfEeLvCZSWxUrJVn1V87tfnh
 ufPickmHdyW5xCc6f16Fm9T6zonAWXBiHryNsgIBTN7iE7pH6fqrhTTzO5vWaCkqnbbh
 dbV+ssQc8f+UtqDV3Sgrq6hNm13vYvA1BEzzrBtTVkKnD9SBapj0JkdOOLBxwopN4N3O /g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35335dw1s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 12:49:49 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ARHgB4X030028;
 Fri, 27 Nov 2020 17:49:48 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 34xthac1jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 17:49:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ARHnek437290418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 17:49:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7BB9C6055;
 Fri, 27 Nov 2020 17:49:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FC50C605D;
 Fri, 27 Nov 2020 17:49:46 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.79.105])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 17:49:46 +0000 (GMT)
Subject: Re: [PATCH 09/13] ibmvfc: implement channel enquiry and setup commands
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
 <20201126014824.123831-10-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <5f873855-fdc2-4da4-a516-4db7b5236a48@linux.vnet.ibm.com>
Date: Fri, 27 Nov 2020 11:49:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201126014824.123831-10-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_10:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=2 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270099
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

On 11/25/20 7:48 PM, Tyrel Datwyler wrote:
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c

> @@ -4462,6 +4464,118 @@ static void ibmvfc_discover_targets(struct ibmvfc_host *vhost)
>  		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
>  }
>  
> +static void ibmvfc_channel_setup_done(struct ibmvfc_event *evt)
> +{
> +	struct ibmvfc_host *vhost = evt->vhost;
> +	u32 mad_status = be16_to_cpu(evt->xfer_iu->channel_setup.common.status);
> +	int level = IBMVFC_DEFAULT_LOG_LEVEL;
> +
> +	ibmvfc_free_event(evt);
> +
> +	switch (mad_status) {
> +	case IBMVFC_MAD_SUCCESS:
> +		ibmvfc_dbg(vhost, "Channel Setup succeded\n");
> +		vhost->do_enquiry = 0;
> +		break;
> +	case IBMVFC_MAD_FAILED:
> +		level += ibmvfc_retry_host_init(vhost);
> +		ibmvfc_log(vhost, level, "Channel Setup failed\n");
> +		fallthrough;
> +	case IBMVFC_MAD_DRIVER_FAILED:
> +		return;
> +	default:
> +		dev_err(vhost->dev, "Invalid Channel Setup response: 0x%x\n",
> +			mad_status);
> +		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
> +		return;
> +	}
> +
> +	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
> +	wake_up(&vhost->work_wait_q);
> +}
> +
> +static void ibmvfc_channel_setup(struct ibmvfc_host *vhost)
> +{
> +	struct ibmvfc_channel_setup_mad *mad;
> +	struct ibmvfc_channel_setup *setup_buf = vhost->channel_setup_buf;
> +	struct ibmvfc_event *evt = ibmvfc_get_event(vhost);
> +
> +	memset(setup_buf, 0, sizeof(*setup_buf));
> +	setup_buf->flags = cpu_to_be32(IBMVFC_CANCEL_CHANNELS);
> +
> +	ibmvfc_init_event(evt, ibmvfc_channel_setup_done, IBMVFC_MAD_FORMAT);
> +	mad = &evt->iu.channel_setup;
> +	memset(mad, 0, sizeof(*mad));
> +	mad->common.version = cpu_to_be32(1);
> +	mad->common.opcode = cpu_to_be32(IBMVFC_CHANNEL_SETUP);
> +	mad->common.length = cpu_to_be16(sizeof(*mad));
> +	mad->buffer.va = cpu_to_be64(vhost->channel_setup_dma);
> +	mad->buffer.len = cpu_to_be32(sizeof(*vhost->channel_setup_buf));
> +
> +	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT_WAIT);
> +
> +	if (!ibmvfc_send_event(evt, vhost, default_timeout))
> +		ibmvfc_dbg(vhost, "Sent channel setup\n");
> +	else
> +		ibmvfc_link_down(vhost, IBMVFC_LINK_DOWN);
> +}
> +
> +static void ibmvfc_channel_enquiry_done(struct ibmvfc_event *evt)
> +{
> +	struct ibmvfc_host *vhost = evt->vhost;
> +	struct ibmvfc_channel_enquiry *rsp = &evt->xfer_iu->channel_enquiry;
> +	u32 mad_status = be16_to_cpu(rsp->common.status);
> +	int level = IBMVFC_DEFAULT_LOG_LEVEL;
> +
> +	switch (mad_status) {
> +	case IBMVFC_MAD_SUCCESS:
> +		ibmvfc_dbg(vhost, "Channel Enquiry succeeded\n");
> +		vhost->max_vios_scsi_channels = be32_to_cpu(rsp->num_scsi_subq_channels);

You need a ibmvfc_free_event(evt) here so you don't leak events.

> +		break;
> +	case IBMVFC_MAD_FAILED:
> +		level += ibmvfc_retry_host_init(vhost);
> +		ibmvfc_log(vhost, level, "Channel Enquiry failed\n");
> +		ibmvfc_free_event(evt);

Looks like you are freeing this event twice due to the fallthrough...

> +		fallthrough;
> +	case IBMVFC_MAD_DRIVER_FAILED:
> +		ibmvfc_free_event(evt);
> +		return;
> +	default:
> +		dev_err(vhost->dev, "Invalid Channel Enquiry response: 0x%x\n",
> +			mad_status);
> +		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
> +		ibmvfc_free_event(evt);
> +		return;
> +	}
> +
> +	ibmvfc_channel_setup(vhost);
> +}
> +



-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

