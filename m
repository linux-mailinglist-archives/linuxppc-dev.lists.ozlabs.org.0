Return-Path: <linuxppc-dev+bounces-15016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F82CDF3EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 05:24:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddTrl5rPyz2yFW;
	Sat, 27 Dec 2025 15:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766809447;
	cv=none; b=CKwiDbRlfAIfHuy3Pzltke9H9XzXe9vWs86tXzDj15S5C4gYMpoZ+77jIc4xNuBlYNeD2Bt9ljZvtxXbbO//Z4yM36xb0V8zmMjgx7JNKWMox7+rD/xVZU6zhPdQb+teMpH7raFaV7mNs/J2HA29ZzxYmA7uVCYMwmhnA9rwbwh9qQzOkIzpoNB80QomGiXHeYQUA6NESR218Xe0VkYzIxZNyhTs8z4J+LX31TBpsa25nj59wi8rs6Snkpd5pywgL3e2vSon6MEFei8XjpN25oloDg9hPWn/Z/v+UDDyD7bahF7pxv9HIh6u/kbWxDp87z+4ZB+59tgX1rlzzuTP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766809447; c=relaxed/relaxed;
	bh=rrVtMCHZYqhrhiS+reB3YfUs7G4fzH91r/+c9TcMzUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jBSVKhJh+BFWe97iu/cw39/06mdHzU8XN79ICrte5et8Ya7EgmpA8QkwOg3l6T7E/zDqWZmbtYRrESn7PHp4asbvMeY1aYEgUqKh52xTwAyQEeX4qZ6t/zXyrUEwN/94GElny2joQLcEH63MTyOVUprIrGZR2US98boUyzCUGqfrSJBEKgIk4sGQ87rOMQOX53zoVdZntWftxKXpEGcSQ2/ESrB3FU0jziR/u1GFG31/G/YGv4YKvWT1plOj7HHihwfwHRYQSwSXO7mY/+JEpBb2S5gBkhBK6DW+st/Ib7Nx6uYDTk4hg56vIxxgKYfrjWpGT/D3uqqiOQRdr6BjKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojc41gZe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojc41gZe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddTrk5Qk3z2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 15:24:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR3F8Zq017092;
	Sat, 27 Dec 2025 04:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rrVtMC
	HZYqhrhiS+reB3YfUs7G4fzH91r/+c9TcMzUw=; b=ojc41gZe+xsjEMySdHRav/
	ZuqsuFO9eV/9a2nkVQLSSScjGtg+5wuvHC+EDifiJKSqMveX8bF6J/z41C4aczJg
	Ri9tj2EgYIUnyhH9Pjp/RBtMsMb0oMQpvbaqI+YzflTP+fCtCTz+5EHbofHwYSKm
	SnQwZq4nwzBku9OLSgaBP41/KQPbjhA1XJuRAX3re1pd/V7FTlnJwqPdmyqQ3Fsz
	ADJ7Q55xW07cbQz8DHysX9Z8BbK+6wHFzEl67q3ko3Pqw0uC06Blh/ZPU0IKdOxV
	mOEwZW2ojs/74TmkC2ElfEKSztIaQjbzGEqGQsTZFrAkC4K+hvRcSjYg0F385y0Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BR4NvRl002675;
	Sat, 27 Dec 2025 04:23:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR40bCc005285;
	Sat, 27 Dec 2025 04:23:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b67mkjgqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BR4Nscc11141458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 04:23:54 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C1FD20040;
	Sat, 27 Dec 2025 04:23:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEB9E20049;
	Sat, 27 Dec 2025 04:23:51 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.212.100])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Dec 2025 04:23:51 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] powerpc/32: Restore disabling of interrupts at interrupt/syscall exit
Date: Sat, 27 Dec 2025 09:53:50 +0530
Message-ID: <176680916371.22434.11687040747709449917.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
References: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDAzNSBTYWx0ZWRfX3ZZ7oNw/YdBq
 2RyJ2zr9tPjcSIpKravsW/G78pcCDGclh9RGWLRMFVGp5YrfEgzLmZVT703CzJWsl9jO8l5E5QM
 7Sz8KhRBvRyX79AOXCOwOtnS2YNxylPXfhndkfrDPZAJMUoTx9DgOwohdq3tLf+dBEVWd8z6Lvr
 t0VicTYG0vZ60xygQ0gkvInEqJetb7l1gneDPXiCurcc83uAr85AzOxtlYui6fgBjsGLar5oOlD
 6JNkHecfDsC7xXnErf/239lTNwgqRQFnHtjUqYapMsNaxzjhKmFAlDtvvhprtMdRBIjh34NZxE2
 HGPDTFqbFe4m4FswriUyK0Rlh0YM5/cGTb42VYams97AAD3s8F9r76vaztitTjOGrj7+ncki3DJ
 Au+Z3l9yBSgkrbuGM0oKfkF1ta5+zE/hX35VNJ36vnXQ29hcDG6EbgbB9heKVPXM1kWL/coNL1U
 kpgyBGS31ls8lpsIKKw==
X-Proofpoint-GUID: BYOGtB0527OThtQgi6t_RM6hnw8fCLtV
X-Authority-Analysis: v=2.4 cv=B4+0EetM c=1 sm=1 tr=0 ts=694f5f5d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=grMsOQSJOuImfsIcpOsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JkCSQwrNWR5zJWR_auDj-ruIUnlqX9Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512270035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 19 Dec 2025 13:23:52 +0100, Christophe Leroy (CS GROUP) wrote:
> Commit 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at
> interrupt/syscall exit") delayed clearing of MSR[RI], but missed that
> both MSR[RI] and MSR[EE] are cleared at the same time, so the commit
> also delayed the disabling of interrupts, leading to unexpected
> behaviour.
> 
> To fix that, mostly revert the blamed commit and restore the clearing
> of MSR[RI] in interrupt_exit_kernel_prepare() instead. For 8xx it
> implies adding a synchronising instruction after the mtspr in order to
> make sure no instruction counter interrupt (used for perf events) will
> fire just after clearing MSR[RI].
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32: Restore disabling of interrupts at interrupt/syscall exit
      https://git.kernel.org/powerpc/c/608328ba5b0619cbc28b409296b5e3840bcb97b6

cheers

