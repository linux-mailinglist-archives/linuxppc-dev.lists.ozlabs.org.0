Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B6586736
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 12:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxDD827Q3z3bry
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 20:01:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcrlKjCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcrlKjCt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxDCM68HLz2xJZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 20:00:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2718lDOm002036
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Aug 2022 10:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=EmYVxdZENBv5YItMVxG9t+9nqpRUjtWsdKWByDczSak=;
 b=gcrlKjCtVcGyyC4ZyYWnoI14lmiWMA90RkoyLryzUmCCgZTKCyQVqsLvCoTsHMMKvdN7
 YoSeni27L6wFMmM7w1NZf6QnsQ6xkRjJW/t8LrfLlGxODq9R7acbR4YZHUUm0DD07VnI
 kjnVloKfrkij3n+9kUbxYhNajFVKycSpYgBcewzhrk68haCVdZSp2CRhgD5uuX912cpF
 ipSF7gTgHv8un3G0TKdUaikNFswATXjQVXabKl5C43tDQloRmBJFL+wHZTSNTVRbyisC
 FRvudXLLW8/wtfq5fwyRCH78V86ldYzc8MYDq8jEQhuf77xVUCddA4QRLkRuUgwJjS8S 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpbmk1wd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 10:00:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2719lPYU007406
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Aug 2022 10:00:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpbmk1wbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 10:00:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2719qHxJ001955;
	Mon, 1 Aug 2022 10:00:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3hmv98t097-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 10:00:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271A0b9x29032854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 10:00:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EE68AE04D;
	Mon,  1 Aug 2022 10:00:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 189ECAE045;
	Mon,  1 Aug 2022 10:00:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 10:00:37 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EA87B60142;
	Mon,  1 Aug 2022 20:00:31 +1000 (AEST)
Message-ID: <0eb09f119e2752b80c3d28bb620cee6205adc7db.camel@linux.ibm.com>
Subject: Re: [PATCH v2 02/14] powerpc: Remove direct call to personality
 syscall handler
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 01 Aug 2022 20:00:27 +1000
In-Reply-To: <20220725062512.118602-1-rmclure@linux.ibm.com>
References: <20220725062512.118602-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: miK_o2QVF8QOsY-2XS7zgPiHsuft_mdW
X-Proofpoint-ORIG-GUID: t7pilSKGvHeYG_TtIBZfpV6DThC50mGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=918
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010045
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:25 +1000, Rohan McLure wrote:
> Syscall handlers should not be invoked internally by their symbol
> names,
> as these symbols defined by the architecture-defined SYSCALL_DEFINE
> macro. Fortunately, in the case of ppc64_personality, its call to
> sys_personality can be replaced with an invocation to the
> equivalent ksys_personality inline helper in <linux/syscalls.h>.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> V1 -> V2: Use inline helper to deduplicate bodies in compat/regular
> implementations.
> ---
>  arch/powerpc/kernel/syscalls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/syscalls.c
> b/arch/powerpc/kernel/syscalls.c
> index ca20083dd0ae..22755502afc0 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -89,7 +89,7 @@ static inline long do_ppc64_personality(unsigned
> long personality)
>         if (personality(current->personality) == PER_LINUX32
>             && personality(personality) == PER_LINUX)
>                 personality = (personality & ~PER_MASK) |
> PER_LINUX32;
> -       ret = sys_personality(personality);
> +       ret = ksys_personality(personality);
>         if (personality(ret) == PER_LINUX32)
>                 ret = (ret & ~PER_MASK) | PER_LINUX;
>         return ret;


