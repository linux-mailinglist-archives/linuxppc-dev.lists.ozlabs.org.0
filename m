Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B532C568209
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 10:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdCp93kMNz3c56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 18:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FcX6Xkk9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FcX6Xkk9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdCnS6tn7z3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 18:46:20 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2667M8ap008613;
	Wed, 6 Jul 2022 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=l3MWD8hQIFQ9/QpMm4hWA643ZTU/ttNO44gzzOp1c0I=;
 b=FcX6Xkk9BOXtgPmP1vshPATskdTvovXszmeyKuA0wboYvwPry/qJ79c4xv/AqDEqcRVr
 CYmRcfoeq0kdiz+g7RCCjmASed334JPMeNOQMvrrt/uDrRpa1iSaee5lXlUh8/uwudxV
 OHC3UfGfKgSaLNbdwruBnpmhgL36cOfosVuU416wdon8q61VIr3dA2Mu3JAgK45GUrKr
 WO+5XYroJ5xLVSnLYZIFfmqdaF+EoFD7T28RvTijkvsnTW63BaonWS30JhmKwdnr+Enb
 hL223wqlOkHIe2auLqGipfzTXBMIDMxFhfP+wtfs7TvY01bDYw0bOV8GQwpJP6db4ANf NQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h55xfhm71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 08:40:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2668LiCJ025027;
	Wed, 6 Jul 2022 08:40:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3h4ujsgpxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 08:40:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2668ed9M23593384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Jul 2022 08:40:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EA9411C04C;
	Wed,  6 Jul 2022 08:40:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9903211C04A;
	Wed,  6 Jul 2022 08:40:38 +0000 (GMT)
Received: from osiris (unknown [9.145.44.193])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed,  6 Jul 2022 08:40:38 +0000 (GMT)
Date: Wed, 6 Jul 2022 10:40:37 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] random: remove CONFIG_ARCH_RANDOM
Message-ID: <YsVKhbiKyuc+vgNO@osiris>
References: <YsTXI3J+ptkN/vb4@zx2c4.com>
 <20220706003225.335768-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706003225.335768-1-Jason@zx2c4.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jMZP3hl2mP4unmTL5_U5VeAn3puFmrFQ
X-Proofpoint-ORIG-GUID: jMZP3hl2mP4unmTL5_U5VeAn3puFmrFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=973 mlxscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060031
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 02:32:25AM +0200, Jason A. Donenfeld wrote:
> When RDRAND was introduced, there was much discussion on whether it
> should be trusted and how the kernel should handle that. Initially, two
> mechanisms cropped up, CONFIG_ARCH_RANDOM, a compile time switch, and
> "nordrand", a boot-time switch.
> 
> Later the thinking evolved. With a properly designed RNG, using RDRAND
> values alone won't harm anything, even if the outputs are malicious.
> Rather, the issue is whether those values are being *trusted* to be good
> or not. And so a new set of options were introduced as the real
> ones that people use -- CONFIG_RANDOM_TRUST_CPU and "random.trust_cpu".
> With these options, RDRAND is used, but it's not always credited. So in
> the worst case, it does nothing, and in the best case, maybe it helps.
> 
> Along the way, CONFIG_ARCH_RANDOM's meaning got sort of pulled into the
> center and became something certain platforms force-select.
> 
> The old options don't really help with much, and it's a bit odd to have
> special handling for these instructions when the kernel can deal fine
> with the existence or untrusted existence or broken existence or
> non-existence of that CPU capability.
> 
> So this commit simplifies things down to the two options that are
> actually used, and removes the confusing old ones that aren't used or
> useful. It leaves "nordrand" for now, as the removal of that will take a
> different route.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
...
>  arch/s390/Kconfig                                 | 15 ---------------
>  arch/s390/configs/zfcpdump_defconfig              |  1 -
>  arch/s390/crypto/Makefile                         |  2 +-
>  arch/s390/include/asm/archrandom.h                |  3 ---

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
