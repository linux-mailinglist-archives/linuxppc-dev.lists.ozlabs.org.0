Return-Path: <linuxppc-dev+bounces-10369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A971B0EA0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 07:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn2kb0XGxz3bby;
	Wed, 23 Jul 2025 15:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753248567;
	cv=none; b=GVIiF7bbB6g2cErMZrIcJFhXWLZQKM5xjmkV97357Pndgy+1Gtm5oFavnDOpQxn7zsP0rQ0EoQ2oFgnhkpxYxrQULn6NGRzKauyCLPrlUSlodUfoBPWUzG5tZYKq13L+D+4DpYQhhg8PM/ALW53UXXGfgHEXa7NwrnlERxnnMb5EnTDKNRyEW2b9wT7tsv2mKYVKKOTS3o/+3LlLe94q+QMXZQwXi5ME6VumpsJlGmEmAisr6+VUcIOIr9gnllJ8FRgnPp5HnIMtFIvOKWMqKHqhfrDCARL6TY/9PKuUcwY6GDeY6SD5IYLOztYWnN5Tp3CPAhrscdsD3G3EcvZFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753248567; c=relaxed/relaxed;
	bh=JIAmCqVKkUtB1JMmgBylqwKIzjeF2m66X6vVcRvAPN0=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=hqZk84CU8n5AujELDvvE3b8lNOyFkS2PYWI/t+u0ulAjYXCZyMxxOcNniX7ojZ+ywCdm0ZHssQWS1KJQV8kNy5pbtaMGC5tygBu4IQmraCjVKgQsS6MvkcOqMdVtER8zIDyTiR5a5U49+1AqtYVZiMnMWQHemYOq7bUw7vFozL3Px/2saxHglYK6NV9dwl4BfelJspq05TYqJTHJoMSpulyrwf0HaSpeel0kz1Rn0Yqk0qsvwOh6OxX3MU9RiqlqUz8eLinBzMs81AKqPDY3CQZmSGtu5rkfDgSOHE02jVdxLhmY3P5uUMj5iSGMEAxuc+ugQPy2uL9+/S30iDI5Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJ3inEuN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJ3inEuN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn2kZ1sR4z2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 15:29:26 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MHsWwh004384;
	Wed, 23 Jul 2025 05:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=JIAmCqVKkUtB1JMmgBylqwKIzjeF
	2m66X6vVcRvAPN0=; b=hJ3inEuNNjnxQjViqd/aEcMJSO+a6y08IGngtgv8mj0B
	k57JFoOSM8ieNTzII3YVpZGtJ53UtxNTmOyIIlSTDTlNoeeRdaR1lAH5nEW7jpzt
	RmLIAwE1q8YGR5mk1J7ztw+IjpqRshYued/akImy3fXFh5x4pJmyL4h/UtKUgXx0
	AriKfxNGICLj8QDlgKopbwprK/vo4i3FUEkLmnL2MOr+Mipvq8MPEVkDFo55It2M
	ICh/rOQMoLQ8jr0r0jDAZ5mX4i1K3pyEOwfQEGmed95f9ajgnWAYtdxLaRbZrCdx
	5/Ua8FoFz3BIX3WWZ+dBsgVSytSuY2tyJWiBrHU3hQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff4tr15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:29:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56N5Pq4d008412;
	Wed, 23 Jul 2025 05:29:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff4tr11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:29:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56N2j4BS012404;
	Wed, 23 Jul 2025 05:29:06 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480p306jef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:29:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56N5T4Xn6095472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Jul 2025 05:29:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACE415805A;
	Wed, 23 Jul 2025 05:29:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4027058060;
	Wed, 23 Jul 2025 05:29:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.252.202])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 23 Jul 2025 05:29:00 +0000 (GMT)
From: Venkat <venkat88@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 2/2] powerpc/fprobe: fix updated fprobe for
 function-graph tracer
Message-Id: <D06F2360-106E-4CBF-85F1-B2B5185CB9FE@linux.ibm.com>
Date: Wed, 23 Jul 2025 10:58:48 +0530
Cc: christophe.leroy@csgroup.eu, Hari Bathini <hbathini@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mark.rutland@arm.com, mhiramat@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        rostedt@goodmis.org, venkat88@linux.ibm.com
To: adityab1@linux.ibm.com
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EXlF6YegNTYLZuDyrNkJTeRc-gQPxWqb
X-Proofpoint-ORIG-GUID: RWU4CdPyZfG-WyQ6BVFOrV2Jq1CMLiQo
X-Authority-Analysis: v=2.4 cv=Ae2xH2XG c=1 sm=1 tr=0 ts=68807325 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=J52luZ3L32VaiGxZi9YA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0MSBTYWx0ZWRfX6mcaF9sqDl04
 Ne8tBut4Boommp7ME2sz6ivXYdFvnUf2k5n8YpGogMG1tVZIqhiKLre3HgqfYOjKxX1hpNXQMtc
 Wa3YNsYvO5r0LdMd7vbBgS9MzOdufDPt6Yqcm4qP5Vuk4YiMzCYazGhEEWVGqoRW7fM0NE0qb+G
 3LLiLD223ceHeTrI+93a+dOWa/AQwN/q64Eo3IkpR5WieJdkFVovCYQ53rt/shCwZnNDlOXraJ4
 2aBXB3Xp8tpc7v0YM8M4EKmdfH2NaQIWLK7GJTClQUSMKcIsURNglXpYAxb+EloCvmQukpAxYlV
 xubtlFpCMcjcHqKFNDQccbCgEkQIVYGg8h9UsmgJe6PEyAmvXGsHi/4jeeB+19Fda2LiUZYDWU+
 CdlEZsRzr6tXqZrD7oItV8xky8LzqXwt0x5DMv2CsPGITjjWMaprg2SkBetAGR5kcjbd3Meq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=371 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230041
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Tested this patch by applying on top of mainline. Build and boot is =
successful. Also ran ftrace selftest, intended test passed and no new =
failures/errors introduced with this patch. Hence,

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

