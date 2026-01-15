Return-Path: <linuxppc-dev+bounces-15862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A19D2744D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 19:16:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsWPp2VQnz309H;
	Fri, 16 Jan 2026 05:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768500958;
	cv=none; b=m9YaL5aNdXxciaSdpI8JgogvlPMmfNswnN5TiggLufaiS2azmYh5qBa4c71VCmpfdTli7ZTO41ikEFIpCuQVwBwUpLb5mWRskOkktZrkz509BNaYuUaGVqaXBOMnOBdFeNh1ZCZLsaPy2quvXquBLOPM0313pAaF4kEPKrrm1dEdT89cgmCityeNsBXYSoDnAjefUSGBa8XNgT+4LP7uD5TK4zX+Zyi6f4TPngL8k55yyju34uqWnl4aXy2Mk2e+Qzq99CM39UruX8fppBnwDyosyBqbP7iQvag1Fh1hUQ7EzKCf+M/10PL9VkrzMzE8zvAsWkH8Huj0IoUCM8tosg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768500958; c=relaxed/relaxed;
	bh=xwR0uUolx+3fZ6HBGehtkXZAYeKDCpBOfveblWPYLCY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AjVP+vZ2yuS/bKt+zLE1UbGvMgPF44nF17u+xhVyrNHTp4KLK4HvWiASf9hGVIr+siTeBG1dZK6e35KxE9kVgZDDHAQSYJgLgCDndx/59xnabB8+ZJ0pvz0TZ7ru8LAgn3Z7k/4mdFByhf8b/A7poWv+ePq6ioP4vb42e4w/Mj5HTVaOhfQx2S5vM2EqLgssARe8cCLlq5lu5gu6iRxko+PZ/T/bFSHxFDYqQAUouk3LgG5FDsC1JQ+UtgqSSWwP6+mGeqg3LOyn5530JDwHUvNOjAUa6RweBPpzh9m9zB1s3049VY+jw0M2mugrUGgwz/p+/j2AAZnE4eBFu/gauw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lWAwCXWM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lWAwCXWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsWPm6T7Zz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 05:15:56 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60F8HOSs005567;
	Thu, 15 Jan 2026 18:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xwR0uU
	olx+3fZ6HBGehtkXZAYeKDCpBOfveblWPYLCY=; b=lWAwCXWMmOCsBGN6UzBSMR
	ybcOACpaeed1JCD+uEYWrrj/HhQoP02g1G9Bq3VDgzGXXIwZO0aRtdx65ntZpqVR
	lCEmVa9zXo2IGnxkxCNmrJI+WzXo08vUMX0FXCuIevfXQtZNtS7bc0qxG6Cb6im5
	3CLSEcCseOd9LV+SlVTfavdqxN3ezN/vACJ1ICNRwR5COVHOQ+jpCUqSGi9p7CYX
	7qvR1vR3aeJrTmIsr+JtwT01tnTiCZcJNU4wxg24+XUKxP/gesClb8iTvXLyh8dK
	0rF6eHNbMUXm5kZpt1GY7+bcddtG9xuFWgq9dj+R2E1bNeAxb3BApLvTe6Wem2wA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hfrj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:03 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FICmCt026022;
	Thu, 15 Jan 2026 18:15:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hfrhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FGCDdR031255;
	Thu, 15 Jan 2026 18:15:01 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t21bkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:01 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FIF0CW35979552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 18:15:00 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94CD85805D;
	Thu, 15 Jan 2026 18:15:00 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D3AA58052;
	Thu, 15 Jan 2026 18:14:58 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.157.243])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 18:14:58 +0000 (GMT)
Message-ID: <f41d4722a70fcf11a617bc740bbeff29904b1508.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>,
        Roberto Sassu	
 <roberto.sassu@huaweicloud.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman	 <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev	
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov	 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)"	 <x86@kernel.org>,
        "H.
 Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel	 <ardb@kernel.org>,
        Roberto
 Sassu <roberto.sassu@huawei.com>,
        Dmitry Kasatkin	
 <dmitry.kasatkin@gmail.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul
 Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E.
 Hallyn"	 <serge@hallyn.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"	
 <linux-arm-kernel@lists.infradead.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)"	 <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE"	
 <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE
 (EFI)"	 <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM"	
 <linux-security-module@vger.kernel.org>,
        "open
 list:KEYS/KEYRINGS_INTEGRITY"	 <keyrings@vger.kernel.org>
In-Reply-To: <20260115004328.194142-2-coxu@redhat.com>
References: <20260115004328.194142-1-coxu@redhat.com>
	 <20260115004328.194142-2-coxu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jan 2026 13:14:57 -0500
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
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9LcAC3ArNRQrB58_TMRchOmHoH0JFiMR
X-Proofpoint-ORIG-GUID: az9-Zrhe7xUtLNs6ch5w8el14qu6fbXh
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=69692ea7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=AiHppB-aAAAA:8 a=20KFwNOVAAAA:8 a=DCsw3ThD87bJHtXWWggA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEzNyBTYWx0ZWRfX5KE9JA8QOFaZ
 QMGylEA2yFrr+LMIlyvxq+GyxaBE3YSEZRlUTijTR0pqOeohHx6Z5o43Ifowv0PwTznHZCpZaps
 P+PFGgHb3M3BpBoqLiGM4S9nK/XYDMeVW3LCMrGOH2JX3h6+U/KGNp5njojjr7Q5jOJhW0IteP5
 zR68vj00G5AtbEN/qAH17efmlAN72EKIlIccQpuQi2Pm5B/93dTxUKju8YVYTIqg3/xbzrzXBhu
 lfwH3mgTVDAixc1ppBso4WX7HbNHhxS95YmrzP5NklBF9YvXXre8NFtZ+HezYe12UcVOPOOauvU
 Dn5D4oCftdI4q321imUwVveAClH6XWJlbZxjs33Mt0P0bMvvZK/TUnM3on0dh1lQEIZzNdcHFg9
 xyEXOo38GSVGnzoy1P+ayCy4GXnXFhQhyK8CpU9JMm5+WZhbRg21HLmjBdG3WhzjvAuQQmuubGp
 eZ3hAvJ+zUyl1kCDipQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601150137
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2026-01-15 at 08:43 +0800, Coiby Xu wrote:
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general,
> integrity-wide function named arch_integrity_get_secureboot.
>=20
> Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> automatically configured by the supported architectures. The existing
> IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> IMA policy based on the refactored secure boot status code.
>=20
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>

Thanks, Coiby!

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


