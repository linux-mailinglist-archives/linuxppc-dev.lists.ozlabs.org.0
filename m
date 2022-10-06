Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD15F628F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 10:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjkzk0wpmz3dqX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 19:26:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQaJ2FUT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQaJ2FUT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjkyn3kHjz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 19:25:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2968HtnG020035;
	Thu, 6 Oct 2022 08:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=4z06aEt1CVcXcJJgdJGrsDHXiD7DCE9N7M+HtyX1Nks=;
 b=bQaJ2FUTsSUoluOzAzg/h3Zf3fjIf675pxE+nenCTE4abhR3Dmatz3sP6FEmtLAy+45X
 SdahBGAcK+oANqLADmy7MqL2MtS0GqJiomQlh6l36b4R3x+G10wEeac2TfA7wiB5ims4
 IQvT9NvIntzSeZ7ZzNBZT4xy+WB88S9RlA3NtKvSwhYM8EozNPyW6ToKwyfzolZQfWEg
 Ooh1F4FuPB8HGVjHmS+Mnszawe4YBcGEjnJFcmLUaoqw0DTNDqOCaKjuY+zJ0EzrVwnt
 iUNAz0riS+9hhIK7ItKKa9vvzWb3CFYAAagK56dQ3Xj+3gA4OUGz//gIp0XYyHWDuTsd BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1ucv864c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 08:25:03 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2968J4ch023613;
	Thu, 6 Oct 2022 08:25:03 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1ucv863k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 08:25:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2968MQG2027853;
	Thu, 6 Oct 2022 08:25:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3jxd68vxfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 08:25:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2968Ow7D51314948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 08:24:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 572E4A405C;
	Thu,  6 Oct 2022 08:24:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01585A4054;
	Thu,  6 Oct 2022 08:24:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 08:24:57 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D3689605A7;
	Thu,  6 Oct 2022 19:24:52 +1100 (AEDT)
Message-ID: <2e13f9e24866c493c2ec656d3ca625df9f4ca14f.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/6] powerpc/module: Optimise nearby branches in ELF
 V2 ABI stub
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 06 Oct 2022 19:24:52 +1100
In-Reply-To: <20221005053234.29312-4-bgray@linux.ibm.com>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
	 <20221005053234.29312-4-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sjOsItCl3urofmbSn8wGqfy6-yTBCr-F
X-Proofpoint-ORIG-GUID: 3Hs5vCDElrkvmAmQnkb3r7Z6zG70yZvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060048
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
Cc: peterz@infradead.org, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-10-05 at 16:32 +1100, Benjamin Gray wrote:
> Inserts a direct branch to the stub target when possible, replacing
> the
> mtctr/btctr sequence.
> 
> The load into r12 could potentially be skipped too, but that change
> would need to refactor the arguments to indicate that the address
> does not have a separate local entry point.
> 
> This helps the static call implementation, where modules calling
> their
> own trampolines are called through this stub and the trampoline is
> easily within range of a direct branch.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

I'm not well versed in this code but nothing stands out as problematic
and it makes sense.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  arch/powerpc/kernel/module_64.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/module_64.c
> b/arch/powerpc/kernel/module_64.c
> index 4d816f7785b4..13ce7a4d8a8d 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -141,6 +141,12 @@ static u32 ppc64_stub_insns[] = {
>         PPC_RAW_BCTR(),
>  };
>  
> +#ifdef CONFIG_PPC64_ELF_ABI_V1
> +#define PPC64_STUB_MTCTR_OFFSET 5
> +#else
> +#define PPC64_STUB_MTCTR_OFFSET 4
> +#endif
> +
>  /* Count how many different 24-bit relocations (different symbol,
>     different addend) */
>  static unsigned int count_relocs(const Elf64_Rela *rela, unsigned
> int num)
> @@ -426,6 +432,7 @@ static inline int create_stub(const Elf64_Shdr
> *sechdrs,
>                               struct module *me,
>                               const char *name)
>  {
> +       int err;
>         long reladdr;
>         func_desc_t desc;
>         int i;
> @@ -439,6 +446,11 @@ static inline int create_stub(const Elf64_Shdr
> *sechdrs,
>                         return 0;
>         }
>  
> +       /* Replace indirect branch sequence with direct branch where
> possible */
> +       err = patch_branch(&entry->jump[PPC64_STUB_MTCTR_OFFSET],
> addr, 0);
> +       if (err && err != -ERANGE)
> +               return 0;
> +
>         /* Stub uses address relative to r2. */
>         reladdr = (unsigned long)entry - my_r2(sechdrs, me);
>         if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

