Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C8AE041
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 23:23:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S1NQ17lpzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 07:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S1LN6mh0zDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 07:21:15 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x89LHMWW084360; Mon, 9 Sep 2019 17:21:10 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uwx5srscx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2019 17:21:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x89LKCWU022942;
 Mon, 9 Sep 2019 21:21:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 2uv466twy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2019 21:21:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x89LL7KI57672074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Sep 2019 21:21:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B78C4C605A;
 Mon,  9 Sep 2019 21:21:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 189C6C6059;
 Mon,  9 Sep 2019 21:21:06 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.80.200.46])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Sep 2019 21:21:05 +0000 (GMT)
Subject: Re: [PATCH] net/ibmvnic: Fix missing { in __ibmvnic_reset
To: Michal Suchanek <msuchanek@suse.de>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Juliet Kim <julietk@linux.vnet.ibm.com>
References: <20190909204451.7929-1-msuchanek@suse.de>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <060cae7c-48bf-bddd-5086-a2a0d8f02c1a@linux.ibm.com>
Date: Mon, 9 Sep 2019 14:21:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909204451.7929-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909090206
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
Cc: linuxppc-dev@lists.ozlabs.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 John Allen <jallen@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/9/19 1:44 PM, Michal Suchanek wrote:
> Commit 1c2977c09499 ("net/ibmvnic: free reset work of removed device from queue")
> adds a } without corresponding { causing build break.
> 
> Fixes: 1c2977c09499 ("net/ibmvnic: free reset work of removed device from queue")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 6644cabc8e75..5cb55ea671e3 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -1984,7 +1984,7 @@ static void __ibmvnic_reset(struct work_struct *work)
>  	rwi = get_next_rwi(adapter);
>  	while (rwi) {
>  		if (adapter->state == VNIC_REMOVING ||
> -		    adapter->state == VNIC_REMOVED)
> +		    adapter->state == VNIC_REMOVED) {
>  			kfree(rwi);
>  			rc = EBUSY;
>  			break;
> 

