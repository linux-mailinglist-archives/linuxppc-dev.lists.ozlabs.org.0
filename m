Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2057EAD41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 10:47:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=keqDA3ma;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV1g02LPNz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 20:47:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=keqDA3ma;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV1f52yNvz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 20:46:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8qEBh019144;
	Tue, 14 Nov 2023 09:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=A3g5ZH5HtHeQ68WTJ7KqJ6F2l0j1q6OQ9tLUIow1AAc=;
 b=keqDA3mauEV4jBsudy6qu5YXhOpjFUXnPEg+Kvh0086Mb9EKFf/MNcShmOiqVmWUf8pZ
 qEePHeG4H0yLpG2FmwfsVWPT3ZD2wMvwKnFDiMCdz1jcC+6ZL2lXNYCLBXD8mlxF5FxL
 9dKRDJ+TQJ55bAGCbmmGmeYCr42KpPBa0CWR3RfF15MFkpm5nqSKQ3tegYuUhVF2Mf8y
 kyj3ZG4+22BJwpwQTxsPGUGMfgfzpiEuVzX0qof2yOEHDnYaOc/KSchy4No1QNSknk+G
 1fwtPhkJdjydHZ6r2zyzZpAOaKRz1guHTWSzkm1Ho2Biott8TUk/2usLhgonhl43fo6O IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc5rthc75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:46:27 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE9eEkQ022056;
	Tue, 14 Nov 2023 09:46:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc5rthc6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:46:27 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8UeQL011022;
	Tue, 14 Nov 2023 09:46:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1ecx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:46:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE9kO8x6554164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 09:46:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACC5F20043;
	Tue, 14 Nov 2023 09:46:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7718220040;
	Tue, 14 Nov 2023 09:46:23 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 14 Nov 2023 09:46:23 +0000 (GMT)
Date: Tue, 14 Nov 2023 15:16:22 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Message-ID: <20231114094622.GR2194132@linux.vnet.ibm.com>
References: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Nvf0-bul-VK9uGPcd-79YTIVNvSSXSNZ
X-Proofpoint-ORIG-GUID: HRs9or1SEHIZK3ZVNhe9IggTVcfZG-XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=917 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311140076
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2023-11-14 12:42:19]:

> No functional change in this patch. A helper is added to find if
> vcpu is dispatched by hypervisor. Use that instead of opencoding.
> Also clarify some of the comments.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index ac4279208d63..b78b82d66057 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -76,6 +76,17 @@ static inline bool is_vcpu_idle(int vcpu)
>  {
>  	return lppaca_of(vcpu).idle;
>  }
> +
> +static inline bool vcpu_is_dispatched(int vcpu)
> +{
> +	/*
> +	 * This is the yield_count.  An "odd" value (low bit on) means that
> +	 * the processor is yielded (either because of an OS yield or a
> +	 * hypervisor preempt).  An even value implies that the processor is
> +	 * currently executing.
> +	 */
> +	return (!(yield_count_of(vcpu) & 1));
> +}
>  #else
>  static inline bool is_shared_processor(void)
>  {
> @@ -109,6 +120,10 @@ static inline bool is_vcpu_idle(int vcpu)
>  {
>  	return false;
>  }
> +static inline bool vcpu_is_dispatched(int vcpu)
> +{
> +	return true;
> +}
>  #endif

If we are introducing vcpu_is_dispatched, we should remove 
yield_count_of() and use vcpu_is_dispatched everwhere

No point in having yield_count_of() and vcpu_is_dispatched, since
yield_count_of() is only used to check if we are running in OS or not.

-- 
Thanks and Regards
Srikar Dronamraju
