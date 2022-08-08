Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225458C451
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 09:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Sqh2tdwz2yxF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 17:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mljA+2Xb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mljA+2Xb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Spz6P7xz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 17:42:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2787CE0S007247
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 07:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=u7+/b2gYCB3ItRfWpXbv/O85hbogXFQRLeTLfKZXTnk=;
 b=mljA+2Xbf86vKZrMjkouUUGPnnFAlUj7TpW+jCcpFhcLhrJIQLywF2k+daeUtQgmCYY9
 LAJZ+3ojxjQm5rnjR8IsjyGCycbUeIn9ZDKeWcMXYhTa7ccxkRDntTOUbX4WjRT6MPAS
 Znvg6mm/sCeEM8x/arfgtRdqBp0aUuph7D6Dib+gPctNJpR0xjySQheXl1qhphzbBct8
 QoRS+qSd7gM2cCQoe0NHrQLsIhLPipFZIAszreZKrESyn9UJ/jSDW2t4XDWSxdhR0+hu
 0ElqGzolrjslD4uRzwzNJaCFjKCOfQdmg9fgv602p4SCOdRI/ULtkz+f5mhsuPRZKeQK rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htwvu0tnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 07:42:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2787FaVa022687
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 07:42:48 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htwvu0tn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 07:42:47 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2787ZIdR021502;
	Mon, 8 Aug 2022 07:42:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3hsfx8sct0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 07:42:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2787ghP27602490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 07:42:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14DC042045;
	Mon,  8 Aug 2022 07:42:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B18F542041;
	Mon,  8 Aug 2022 07:42:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 07:42:42 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 89D9A6010A;
	Mon,  8 Aug 2022 17:42:41 +1000 (AEST)
Message-ID: <7b6439f8288d71306e63d89f145597d1327afc35.camel@linux.ibm.com>
Subject: Re: [PATCH v2 09/14] powerpc: Add NULLIFY_GPRS macros for register
 clears
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 17:42:41 +1000
In-Reply-To: <20220725062906.120088-1-rmclure@linux.ibm.com>
References: <20220725062906.120088-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LqbN_zTrAc4FT_vdQCnuTasp-iDob8tY
X-Proofpoint-GUID: 5I2XJPgHfBHlVlzRHgZXKofv6ypRA1AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 mlxlogscore=947 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080038
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

On Mon, 2022-07-25 at 16:29 +1000, Rohan McLure wrote:
> Macros for restoring and saving registers to and from the stack
> exist.
> Provide macros with the same interface for clearing a range of gprs
> by
> setting each register's value in that range to zero.
> 
> The resulting macros are called NULLIFY_GPRS and NULLIFY_NVGPRS,
> keeping
> with the naming of the accompanying restore and save macros, and
> usage
> of nullify to describe this operation elsewhere in the kernel.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious
> verb

And I see you've addressed my comment re 32 v 64 bit from V1 as well.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/ppc_asm.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/ppc_asm.h
> b/arch/powerpc/include/asm/ppc_asm.h
> index 83c02f5a7f2a..d6c46082bf7f 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -33,6 +33,20 @@
>         .endr
>  .endm
>  
> +/*
> + * This expands to a sequence of register clears for regs start to
> end
> + * inclusive, of the form:
> + *
> + *   li rN, 0
> + */
> +.macro NULLIFY_REGS start, end
> +       .Lreg=\start
> +       .rept (\end - \start + 1)
> +       li      .Lreg, 0
> +       .Lreg=.Lreg+1
> +       .endr
> +.endm
> +

I suppose this could be done using the existing OP_REGS macro,
something like OP_REGS li, 0, start, end, 0, 0 - but a load immediate
is semantically a bit different from the existing uses of OP_REGS so I
don't mind either way

>  /*
>   * Macros for storing registers into and loading registers from
>   * exception frames.
> @@ -49,6 +63,14 @@
>  #define REST_NVGPRS(base)              REST_GPRS(13, 31, base)
>  #endif
>  
> +#define        NULLIFY_GPRS(start, end)        NULLIFY_REGS start,
> end
> +#ifdef __powerpc64__
> +#define        NULLIFY_NVGPRS()                NULLIFY_GPRS(14, 31)
> +#else
> +#define        NULLIFY_NVGPRS()                NULLIFY_GPRS(13, 31)
> +#endif
> +#define        NULLIFY_GPR(n)                  NULLIFY_GPRS(n, n)
> +
>  #define SAVE_GPR(n, base)              SAVE_GPRS(n, n, base)
>  #define REST_GPR(n, base)              REST_GPRS(n, n, base)
>  

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

