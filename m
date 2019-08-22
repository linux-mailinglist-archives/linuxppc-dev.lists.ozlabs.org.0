Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C08E999AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:58:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrMJ3w2tzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dqzm5bThzDrcR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:41:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MGJYsl084600; Thu, 22 Aug 2019 12:41:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhw2c4vdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 12:41:15 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7MGKfAZ088399;
 Thu, 22 Aug 2019 12:41:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhw2c4vdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 12:41:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7MGVZep013805;
 Thu, 22 Aug 2019 16:41:14 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2ue97759t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 16:41:14 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MGfD2k46792998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 16:41:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CFE812405A;
 Thu, 22 Aug 2019 16:41:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70995124054;
 Thu, 22 Aug 2019 16:41:13 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 16:41:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] powerpc/vphn: Check for error from hcall_vphn
In-Reply-To: <20190822144235.19398-2-srikar@linux.vnet.ibm.com>
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
 <20190822144235.19398-2-srikar@linux.vnet.ibm.com>
Date: Thu, 22 Aug 2019 11:41:13 -0500
Message-ID: <87imqprw46.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220154
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> There is no point in unpacking associativity, if
> H_HOME_NODE_ASSOCIATIVITY hcall has returned an error.
>
> Also added error messages for H_PARAMETER and default case in
> vphn_get_associativity.

These are two logical changes and should be separated IMO.


> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 50d68d2..88b5157 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1191,6 +1191,10 @@ static long vphn_get_associativity(unsigned long cpu,
>  				VPHN_FLAG_VCPU, associativity);
>  
>  	switch (rc) {
> +	case H_SUCCESS:
> +		dbg("VPHN hcall succeeded. Reset polling...\n");
> +		timed_topology_update(0);
> +		break;
>  	case H_FUNCTION:
>  		printk_once(KERN_INFO
>  			"VPHN is not supported. Disabling polling...\n");
> @@ -1202,9 +1206,15 @@ static long vphn_get_associativity(unsigned long cpu,
>  			"preventing VPHN. Disabling polling...\n");
>  		stop_topology_update();
>  		break;
> -	case H_SUCCESS:
> -		dbg("VPHN hcall succeeded. Reset polling...\n");
> -		timed_topology_update(0);
> +	case H_PARAMETER:
> +		printk(KERN_ERR
> +			"hcall_vphn() was passed an invalid parameter."
> +			"Disabling polling...\n");

This will come out as:

hcall_vphn() was passed an invalid parameter.Disabling polling...
                                             ^

And it's misleading to say VPHN polling is being disabled when this case
does not invoke stop_topology_update().

> +		break;
> +	default:
> +		printk(KERN_ERR
> +			"hcall_vphn() returned %ld. Disabling polling \n", rc);
> +		stop_topology_update();
>  		break;

Any added prints in this routine must be _once or _ratelimited to avoid
log floods. Also use the pr_ APIs instead of printk please.
