Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54506251A21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:48:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbVhC5Xg3zDqJL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 23:48:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hartb@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i8z9Dab3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVdW6tTmzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:46:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PDXi1p153000; Tue, 25 Aug 2020 09:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=1Rp0P65mclnfxjQiUt++LdLKDCUo12LE/UVwbCf+g00=;
 b=i8z9Dab3k703PwN4I5VmM+rzVRNT0lmkvhfbTZMupko4CDnNNjLiw9OwSBKennmxWmDj
 doJEKBwzpaqSqwkonp7p7WIX+crruQTzDodg/9Bm6LfWDq6YIrIXqzLuepwsgY44pkDC
 v22BiBi7iBjPMsTdhyGF73nRnWBD/5ULrXgkXxTgf/L8skJ+vsooArNn5oa4wYh7uhLd
 TLamEA3fIfBaL/ojuyqSYn0EiZ3OsfeE7fo5bZrP6cuiw0XLEuJt5NbiGlMtIWONJSfT
 SK0WFHFmd+yrYaFn9hzUSovWe6rfkLGd0jQTimJZZIQPKOOs9Nc8lfl8db8KIDH1UxxD tA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3353kw8eae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 09:46:13 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PDh4OJ004459;
 Tue, 25 Aug 2020 13:46:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 332uwa9snw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:46:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PDkC1X55050558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 13:46:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFD6AAE062;
 Tue, 25 Aug 2020 13:46:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E877AE05C;
 Tue, 25 Aug 2020 13:46:11 +0000 (GMT)
Received: from Brians-MBP (unknown [9.211.49.159])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Aug 2020 13:46:11 +0000 (GMT)
Date: Tue, 25 Aug 2020 08:45:55 -0500
From: Brian W Hart <hartb@linux.vnet.ibm.com>
To: Dany Madden <drt@linux.ibm.com>
Subject: Re: [PATCH net] ibmvnic fix NULL tx_pools and rx_tools issue at
 do_reset
Message-ID: <20200825134554.GA33239@Brians-MBP>
Mail-Followup-To: Dany Madden <drt@linux.ibm.com>, davem@davemloft.net,
 netdev@vger.kernel.org, Mingming Cao <mmc@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200824234922.805858-1-drt@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824234922.805858-1-drt@linux.ibm.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_04:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250102
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
Cc: netdev@vger.kernel.org, Mingming Cao <mmc@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 24, 2020 at 07:49:23PM -0400, Dany Madden wrote:
> From: Mingming Cao <mmc@linux.vnet.ibm.com>
> 
> At the time of do_reset, ibmvnic tries to re-initalize the tx_pools
> and rx_pools to avoid re-allocating the long term buffer. However
> there is a window inside do_reset that the tx_pools and
> rx_pools were freed before re-initialized making it possible to deference
> null pointers.
> 
> This patch fixes this issue by checking that the tx_pool
> and rx_pool are not NULL after ibmvnic_login. If so, re-allocating
> the pools. This will avoid getting into calling reset_tx/rx_pools with
> NULL adapter tx_pools/rx_pools pointer. Also add null pointer check in
> reset_tx_pools and reset_rx_pools to safe handle NULL pointer case.
> 
> Signed-off-by: Mingming Cao <mmc@linux.vnet.ibm.com>
> Signed-off-by: Dany Madden <drt@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 5afb3c9c52d2..5ff48e55308b 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -479,6 +479,9 @@ static int reset_rx_pools(struct ibmvnic_adapter *adapter)
>  	int i, j, rc;
>  	u64 *size_array;
> 
> +	if (!adapter->tx_pool)
> +		return -1;
> +

Should this one be testing rx_pool?

brian

>  	size_array = (u64 *)((u8 *)(adapter->login_rsp_buf) +
>  		be32_to_cpu(adapter->login_rsp_buf->off_rxadd_buff_size));
> 
> @@ -649,6 +652,9 @@ static int reset_tx_pools(struct ibmvnic_adapter *adapter)
>  	int tx_scrqs;
>  	int i, rc;
> 
> +	if (!adapter->tx_pool)
> +		return -1;
> +
>  	tx_scrqs = be32_to_cpu(adapter->login_rsp_buf->num_txsubm_subcrqs);
>  	for (i = 0; i < tx_scrqs; i++) {
>  		rc = reset_one_tx_pool(adapter, &adapter->tso_pool[i]);
> @@ -2011,7 +2017,10 @@ static int do_reset(struct ibmvnic_adapter *adapter,
>  		    adapter->req_rx_add_entries_per_subcrq !=
>  		    old_num_rx_slots ||
>  		    adapter->req_tx_entries_per_subcrq !=
> -		    old_num_tx_slots) {
> +		    old_num_tx_slots ||
> +			!adapter->rx_pool ||
> +			!adapter->tso_pool ||
> +			!adapter->tx_pool) {
>  			release_rx_pools(adapter);
>  			release_tx_pools(adapter);
>  			release_napi(adapter);
> @@ -2024,10 +2033,14 @@ static int do_reset(struct ibmvnic_adapter *adapter,
>  		} else {
>  			rc = reset_tx_pools(adapter);
>  			if (rc)
> +				netdev_dbg(adapter->netdev, "reset tx pools failed (%d)\n",
> +						rc);
>  				goto out;
> 
>  			rc = reset_rx_pools(adapter);
>  			if (rc)
> +				netdev_dbg(adapter->netdev, "reset rx pools failed (%d)\n",
> +						rc);
>  				goto out;
>  		}
>  		ibmvnic_disable_irqs(adapter);
> -- 
> 2.18.2
> 
