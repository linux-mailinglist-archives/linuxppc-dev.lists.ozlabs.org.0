Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B841BC3F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 17:42:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BQrD0PTszDqm6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 01:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BQh85gBnzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 01:35:13 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SFWJS5052329; Tue, 28 Apr 2020 11:35:11 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhc197nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 11:35:11 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SFSxDj028691;
 Tue, 28 Apr 2020 15:35:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 30mcu6w1ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 15:35:10 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SFZ93b54788554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 15:35:09 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3267B2065;
 Tue, 28 Apr 2020 15:35:09 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88117B206A;
 Tue, 28 Apr 2020 15:35:09 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.80.239.215])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 15:35:09 +0000 (GMT)
Subject: Re: [PATCH net] ibmvnic: Fall back to 16 H_SEND_SUB_CRQ_INDIRECT
 entries with old FW
To: Juliet Kim <julietk@linux.vnet.ibm.com>, netdev@vger.kernel.org
References: <20200427173343.16626-1-julietk@linux.vnet.ibm.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <8617ba73-8a05-51c4-e52b-164687cecf07@linux.ibm.com>
Date: Tue, 28 Apr 2020 10:35:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200427173343.16626-1-julietk@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_10:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280119
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/27/20 12:33 PM, Juliet Kim wrote:
> The maximum entries for H_SEND_SUB_CRQ_INDIRECT has increased on
> some platforms from 16 to 128. If Live Partition Mobility is used
> to migrate a running OS image from a newer source platform to an
> older target platform, then H_SEND_SUB_CRQ_INDIRECT will fail with
> H_PARAMETER if 128 entries are queued.
>
> Fix this by falling back to 16 entries if H_PARAMETER is returned
> from the hcall().

Thanks for the submission, but I am having a hard time believing that 
this is what is happening since the driver does not support sending 
multiple frames per hypervisor call at this time. Even if it were the 
case, this approach would omit frame data needed by the VF, so the 
second attempt may still fail. Are there system logs available that show 
the driver is attempting to send transmissions with greater than 16 
descriptors?

Thanks,

Tom


>
> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
> ---
>   drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 4bd33245bad6..b66c2f26a427 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -1656,6 +1656,17 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
>   		lpar_rc = send_subcrq_indirect(adapter, handle_array[queue_num],
>   					       (u64)tx_buff->indir_dma,
>   					       (u64)num_entries);
> +
> +		/* Old firmware accepts max 16 num_entries */
> +		if (lpar_rc == H_PARAMETER && num_entries > 16) {
> +			tx_crq.v1.n_crq_elem = 16;
> +			tx_buff->num_entries = 16;
> +			lpar_rc = send_subcrq_indirect(adapter,
> +						       handle_array[queue_num],
> +						       (u64)tx_buff->indir_dma,
> +						       16);
> +		}
> +
>   		dma_unmap_single(dev, tx_buff->indir_dma,
>   				 sizeof(tx_buff->indir_arr), DMA_TO_DEVICE);
>   	} else {
