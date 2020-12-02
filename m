Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767F2CC571
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 19:42:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmSWD4ylQzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 05:42:16 +1100 (AEDT)
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
 header.s=pp1 header.b=n9c4Mh9I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmSTZ5qXPzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 05:40:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2IXv0o135382; Wed, 2 Dec 2020 13:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L69NYuLhU3uOuWNgUvbNXLJASVglg/Pd6mCXYVJf3RI=;
 b=n9c4Mh9IuKKx/pYdlxPCERQ3SGQmBr8rnSq8jDCHYfKyLrjCixS9aUUJ2Hx+Osg3C5gs
 sdEjhEFvkfFHJP8Ev93YBWczcV0PRfixy09Lkrl1ueRImhX8rkbbmHlotQBXDuivAdMJ
 eSZh70vAELXN9wS+/6aqboUX9ZwLZD8dt4FnACjhkL2NR9i7817Uu9AmaBcghqd99sgQ
 K4cQSYRt1HVf2AckGg3TH/4rkYtQYrjTsjD5dr/W3PpvPHRc6Jtd/8PhjiTjhBXrBz7H
 7+NzI+KYf5tdvaWphc+3mFiaizLCpm8CR4ZP3j7fTwpOVSmU3EnU/Bc5farB09jBzUoP pQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355sr60ydw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 13:40:47 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2IRU7W031477;
 Wed, 2 Dec 2020 18:40:46 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 354ysukkp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:40:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2IekZ231916538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 18:40:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54ED6124054;
 Wed,  2 Dec 2020 18:40:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81E39124052;
 Wed,  2 Dec 2020 18:40:45 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.78.151])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 18:40:45 +0000 (GMT)
Subject: Re: [PATCH v2 17/17] ibmvfc: provide modules parameters for MQ
 settings
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-18-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <e2343b78-5be3-da2d-b2bc-ccb0a75c61ae@linux.vnet.ibm.com>
Date: Wed, 2 Dec 2020 12:40:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005329.4538-18-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020109
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
> +module_param_named(mig_channels_only, mig_channels_only, uint, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(mig_channels_only, "Prevent migration to non-channelized system. "
> +		 "[Default=" __stringify(IBMVFC_MIG_NO_SUB_TO_CRQ) "]");
> +module_param_named(mig_no_less_channels, mig_no_less_channels, uint, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(mig_no_less_channels, "Prevent migration to system with less channels. "
> +		 "[Default=" __stringify(IBMVFC_MIG_NO_N_TO_M) "]");

Both of these are writeable, but it doesn't look like you do any re-negotiation
with the VIOS for these changed settings to take effect if someone changes
them at runtime.

> +
>  module_param_named(init_timeout, init_timeout, uint, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(init_timeout, "Initialization timeout in seconds. "
>  		 "[Default=" __stringify(IBMVFC_INIT_TIMEOUT) "]");

> @@ -3228,6 +3250,36 @@ static ssize_t ibmvfc_store_log_level(struct device *dev,
>  	return strlen(buf);
>  }
>  
> +static ssize_t ibmvfc_show_scsi_channels(struct device *dev,
> +					 struct device_attribute *attr, char *buf)
> +{
> +	struct Scsi_Host *shost = class_to_shost(dev);
> +	struct ibmvfc_host *vhost = shost_priv(shost);
> +	unsigned long flags = 0;
> +	int len;
> +
> +	spin_lock_irqsave(shost->host_lock, flags);
> +	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->client_scsi_channels);
> +	spin_unlock_irqrestore(shost->host_lock, flags);
> +	return len;
> +}
> +
> +static ssize_t ibmvfc_store_scsi_channels(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct Scsi_Host *shost = class_to_shost(dev);
> +	struct ibmvfc_host *vhost = shost_priv(shost);
> +	unsigned long flags = 0;
> +	unsigned int channels;
> +
> +	spin_lock_irqsave(shost->host_lock, flags);
> +	channels = simple_strtoul(buf, NULL, 10);
> +	vhost->client_scsi_channels = min(channels, nr_scsi_hw_queues);

Don't we need to do a LIP here for this new setting to go into effect?

> +	spin_unlock_irqrestore(shost->host_lock, flags);
> +	return strlen(buf);
> +}
> +
>  static DEVICE_ATTR(partition_name, S_IRUGO, ibmvfc_show_host_partition_name, NULL);
>  static DEVICE_ATTR(device_name, S_IRUGO, ibmvfc_show_host_device_name, NULL);
>  static DEVICE_ATTR(port_loc_code, S_IRUGO, ibmvfc_show_host_loc_code, NULL);



-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

