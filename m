Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184A67E63B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Hym071qz3fHf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aivNL1MD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aivNL1MD;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Hxk5dtPz3fCY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:10:34 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30RC1OrS010035;
	Fri, 27 Jan 2023 13:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=mI8i9MTSsYzZV7suqERmHFNF665YMmu1efTHtlRfWHE=;
 b=aivNL1MD05Rtv47yVCNmilQz/2wYvQjoXMeP3eEAW25CX/hQPDz4COct1JQYs3NM0Uqs
 8NTOJsdsUVuBBOGFE2uc2CM6icgaJRXZO8Aa/ncIRZCuLmyUJFjExbtQIDQ+0/3Luyyw
 ygM/TUIwTjA3U/natamqiTkAUXfk8MjWH2JAD9SqG7w/NQd2iZKzocDoyLy+tB+5YoAg
 wXpPix9ORiSCcTttdFqt8wMNVBPzosl5HeAqIXeFfd6N6R6P5xu447BHoZkJSSvZpSAL
 7WwWEAXWNGor41HMwEiHyu+qfISgCBvYE6QOhJ7bpS23g1rg45xfElV0XCb5JzTyQFhr ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce8m9pcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 13:10:31 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RC3Tje020110;
	Fri, 27 Jan 2023 13:10:30 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce8m9pcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 13:10:30 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30RAoXBj004500;
	Fri, 27 Jan 2023 13:10:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p8k4dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 13:10:30 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30RDASUs3605134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:10:28 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94EAD5805C;
	Fri, 27 Jan 2023 13:10:28 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 714FC58054;
	Fri, 27 Jan 2023 13:10:28 +0000 (GMT)
Received: from localhost (unknown [9.211.111.131])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jan 2023 13:10:28 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Replace one-element arrays with flexible
 arrays
In-Reply-To: <20230127085023.271674-1-ajd@linux.ibm.com>
References: <20230127085023.271674-1-ajd@linux.ibm.com>
Date: Fri, 27 Jan 2023 07:10:28 -0600
Message-ID: <87357wp1h7.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KIbM4aQG0R9_EksZ-y0t-UPOiI6ZCa8Y
X-Proofpoint-GUID: T1IUKyhZvGmcsYwWc3AR1jPPeD8FaAus
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270123
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
Cc: Leonardo Bras <leobras.c@gmail.com>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> Using a one-element array as a fake flexible array is deprecated.
>
> Replace the one-element flexible arrays in rtas-types.h with C99 standard
> flexible array members instead.
>
> This helps us move towards enabling -fstrict-flex-arrays=3 in future.
>
> Found using scripts/coccinelle/misc/flexible_array.cocci.
>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Leonardo Bras <leobras.c@gmail.com>
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/KSPP/linux/issues/21
> Link: https://github.com/KSPP/linux/issues/79
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/rtas-types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
> index 8df6235d64d1..40ec03a05c0b 100644
> --- a/arch/powerpc/include/asm/rtas-types.h
> +++ b/arch/powerpc/include/asm/rtas-types.h
> @@ -44,7 +44,7 @@ struct rtas_error_log {
>  	 */
>  	u8		byte3;			/* General event or error*/
>  	__be32		extended_log_length;	/* length in bytes */
> -	unsigned char	buffer[1];		/* Start of extended log */
> +	unsigned char	buffer[];		/* Start of extended log */
>  						/* Variable length.      */
>  };
>  
> @@ -85,7 +85,7 @@ struct rtas_ext_event_log_v6 {
>  					/* that defines the format for	*/
>  					/* the vendor specific log type	*/
>  	/* Byte 16-end of log */
> -	u8 vendor_log[1];		/* Start of vendor specific log	*/
> +	u8 vendor_log[];		/* Start of vendor specific log	*/
>  					/* Variable length.		*/
>  };

I see at least one place that consults the size of one of these structs,
in get_pseries_errorlog():

	/* Check that we understand the format */
	if (ext_log_length < sizeof(struct rtas_ext_event_log_v6) || ...

Don't all such sites need to be audited/adjusted for changes like this?
