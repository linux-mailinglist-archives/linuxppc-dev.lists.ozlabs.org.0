Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195407EBCA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 05:45:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oBF6AWMe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVVwf6dfkz2yLr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 15:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oBF6AWMe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVVvl36TKz3cBs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 15:45:07 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SVVvh1Vz5z4xDB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 15:45:04 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SVVvh1RLgz4xFR; Wed, 15 Nov 2023 15:45:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oBF6AWMe;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SVVvg3NwGz4xDB
	for <linuxppc-dev@ozlabs.org>; Wed, 15 Nov 2023 15:45:02 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF47ffN009909
	for <linuxppc-dev@ozlabs.org>; Wed, 15 Nov 2023 04:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xoeGNuODI4Ks4WurHDLSdYhufxULclt9O233cWq8dls=;
 b=oBF6AWMeqG47s+A5VNJoCB/O26bc8DyT6E/lLuHelWMfR8Sag8rKZx9G9IxYQgc+m5nG
 r38O3gptkOTkGzX/WuQqHATwSGRsJlkX61yNOYHG0DB+QTiCuG18CmMvv+eFjKj/H2lq
 YXb07sohRZCzOlEBJZdqxClqfhFTdIjkOgKdPeI0qbzTHW1qFFt6TUVdVvvr1vWgI4ka
 bPmJMnfyJdhVKza22Y1cFRSBSajRB2lZXBbIV0DddYmma7p4Mdl/0txeEfq/xkUQgZkM
 SahcmVnjzkx78ZZDlRq8KIHe6TXBFczuprmI9Cn9VdVpb26WjVSOXIo7fVINrKqGAaQ1 sA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucppggvrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Wed, 15 Nov 2023 04:44:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF4eA5J029435
	for <linuxppc-dev@ozlabs.org>; Wed, 15 Nov 2023 04:44:58 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1mckg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Wed, 15 Nov 2023 04:44:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AF4iuDc22610566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 04:44:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5406658057;
	Wed, 15 Nov 2023 04:44:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A5BE58058;
	Wed, 15 Nov 2023 04:44:54 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.109.250])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Nov 2023 04:44:54 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
In-Reply-To: <20231029124548.12198-2-sourabhjain@linux.ibm.com>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
Date: Wed, 15 Nov 2023 10:14:00 +0530
Message-ID: <871qcr1v8v.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BopNmo4y3WLiYYJUvt84dqJrdggftOaY
X-Proofpoint-GUID: BopNmo4y3WLiYYJUvt84dqJrdggftOaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_02,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1011 mlxlogscore=544 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150035
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

....

> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index 27f9e11eda28..7be3d8894520 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
>  
>  #define FADUMP_CPU_UNKNOWN		(~((u32)0))
>  
> -#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
> +/*
> + * The introduction of new fields in the fadump crash info header has
> + * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
> + * This alteration ensures backward compatibility, enabling the kernel
> + * with the updated fadump crash info to handle kernel dumps from older
> + * kernels.
> + *
> + * To prevent the need for further changes to the magic number in the
> + * event of future modifications to the fadump header, a version field
> + * has been introduced to track the fadump crash info header version.
> + *
> + * Historically, there was no connection between the magic number and
> + * the fadump crash info header version. However, moving forward, the
> + * `FADMPINF` magic number in header will be treated as version 0, while
> + * the `FADMPSIG` magic number in header will include a version field to
> + * determine its version.
> + */
> +#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
> +#define FADUMP_VERSION			1
>

Can we keep the old magic details as

#define FADUMP_CRASH_INFO_MAGIC_OLD		fadump_str_to_u64("FADMPINF")
#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")

Also considering the struct need not be backward compatible, can we just
do

struct fadump_crash_info_header {
	u64		magic_number;
	u32		crashing_cpu;
	u64		elfcorehdr_addr;
	u64		elfcorehdr_size;
	u64		vmcoreinfo_raddr;
	u64		vmcoreinfo_size;
	struct pt_regs	regs;
	struct cpumask	cpu_mask;
};

static inline bool fadump_compatible(struct fadump_crash_info_header
*fdh)
{
	return (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC)
}

and fail fadump if we find it not compatible?

-aneesh
