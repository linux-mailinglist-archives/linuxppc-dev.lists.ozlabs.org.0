Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABA5EFFFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:19:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdnpF2Tk3z3bkb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:19:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TOPsZU2N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TOPsZU2N;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdnnY0g6zz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 08:18:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TM4DEH002142;
	Thu, 29 Sep 2022 22:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Lr62tqjqtZfnWJa8AgqXDdpepOwYj9yS+Vb0sgSrOGE=;
 b=TOPsZU2NpIAGKJ+6Rd7ec3sADVcT1VovTXDOwQHnc1yKX1QhzyxnSA/LOPImClWt5lph
 dzMeF4MBzxs1xWgr2YIm10WzvgorUDgFzqanq7P054qpBloZpdg90FzOGE8ywXSqtJ0+
 Uhh0UCcXi/I8PWkZ9ES8xK5cKUQroEIHRgXHtdYSHb85epZQIwBVbyuLmHiaM1mSF7Kv
 j91alqBRXfSdaeyffIfrd4K+xNWHr2jVNRa+sN28xTfIOlHQuLugmYyQDAvntNZsyKpO
 djnmnKiKUnh3O77nK0B5TzoTEHqZyTeVBCh8E1sRuRsfU+TzXG7IZOR8O7hEiwylrXs0 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwku4re9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:18:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28TM4Duf002097;
	Thu, 29 Sep 2022 22:18:34 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwku4re91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:18:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TM5Y0m025267;
	Thu, 29 Sep 2022 22:18:33 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma03dal.us.ibm.com with ESMTP id 3jsshae145-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:18:33 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TMIVMe18219600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 22:18:32 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D24725804C;
	Thu, 29 Sep 2022 22:18:30 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C05005805D;
	Thu, 29 Sep 2022 22:18:30 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 22:18:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Pass hw_cpu_id to node
 associativity HCALL
In-Reply-To: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
References: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
Date: Thu, 29 Sep 2022 17:16:40 -0500
Message-ID: <87wn9lbzcn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0VyJUE5Fy4qq_hWut5S5K0ptPRGOE7_b
X-Proofpoint-GUID: RNZ7enbVwauz6KfatMlkNQGaedFmviCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_13,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290139
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> Generally the hypervisor decides to allocate a window on different
> VAS instances. But if the user space wishes to allocate on the
> current VAS instance where the process is executing, the kernel has
> to pass associativity domain IDs to allocate VAS window HCALL. To
> determine the associativity domain IDs for the current CPU, passing
> smp_processor_id() to node associativity HCALL which may return
> H_P2 (-55) error during DLPAR CPU event.
>
> This patch fixes this issue by passing hard_smp_processor_id() with
> VPHN_FLAG_VCPU flag (PAPR 14.11.6.1 H_HOME_NODE_ASSOCIATIVITY).
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index fe33bdb620d5..533026fd1f40 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -348,7 +348,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>  		 * So no unpacking needs to be done.
>  		 */
>  		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
> -				  VPHN_FLAG_VCPU, smp_processor_id());
> +				  VPHN_FLAG_VCPU, hard_smp_processor_id());
>  		if (rc != H_SUCCESS) {
>  			pr_err("H_HOME_NODE_ASSOCIATIVITY error: %d\n", rc);
>  			goto out;

Yes, it is always wrong to pass Linux CPU numbers to the hypervisor,
which has its own numbering for hardware threads. It usually coincides
with Linux's numbering in practice, which tends to hide bugs like this.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
