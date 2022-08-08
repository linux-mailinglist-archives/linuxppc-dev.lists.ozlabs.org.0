Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494658C419
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 09:36:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1SgS0v9Kz3blf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 17:36:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tCQr3CKB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tCQr3CKB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Sfh4QtJz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 17:35:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2787HK7e032104
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 07:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=D5+9m0HMbUsfrNly+gCm48gosBg2f2CiOAapw6aIoh4=;
 b=tCQr3CKBu5DoKiiM++VUDXBIeUPcNKIV3HUsIPGHPqyqs1LTiN5J4M+8+BF7WRbjLspR
 TMqUNf3VRitNBSQhTIQunWjxsDdJsBnHl+YBPc6If8NDj9gATN6fi15SFXvkrpASXccq
 Y4WsorYTjPx8Ou415UPnMiRIV0XgaDVrlwu9xdydzuWDPCzTdJ8K2yT31e0Kjh/7fee7
 1kWniMHOh8XRRpzcyoPad1su/d3OYJ6VtbGk2qAzjtXlyyPHqPyLI+mJwa5yeZz+GlTx
 V2G5+R+LmmavUn6wecgsMLvL3Xpbjh+pLGyFxvNjVn7mkL9MRKz2mRuIplh/Vv1Ak7RB Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htwyfgfd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 07:35:36 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2787Hgcx000702
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 07:35:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htwyfgfca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 07:35:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2787M1b8024643;
	Mon, 8 Aug 2022 07:35:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hsfjj1v02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 07:35:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2787ZWAF31523144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 07:35:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAA9711C04A;
	Mon,  8 Aug 2022 07:35:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9419911C04C;
	Mon,  8 Aug 2022 07:35:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 07:35:31 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 170C76010A;
	Mon,  8 Aug 2022 17:35:24 +1000 (AEST)
Message-ID: <172c6e205c4f1ee36900b7ba3753847983242f6c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 08/14] powerpc: Use common syscall handler type
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 17:35:23 +1000
In-Reply-To: <20220725062845.119908-1-rmclure@linux.ibm.com>
References: <20220725062845.119908-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lfS2Bi4OqU0_0Rv2iYe8ShteJqT-zfgX
X-Proofpoint-GUID: 3UsgiBP1ZK8xJCoTaZNB369vom7TmQPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208080036
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

On Mon, 2022-07-25 at 16:28 +1000, Rohan McLure wrote:
> Cause syscall handlers to be typed as follows when called indirectly
> throughout the kernel.
> 
> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned
> long,
>                            unsigned long, unsigned long, unsigned
> long);
> 
> Since both 32 and 64-bit abis allow for at least the first six
> machine-word length parameters to a function to be passed by
> registers,
> even handlers which admit fewer than six parameters may be viewed as
> having the above type.
> 
> Fixup comparisons in VDSO to avoid pointer-integer comparison.
> Introduce
> explicit cast on systems with SPUs.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

This patch needs rebasing on top of commit 1547db7d1f44 ("powerpc: Move
system_call_exception() to syscall.c").

> 
> diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c
> b/arch/powerpc/platforms/cell/spu_callbacks.c
> index fe0d8797a00a..114bbe2eeacc 100644
> --- a/arch/powerpc/platforms/cell/spu_callbacks.c
> +++ b/arch/powerpc/platforms/cell/spu_callbacks.c
> @@ -34,22 +34,22 @@
>   *     mbind, mq_open, ipc, ...
>   */
>  
> -static void *spu_syscall_table[] = {
> +static const syscall_fn spu_syscall_table[] = {
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr,
> entry)
> -#define __SYSCALL(nr, entry) [nr] = entry,
> +#define __SYSCALL(nr, entry) [nr] = (void *) entry,
>  #include <asm/syscall_table_spu.h>
>  };
>  
>  long spu_sys_callback(struct spu_syscall_block *s)
>  {
> -       long (*syscall)(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64
> a6);
> +       syscall_fn syscall;
>  
>         if (s->nr_ret >= ARRAY_SIZE(spu_syscall_table)) {
>                 pr_debug("%s: invalid syscall #%lld", __func__, s-
> >nr_ret);
>                 return -ENOSYS;
>         }
>  
> -       syscall = spu_syscall_table[s->nr_ret];
> +       syscall = (syscall_fn) spu_syscall_table[s->nr_ret];

I don't think this cast is necessary?

>  
>         pr_debug("SPU-syscall "
>                  "%pSR:syscall%lld(%llx, %llx, %llx, %llx, %llx,
> %llx)\n",

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

