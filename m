Return-Path: <linuxppc-dev+bounces-8269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D614AA83B8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqh40Wbxz2yqg;
	Sun,  4 May 2025 13:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328900;
	cv=none; b=Z10r+FcoaFAL73jRyLIMwysMq6LEWV1HXUReeoeLiwtptV3kl9DOr6TYUngP8ziz56Yp/3+AIo2cFGRS4yqPD44Jx1dVdniGXst7fkVdZLfxjMUttyE+DrpbcZ/McXMc/guAgTgOvionDJjWqskslXo0+ckEGfIA3RFmOW2FBtrHkfaZAPXU8pTevNDtKos19aIynFRafGGYlim/JFtvXk+B2oNdpBm5IxZ2QymrhqcPleZBfwmVKxOHvR6MmeQJU7kKPZscaXmyEuibZs+OpIKzZvWgYmjPDpi3AflBEwGK6ja0h407WFDjmdhEzOkq9FgEYpdry9crvx6A06cGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328900; c=relaxed/relaxed;
	bh=K3y7Ud0JWsUu/klGU0mn8eOjtD3Dz61tdR2cg1utJNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRCkz8yuhBpMmc8OvGcrt/Sg+K5kH6rBUcFOaRg1u1Qba+maeya6w4FnM9UHPQR3e+javkDU6hZd/wSiyaV7rZdhCAgMgqxWb0ffilkvAZi7wP0rR6kohbZ8GwfOQKxqGFhQA4A9XdccVHRMMzq1Zt4HzcmBz4beygt2a3dDWJnWgegIt5L3CD1tfgzZuX99BDzuBh/oFTFonMx4WHUBShYdGIX4bPS9XBOHsTYHQ9KwrnAIjsOupxLkU/CputbW0dMMjZySEHz59tN7Efj2OdT9FxiHdAxd/wleK9fmaNfQ2qEXHuMd/uuNziSg24zKjoIRMCBiEQIfWStpEGYIgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GvPDmkEo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GvPDmkEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqh32Lcvz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:21:39 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5441hxEY032285;
	Sun, 4 May 2025 03:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K3y7Ud
	0JWsUu/klGU0mn8eOjtD3Dz61tdR2cg1utJNE=; b=GvPDmkEolNrssRWJlOTVL+
	5Aqq7nHEeJBc/1P8dUa+mviUgMU+f6EDzzbe/Dncv5t1gKNetZZRgHIoO8zcz4Sn
	OaDszLnHGSyngajmAhBsjWuJPhYnNAAtBdFapn1ehm7svLcHu1qS9YFOQJOMh6zn
	D2Nwy+OpITbH0e5Z5ovQ9irke9fRUmyA+vEJ6A6yK5f+MFOSuFDoJObZd0MCscuv
	IngwUBNLq2sm0eXc167RmjBbr/L0JE/vKZYxScGOopy6cwOyilghjzh1yScErYO6
	ycTOEe5WilI5TAkgeLnMhbEiItwSjN6RfZaWTmecobLyrFEEycaE0T1dvn6rOi/A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dh2ktbyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:21 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LKjR012292;
	Sun, 4 May 2025 03:21:20 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dh2ktby7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:20 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5440bYDH026011;
	Sun, 4 May 2025 03:21:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuygfbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LFhU58786292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E3122004B;
	Sun,  4 May 2025 03:21:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47AD420040;
	Sun,  4 May 2025 03:21:11 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:10 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, hbathini@linux.ibm.com
Subject: Re: [PATCH v2] powerpc/crash: Fix non-smp kexec preparation
Date: Sun,  4 May 2025 08:51:09 +0530
Message-ID: <174632869189.233894.10128282459627577236.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250211162054.857762-1-eajames@linux.ibm.com>
References: <20250211162054.857762-1-eajames@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=fLE53Yae c=1 sm=1 tr=0 ts=6816dd31 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=vi5WORPy-piokG4nGH0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: y8K5q1wFtKMzs9Wy3_4jEJOjhbRRF9RS
X-Proofpoint-ORIG-GUID: -z7dneZFxs5u34ue_3gYH-LoT1t5OvYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfX0v996VwFUsl5 ZS6kVRoLncImf8r1FcBRCw6SGfsG3HtROIn+8BKaY6vH46rpGU5+jfIIPYZJ2umoSbcu51XLtYW hurNuukYNlm+JCr5CnVgBGYeQjijhjVl0ptq7XCYBE33YRtCERTdmSdHZ17FGDjUJ62Q6O2jdxc
 fPX0/Hj76P0XNz17sqHGXShTgiMV/vxj5ByjA6mpkIIlDQYOq+k7hX7BQXjfRtzQs/60/gkVi6H XCUxKkiL33vo6cMWUXJE9rjCnGyAkxhjjLmUq01lIeLqv0VzcM7frQKxgVrsGUc1fzjkV3jHwW6 X0qUxiPmqgrvfuPDY5TSSceXfHKGnNeVDpdblxM1lQV0xwBEthSpIYjqis29ON9pRhbVlsE55w+
 WwV/n16duLDw/+OePuzX898rXUK2OUdZijg2gwj3PPZL8ZfCBGSw7POakSXJwOcQuOf4S+A+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxlogscore=776
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 11 Feb 2025 10:20:54 -0600, Eddie James wrote:
> In non-smp configurations, crash_kexec_prepare is never called in
> the crash shutdown path. One result of this is that the crashing_cpu
> variable is never set, preventing crash_save_cpu from storing the
> NT_PRSTATUS elf note in the core dump.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/crash: Fix non-smp kexec preparation
      https://git.kernel.org/powerpc/c/882b25af265de8e05c66f72b9a29f6047102958f

Thanks

