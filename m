Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F45A608E4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 17:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mvm7z0FW8z3dw4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Oct 2022 02:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jJ7x+IOu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jJ7x+IOu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mvm7022S7z3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Oct 2022 02:52:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29MD8jiU008269
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 15:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=UUGmn3VdAvkqfeE4IBY3WMVsGKXUo50KplXTBVAI+Pc=;
 b=jJ7x+IOuQfu4cQhHNK9Rv4CtvltZyhp08KhkLWTGbVsxDc3qDUoUfx5bV/JsLKXpzQQC
 A+a2Sl0Ylm7eUeKMFRFgSbYCLPYn0bCJWBNENw35pUxjN2pEuHEkC8Jj2Q7etaKrI+wc
 +H+AXvozkPEDT1hjCkGC4PsNoiJhhClTmQTdRDoUZot/54UBFy02ceodmmSXrToreLMm
 nhldBI8IIZEfL35HWNVc4upN9VDByBUHiFk7zQLdnfl9r+hm5yGoyKKPWBwtkMyHo4Im
 6TifoPCkvq0dJ4IOEL3oo6R3bEpf+ySZZVxhWfm1qj4Jz0ORvepRaj2aKVOIr/LOdjjz Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kcfy8kv25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 15:52:07 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29MFasmx016568
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 15:52:06 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kcfy8kv1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Oct 2022 15:52:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29MFplTm000481;
	Sat, 22 Oct 2022 15:52:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3kc859gf41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Oct 2022 15:52:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29MFq25a36569682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Oct 2022 15:52:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 796B7AE045;
	Sat, 22 Oct 2022 15:52:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0280AE051;
	Sat, 22 Oct 2022 15:52:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.16.180])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 22 Oct 2022 15:52:01 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS
 when returning to soft-masked context
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20221022052207.471328-1-npiggin@gmail.com>
Date: Sat, 22 Oct 2022 21:22:00 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F170DEA-AB4D-4BA6-A426-4A6914187386@linux.ibm.com>
References: <20221022052207.471328-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sErmVs4MybT-E2xdHHWMuewtslzz9g1B
X-Proofpoint-ORIG-GUID: kwfCXfVKkzE6k6fFWTf3aiWQOKZjvJqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=787 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210220097
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22-Oct-2022, at 10:52 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> Commit a4cb3651a1743 ("powerpc/64s/interrupt: Fix lost interrupts when
> returning to soft-masked context") fixed the problem of pending irqs
> pending cleared when clearing the HARD_DIS bit, but then it didn't =
clear
> the bit at all. This change clears HARD_DIS without affecting other =
bits
> in the mask.
>=20
> When an interrupt hits in a soft-masked section that has MSR[EE]=3D1, =
it
> can hard disable and set PACA_IRQS_HARD_DIS,which  must be cleared
> when returning to the EE=3D1 caller (unless it was set due to a
> MUST_HARD_MASK interrupt becoming pending). Failure to clear this =
leaves
> the returned-to context running with MSR[EE]=3D1 and =
PACA_IRQS_HARD_DIS,
> which confuses irq assertions and could be dangerous for code that =
might
> test the flag.
>=20
> This was observed in a hash MMU kernel where a kernel hash fault hits =
in
> a local_irqs_disabled region that has EE=3D1. The hash fault also runs
> with EE=3D1, then as it returns, a decrementer hits in the restart =
section
> and the irq restart code hard-masks which sets the PACA_IRQ_HARD_DIS
> flag, which is not clear when the original context is returned to.
>=20
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: a4cb3651a1743 ("powerpc/64s/interrupt: Fix lost interrupts when =
returning to soft-masked context")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Thanks Nick. The patch fixes the reported problem

Tested-by: Sachin Sant <sachinp@linux.ibm.com>=
