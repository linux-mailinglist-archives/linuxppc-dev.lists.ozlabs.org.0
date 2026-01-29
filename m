Return-Path: <linuxppc-dev+bounces-16391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLboBFQze2lJCQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 11:15:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871BAE738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 11:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1w5C5wwQz2ydj;
	Thu, 29 Jan 2026 21:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769681743;
	cv=none; b=gYDKdPNl2RStQkauJpgHUEmtFSDhtLbtnN6vrvsa2JHbx3fjgYO4xoRcwhWOh9sdO1JHNkDZi4mIjHjsSrmowXqXhek5it6NG9ZrKRdQI/0GIj1hLZf8AvSCxlPHWLjMXHfa9/caVgDjxAMlCzK8dJfxf5iVk3jD9JxfqafjFjHdoirqR+LUpWst1uLHWl5+ASCVcdCxJk8zDKzSOJVI0AW3bbKJ9KMiYPoaDO3N8UsE6Q0WdIaNl7UUliSDvbdwJFGfh/sZLeodMz9E01B1AAyUS0BTzfcmamNzVEifP9TLm7UDuxNc6je2hudSJm/GHLx3UeXbemScpVd1dMSjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769681743; c=relaxed/relaxed;
	bh=YJkxGuRbVI3wzytxknHvdWJ9TCuj+K0iGTi9NJ0Fssk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNfWUDuvaRwL2lsOeltD3O5pMa3+pTWSrDI1jgr2WtNGevvVlsJcoIcuwC3XVIE76df+nbM4B9l+w3J8YJkSbSQMgTXgJ0p2bieo/WZ3GR2siJZuDLurWnFK7w0yATKLJeLKL0O3mR7hv04Z7JgMTU96V8s4HkZ6gSxepv17b5XhJWeAPFvWa4pTMPWAo9mWQJm/hUYtAOaXjLJ34BOt7Jh9QSsuk3Mp7P/RNg7bfT+LSe0eJRry5yVjOb7UWQI9KxHfME0n1Cp42obovoybsod7tsdIsXWzf3YDHqgPS7CG9ppT0kOuK00BP66hM9Oz/veTarCBqfPEoClUA8NIpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gfei5IjR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gfei5IjR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1w5B6Hn2z2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 21:15:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60SLbECQ024618;
	Thu, 29 Jan 2026 10:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YJkxGu
	RbVI3wzytxknHvdWJ9TCuj+K0iGTi9NJ0Fssk=; b=Gfei5IjRy3xcuy9TfyMB5b
	LRmc4cJ+tHxL3nX5jgsy/S65VBw0Mpptp9K24vVMbO558eOJ6K4Gm8dQVoj+sHXH
	2ppM0tJU5kN9FbdW+0QDv+bQvXt8NUFl+vfh/7DsJOQl7iQ4N5nNdlwkuyPl5h3z
	bKyYwcE6eu7LE2Te334T4nHO0/a5hw8I0ktOAN7RW6ns4H/OlX21cu5/1vc+p1uR
	oyS+Ya1KVWk2XBmD20J3neliHGlH/uh2EFTOSywbKJX/VaMUVKbxlWPN+Ji0IOXc
	2+GHUYP3y6xBLcnmT+nOqe9yeFnqSo9mryckz2uOqx2uL4pMfct05QZ822zTKF5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtqy9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 10:15:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60TAFRk4022601;
	Thu, 29 Jan 2026 10:15:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtqy99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 10:15:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60T63g7A019630;
	Thu, 29 Jan 2026 10:15:26 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9dn984j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 10:15:26 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60TAFO8i28508820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 10:15:24 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B80058059;
	Thu, 29 Jan 2026 10:15:24 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B3AB58043;
	Thu, 29 Jan 2026 10:15:23 +0000 (GMT)
Received: from [9.61.90.223] (unknown [9.61.90.223])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Jan 2026 10:15:22 +0000 (GMT)
Message-ID: <64228832-ebdb-4899-916c-a68f2d85096e@linux.ibm.com>
Date: Thu, 29 Jan 2026 05:15:22 -0500
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
Subject: Re: [PATCH v5 0/6] Extend "trusted" keys to support a new trust
 source named the PowerVM Key Wrapping Module (PKWM)
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20260127145228.48320-1-ssrish@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20260127145228.48320-1-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RsLaDV3LTNJQuePLSr4C0DweVWaf7PGP
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=697b3340 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=N8QNvH2uwYDi7y4ex84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yla_fuBo9BtvuM0keuW97l87MgMjoYjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2MyBTYWx0ZWRfXzm8LUkLb5s7i
 9S30rTWPv/Ma7tqcly6ezIyW0L6/nKbo2oBs2+KHJhj2h3NE6Za/EcjQeQpfR5YKk6wnyZndSqi
 DE1zW/Ru3I0vdUeOwhuzI2hZHQm5CiaNyoqqw470jtHR8bOb9skcRmPIjAVa2ZTSVFY14XQVO+2
 1hdYzw0C68V2+wzZVBjedioxVagLEaMtYx2Mj15goJRDkZVvBN/gGNFZrwzxQiUZwP2LuFfRWJV
 4omvLi+5+ak4Ol3KFczafcJ73ykuTCGwRGJHRuQpKfQ3svZZblDQ3XkTLzZ952kwXX3mCpxvnhO
 HgXYSuHs1dEabmAqINJLQtJ9s9yZxG7ByM55frqBX+B+L+ENJphW/K2Q3TKrBcnm3rsXOon/gTZ
 7FjPXHx9WG5qOGgjjDIQaPqf+HvxHgCtv4nqWezjdWjIzBzCX843L/0dads1GS8PRn/Dw/jxBTE
 r7CMKSPV6qVYFtXwYuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601290063
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16391-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nayna@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nayna@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5871BAE738
X-Rspamd-Action: no action


On 1/27/26 9:52 AM, Srish Srinivasan wrote:
> Power11 has introduced a feature called the PowerVM Key Wrapping Module
> (PKWM), where PowerVM in combination with Power LPAR Platform KeyStore
> (PLPKS) [1] supports a new feature called "Key Wrapping" [2] to protect
> user secrets by wrapping them using a hypervisor generated wrapping key.
> This wrapping key is an AES-GCM-256 symmetric key that is stored as an
> object in the PLPKS. It has policy based protections that prevents it from
> being read out or exposed to the user. This wrapping key can then be used
> by the OS to wrap or unwrap secrets via hypervisor calls.
>
> This patchset intends to add the PKWM, which is a combination of IBM
> PowerVM and PLPKS, as a new trust source for trusted keys. The wrapping key
> does not exist by default and its generation is requested by the kernel at
> the time of PKWM initialization. This key is then persisted by the PKWM and
> is used for wrapping any kernel provided key, and is never exposed to the
> user. The kernel is aware of only the label to this wrapping key.
>
> Along with the PKWM implementation, this patchset includes two preparatory
> patches: one fixing the kernel-doc inconsistencies in the PLPKS code and
> another reorganizing PLPKS config variables in the sysfs.
Tested the entire patch series. Seems to work as expected.

Tested-by: Nayna Jain <nayna@linux.ibm.com>

Thanks & Regards,

      - Nayna



