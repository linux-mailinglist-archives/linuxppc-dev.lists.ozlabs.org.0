Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF686786E78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 13:52:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6siwV36;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWhKh1pjmz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 21:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6siwV36;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWhJm5LNbz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 21:52:08 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OBgWN3017493;
	Thu, 24 Aug 2023 11:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SXzOVZiCSwjTMWhbhocXyzsUf2o3Hfs+/KgvRo54B0Y=;
 b=W6siwV36vYH2ZBQH17r1zts3KFFs+XvIKy/SZg07MaoQvcNUwokXbaikm3JmLMuGSBvq
 INzqPne/oyBFYE2V/2lCo5v+jMPlIW4o2qUNhoUHbBE1CfaDHUdGrzwLdSLgSqyMuGgg
 oWnoiQmW6J163YIKsp2gIB0RjZXCmrT+kZCDj/j3f0IHovwWblbBVwN3kj+mvC6sE/ff
 j4r7LvTZ9Wqb46DO+i1ilttmpPw/N63Wnf97Elseit6fX0rdBX/J6lDqw4x0DCK7KD6U
 /GuRFFl4pLGIPTCZCdIAajjtDXW4mOj1P0+sv960GYClEr5riaEHPORAOL6i8RXoJIsI IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp6jj0mq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 11:52:02 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37OBipHU028140;
	Thu, 24 Aug 2023 11:52:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp6jj0mp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 11:52:01 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37O9vsLW004047;
	Thu, 24 Aug 2023 11:52:00 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21rpmht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 11:52:00 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37OBpxvk62521708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 11:51:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6D865805C;
	Thu, 24 Aug 2023 11:51:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A328658058;
	Thu, 24 Aug 2023 11:51:59 +0000 (GMT)
Received: from localhost (unknown [9.61.7.26])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Aug 2023 11:51:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas
 Piggin <npiggin@gmail.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>
Subject: Re: [PATCH RFC 2/2] powerpc/selftests: add test for papr-vpd
In-Reply-To: <350d2d004cb3d250e40141a0e6f588c8a5585d90.camel@russell.cc>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-2-932623cf3c7b@linux.ibm.com>
 <350d2d004cb3d250e40141a0e6f588c8a5585d90.camel@russell.cc>
Date: Thu, 24 Aug 2023 06:51:59 -0500
Message-ID: <87lee0zmhs.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EUB6ZdOYOdKo7fV6LD3vGtrAcgL73Wus
X-Proofpoint-GUID: rLiz3G6qiU7Q2LyQNfWOGBz5w_PUf3cH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_08,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=555 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240094
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
> snowpatch has found a compiler error with this patch.
>
>
>    Error: papr_vpd.c:346:33: error: passing argument 2 of 'test_harness'
>    discards 'const' qualifier from pointer target type [-Werror=discarded-
>    qualifiers]
>       if (test_harness(t->function, t->description))
>                                     ^
>    In file included from papr_vpd.c:11:0:
>    /linux/tools/testing/selftests/powerpc/include/utils.h:35:5: note:
>    expected 'char *' but argument is of type 'const char * const'
>     int test_harness(int (test_function)(void), char *name);
>         ^

Thanks, this compiler warning will resolve when this code is built with
701ca3657d5 "selftests/powerpc: add const qualification where possible",
which is in powerpc/next.
