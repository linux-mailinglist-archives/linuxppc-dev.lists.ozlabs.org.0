Return-Path: <linuxppc-dev+bounces-10153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47416AFC2A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 08:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbrgG6bWwz2xgQ;
	Tue,  8 Jul 2025 16:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751955882;
	cv=none; b=N3Aa1Hh7AdKR57oaWbuMftrvs39BH1KRahksgZCoj1Zf4QHWucwpfmU8/dVnlwUIQ/Wj077k4iWrQdpYBtJJyCyctfbAVLQ3uTHbPK/fYxTXi2PtxN9S1EMrFPiQw+VQicaX7zYzTvIkz8SGyTCnymk0Tr+yMjR564t47MpDmK7hHJZVXUT9n0BVavrx3+tzioIc8vs8bL1JsSKo5+abBwzLEC8KKtDGrNtaUIvt5AIoKzqSrgb1GE77HAHM7DQrqvpMGpKewG56WXXgPo9S14efkVWDejqhf0KOPcpXKBy4l2fEcGznudPynHg1CrHaz9b5PxQTW000rj8wpOLTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751955882; c=relaxed/relaxed;
	bh=JrqkEGQNWicN6z7I9Dn4pCP0FUXIKVd67WcnJYSb1UA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=BXOAzXVW6pQDIrkIY+ABEIuxmYO7OhELoLwIhu4kIzuLAR3v+ZkQJTYvHVBc9GNM/cHdwjAB6+wu4JfZw23Bf8bz55k33yweydCVrGpHW1EyZ/thILEtOPavamNXUZS9aMTCWelQ1gaE0RrHwGKuwbgFeYu3or6cevEgRyW/rqqw864xVn1zot4ZMWroTQEdgBH6B92AEJZLGNQc47aWcXppEGiUd/C3rk/xxw+pZ7tzibAQfeeBQZKsVv8//FzMwQlxIQ0zIEELWEudjEDquDcPShRnO7cdODiDzW7C7Px0nNVeR93xSUSyhAc3fBHTW/owG2mFTfYyA492IjxAiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=buEhenlq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=buEhenlq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbrgG0rQZz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 16:24:41 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567JxZ8l032551;
	Tue, 8 Jul 2025 06:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JrqkEG
	QNWicN6z7I9Dn4pCP0FUXIKVd67WcnJYSb1UA=; b=buEhenlqN+VQLFHqmpmM8I
	MC4YRw+E+96K2fSFaD3WUwP55sZfskieqyWJVJV82/0CElbnUtTNPhNS6CIiYGUN
	kP6KcIPSzP266MhPv6gjCxKLOIHEdA99RRkAIOEH+nDaG/zEw37ZuAh7ebYT9M1f
	7HZLr3KeUCXvuTJQv/3QoyBLBRSaH0KTdDpXvGN0iFizISKQJnvBg1nAE3eUlJ7I
	RA4ODSj3WsOx40td8KmIRmfk2rKjZmFMyAxqH6wi+UdVTeLytpj45P+IUTbvpQoa
	N7Lnvma8rMGh3ovPT33t7+mIQO7OD4+d0SwwUoZR/xoam/PjKAe22HH20+UlPohQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptjqwh5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:24:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5686OcTX011214;
	Tue, 8 Jul 2025 06:24:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptjqwh5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:24:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5682K312002888;
	Tue, 8 Jul 2025 06:24:37 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfvm9he6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 06:24:37 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5686OURk23986708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jul 2025 06:24:30 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D1AA58059;
	Tue,  8 Jul 2025 06:24:36 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 185F358053;
	Tue,  8 Jul 2025 06:24:35 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Jul 2025 06:24:34 +0000 (GMT)
Message-ID: <a5c6173f3109dac14e43c30f6483afe19573870f.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND 3/3] Documentation: ioctl-number: Correct full
 path to papr-physical-attestation.h
From: Haren Myneni <haren@linux.ibm.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Documentation
 <linux-doc@vger.kernel.org>,
        Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>,
        Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Donnellan
 <ajd@linux.ibm.com>
Date: Mon, 07 Jul 2025 23:24:34 -0700
In-Reply-To: <20250708004334.15861-4-bagasdotme@gmail.com>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
	 <20250708004334.15861-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GL8IEvNK c=1 sm=1 tr=0 ts=686cb9a6 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=kidChhKsLFQF8T2tou0A:9 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: t9WIYJFgt4RV27TIljZyJXv5Pk9JUO7_
X-Proofpoint-GUID: uqEOUAgq8dakJ3CcwbrDoRHfx64MqKjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0OSBTYWx0ZWRfX8+eS8LAgOL/l +r0z332481+fayHUujf9JfUgcSI/OWojgHaViMh0Kl5QMtJDti66rumAb4OUgS2Epr+wgKsLmBJ U8nQSZ59C409hWJWcvW5k0UL60oAithLBI/qVaffgdWPlIe8nKUamjyy2EeP24AsVCNFp6XlPbY
 Yk2kk/UaHvMvbREPhQ7F71227bYKaQSm8BaC7u2ne3h+1O7zwUNZmXknpH8eEU43XtPN0e4r1N2 xvNCy5T7avGODHgiB4cmlyrAOUIMIfwrGBKWxViowvWz7CHhXcA79DbarXL0j23AAhlYlg2FUXd yODDabiygZ0S2jJmsZrwos62Ut4b832XqlLBNMHjowBrs3nrsaBQPqfZC1ESYrpWdJiYYhOq/Q9
 ZfrvrUUQlWLjwOU1WN7CuSAzvdDY2R0iRNh8D289yF/VyAiJQ+RC8JkY81bdk1DO5C8OvpRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=873
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080049
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-07-08 at 07:43 +0700, Bagas Sanjaya wrote:
> Commit 03c9d1a5a30d93 ("Documentation: Fix description format for
> powerpc RTAS ioctls") fixes Sphinx warning by chopping arch/ path
> component of papr-physical-attestation.h to fit existing "Include
> File"
> column. Now that the column has been widened just enough for that
> header file, add back its arch/ path component.
> 
> Fixes: 03c9d1a5a30d ("Documentation: Fix description format for
> powerpc RTAS ioctls")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for fixing.

Reviewed-by: Haren Myneni <haren@linux.ibm.com>

> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst
> b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index b45f5d857a00b6..5aa09865b3aa0f 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -369,7 +369,7 @@ Code  Seq#    Include
> File                                             Comments
>                                                                      
>    <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-
> dump.h        powerpc/pseries Platform Dump API
>                                                                      
>    <mailto:linuxppc-dev@lists.ozlabs.org>
> -0xB2  08     powerpc/include/uapi/asm/papr-physical-
> attestation.h      powerpc/pseries Physical Attestation API
> +0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-
> attestation.h powerpc/pseries Physical Attestation API
>                                                                      
>    <mailto:linuxppc-dev@lists.ozlabs.org>
>  0xB3  00     linux/mmc/ioctl.h
>  0xB4  00-
> 0F  linux/gpio.h                                              <mailto
> :linux-gpio@vger.kernel.org>


