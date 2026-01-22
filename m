Return-Path: <linuxppc-dev+bounces-16118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFMMNFPNcWl1MQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 08:10:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E254362696
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 08:10:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxXJJ2jDvz2ySb;
	Thu, 22 Jan 2026 18:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769064405;
	cv=none; b=mmVjaO7uFORCW07sva1CGQibCh5XbQWV7PugdWs5jWs9vag9jSJxmaetOvQKJx81HmloV3tZBEhvbSBSbvejPYvgm9D9FjymCRRI8g3DPlDx+pGk4mCrMGKKkQoD8e73z91hRlJV7aUHAJ1l/aNqNP5wN9XMuzIGs3GkKMEstE9emNc2sAvRy6+5weXhTGRvULe3oXgUdjdYwbLdNk8j9SsnOzEsR14AYkP6UznUPn5upNB1J2HxIRlG1PAa8VqdnWaolweD1V1T+9RZdo5MlQYO0nEK7pmUeMA0qYMtlOQvbZTfb2cfgpb98672dggxRgDJBVP1w49C1nFkEgxLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769064405; c=relaxed/relaxed;
	bh=edmSY5GLa5spGf23csUtWTjTLCq8zh76a1gduET7t1U=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=SWrGAGqwZRr7eHLg4cGXVoeJBaBZkaZYoT9W1Ssq5SBEBIps3nZki3NrEPfhR4L+aTdSmr60Dx5aulXPkMxMD/7K1uFaE7yeS/7eG2SId8Bm2VDG35AkhCGpj8QQamJGixveKIbnGc51HgKKIWdrLQNocq8NUhnHQDsJ7ZPNCxjU9QjOJvLpz9ZqKAquWuzNy2fLbdeoVEEetfORMwUld76lddtfcqkGTPzxvU2etqZknhiHR5nOJdQ3BjkEiHMcJG2gtdn1h/qmaT20c3LqxfhDnTTFj1t0bHkWh/kdrxQTXxGKTjB3kUUQjL6Tr8n77qjK/cOFpv82AZK58GgtJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ccMkVNwu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=trupti@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ccMkVNwu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=trupti@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxWnJ5RKdz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:46:44 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60M0a6P1006266;
	Thu, 22 Jan 2026 06:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=edmSY5
	GLa5spGf23csUtWTjTLCq8zh76a1gduET7t1U=; b=ccMkVNwunSEoq+Y82kzbiY
	2rHrswd5tpmz8rGSaFPbBsBwxLD3zGGebQIGu+Kt0pCVKNOPs1wwRSlFlsA8t9yl
	ZGT9Zmezq6+//2CBCLVRHM5P9TgxZKYgBSv8xG1rPII86lz0rMGqLWOIbW7lJYk2
	thC3/XlRiT8WeRx26cexW65Kf/T+Zx20cYYTFYXvGVhiziJ6aKeoVlJZR/3ZXKRU
	MM7Q7EjYcWrwTAkI119d+feIAkIGfdsMBEywFflAhTWA4MS3yL8C5lJ6T9cNIIUm
	dXzqbFMo0lI3Jgolse/Sz5CnsKs2TbjDJk24JF7hO/pa5i2jJXjhEwbiVSdJ4l4Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23s8bay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 06:46:35 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60M2euhc009266;
	Thu, 22 Jan 2026 06:46:34 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kghy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 06:46:34 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60M6kYkZ32113354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 06:46:34 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A74A58053;
	Thu, 22 Jan 2026 06:46:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABEC858043;
	Thu, 22 Jan 2026 06:46:33 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 06:46:33 +0000 (GMT)
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
Date: Thu, 22 Jan 2026 12:16:33 +0530
From: Trupti <trupti@linux.ibm.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-powerpc <debian-powerpc@lists.debian.org>,
        linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,
        gentoo-powerpc@lists.gentoo.org
Subject: Re: Github tracker for PowerPC issues
In-Reply-To: <a8c239b497a3986fa20556b5aa54b8e2c8d56b17.camel@physik.fu-berlin.de>
References: <a8c239b497a3986fa20556b5aa54b8e2c8d56b17.camel@physik.fu-berlin.de>
Message-ID: <f80cd9f9b91966862ece4bb270460198@linux.ibm.com>
X-Sender: trupti@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KH5M3m1LHZEAyPA4FhNunAd8DjLOVQ-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0MyBTYWx0ZWRfX6YZz3p5WU6ei
 tyy9urblBSWSnw+k4PK63o+isC4hIRuBVQmcXvY+NB8tIg4hKPbxw/Q5jSL/NkyMJigzzPPSh0m
 OKjK0lfXiKyPvA65OHXBb1Mhs7kYEvhBLvBw565QFKa3aNvud18tGeRX5ULoXvHwr19VG/hM9OS
 LZBBjIDMwTyOykL+7e67nds86gwneQGXuHdwDowNmgewJhifO1BwiacA6chvo4uHGTYATwEVewE
 wvv44xonKP8jBFxeZaUmhDnHMmPvCrhndFRk6GR8aSDxtovsqnEbAHVg01D7eYBNvgWXA4TEp+C
 azW+HakVqViXXVLVuKkh6KgEDm9z1Xa9Ne+LLpD1KBdaOgPFV14mKUiFOSZsa/RcdUnohvP+2JO
 uukutkvjvSfpRc3r8Efy3muWl3iuuCP3iuT89Jti7YKY+X6ZMo3ynrqxMlaeRyJzN3yQ9/iIVqY
 rPeBzYhqK0ozX1aIgQg==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6971c7cb cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=l2zBbvN3ftEsW1hs0XsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: KH5M3m1LHZEAyPA4FhNunAd8DjLOVQ-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601220043
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16118-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glaubitz@physik.fu-berlin.de,m:debian-powerpc@lists.debian.org,m:linuxppc-dev@lists.ozlabs.org,m:gentoo-powerpc@lists.gentoo.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[trupti@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trupti@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E254362696
X-Rspamd-Action: no action


Hello Adrian,


On 2026-01-22 02:13, John Paul Adrian Glaubitz wrote:
> Hi,
> 
> I just noticed that similar to the issue tracker I created for SPARC
> [1], there is an
> issue tracker for PowerPC [2].
> 
> The idea is to track any issues specific to a certain architecture in
> a central, prominent
> location so these become visible to any distribution maintainer and
> PowerPC upstream developer.
> 
> Thus, if you spot a bug affecting PowerPC, please report it in [2].
> 
> Thanks,
> Adrian
> 
>> [1] https://github.com/sparclinux/issues/issues
>> [2] https://github.com/linuxppc/issues/issues

Thanks for sharing this information. However, the issues at 
https://github.com/linuxppc/issues/issues are mostly related to the core 
Linux kernel and toolchain.

For Debian-specific work, we need a separate issue tracker: 
https://github.com/linuxppc/Debian/issues, where Debian-related issues 
can be reported.

I will share the link to this issue tracker shortly.


Thanks,
Trupti

