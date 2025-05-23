Return-Path: <linuxppc-dev+bounces-8909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B2AC1BCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 07:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3YWy4Bcyz2yTK;
	Fri, 23 May 2025 15:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747977918;
	cv=none; b=Rgfkn7f+VRAN0xZaYtY43dQJ+6pfykty4kpW4UunQ1dyFN+Dj/Q6xbBpyIVdVAXVyP6+IqbDv24kCgpnT3Ivm6hUc3f/wCyGokw9ef66u7jD3wV6pHILwMUQ0Fm393wVp7hl1a2810Qq3WquS2dPDhO29RUQpZNzgVmTo9OWme8Y/euKUnykIBuNSmJSjtE6FkAhsatcLLnifSAFAQXCb/IvFVjg7AAdOnxmZcmTd/1vio/ajrS38G+9FllT6LWabC8Eej2XkE+VBGU0U2S8uMBouJ/BnX+o+PQa8bVEJgncqI1D0Y3sVmOjORN/CEM5WpAICCX55O0jN0WAtMYhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747977918; c=relaxed/relaxed;
	bh=T9QR0vRv/b0B11JDYax3wCR+tNiJcsp+EMocfpzOxi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nubGZAqzd0f03ntwBACn8esUZ+DuyTsVIUqubxr8uEbDTpSrv5vOgU3/UuGZ3YVMrB1ZXZNlSk/yWHGJ+UXZpbUmcQcLV5maOSXEtW1AhNGtoPwjmzSdua6jpC63saHBjYy5FFSJK0VhLI4JsDL8w0jRbUriIbjuqrDFzSlFNOdTO5ZQ6saDlxvEppKhrgZnR2DneJbZYZrtQgxZbRnwgOlOTJGYw9hzQWDmcm2uusBjLeZQ2EVRHtgf6K8BUQuGbp/coxr+08Lej7QcmIo+4TVd2DuuQF9Aq07hH5yoip+JH6744YoRagY/EU8nG1KM1Y3+Z7D0F8e4qf/ldgK/xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gkPzzSJS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gkPzzSJS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3YWw341jz2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 15:25:15 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MNWEn5006420;
	Fri, 23 May 2025 05:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T9QR0v
	Rv/b0B11JDYax3wCR+tNiJcsp+EMocfpzOxi8=; b=gkPzzSJS3ymffrtpxcB5vm
	v0s0Gt+0xedPFAF4Q0SBMgwUo01yMH5OqoDNtugNOwneyxcvMf5JVIm1y0T08Re7
	EmJ6QdZ6GthLPsjQ11Y8uXW7sj+Eeyb8WqKlexTBXqcCpntaCyNC/X7hKpXH2JUj
	tiWuD0uZqTjnvmBQRioWrY0breTha8OmZHdV8IDZEYMicTaNWm94EHTL/osOLYVd
	iuLvSdTpZmyAtPpzaNMZw/bBFpt41IbV5Ua0ZuIpLPTk4wDsHISYTDhuqr1lanD2
	vG9gQ6KwGs17vxJDgNiDQL5N9JmAxrZi3uqj2fVPEF8IGqrxh/bDnF+01ZlmwWWQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9m7t7sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:24:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54N5Ogd1008988;
	Fri, 23 May 2025 05:24:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9m7t7sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:24:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54N1ugL2015431;
	Fri, 23 May 2025 05:24:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnnn2at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:24:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54N5OdfJ51446136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 05:24:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFC2C20043;
	Fri, 23 May 2025 05:24:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FB4920040;
	Fri, 23 May 2025 05:24:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 05:24:39 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A792F60213;
	Fri, 23 May 2025 15:24:35 +1000 (AEST)
Message-ID: <e50abba6c962772c73342bacf20fb87dc99dd542.camel@linux.ibm.com>
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline
 mismatches
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman	
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy
	 <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        "Ritesh
 Harjani (IBM)" <ritesh.list@gmail.com>,
        "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>,
        Andrew Morton	 <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,
        Christoph Hellwig <hch@lst.de>, Marco Elver
 <elver@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey
 Ryabinin <ryabinin.a.a@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier	 <nicolas.schier@linux.dev>,
        Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev
Date: Fri, 23 May 2025 15:24:30 +1000
In-Reply-To: <20250523043935.2009972-8-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
	 <20250523043935.2009972-8-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=SMZCVPvH c=1 sm=1 tr=0 ts=6830069b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=REYBSQJbgk_QW_Jsg8sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: oQb5v6M7wutfrMtk1qvZQMEXsUNMAS6C
X-Proofpoint-ORIG-GUID: 5IyYPtP_M7W6sx6jcc6-H4GkEZFAEAEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA0MyBTYWx0ZWRfX8CeyVmgZNEOz 8pmB+9RdT5ZsQ98qxplPqvRkrNpOOYwsSTFPDm5ofvI1Vh4bbudIby6HA8NmTGhtWKTGCbPb+Vc ncpDniBcH8eQ2V6TvH4/WOR7hWwc72H7W3tmeVLVHUbkift9S50W47R4EZG5vRt+eQh2UiWAsBK
 iE2vMgtZCKgIB8ryEScHd2O4ZVBu+fZQ71R6KP7ZepPiveo0szKoP5GtVDvnlETC92QyKZ6dJPA 9F354NXkUaazXC5GwoeLMpIeHZomJ+1xdeYZUMVAtJ78BfchmFk42UaDhV8BLvtV9oREWNDxTxG /JkwdDWhrq02gBuo/giLPxFbLNIIh1tgMIxMCWOWwczwEbDPV9zml+heRweY+Jd/oul5iu2Dl1O
 bQSsYl9qhOX4fnuFfAi63sra+qJkyo0qkV3/wv1tj0wVD9FBgFyh3pEhli53wYP0l6epaDcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=480 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230043
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-05-22 at 21:39 -0700, Kees Cook wrote:
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved.
> For
> s390 this requires forcing a couple functions to be inline with

I assume you mean powerpc here, though I'm sure my employer is happy
that you're at least confusing us with IBM's other architecture :)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

