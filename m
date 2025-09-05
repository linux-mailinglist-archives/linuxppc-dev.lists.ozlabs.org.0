Return-Path: <linuxppc-dev+bounces-11765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AEDB44E66
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 08:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ6bs72srz3bY7;
	Fri,  5 Sep 2025 16:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757055449;
	cv=none; b=okpNfKhhc3rIKoRcGAd3Q05JoZsZ354wztijarkRge2NEx20CItTaUSe8tRaxWIkTyMbxRLAnUc9zVw8zfH6O07M2WWdPDNPLQ2xW0VMpXfJPPJwfXmzWKhlDs37tDfpJS+qIxJ41jswuYGcDvabkBqZXZKh5es3e4y4xncHMvmdcZ5Jxwu1ehGhQRYDDdcl5K+KAEJ0Lm6gnNK87O9yvFcUgBXlkSEDOE3i1YgjByb6e4kvfZmkB2ZfquYxNRebIteY0PUxoWvBBxj8VTdVpDh9NwY6Rab50V0cO5csJWAQiSWRabwY/eax3skfbfSaoPzIF4uSl9rGdQhbeBeqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757055449; c=relaxed/relaxed;
	bh=i6iIRwlL08m7ddD00gWRDzn7fpP62voWSOHllYdsQfM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2WdjV2mzAwSdvV2mW4twfhZtwg8ASMSzVIiOOmeDul0hTy4HA7nQv/7bW8j7dz84e5eioqR3kD0k/VitPj9JERYIUkhG+TUPIkDokbIPtaLAmkAE3lvN1uRKEBNvu1RCfiSGZ9lF/fLg847aWJQbvHSnn0gXGW8jirdIXOTynbvxx+6V4VpDMydZ5U/XCLEjw0GYZKx/0VE/lxCe9uSWxaM4NSR8/FRtKhbWRFBXPu1YyLUvfHtdaP8mKF2MMm939B5rQFu//gCYGZhlkcTWIP6CmYUYryYdNWvqT5mQCpKTPQ331VyGjFdmyBQzWYknaFqAwaHEzVh356x7f6xEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoXxllUZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoXxllUZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ6bs0Btmz30VQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 16:57:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584K5SFc012012;
	Fri, 5 Sep 2025 06:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i6iIRw
	lL08m7ddD00gWRDzn7fpP62voWSOHllYdsQfM=; b=VoXxllUZm8+7DgckRp/NLN
	zPYc8QI+ZJf5ogWCoo7J5wJRm06a8olnHUjPs5I4lnlQ1pJ2SVDXYCMOnl1yfuDz
	IRdUBU3ovvzTd9CfzMYu9JseXs2+QDOMHsAXJERd+pwKPw4qWWv5Nh05Lk0kuKMb
	46dkr7qUULAlXRms5uaUgiq6a+zMEoSr2LXCiAxDfEsdKasNhfI/FN9cYaw285Ob
	x34bbjE+AK7fRdORJ6RsxSgN4iQ9EKI6yPsoJfx4kQHbj3BEegmP0XJr7zU4h6BQ
	G7S/9kusQKbeFzhqa1bl7UvW7gePEjBse2wfS38iWiCCFJxDKgV/m2SrjoqE+biw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurerb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 06:57:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5856vGnm000584;
	Fri, 5 Sep 2025 06:57:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurerb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 06:57:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58567HMB014052;
	Fri, 5 Sep 2025 06:57:15 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3qy6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 06:57:15 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5856vFrs27919074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Sep 2025 06:57:15 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4191558054;
	Fri,  5 Sep 2025 06:57:15 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D502158060;
	Fri,  5 Sep 2025 06:57:12 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Sep 2025 06:57:12 +0000 (GMT)
Message-ID: <977ad5eef4f8726e9d5bff31b758918f0341659d.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup
 failure
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman	
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Madhavan
 Srinivasan	 <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Erhard
 Furtner	 <erhard_f@mailbox.org>
Date: Fri, 05 Sep 2025 16:57:11 +1000
In-Reply-To: <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
	 <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfXzvkHakOeeGWc
 xIxAT6pze9qsFX2mdazJPm3UogZYYT8H/DDeR0e3NxWMqNV+L/KW/42Mqwo+Vj4yLHIwlNsxCRw
 y4Cx1kEVZuv6j3lI0TcUCBHkL7YnImsOkm/1JuLhTws//g8cUABTtC8ph+r1EC+TalhoX3WG9v+
 pvrcoWem1opzF2XFSOCtmMEht2oey7X0tS6pHW7HV47XoRLT4jer/ihdax65sHV//YjCa1ADgP9
 qtuClyebYb4sdNW+ig9lIGnicxh/e74/+EmIYPkG1MmVz5u/HtnuamGZuCVlzOn+BTdTWM5DVrF
 AAuvR8dr4sH6JcM8jC3uKEAH7/Fu6+vDPPx3x/OlXoNOAP7Eci/sRHqssn/lmEp2fs9aBD5TIuW
 M+MFTaX+
X-Proofpoint-GUID: HLJBueF4UV6soL6npRI4I6Onc-nK5ppq
X-Proofpoint-ORIG-GUID: O4JRA3B6Hh-HfKmWIdX2yTs_2TdtcoRY
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68ba89cd cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8
 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8 a=kZQNDw5qEIdUIES3TQEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-09-04 at 18:33 +0200, Christophe Leroy wrote:
> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
> kernel text has to be mapped read-only or read-write based on build
> time options.
>=20
> But nowadays, with functionnalities like jump_labels, static links,
> etc ... more only less all kernels need to be read-write at some
> point, and some combinations of configs failed to work due to
> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
> access to kernel modifications.
>=20
> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
> possible options that may imply kernel text modification, always
> set kernel text read-write at startup and rely on
> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.
>=20
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes:
> https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.=
org/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

The original issue that Erhard and I were investigating was why the latest
version of the PowerPC page table check series[0] was failing on his G4, wh=
en
built as part of a config with many other debugging options enabled.

With further instrumentation, it turns out that this was due to a failed
instruction patch while setting up a jump label for the
page_table_check_disabled static key, which was being checked in
page_table_check_pte_clear(), which was in turn inlined ultimately into
debug_vm_pgtable().

This patch seems to fix the problem, so:

Tested-by: Andrew Donnellan <ajd@linux.ibm.com>

But I'm still curious about why I only see the issue when:

  (a) CONFIG_KFENCE=3Dy (even when disabled using kfence.sample_interval=3D=
0) -
noting that changing CONFIG_KFENCE doesn't change the definition of
PAGE_KERNEL_TEXT; and

  (b) when the jump label ends up in a __init function (removing __init fro=
m
debug_vm_pgtable() and its associated functions, or changing the code in su=
ch a
way that the static key check doesn't get inlined, resolves the issue, and
similarly for test_static_call_init() when CONFIG_STATIC_CALL_SELFTEST=3Dy)=
.

I don't understand the mm code well enough to make sense of this.

[0] https://lore.kernel.org/all/20250813062614.51759-1-ajd@linux.ibm.com/

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

