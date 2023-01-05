Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B343165E65E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 09:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nnf7d4gtXz3bck
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 19:01:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EW9DXA6n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EW9DXA6n;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nnf6g1JbWz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 19:00:57 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3057m6nE036979;
	Thu, 5 Jan 2023 08:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=5zKaQOA6IGKVjD/e3CeInd78n2sD2CM5QMQ3/3xpoGk=;
 b=EW9DXA6n2b01/pIeafCvQxNtyVXERMmUKUcexO4zlYK5qRyuT9us8zoLA1/5lQbJ5qy1
 /ynaFOc6HqsRRtM5cMcTDaEcpaDP3cNwOJZOuVePS8htJeyrPbhJ8rQ2ZgmFJgwv1kp7
 +ie99xvIvOusHkzPu9qCmrCY0hSNGXBHH83tQloT802o/xA3CQsVRQahUm92P4+4x1py
 ZpGD0hOq3cQHnX10/yPwafM6UobAeQxrhuzUBtCNnb/PdsaDsxNCVkeQxgeb5EEozmRK
 fI3YcoD3kZG7G9vDTutVltfhiRsvVrWe3mOPf6qZd93S/XvTZt8+Zab06nqszpW27rnA dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwtfm06tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 08:00:14 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3057mKYR037398;
	Thu, 5 Jan 2023 08:00:13 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwtfm06qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 08:00:13 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3051RcWN000986;
	Thu, 5 Jan 2023 08:00:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6mpf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 08:00:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 305806Vv45351190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 08:00:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A8E2005A;
	Thu,  5 Jan 2023 08:00:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2D7920043;
	Thu,  5 Jan 2023 08:00:04 +0000 (GMT)
Received: from osiris (unknown [9.171.68.186])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Jan 2023 08:00:04 +0000 (GMT)
Date: Thu, 5 Jan 2023 09:00:03 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 00/14] Remove clang's -Qunused-arguments from
 KBUILD_CPPFLAGS
Message-ID: <Y7aDg5BqjRDZrOR/@osiris>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HN0SRG90u-IN-eEqiy_9QPgOJjfvpn1A
X-Proofpoint-ORIG-GUID: AWGhRIIBoEln5sOF-oxHHjt5w7QDkV0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=670
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050062
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>, masahiroy@kernel.org, x86@kernel.org, Rodrigo.Siqueira@amd.com, mingo@redhat.com, borntraeger@linux.ibm.com, harry.wentland@amd.com, llvm@lists.linux.dev, nicolas@fjasle.eu, gor@linux.ibm.com, linux-kbuild@vger.kernel.org, sunpeng.li@amd.com, npiggin@gmail.com, bp@alien8.de, tglx@linutronix.de, tsbogend@alpha.franken.de, Xinhui.Pan@amd.com, ndesaulniers@google.com, linux-mips@vger.kernel.org, svens@linux.ibm.com, alexander.deucher@amd.com, linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 04, 2023 at 12:54:18PM -0700, Nathan Chancellor wrote:
> Hi all,
...
> This series has seen my personal test framework, which tests several different
> configurations and architectures, with LLVM tip of tree (16.0.0). I have done
> defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mips,
> powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping the
> rest of the test infrastructure will catch any lurking problems.
> 
> I would like this series to stay together so that there is no opportunity for
> breakage so please consider giving acks so that this can be carried via the
> kbuild tree.
...
>       s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
>       s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
>       s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
...
>  arch/s390/kernel/vdso64/Makefile            |  4 +--
>  arch/s390/purgatory/Makefile                |  2 +-

For the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
