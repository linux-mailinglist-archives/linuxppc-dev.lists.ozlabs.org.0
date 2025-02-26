Return-Path: <linuxppc-dev+bounces-6482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D7A454A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlC66Bqz3bjb;
	Wed, 26 Feb 2025 15:46:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545207;
	cv=none; b=P5aoBI6aVaTc9iiiaX5tL86C61nSBwnc9EDGx4mtcTuY3pS08vk0IFmhojK2RzrnZwuRYKvHjUXEXGiv6zIVlcsi2gsrIgn3W0Nk3sBxdNzHlRObQR/xuVsF2mqA2c4jiN0mPiMqxVOTG5oiwneifBikQuTRs3hZCTRJ5KI8zMWE0/9eGaFSq0sxjYYHP+b+lKHIUMgyDSikLjgI1gnAObtY3gKEF4tcKJYWjiT1wgjyNUmxvfRhDfqqrx+z+M/csdWCxpvxW6zXg+0WTVWLWOlecHQ1XfvB646qetrXWAyL+fKLYHklKyNQQ1qPpRoD90YmcnGFR2H4fhPdW6jQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545207; c=relaxed/relaxed;
	bh=/jFEVa0ZWxt2n9ZJoBsUd19dCfch4h+qt59lzlhzq7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYrmTJ6EgJc4YdS715ibsk6P+idGtmcna4GLTM6+4kpaj0WwRNN9y5DQ4uK7KqdsrLQ9DKUPWK2F/fXhb15m0Z4gFf0ge7oq5udKlhoBEaUpkqe+TcV48hbWdJ+14kAQF8Qu6/EkLdmZ3uyZaG5E9rwR+BmKDqxYT3tlDzsqeeYgtMBRAk5puB+IzaXbNSLygGq9pJ/NqgwsrvLOwEOTobNUGOdAHKTQUG14PtXF8q4/etEr9lT+xhckDdYLxUkmnyhqwUKnsANWeoYRz2kvaWD85a3T4nAzIsx9Ue9Tf6hp6BusXyI/BH33ZtNMF+SRxVMaipwkDH2/ydsnOZt7IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BWIYceyM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BWIYceyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hlC0rGTz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:46:46 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1kswq027799;
	Wed, 26 Feb 2025 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/jFEVa
	0ZWxt2n9ZJoBsUd19dCfch4h+qt59lzlhzq7c=; b=BWIYceyMBwWUZOI88KcjE/
	tElFcybj+T1AU4OP0d3I1sqqj6xNXMF7KZqibIWnTfoZVyzPhmE93uf/+sGtR12a
	EtL3p5I08RLUcTFQucgnmQZyAA3vbtQcS5zfjDsVv40RBja5nWeCGq8P/GjljdC7
	8Qv/mKJ/5jkBpkI3E2NxexyvfD8x8+fYOvAkJQ+MrDoDKsPmcGtfB5PQOPZpICaY
	OQ8qRbuXc7YqWHUFuNBIxuyWN/h7M4u0adc0c5o8LlgM8LgmdR7MuKqZjM/zrk9b
	jMoP+BjOmOjaJ903WX1tv7NU6GdtFbDaejxadt85eAfOm1zTAyda3u+ND7HwhoRw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j95eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:35 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4kZlJ024787;
	Wed, 26 Feb 2025 04:46:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j95ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:35 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q4TrrC026287;
	Wed, 26 Feb 2025 04:46:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswngsut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4kWhu41615716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41A1A20043;
	Wed, 26 Feb 2025 04:46:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 244C820040;
	Wed, 26 Feb 2025 04:46:28 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:27 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/44x: Declare primary_uic static in uic.c
Date: Wed, 26 Feb 2025 10:16:26 +0530
Message-ID: <174054508251.1386382.8390304767144100879.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <0e11233d30333610ab460b3a1fd0f43c3a51e34d.1736331884.git.christophe.leroy@csgroup.eu>
References: <0e11233d30333610ab460b3a1fd0f43c3a51e34d.1736331884.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SsfQpaZiyM8m6zvLnAS8LKdCYTYAd3DE
X-Proofpoint-ORIG-GUID: EJ6bfjv7CBq3maI_XU5MYHt55rXMtqki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=808 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 08 Jan 2025 11:24:54 +0100, Christophe Leroy wrote:
> primary_uic is not used outside uic.c, declare it static.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/44x: Declare primary_uic static in uic.c
      https://git.kernel.org/powerpc/c/779c501cab14ba0b441a3c802c56be46a24f5c3b

Thanks

