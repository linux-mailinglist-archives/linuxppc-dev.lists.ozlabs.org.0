Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD911B9D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 18:14:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y3T04r9hzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 04:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y1Fk6hSxzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Y1Fj2bVzz8swC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:34:49 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Y1Fj0tlXz9t2k; Thu, 12 Dec 2019 02:34:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Y1Fh3qx0z9t0w
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Dec 2019 02:34:48 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBFWQdW020139; Wed, 11 Dec 2019 10:34:46 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtfbxjkxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 10:34:45 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBBFYecM028673;
 Wed, 11 Dec 2019 15:34:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2wr3q6ya45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 15:34:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBFYhC315925714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 15:34:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4DC0112063;
 Wed, 11 Dec 2019 15:34:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7694A112067;
 Wed, 11 Dec 2019 15:34:43 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.41.178.211])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 15:34:43 +0000 (GMT)
Subject: Re: [PATCH] net/ibmvnic: Fix typo in retry check
To: netdev@vger.kernel.org
References: <1576078359-9220-1-git-send-email-tlfalcon@linux.ibm.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <23eafd7b-0c25-d2f8-e837-f4b7fec6fe20@linux.ibm.com>
Date: Wed, 11 Dec 2019 09:34:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1576078359-9220-1-git-send-email-tlfalcon@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912110131
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/11/19 9:32 AM, Thomas Falcon wrote:
> This conditional is missing a bang, with the intent
> being to break when the retry count reaches zero.
>
> Fixes: 476d96ca9c ("ibmvnic: Bound waits for device queries")
> Suggested-by: Juliet Kim <minkim@linux.ibm.com>
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> ---

Excuse me, disregard this patch. I used the wrong email address for 
Juliet. And forgot the intended branch.  I will resend a v2 soon.

Tom


>   drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index efb0f10..2d84523 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -184,7 +184,7 @@ static int ibmvnic_wait_for_completion(struct ibmvnic_adapter *adapter,
>   			netdev_err(netdev, "Device down!\n");
>   			return -ENODEV;
>   		}
> -		if (retry--)
> +		if (!retry--)
>   			break;
>   		if (wait_for_completion_timeout(comp_done, div_timeout))
>   			return 0;
