Return-Path: <linuxppc-dev+bounces-11817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E539B46AC0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 12:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJpmx0Gmlz30Wh;
	Sat,  6 Sep 2025 20:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757153264;
	cv=none; b=jXocGtklyCJQAOPHazcmkwbW/Q5jDLc5ttBrK/URIiMW0sNRQSsYrfK+TU7r1EE53mOPc2uehtkbv36X/8aXX3YS+uRwEPxLqgX+qisY6mNdoPpWUrTyWb7ZYe6qM/pZpQNw4Ok5PwzAbxkIGvUAJM3pOBTbq3bO4QXmYzEAFNEgKc7JevCrGODMJb/1ELs3VI+p9oR2d1b85y5UzOcGM5YOrDrDs6WJ/wQ8aEU6qE7gUjEl5QHrS10RgRw+bLC3aHubCEy3LFiPIporKlmbWt9ReR3qjdQk9fJOAFT1OaAcFnnw5cLhaIjDQcE6s2L3koTGSqBvUXLSzVIn7FXiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757153264; c=relaxed/relaxed;
	bh=CZNn1C8CL/q+WGmv+vcch3PsxrOMEvOrvNkL1/C4qU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lm+VYhsSnQ+uXY0F20azNWAn/je56Y/KRhR+QMNyAxzPkr9NRtuyEPK1I+6gZkdgAUDVad1cBb8dRL9pkon7GSVG2EKaidmuafHQEdWRVuxGYPF3mC3tRfuhX+YpXoLebKJ8jmW5oOPJpAX8g0+9ifQtxm7LcZiUgomk7SVO8ulPOSZG/ofOShh5jFQuQaCtI9Tm55L55cGvVdINL/vEURs+2LH7LqPT8AGjopp+ZM36Yxta7y2gvagT0U0FaH5TJ4NKWEZDm7Co9TvOBO8S9ngxvIDkW+PQrdwyLlhnKZU3dHexN8ngNhOfxfWTe48jJDnrAHALhaXAzuPh2ITGtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZdilHPI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZdilHPI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJpmw29fbz30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 20:07:44 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5863ofLC025614;
	Sat, 6 Sep 2025 10:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CZNn1C
	8CL/q+WGmv+vcch3PsxrOMEvOrvNkL1/C4qU8=; b=gZdilHPIyTe+0GxEoyHNr4
	RNs2pmrNXTGzC/kPL97lBgMx+gC0fVEPe2V/V8RrwsK6n7xXdQqIZYR1M0lPTWK5
	nf+bFcxYiOmyVC2X2bu+j9DYDCLZA2gzNanBZp2ILmq1Xw2N+zIsIkiMwXkTrubm
	HVvafHYC+J2FTJzC7MUp3f90feLzXJE2noK8v1q05EGbs9Rco/vKvBjcHXrbfBLI
	TrseXm2tsTqAeGaouG/T7XzWCEpxyJ/71TXGzP0+RoAZ1ZoqAiPA/zWeStU30MTQ
	UClqJscyQtDtoc2KMSXOyWhpTDfk+kbQJ2Ntt5j8PUwmhtCsLu7sxTELn4old/Kw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfes4sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5868QaqR019363;
	Sat, 6 Sep 2025 10:07:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vd4nd9w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586A7V0j22217152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 10:07:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 830BA2005A;
	Sat,  6 Sep 2025 10:07:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 763632004D;
	Sat,  6 Sep 2025 10:07:29 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.107.45])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 10:07:29 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Huth <thuth@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Sat,  6 Sep 2025 15:37:28 +0530
Message-ID: <175715312004.95031.8015199240329986989.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801082007.32904-1-thuth@redhat.com>
References: <20250801082007.32904-1-thuth@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: We6pR1ypHcundy0I6w2ZJYLChoqwxF28
X-Proofpoint-GUID: We6pR1ypHcundy0I6w2ZJYLChoqwxF28
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bc07e6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=zwY7vhdFYRJvcIJZdwUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX9K7J0/NLjj7t
 ijCllUkn6w09quDCssmPwXZ1c7yHqmhSdJY3EeBUy5lbUpHpD9Y0Ck2MoctxpcbWUixm3WgZLTq
 jWP5wVD5tn5BZCircc0nAY1WThSCT+JeqaW1cwa97BKSmOOWZr5EjfQXQ4QxCDIelD6Za5eL6je
 y5W+FHSGUniZwmhgySIiaTnf8rgOhdRSGYQdNaegh/Voe47EBMSS5FGpnkpfokUgRZRCp8IKd/5
 M1KNoP6Wbbbf0XPBcrZP8l++SJaz75Dnn3GH7qKdQcWDWNP2PjzoyqFGatwKsOeoEYV/x1d3NBw
 9zNcbYVnJ5Ztc7fK7uewkmcpRwidFBc2gGXitY+6izJhFBNVPFrrli/jRz4ucOmBhYfaeEehwCp
 fN/Z5InZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 01 Aug 2025 10:20:05 +0200, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code. This is bad
> since macros starting with two underscores are names that are reserved
> by the C language.
> Additionally, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      https://git.kernel.org/powerpc/c/8e0665eb85394ea9823fb965a73ae9a6265af4b0
[2/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
      https://git.kernel.org/powerpc/c/74db6cc331b0da5c48c62b7af68d747ec9af1984

Thanks

