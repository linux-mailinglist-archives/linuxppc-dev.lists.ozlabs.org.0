Return-Path: <linuxppc-dev+bounces-5894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB9A2A3C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 10:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpWKf4Dzmz308M;
	Thu,  6 Feb 2025 20:00:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738832454;
	cv=none; b=C2ymp3xd36YUwmgFv8UP2oq4rEd9r+YzkQfmhH6/0E/+cxoDW3CO/hCSIPmN2Vpw20XFPh6qWkbWRaGyhJLeOKg+OALHTO3taKtoVA2K2Azcaj4r2DekvvBSz0TmJqo5FaDfE6Ci5cNzLQPcMEBEpFXpWOs+0Zx06pOwEpDTmfbT58qvQn8CtKBb9bXzZgfjRY4ys/kBvsX+U0XgU3AlkP3Ivbo1cmx5Uc/5TAIzk5CzM2GhMhZd1185p4YIW3wwngnK7Ut3MM8ccKdyATOLgz4Qtw30xvrjXdyRxKzZ3WWt9UuE/lP8nFlj3z5lfqiAc9un4j9DGmUphaFg1ZgsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738832454; c=relaxed/relaxed;
	bh=0W3hRzcMBQdJKf41pQDnaZxshPEQ4bm+jDoMRfYIhqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbNe0+WCT/Z6nWk7iUyfqiLVLqwjDJsVWQxxNYN0jqvTFc61S2wdnZ68myAJzembEW9cNhauZNU+LH+0lsCwh2MvHpg3pfmnqhXZRCX+ab48Gw16gh+hKn27CjC8AYsIIJO3aCFWWvXtH/fxwk/TrRjirS415wb5cx6ddW3hs1uKh0o61/sUiNpldl4eyZJfhOwmjjMKDD3Gl/80MIUS2Sg+4id0EpfTCo3t9k0zG/LMRc5HqQjzl0J8+AzspNwMKG7U3dQtrumU60RnqPB45tiL8hku79hKqEbVIwXfjobSDWHiRjBjJyfmEoXhWwZd8GyMLPTV4EczWZeabWitYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lSBQAnZ1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lSBQAnZ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpWKc3hzFz2ydG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 20:00:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5160vjjL001791;
	Thu, 6 Feb 2025 09:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=0W3hRzcMBQdJKf41pQDnaZxshPEQ4b
	m+jDoMRfYIhqg=; b=lSBQAnZ1TjhUuzZcSvVHORXuW3Fj/unhPvepG0lw4O5Yly
	KJh1mlV4iZ6o47209ek/dkz3ZsLqu6hpNCkDQjpZdNDgfENFw45SiFcpxBUxeOtP
	PDgN6E/XwzaqHgCCEGeugKFTnNSqt2oxDpBks3sc19uEChYZFaYRWDXkOrAoygJ+
	q9CxQ7Qwu4v2m9ogcmn536d+hFLbjdynAPN1aE00cqMlpZ4QNEBX7SPFqofaBLMQ
	fnl1Bq+iwfDC9YtIrAI1Jb303iC5gcJ/2whe8vbriNPkNdl272azSrYxjkFgPP4/
	sNfBsIaQxZX6rxVboB+g928dmNYcKjDB2DQxrSvg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ma8yvrcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 09:00:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51677j4J007127;
	Thu, 6 Feb 2025 09:00:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxaywfkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 09:00:47 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51690jOD26804880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 09:00:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FAFA2009E;
	Thu,  6 Feb 2025 09:00:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63D74200A6;
	Thu,  6 Feb 2025 09:00:44 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Feb 2025 09:00:44 +0000 (GMT)
Date: Thu, 6 Feb 2025 14:30:40 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Dan =?utf-8?B?SG9yw6Fr?= <dan@danny.cz>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: panic in cpufreq_online() in 6.14-rc1 on PowerNV
Message-ID: <ugquf2uym6q572y2rck4h63wsd2us6jz7cepnqjpnghh6z6he3@dhdn3pvoahyf>
References: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gdW9Y5DLugYLlcsUl1-VfmxbZvmG7ih1
X-Proofpoint-GUID: gdW9Y5DLugYLlcsUl1-VfmxbZvmG7ih1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=613 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060073
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Dan,

The fix for this was pulled yesterday[1], you can apply it

[1] - https://lore.kernel.org/all/20250205181347.2079272-1-aboorvad@linux.ibm.com

Thanks,
Gautam

