Return-Path: <linuxppc-dev+bounces-10704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D2B1D1B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 06:45:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byF3416SFz30RJ;
	Thu,  7 Aug 2025 14:45:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754541936;
	cv=none; b=BJV5mH0SvrQDyobhk7DylgKACA1zDci9MyYMURUbEsn/2bU2A9YNKRbrnfqtrQulxgvTIYk6JuSO/AA/Dy1dwmq5NfryhS5qkBbQ66AUhsb+KSu6Ny+RKVqTWkjEtiPHVPXfU5c1pH3zlSIBfpvjUez8WuIzxY27Mul43Wm+aRQI6XIWHPDdUMDk1yi1xSgF0sdkzGxxwaZjsTC29+vGzSuCVf7Bl+qCn9/sNk/hCSxk8f+V1966MkwD4gpDZvD3y17jAMgGcLzgvTAOxZhBvbQYfBhbo0XhcOPAm88/s8X/Fi0yjqETcwkc3FF1YH4HKT7sCIy7QZtFavIT3N4kLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754541936; c=relaxed/relaxed;
	bh=H9CRSste/NHsQRZw0qsq+5701S8wkfWLjHHrfuvfY2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=VAth5u6uBHzMMd156KCCHn9CS02+py4d/eYAG86xPyGiwKOvLaSBsBOu6RdStQFLo0RoPlJVZ/BPFomBCbWpgWjIqLcb7eKy4OCygl0qcu+kKtbEZiO7Y3Jng4Vd1j0Mn81MXc1m20Ko84OpH8ew89JwkdxZU6+rUGoYhqkw4Y/X7gWtXRIvkXUWXcNeg6dWS6s5IwnteAJGUN1AHHgXRB4P8UaGOKhXsj+EJvHxQ44ay1D+Ktc+f7XarsQEX6qeAomKwygRo5mwYU8F8IBoi2h+V/xLebmTBSbgmQxwgZAoMy/j7LZhpA0aR1tGfsUR81MtDtcBaCtMxFfac6fIGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfBQhBnh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfBQhBnh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byF330MFLz2yS4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 14:45:33 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5773wdDd019459;
	Thu, 7 Aug 2025 04:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=H9CRSs
	te/NHsQRZw0qsq+5701S8wkfWLjHHrfuvfY2E=; b=pfBQhBnhtdRkBoPw0oDguj
	7yJImJrXZLxvKyW3kv4slgG2TNIXo2IsWgV6Yzz0l8t3x8hVEuPM4SGuklx6uoyE
	LI1mjRwiYQzpeIv1Nld+m8dxaXlz/nkeumwzYrpFCxzAet4etIOXRBUU9NivyZGs
	LJIiQLb6KAivVjVwxibtdg2HDed4ol3OopWVReF7EfJ7PhoxlgD236qBaTxB8MeG
	8n/eu8Y3WJh7T+40wN8MERqpjIbTN119EvUCH5hHXAj7a/rIJOK+Ay77zpbmjQbY
	l0A+2hP5wtr2SVDAwHazTI+g4Cbdzq4WdeQ8HR5MbuXTxOvmYrnXrrCwM9WTEVKw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26twd42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 04:45:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5770f86r031321;
	Thu, 7 Aug 2025 04:45:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwnexnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 04:45:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5774jPZ115532306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 04:45:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9AE62004B;
	Thu,  7 Aug 2025 04:45:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C4F320040;
	Thu,  7 Aug 2025 04:45:25 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 04:45:24 +0000 (GMT)
Message-ID: <01d8e15b-5feb-4db0-beed-67bb5cc765de@linux.ibm.com>
Date: Thu, 7 Aug 2025 10:15:24 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: PPC: Fix misleading interrupts comment in
 kvmppc_prepare_to_enter()
To: Andrew Donnellan <ajd@linux.ibm.com>
References: <20250806055607.17081-1-ajd@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
In-Reply-To: <20250806055607.17081-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SLsYH1L2uwvatNhfa8VqdcQ1OvFr4PKz
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=68942f6a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=x6bhQlrcOuA10pbQGD8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SLsYH1L2uwvatNhfa8VqdcQ1OvFr4PKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDAyOSBTYWx0ZWRfX2b5LITlRTEI2
 e/ZZRIjyitRU3vqFVeNS10q6fh3GNvrZxEOZN0AzVfyd5ruf/1Iuz4jJyUgxLsM6a1fJWefP4L+
 jgm4+HQDSjUGYhibNiedqBEDbNTN4VcQ5lx4I6WzDm2AnwwA+2qrTNMKqNmqNU5KvLgpg/QrOyW
 JZqbguXcqPgksM8vUvlyyqkdhwyhRHs2Dbigcie3+mG4RfjMX/wsGcUmw/MhwBkuX4DZAS8iyIC
 kVRKWeSk5akhrCgQvxK9RNwjDKwO3qGUvGJqv+tUI1WzTxireoCXBR6S+XA/zYrR6eEQFVYK0i3
 22KMdNkzXjXg4rhde1QGSNEVA6B5gZQntecPI5HZykwhY0NWpOzmTk8JCwPUxoqOevXA1WFJeSb
 SZ3SPZU7se6wWBXzuZEXRpZOm4K9+PZSrZqg5j3pAuhcw1LfBxIFnHhCWZ4N1LO8+XtvAq5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=532
 malwarescore=0 phishscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/6/25 11:26, Andrew Donnellan wrote:
> Until commit 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup"),
> kvmppc_prepare_to_enter() was called with interrupts already disabled by
> the caller, which was documented in the comment above the function.
> 
> Post-cleanup, the function is now called with interrupts enabled, and
> disables interrupts itself.
> 
> Fix the comment to reflect the current behaviour.
> 
> Fixes: 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Given that there is WARN_ON which would trigger if IRQ were disabled
and further we flip irq before calling schedule, indicates that IRQ must 
be enabled while calling it.

Reviewed-by:: Shrikanth Hegde <sshegde@linux.ibm.com>

