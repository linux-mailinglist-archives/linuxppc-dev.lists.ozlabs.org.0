Return-Path: <linuxppc-dev+bounces-7978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C6A9C33A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 11:22:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkS6m6Nx0z2xlL;
	Fri, 25 Apr 2025 19:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745572960;
	cv=none; b=SxyKmhIMq8dXLJaqLBZoVir0NLhjnXzVpKwPQHJqMYOYWLOLlft6KoFUCax7Whhhsf/RZe8SqY1AdsZ721QvK+AUS8pNtOtlPXjzcD/uzZwmizYfOS9m3uLBkkE231SDALAd60WuO361bVs/NIGcbBy5Oa0lXOdwp5K04Zabykc5VB4GfYamY/Wc1w4hkkGQurD7D2TLcj2OOD2XnB5dmCkWF/GBREE0fApikjRbE5aABGM9HgIHZMz9h2pBhuOrjlqXDgcZVoqPoM0AKaZ9nEdRloy2UdTSz2FIWD6kdXHIN7pZhVd8MnOiGTFt3+/KTzSywSrIHrVZjb+uOC9sZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745572960; c=relaxed/relaxed;
	bh=LN1pPLHSqJ9U/pYwUJkUNGq9IVtE+AolnPWKBhc2ADA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eja5gPXUaaog2lVOxlY8Bnxb3xfPcoP4PA9vFyT8x9Qmky8HOKUH454kBudwQ6X6WrP2o46sapxP5g3waBee0g7npG+GwMSKZXQw9KO8Q8HIc+l49OSwTAmZSSmtXw3sAfk7Gb/16haPCQYWHdfDFW0DbBXssUFInj/log8xBTPliedUOKPI8Mrm4zzc0HyUKrbBLRJJ8bpDxf3K4NnaOmV33+C5H5hu7vEiR1fdvVBZy38bp0raN6H7GbXT6WMWOKlhG1GMbHVG7EUrnbr574LKqwxCb+/eiqjl7Oh1XAiUiLb+HPnebSNRUFVwruYzSSXlxOtUJxN9T/g3bTw6GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VGrSB5nZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VGrSB5nZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkS6l5jykz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 19:22:38 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OL3NgJ000435;
	Fri, 25 Apr 2025 09:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=LN1pPLHSqJ9U/pYwUJkUNGq9IVtE+A
	olnPWKBhc2ADA=; b=VGrSB5nZcoK0RffuWJWHLhfuM8GAlIazwHpD7eE/OBVuHw
	UY3GXaxKq2D71/B4zNB4vPkg7RU8GLsSd3wpAM4jUddw/7hHm2zYfpLLDCZrronN
	7fdJJRI4pAEthFQjKihc5pKKvSyfhDCHTY10xtCx5syM+2DlwYS9+VWDvD4PWQtf
	8Yu10XexVmGtYiWCrrw3G5PiGd55CMecKwmGz1Pdfr5LUchVzQAC46Y16zkCJ9Dc
	tmCVBZdDy8C/obfgKZnBaMG7VemuuimbYqmjNtr7EcExilbKg51/JeEcyh9LjBl3
	cdqVX/zvRV7P+Ha+5wq0iwzON6GHz/dXPOdcG6zA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvktjc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:22:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8nqOG005844;
	Fri, 25 Apr 2025 09:22:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxmhc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:22:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53P9MT0v52953398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 09:22:29 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CAF52008E;
	Fri, 25 Apr 2025 09:22:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 904362008C;
	Fri, 25 Apr 2025 09:22:28 +0000 (GMT)
Received: from osiris (unknown [9.111.13.86])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 09:22:28 +0000 (GMT)
Date: Fri, 25 Apr 2025 11:22:27 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 5/7] s390/crc: drop "glue" from filenames
Message-ID: <20250425092227.7180Bda-hca@linux.ibm.com>
References: <20250424002038.179114-1-ebiggers@kernel.org>
 <20250424002038.179114-6-ebiggers@kernel.org>
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
In-Reply-To: <20250424002038.179114-6-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX3e4KGJJceAbh 8ulqlz118/sMZd30x5ryne975AKqT2PWmDFs66SGKThLVdu9fq1jhjkFbOret7lzmwtkhjbnsnB hs8lCmJaLnb69Lk1nfCnnPbWIgzBjiZaaG4lu0UN123R18mRCDBXRAC1wTGrk6iK/JjlDXTRwZV
 4z5lzLYQhMLPkX+/OMVNe7fX6zSl30Vb/FBd4OkHMfy3F1JIKNmN42hT5hZadKFSxrlUrjc7NMZ VQksjv1Ly9bOVvWc8XRchJM0dhpfYzENrwJOX4As6O2FlaTn8pASor5YRmutatyfFOBmNA4gl0O g2G+K9qoOwZ5KYQInoScDk+YBeHwzT3ANt0w/3x6nYd3g8WsNLWNwmzVQVVhllOpCLHZhHo7HR7
 X38P3SFEG10nDi/t0vhJoVJqOiQz3xO3KB+YPOHMmO4fh2y/FOTF+xrLCTUtekJWCXWbaFc4
X-Proofpoint-ORIG-GUID: fzRVex48zlkxZ2zgDgYwyiXuH5CDRUOW
X-Proofpoint-GUID: fzRVex48zlkxZ2zgDgYwyiXuH5CDRUOW
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=680b5458 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=TEI_16ca6WvQRRaRdDEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=632
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 23, 2025 at 05:20:36PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The use of the term "glue" in filenames is a Crypto API-ism that does
> not show up elsewhere in lib/.  I think adopting it there was a mistake.
> The library just uses standard functions, so the amount of code that
> could be considered "glue" is quite small.  And while often the C
> functions just wrap the assembly functions, there are also cases like
> crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
> in-lining the actual implementation into the C function.  That's not
> "glue code", but rather the actual code.
> 
> Therefore, let's drop "glue" from the filenames and instead use e.g.
> crc32.c instead of crc32-glue.c.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/lib/Makefile                  | 2 +-
>  arch/s390/lib/{crc32-glue.c => crc32.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

