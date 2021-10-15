Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1742FE22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 00:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWLXc0Cwjz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 09:29:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V6DE3K8v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V6DE3K8v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWLWs1V5Jz2ypf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 09:28:24 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FJsC8H028150; 
 Fri, 15 Oct 2021 18:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2TbOFDBOAdhGXtIKjUUsjfMVX6BLx7JIly9Sk1X66Fg=;
 b=V6DE3K8vzWRqW88zs57O8f1eeC59981Q7qaB7vw8SsqcckX6kC1GQIS7t0x7HtWsOCr7
 gkfhzuRRNol8qh08mht8VZxBGcr0fCACYnI2nreY8Kk1KKqXq18VkzHpCRGJeaF+rdf0
 pDYHONFMCNMFABfzYMsJAua0FR1UoBCHLSOkW+ey7zTZUJWlSrorFlVemh4ivF7j4lXt
 JRmE4HGiBxypUEfxYrMnDy5ZsPYeUxjR7uoiSZW0n14lkQQCRI4mS75FWGuExnUpr7LM
 qdgsLsVoGD01yoRKLsCX7JcI87KsG98R/qnT76TBs9rYtg1yaAkA3n/KvTxIu76G8D5c 4Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bpr62ahqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 18:28:18 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19FMRkba011255;
 Fri, 15 Oct 2021 22:28:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3bk2qcpvvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 22:28:18 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19FMSHBx35258632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 22:28:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A6976A04D;
 Fri, 15 Oct 2021 22:28:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEA76A047;
 Fri, 15 Oct 2021 22:28:15 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.55.194])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Oct 2021 22:28:15 +0000 (GMT)
Subject: Re: [PATCH net-next 11/12] ethernet: ibmveth: use ether_addr_to_u64()
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
References: <20211015221652.827253-1-kuba@kernel.org>
 <20211015221652.827253-12-kuba@kernel.org>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <5c4a0b8f-dd41-78aa-5ffe-16c639794b63@linux.ibm.com>
Date: Fri, 15 Oct 2021 15:28:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015221652.827253-12-kuba@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DwXEavOzM-SAg1lOgKJn9OnTNveZ5M6M
X-Proofpoint-GUID: DwXEavOzM-SAg1lOgKJn9OnTNveZ5M6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_07,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150135
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
Cc: cforno12@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/15/21 3:16 PM, Jakub Kicinski wrote:
> We'll want to make netdev->dev_addr const, remove the local
> helper which is missing a const qualifier on the argument
> and use ether_addr_to_u64().

LGTM. ibmveth_encode_mac_addr() is clearly code duplication of
ether_addr_to_u64() minus the const qualifier.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> 
> Similar story to mlx4.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: cforno12@linux.ibm.com
> CC: mpe@ellerman.id.au
> CC: benh@kernel.crashing.org
> CC: paulus@samba.org
> CC: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index 836617fb3f40..45ba40cf4d07 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -483,17 +483,6 @@ static int ibmveth_register_logical_lan(struct ibmveth_adapter *adapter,
>  	return rc;
>  }
> 
> -static u64 ibmveth_encode_mac_addr(u8 *mac)
> -{
> -	int i;
> -	u64 encoded = 0;
> -
> -	for (i = 0; i < ETH_ALEN; i++)
> -		encoded = (encoded << 8) | mac[i];
> -
> -	return encoded;
> -}
> -
>  static int ibmveth_open(struct net_device *netdev)
>  {
>  	struct ibmveth_adapter *adapter = netdev_priv(netdev);
> @@ -553,7 +542,7 @@ static int ibmveth_open(struct net_device *netdev)
>  	adapter->rx_queue.num_slots = rxq_entries;
>  	adapter->rx_queue.toggle = 1;
> 
> -	mac_address = ibmveth_encode_mac_addr(netdev->dev_addr);
> +	mac_address = ether_addr_to_u64(netdev->dev_addr);
> 
>  	rxq_desc.fields.flags_len = IBMVETH_BUF_VALID |
>  					adapter->rx_queue.queue_len;
> @@ -1476,7 +1465,7 @@ static void ibmveth_set_multicast_list(struct net_device *netdev)
>  		netdev_for_each_mc_addr(ha, netdev) {
>  			/* add the multicast address to the filter table */
>  			u64 mcast_addr;
> -			mcast_addr = ibmveth_encode_mac_addr(ha->addr);
> +			mcast_addr = ether_addr_to_u64(ha->addr);
>  			lpar_rc = h_multicast_ctrl(adapter->vdev->unit_address,
>  						   IbmVethMcastAddFilter,
>  						   mcast_addr);
> @@ -1606,7 +1595,7 @@ static int ibmveth_set_mac_addr(struct net_device *dev, void *p)
>  	if (!is_valid_ether_addr(addr->sa_data))
>  		return -EADDRNOTAVAIL;
> 
> -	mac_address = ibmveth_encode_mac_addr(addr->sa_data);
> +	mac_address = ether_addr_to_u64(addr->sa_data);
>  	rc = h_change_logical_lan_mac(adapter->vdev->unit_address, mac_address);
>  	if (rc) {
>  		netdev_err(adapter->netdev, "h_change_logical_lan_mac failed with rc=%d\n", rc);
> 

