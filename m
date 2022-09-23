Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F15E8257
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 21:05:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ1mp3Rl3z3dqK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 05:04:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FR/IRFY+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FR/IRFY+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZ1m40VhGz3c23
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 05:04:19 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NH6DdC025652;
	Fri, 23 Sep 2022 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MuBSUJNz2EZLJFjx/Wk5ELtrb2nH5vloc/QhcYKQVkM=;
 b=FR/IRFY+xcS5+T96EwH2BEsei7I8INijO+y1CvmB0XLIxHsR+E/m3MRItHxgavaGJwcA
 KsyUmZFYDmvNH1P73Uj/EZEUYCMWsxAPZTpWNV+OGzjfa0xnaUBhmJrhAfoMzrE6Ey8N
 wxbf8fka4FoKcEJ9JcI4pQ5+ynBLMJs81tMVS+usEOsrKX5ZybA9ae0myEN7KxcCPtW7
 LtQRsfCCvfwaMgMtpR/nllUJxa8hKrM8msTJKGgBGo9NkEyi7hOoKneuqLC4fjGfbNHy
 OLg48NU4twXsjqFqCkqDOOMvZ7r/bn3RK7zpG4w0PSmEsU+ZIsoxVXv1L8IMsrf42V4L Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jsam5pwyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 19:03:43 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28NInoc6008637;
	Fri, 23 Sep 2022 19:03:42 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jsam5pwwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 19:03:42 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28NIo3SS026482;
	Fri, 23 Sep 2022 19:03:41 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02wdc.us.ibm.com with ESMTP id 3jn5va1m27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 19:03:41 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28NJ3fLn7799506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 19:03:41 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F0E658059;
	Fri, 23 Sep 2022 19:03:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAF6E58043;
	Fri, 23 Sep 2022 19:03:36 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.173.46])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Sep 2022 19:03:36 +0000 (GMT)
Message-ID: <67337b60a4d3cae00794d3cfd0e5add9899f18b7.camel@linux.ibm.com>
Subject: Re: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to
 verify kernel image signature + dependencies
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Date: Fri, 23 Sep 2022 15:03:36 -0400
In-Reply-To: <cover.1663951201.git.msuchanek@suse.de>
References: <cover.1663951201.git.msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SsokmeIEOQvFjsuuW5hlsedfFQGtkcPI
X-Proofpoint-ORIG-GUID: xC2eJ1JrrMo3jvaPpOW6BQ5aqRsb_2NA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_06,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209230120
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Alexander Egorenkov <egorenar@linux.ibm.com>, keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Sasha Levin <sashal@kernel.org>, "open
 list:S390" <linux-s390@vger.kernel.org>, Coiby Xu <coxu@redhat.com>, Baoquan He <bhe@redhat.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Eric Biederman <ebiederm@xmission.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT \(AARCH64
 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>, Philipp Rudo <prudo@redhat.com>, "open
 list:KEXEC" <kexec@lists.infradead.org>, linux-security-module@vger.kernel.org, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, "open list:LINUX FOR
 POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-09-23 at 19:10 +0200, Michal Suchanek wrote:
> Hello,
> 
> this is backport of commit 0d519cadf751
> ("arm64: kexec_file: use more system keyrings to verify kernel image signature")
> to table 5.15 tree including the preparatory patches.
> 
> Some patches needed minor adjustment for context.

In general when backporting this patch set, there should be a
dependency on backporting these commits as well.  In this instance for
linux-5.15.y, they've already been backported.

543ce63b664e ("lockdown: Fix kexec lockdown bypass with ima policy")
af16df54b89d ("ima: force signature verification when CONFIG_KEXEC_SIG is configured")

-- 
thanks,

Mimi

