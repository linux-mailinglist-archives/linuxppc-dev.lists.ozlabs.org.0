Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8FE6C74CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjP1l2gddz3fQm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 11:57:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HwGpiNvH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HwGpiNvH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjP0n4pHkz3cjR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 11:56:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLYhqa016881;
	Fri, 24 Mar 2023 00:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=kuTTeNUt8xpIjeJQhG6wVE12zo7nTFfYmQN8M86r/+s=;
 b=HwGpiNvHxDvLZgXr1RM8snUMDgmtkOhzVb6ydtYwVZgvVwWRKRAmW9kK0X2XFcitHbXz
 4xHktQ8zpa8Fa8Xftm2SuR18ChHFO93B+Fe4wipk+fsMdjqEiqq+IRsPkTT+HtfcV/2K
 6OgCbpRYgzjq9AImj8msApR5D+VMk/6eVTv2FnmHYJ8wdAu4ZIYelmZv97z8aBtnHnpE
 X6aiIuVqcZDzD3KlufZws7u9pA4C4P8oSvO5TQeVBRz1NCSfeEj8tL5fFstpKZk/XS6w
 aZVPH3T/Q8hAhG3S7s9qXQx8BggTSxXdxo1WTYC8mteWCpkYLAKoPb/ikllj6hpxRE7E qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxtbuht4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 00:56:15 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32O0jkfE005074;
	Fri, 24 Mar 2023 00:56:15 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxtbuhsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 00:56:15 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLefT1023182;
	Fri, 24 Mar 2023 00:56:14 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pgxw50r69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 00:56:14 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32O0uDIl41615792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 00:56:13 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 763AF58067;
	Fri, 24 Mar 2023 00:56:13 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BD2E58052;
	Fri, 24 Mar 2023 00:56:13 +0000 (GMT)
Received: from localhost (unknown [9.211.85.75])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Mar 2023 00:56:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 7/8] powerpc/rtas: warn on unsafe argument to
 rtas_call_unlocked()
In-Reply-To: <87mt437jcu.fsf@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-7-010e4416f13f@linux.ibm.com>
 <e0f8c82707dce0300fc5a2bc5f0a3ab90a83cee0.camel@linux.ibm.com>
 <87mt437jcu.fsf@linux.ibm.com>
Date: Thu, 23 Mar 2023 19:56:13 -0500
Message-ID: <871qlf6k7m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RlNfzH6wU4w5ViO-DXqIkIJPHrIrSHQF
X-Proofpoint-GUID: K0Nn5kuzAck3nb93fYt3wmwvReocwZ6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=998 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240002
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
>
> aside: does anyone know if the display_status() code is worth keeping?
> It looks like it is used to drive the 16-character wide physical LCD I
> remember seeing on P4-era and older machines. Is it a vestige of
> non-LPAR pseries that should be dropped, or is it perhaps useful for
> chrp or cell?

Never mind, I see the display-character token and associated properties
on a P8 LPAR and in a current PAPR.
