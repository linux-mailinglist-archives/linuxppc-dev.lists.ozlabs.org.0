Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B83FB51907
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 18:52:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xb1d6YH4zDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 02:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mmc@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XZzj4rMBzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 02:50:38 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OGmXkJ078750
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 12:50:34 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb1qda72x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 12:50:34 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mmc@linux.vnet.ibm.com>;
 Mon, 24 Jun 2019 17:50:33 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 17:50:30 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5OGoT9352167054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 16:50:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 459D17805C;
 Mon, 24 Jun 2019 16:50:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1956E7805E;
 Mon, 24 Jun 2019 16:50:29 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 16:50:29 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 Jun 2019 10:52:18 -0600
From: mmc <mmc@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
In-Reply-To: <20190621060518.29616-1-nathanl@linux.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
X-Sender: mmc@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19062416-0036-0000-0000-00000ACF3FA4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011321; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01222678; UDB=6.00643374; IPR=6.01003838; 
 MB=3.00027447; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-24 16:50:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062416-0037-0000-0000-00004C570B1C
Message-Id: <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240133
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
Cc: ego@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 julietk@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-06-21 00:05, Nathan Lynch wrote:
> The protocol for suspending or migrating an LPAR requires all present
> processor threads to enter H_JOIN. So if we have threads offline, we
> have to temporarily bring them up. This can race with administrator
> actions such as SMT state changes. As of dfd718a2ed1f ("powerpc/rtas:
> Fix a potential race between CPU-Offline & Migration"),
> rtas_ibm_suspend_me() accounts for this, but errors out with -EBUSY
> for what almost certainly is a transient condition in any reasonable
> scenario.
> 
> Callers of rtas_ibm_suspend_me() already retry when -EAGAIN is
> returned, and it is typical during a migration for that to happen
> repeatedly for several minutes polling the H_VASI_STATE hcall result
> before proceeding to the next stage.
> 
> So return -EAGAIN instead of -EBUSY when this race is
> encountered. Additionally: logging this event is still appropriate but
> use pr_info instead of pr_err; and remove use of unlikely() while here
> as this is not a hot path at all.
> 

Looks good, since it's not a hot path anyway, so unlikely() should 
benefit from optimize compiler path, and should stay. No?

Mingming
> Fixes: dfd718a2ed1f ("powerpc/rtas: Fix a potential race between
> CPU-Offline & Migration")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index fbc676160adf..9b4d2a2ffb4f 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -984,10 +984,9 @@ int rtas_ibm_suspend_me(u64 handle)
>  	cpu_hotplug_disable();
> 
>  	/* Check if we raced with a CPU-Offline Operation */
> -	if (unlikely(!cpumask_equal(cpu_present_mask, cpu_online_mask))) {
> -		pr_err("%s: Raced against a concurrent CPU-Offline\n",
> -		       __func__);
> -		atomic_set(&data.error, -EBUSY);
> +	if (!cpumask_equal(cpu_present_mask, cpu_online_mask)) {
> +		pr_info("%s: Raced against a concurrent CPU-Offline\n", __func__);
> +		atomic_set(&data.error, -EAGAIN);
>  		goto out_hotplug_enable;
>  	}

