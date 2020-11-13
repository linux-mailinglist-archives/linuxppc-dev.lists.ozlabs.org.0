Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315F2B159E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 06:47:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXSD64HQ5zDqnB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 16:47:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J1nYPWAJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXSBH6kzHzDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 16:45:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD5Vt1j117015; Fri, 13 Nov 2020 00:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=B34aOJJPx8zuYeMoeXNRFeD0nQDuFLaURm5o/5PScys=;
 b=J1nYPWAJYZ4X/6j3q+sBT6YTscPUuhxOCejdGED0Sccj2Z6ZpKlKPshPcZa6Xvky3PNa
 i9wlvgFFCda1GK8wX6k4VUSZ4aF4iOjZrl726QWWFX2ELb6dUOrVTZUmN2AXETrO0shD
 A/mdauCdvSUaSMxRbab8EA58KuBTgwvOoj1Ujsp+FVNtxawR7uXGAtuHycEbimJySKfH
 n0V87khqFurSaQySIPYzexAzU9MHIdmX+seGXCTJXv5qgkBHMpBSsl3SkTDCdYiXK/ly
 AOQd8Yb3ckMyaDEH0kZHOAklS3ZCAIfYL6URWnRARIIAAXuftFOtCw8GZjVEk/ESFVjo yA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34shc2v341-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 00:45:56 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AD5bUwL002679;
 Fri, 13 Nov 2020 05:45:56 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34nk7acj2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 05:45:56 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AD5jrJX12845628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 05:45:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BF346A054;
 Fri, 13 Nov 2020 05:45:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BA7E6A04F;
 Fri, 13 Nov 2020 05:45:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Nov 2020 05:45:52 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 12 Nov 2020 21:45:52 -0800
From: drt <drt@linux.vnet.ibm.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next 01/12] ibmvnic: Ensure that subCRQ entry reads
 are ordered
In-Reply-To: <1605208207-1896-2-git-send-email-tlfalcon@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605208207-1896-2-git-send-email-tlfalcon@linux.ibm.com>
Message-ID: <527f42fa5e6a087101cbc19934611783@linux.vnet.ibm.com>
X-Sender: drt@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_03:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130029
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, brking@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-12 11:09, Thomas Falcon wrote:
> Ensure that received Subordinate Command-Response Queue
> entries are properly read in order by the driver.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

Acked-by: Dany Madden <drt@linux.ibm.com>

> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
> b/drivers/net/ethernet/ibm/ibmvnic.c
> index da15913879f8..5647f54bf387 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2391,6 +2391,8 @@ static int ibmvnic_poll(struct napi_struct
> *napi, int budget)
> 
>  		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
>  			break;
> +		/* ensure that we do not prematurely exit the polling loop */
> +		dma_rmb();
>  		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
>  		rx_buff =
>  		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
> @@ -3087,6 +3089,8 @@ static int ibmvnic_complete_tx(struct
> ibmvnic_adapter *adapter,
>  		int num_entries = 0;
> 
>  		next = ibmvnic_next_scrq(adapter, scrq);
> +		/* ensure that we are reading the correct queue entry */
> +		dma_rmb();
>  		for (i = 0; i < next->tx_comp.num_comps; i++) {
>  			if (next->tx_comp.rcs[i]) {
>  				dev_err(dev, "tx error %x\n",
