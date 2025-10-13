Return-Path: <linuxppc-dev+bounces-12791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3CBD1C67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 09:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clTSw620Yz2yrm;
	Mon, 13 Oct 2025 18:27:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760340448;
	cv=none; b=VWp1JcXG5shVojQOqRAebi+lBOTBdC9o1Xfzj3ZMKTyQGE2qBbSXCWkWKzXmIJpNJHHqH5L0hcZZVazlDs3UNbqUJ74e29cpjweVnen5H3/AZ/mfwBuZ34zpDjUcci8yOOTM9gED6UTjpWKIaPByJZFPlsS+Z5BD/DqL4BZ7zDT6P19ixd9L1ytaj5WKCFMB2SVnHPu1ptl1NIlfs0yG5/oaVLlmn41AxGhiQoXT9Irua+GrTPTMLN0jRGWR8pUAYGmPfLQ4sLWLs0d8CRC2exQ4TsFv8LTIMxn+ObL+ruedJLG+UjowZV3Ezy9Gd58H6XWAxognmoczAV+u0UAHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760340448; c=relaxed/relaxed;
	bh=bTiF+BWsP+sAuwRYEFqVZgkw/cidH8/ZLJVrg0nDFQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLqRuwR18OA7NZHqk+Yi5G7E3KUnlsDjPNFcrTTOtHlKdHrWjwdVVJusCxDHkiulBfYC45T/lQG+hBX/zPYS+sDhsRS70vzyigH15dUu5rgX130D99oZvLKPvimGgPrmFeMAzJEqbbJ6Lu1PeyXXH4ruSaSqFFcD9Cl/Jj7FcxJK0LO+R35gz6ofN1IwpMj80FmSdgHXroN+EeQZtwuI2W7xRB6ee2Uc06teHvxgCmlEOg9UYtFAI17tnEkoVFLd/bOyJ1BPL+q+m3CG/noOn9KU13jjgT5B+aJkAhxpmKzp0njDk8vzH5QZxELcfODpfMeEFtUzHrt0J3+zgqaFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CktaWn0j; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CktaWn0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clTSv5khtz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 18:27:27 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D1H0mg016744;
	Mon, 13 Oct 2025 07:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bTiF+B
	WsP+sAuwRYEFqVZgkw/cidH8/ZLJVrg0nDFQo=; b=CktaWn0jx6la+uEI8TTx9e
	MUjU+gy66aapApShNo6+p+tXGn4lsfqNzFUOAtmHwwYViQVM5rCL72TrJu6xP9bs
	duiFsnKeAu4FqkyaHZPD/KZqGeBJSm+T6F5y6WFXQ4kNLDdDvPGMiozkKp2uKupg
	x4E0efOkoabB2a7SxL2oBNfmFSAT/RaSRVvfVHk7EFS03Ms4BeFXlw5kvgIQ/3V0
	GJVQ2dVrkkNgVDfHhu8pDw0kKmsjJmEJzIHf8EVuazTXVR8fN0vAndBrlb+N/a4G
	PgktbKeEAAV5EAs+GF7IMWquMg5fd1rSKUOsa8nhYaf8td2pk4u3TifCn+IekODw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey8fjkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 07:27:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59D6R46d016705;
	Mon, 13 Oct 2025 07:27:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r32jmk0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 07:27:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D7R8ZP54723032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 07:27:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6005620074;
	Mon, 13 Oct 2025 07:27:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A9662006E;
	Mon, 13 Oct 2025 07:27:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.21.93])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 13 Oct 2025 07:27:05 +0000 (GMT)
Date: Mon, 13 Oct 2025 12:57:00 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <aOypxKMzsLR5tAtv@linux.ibm.com>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
 <20251013040148.560439-1-vishalc@linux.ibm.com>
 <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bp2bZu6f2BQTPTG9kZ1gxrm11KIT41L7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfX8vblzQT9rLVU
 7mdtFcJ4Dx4yJkBKI564BPd1idWly6W/VdNzzylF/RLy1OPPrLggdD+vVaxC4H9625dUJonK41d
 BWkUAjmNV1pm9kTXzMx+sHYKWg5gWtljrDeVCHtKRg+Yy+h19gOfVf5jsOOr5I2qSCwcvFzEszk
 61w/aV4MPaugCS923hzffW9Dpvt3itGElkHKWzvvzOfzF1pAUBOnTXePJo8WlM4QoE8TnwbB7nx
 Q6OW/w12EjKWUdlGWi4lk2XLKxNDUiO5d09HKfNWKr3AMsmPYYoNg6y+qXq2DV4BySKCL7qGmMz
 /AxJpddzhwIKP60h4nivBJUPdLUmS600+WogX2ZEljWi7ID8GaTnNAkafYw+FKDL41vEd2pPzso
 7AcI6uK6kkMRplOhngvceTIaWu25pg==
X-Proofpoint-GUID: Bp2bZu6f2BQTPTG9kZ1gxrm11KIT41L7
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68eca9cf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8
 a=-ktxzAwryNFT6qpDX-UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 13, 2025 at 08:46:48AM +0200, Christophe Leroy wrote:
> +CLANG ppl
> 
> Hi,
> 
> Le 13/10/2025 à 06:01, Vishal Chourasia a écrit :
> > While debugging a ppc64le QEMU guest on an x86_64 host, I observed GDB crashes
> > when attempting to attach to the remote target:
> > 
> > (gdb) target remote :1234
> > 
> > Investigation revealed that cross-compiling the Linux kernel for ppc64le on an
> > x86_64 host using Clang produces a vmlinux binary containing an empty .interp
> > section. This empty .interp section is responsible for the GDB crashes.
> 
> Which version of CLANG is it ?
(i) ❯ clang --version
clang version 21.0.0git (https://github.com/llvm/llvm-project.git a80bccc6847be104948f46d313f03ac6b9ccb292)

> 
> > 
> > This issue does not occur when:
> > - Building for ppc64le target using GCC on x86_64 host
> > - Building for ppc64le target using Clang on ppc64le host
> 
> Is it the same CLANG version ?
# clang --version
clang version 22.0.0git (https://github.com/llvm/llvm-project.git 2f755c543ab357bd83235592fcee37fa391cdd9d)

> 
> > - Building for ppc64le target using GCC on ppc64le host
> > 
> > For details refer [1]
> > 
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=33481
> 

vishalc


