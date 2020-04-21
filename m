Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 332191B336D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:36:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Khl3LFtzDqsw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 09:36:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496KdK5mv4zDqsh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 09:33:41 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LNX7Dc135391
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:33:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2xnxwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:33:38 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03LNXcuu136303
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:33:38 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2xnxwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 19:33:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03LNUjYu024823;
 Tue, 21 Apr 2020 23:33:37 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 30fs66ma5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 23:33:37 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03LNXawa45810166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 23:33:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA4F3AC05E;
 Tue, 21 Apr 2020 23:33:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6615AC059;
 Tue, 21 Apr 2020 23:33:36 +0000 (GMT)
Received: from localhost (unknown [9.85.163.64])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Apr 2020 23:33:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/eeh: fix pseries_eeh_configure_bridge()
In-Reply-To: <074529df859e2aae5ee1683e567f708b65e3558d.1587361657.git.sbobroff@linux.ibm.com>
References: <cover.1587361657.git.sbobroff@linux.ibm.com>
 <074529df859e2aae5ee1683e567f708b65e3558d.1587361657.git.sbobroff@linux.ibm.com>
Date: Tue, 21 Apr 2020 18:33:36 -0500
Message-ID: <874ktc2z3j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_10:2020-04-21,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=1 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004210173
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> If a device is hot unplgged during EEH recovery, it's possible for the
> RTAS call to ibm,configure-pe in pseries_eeh_configure() to return
> parameter error (-3), however negative return values are not checked
> for and this leads to an infinite loop.
>
> Fix this by correctly bailing out on negative values.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 893ba3f562c4..c4ef03bec0de 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -605,7 +605,7 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
>  				config_addr, BUID_HI(pe->phb->buid),
>  				BUID_LO(pe->phb->buid));
>  
> -		if (!ret)
> +		if (ret <= 0)
>  			return ret;

Note that this returns the firmware error value (e.g. -3 parameter
error) without converting it to a Linux errno. Nothing checks the error
value of this function as best I can tell, but -EINVAL would be better
than an implicit -ESRCH here.

And while this will behave correctly, the pr_warn() at the end of
pseries_eeh_configure_bridge() hints that someone had the intention
that this code should log a message on such an error:

static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
{
	int config_addr;
	int ret;
	/* Waiting 0.2s maximum before skipping configuration */
	int max_wait = 200;

	/* Figure out the PE address */
	config_addr = pe->config_addr;
	if (pe->addr)
		config_addr = pe->addr;

	while (max_wait > 0) {
		ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
				config_addr, BUID_HI(pe->phb->buid),
				BUID_LO(pe->phb->buid));

		if (!ret)
			return ret;

		/*
		 * If RTAS returns a delay value that's above 100ms, cut it
		 * down to 100ms in case firmware made a mistake.  For more
		 * on how these delay values work see rtas_busy_delay_time
		 */
		if (ret > RTAS_EXTENDED_DELAY_MIN+2 &&
		    ret <= RTAS_EXTENDED_DELAY_MAX)
			ret = RTAS_EXTENDED_DELAY_MIN+2;

		max_wait -= rtas_busy_delay_time(ret);

		if (max_wait < 0)
			break;

		rtas_busy_delay(ret);
	}

	pr_warn("%s: Unable to configure bridge PHB#%x-PE#%x (%d)\n",
		__func__, pe->phb->global_number, pe->addr, ret);
	return ret;
}

So perhaps the error path should be made to break out of the loop
instead of returning. Or is the parameter error result simply
uninteresting in this scenario?
