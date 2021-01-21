Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4B2FF315
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 19:26:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM9p66WxyzDrRS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 05:26:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QDOxrV8b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM9lP4qn2zDrQY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 05:24:17 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LIBGhM044882; Thu, 21 Jan 2021 13:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=Mg6re5QmA4AtijIQv5WI3wTkGejnJfeUGID6cqzZM6w=;
 b=QDOxrV8boTOTn4xP3ILtvAfzunjnbpH00gfVREz1tIo4r6kcaav29j/vrp3cvA1xURoh
 OKF8yxNXQO/ttmbxKUpdM3GHlhDUZoJLuoLm5xz+j+hnrwonfZu3FwJJy75bUlfUIUn7
 rnw8eLxHLi4ZQ/bjx9snn5mj6RpMHEZF3uFplaWcUCJClsC4FPALdV4VjkBuEcm5/Oab
 fnMV10t89TRn408nGbn+QLbp+3UzjrEo6xCIlp4T5qwBc0fSNs7tkZAc86BF5KPz9Yg+
 90doniXKom0efItAZWJOVuoo6QCmOeAe4iPys38WW1GgTKCJFQEQMmJs7fE+ZP6297l6 3g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367ens0byc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 13:24:05 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LICvcU010425;
 Thu, 21 Jan 2021 18:24:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3668p31k38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 18:24:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LIO36Z14418322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 18:24:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D9572805E;
 Thu, 21 Jan 2021 18:24:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D961E28059;
 Thu, 21 Jan 2021 18:24:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 18:24:02 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 21 Jan 2021 10:24:02 -0800
From: Dany Madden <drt@linux.ibm.com>
To: Lijun Pan <ljp@linux.ibm.com>
Subject: Re: [PATCH net] ibmvnic: device remove has higher precedence over
 reset
In-Reply-To: <20210121062005.53271-1-ljp@linux.ibm.com>
References: <20210121062005.53271-1-ljp@linux.ibm.com>
Message-ID: <c34816a13d857b7f5d1a25991b58ec63@imap.linux.ibm.com>
X-Sender: drt@linux.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_09:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=946 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210091
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
Cc: gregkh@linuxfoundation.org, julietk@linux.vnet.ibm.com,
 netdev@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 paulus@samba.org, kernel@pengutronix.de, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-01-20 22:20, Lijun Pan wrote:
> Returning -EBUSY in ibmvnic_remove() does not actually hold the
> removal procedure since driver core doesn't care for the return
> value (see __device_release_driver() in drivers/base/dd.c
> calling dev->bus->remove()) though vio_bus_remove
> (in arch/powerpc/platforms/pseries/vio.c) records the
> return value and passes it on. [1]
> 
> During the device removal precedure, we should not schedule
> any new reset (ibmvnic_reset check for REMOVING and exit),
> and should rely on the flush_work and flush_delayed_work
> to complete the pending resets, specifically we need to
> let __ibmvnic_reset() keep running while in REMOVING state since
> flush_work and flush_delayed_work shall call __ibmvnic_reset finally.
> So we skip the checking for REMOVING in __ibmvnic_reset.
> 
> [1]
> https://lore.kernel.org/linuxppc-dev/20210117101242.dpwayq6wdgfdzirl@pengutronix.de/T/#m48f5befd96bc9842ece2a3ad14f4c27747206a53
> Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Fixes: 7d7195a026ba ("ibmvnic: Do not process device remove during
> device reset")
> Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> ---
> v1 versus RFC:
>   1/ articulate why remove the REMOVING checking in __ibmvnic_reset
>   and why keep the current checking for REMOVING in ibmvnic_reset.
>   2/ The locking issue mentioned by Uwe are being addressed separately
>      by	https://lists.openwall.net/netdev/2021/01/08/89
>   3/ This patch does not have merge conflict with 2/
> 
>  drivers/net/ethernet/ibm/ibmvnic.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
> b/drivers/net/ethernet/ibm/ibmvnic.c
> index aed985e08e8a..11f28fd03057 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2235,8 +2235,7 @@ static void __ibmvnic_reset(struct work_struct 
> *work)
>  	while (rwi) {
>  		spin_lock_irqsave(&adapter->state_lock, flags);
> 
> -		if (adapter->state == VNIC_REMOVING ||
> -		    adapter->state == VNIC_REMOVED) {
> +		if (adapter->state == VNIC_REMOVED) {

If we do get here, we would crash because ibmvnic_remove() happened. It 
frees the adapter struct already.

>  			spin_unlock_irqrestore(&adapter->state_lock, flags);
>  			kfree(rwi);
>  			rc = EBUSY;
> @@ -5372,11 +5371,6 @@ static int ibmvnic_remove(struct vio_dev *dev)
>  	unsigned long flags;
> 
>  	spin_lock_irqsave(&adapter->state_lock, flags);
> -	if (test_bit(0, &adapter->resetting)) {
> -		spin_unlock_irqrestore(&adapter->state_lock, flags);
> -		return -EBUSY;
> -	}
> -
>  	adapter->state = VNIC_REMOVING;
>  	spin_unlock_irqrestore(&adapter->state_lock, flags);
