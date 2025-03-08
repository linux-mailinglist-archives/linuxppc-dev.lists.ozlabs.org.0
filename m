Return-Path: <linuxppc-dev+bounces-6822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C5A579B7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 11:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8zRz10nQz30Lt;
	Sat,  8 Mar 2025 21:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741428623;
	cv=none; b=cLTOOG6/SWbrFeIrarfKSUekeqm3U5N8u8h46Ke9hNg8gwFq188rbRvZAXPwBVEtIoEArx2gGXqdNBnOdajoYzwx1ew/+pYG/hg9if9m5cJh7HrwEExWQYyXfMCAWe0kPz+V6JsfC0AxwcZe4pYOuEbKisCX6RVNFXUiRZBfmV7/pjuvdds3XD76aA7gPeyDAvydrFG0hYMwW75+L1PuOAzA1Y0Zl4AM5eAOJ42mo1hHyxvGWufJgSZGA3PwvaQW9lLkq0xdwOLneBZCmBkPRqbwY7OIz4IP19l447zcKiZirK3orzMIR+EMLvlZZluph2DuVnw+nQjjEgtdpiMHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741428623; c=relaxed/relaxed;
	bh=YCN+W1fUjsijjxnGE7asmvmFJFb5jKP+NWmvsac7Z0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8yPLCOLaP3MM0hJx6uyI8Wo4z23Q32detAs2s08jyG32WnOXxfTuM7424Scb0Wssj6WBst/kYrgBTOeZevBktoyXD68FPuwNFPrd9nQeSZv4QVzuzamCHb1kVcsJnGSXkzcFDCC7Q2zK3e4c9IQf+DeSen1yUkv48C48QhqXj6aQ8uGdkEC0eY0qHmqfRSQWinXTbSX0/pMfIuDuWFBtymiZw45LA2AjbopMqkm455TPh5IzPyP7sYakeb2xsqS4fhFWMP/7HefjioqiS4xk1g/axYO+tHdjgYBrcetR9InezAQwp7dzAAI3G78bCY4QlbuQJOvLdQYNmfUT2mhTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LoqZXyDb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LoqZXyDb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8zRx6tYgz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 21:10:21 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5284VmNM010947;
	Sat, 8 Mar 2025 10:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=YCN+W1fUjsijjxnGE7asmvmFJFb5jK
	P+NWmvsac7Z0U=; b=LoqZXyDbbCseZ8OkAETnLpTAuFz718kg4A8fW8kI1b8a0W
	4d9BAsjpWgYv/qrGQg0/yZ7iF+Qt3Fq4lH19ZNW6mBRJ9vSaN4apwDtKv1aY7PkT
	JrkDd2dZJ/idkn49QzfqSXcOTTJxBx7fZXJ3kf1bFsSQlAMCrRyrv3A0zKkYhC76
	gg0IUrQUVcaUpuV0mRFDdpBNSFTcJhB15gk/bV/6WUhkvvti6FOKD/O4i19uHJSF
	mz+BQ7mBI6v1kg8/+3drsb93U7VXueut5GNj1awVQVR6URUCkp9Kp2yEbyKsJKVO
	wai/IehLZS1xjywGvhq2ZXGQ8ObAZflsAdLKu4Pw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 458caj98dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Mar 2025 10:10:03 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5289xgig031173;
	Sat, 8 Mar 2025 10:10:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 458caj98d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Mar 2025 10:10:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5286DUUI025026;
	Sat, 8 Mar 2025 10:10:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 454f92k7v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Mar 2025 10:10:02 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 528AA03T42140030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Mar 2025 10:10:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9150B2004B;
	Sat,  8 Mar 2025 10:10:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEE862004E;
	Sat,  8 Mar 2025 10:09:59 +0000 (GMT)
Received: from localhost (unknown [9.43.38.1])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Mar 2025 10:09:59 +0000 (GMT)
Date: Sat, 8 Mar 2025 15:39:58 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: Fix build with gcc 15
Message-ID: <6d47dydexfieolj2r6jbbn5lyb5v5sg5owg7cb4qwltsor3ir6@f2h33gx7f2dg>
References: <20250307092055.21986-1-msuchanek@suse.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307092055.21986-1-msuchanek@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v0YDPd8Ce61Or7KjAILdU_hCPJ46r3WL
X-Proofpoint-GUID: RsPy4hhKvtu2qJhqitc-nRdQnyqmfHG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=874 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503080071
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 07, 2025 at 10:20:52AM +0100, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/boot/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd2..e6b35699c049 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -33,6 +33,7 @@ else
>  endif
>  
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
> +BOOTTARGETFLAGS	+= -std=gnu11
>  BOOTTARGETFLAGS	+= -m64
>  BOOTTARGETFLAGS	+= -mabi=elfv2
>  ifdef CONFIG_PPC64_ELF_ABI_V2
> -- 
> 2.47.1
> 
> 

Reviewed-by: Nysal Jan K.A. <nysal@linux.ibm.com>

