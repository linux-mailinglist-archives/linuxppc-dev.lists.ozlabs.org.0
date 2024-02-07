Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB884CF87
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 18:12:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL/Ev/8y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVRWN2StYz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 04:12:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL/Ev/8y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVRVd5jxRz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 04:11:53 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 417GCaMh014328
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Feb 2024 17:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=2a340BaZrC0AYFkq7DoaCmLIJa4moi9uo+gpPJRgKao=;
 b=fL/Ev/8yGQT40H+6lpjMyIAOfwsofPSP+P6/cu4MXHtaJDvYECXxJNX3diT7QrQMkPXX
 ZPoWauoaoBX9h1J1M0YFbFM+GoD6aAxrwNSWNC5oqUaYQGRAclNwPdKpwxLWE6UPSuWT
 CfzUK/MpJ9Tb5yAY3QySAYPDyOfhPH/kUPVlokJpcHrGlwBxJ1tmHoKJbEm0wXa9SWl9
 RUf7fLGhu1lqgWLfa/hv5jrie/2rIAYjhJkHf9WsWp6IkWjsY2SGYIiXVFAoKNTf5uHB
 etbB76M/MsqItLInGJ6UFpt/TX4WI83tw7WxjFf48fojz88bTkm89voE4kI6IIYo4VBm rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4d1dt1pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Feb 2024 17:11:50 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417GvO4v014221
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Feb 2024 17:11:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4d1dt1aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 17:11:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 417Eixsv008519;
	Wed, 7 Feb 2024 17:11:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w221k6qev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 17:11:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 417HAxVv41222730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Feb 2024 17:10:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 394142004B;
	Wed,  7 Feb 2024 17:10:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15B7720040;
	Wed,  7 Feb 2024 17:10:57 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.112.162])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed,  7 Feb 2024 17:10:56 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 07 Feb 2024 22:40:55 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/pseries: Add a clear modifier to
 ibm,pa/pi-features parser
In-Reply-To: <20240207035220.339726-1-npiggin@gmail.com>
References: <20240207035220.339726-1-npiggin@gmail.com>
Date: Wed, 07 Feb 2024 22:40:55 +0530
Message-ID: <87eddofbds.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L-pOq2R7azLGNvrk2e2tPbebs5zv36db
X-Proofpoint-ORIG-GUID: EQzeokr-jxvQl1IWnXtyoicUupyh9mK2
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_08,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 mlxlogscore=696 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070127
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> When a new ibm,pa/pi-features bit is introduced that is intended to
> apply to existing systems and features, it may have an "inverted"
> meaning (i.e., bit clear => feature available; bit set => unavailable).
> Depending on the nature of the feature, this may give the best
> backward compatibility result where old firmware will continue to
> have that bit clear and therefore the feature available.
>
> The 'invert' modifier presumably was introduced for this type of
> feature bit. However it invert will set the feature if the bit is
> clear, which prevents it being used in the situation where an old
> CPU lacks a feature that a new CPU has, then a new firmware comes
> out to disable that feature on the new CPU if the bit is set.
> Adding an 'invert' entry for that feature would incorrectly enable
> it for the old CPU.
>
> So add a 'clear' modifier that clears the feature if the bit is set,
> but it does not set the feature if the bit is clear. The feature
> is expected to be set in the cpu table.
>
> This replaces the 'invert' modifier, which is unused since commit
> 7d4703455168 ("powerpc/feature: Remove CPU_FTR_NODSISRALIGN").
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
<snip>

Tested this patch on a PP64-LE lpar with the patch[1] and seeing the
relevant pi-feature bit CPU_FTR_DBELL getting cleared.

[1]
https://lore.kernel.org/all/20240207035220.339726-2-npiggin@gmail.com

Hence,

Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>

-- 
Cheers
~ Vaibhav
