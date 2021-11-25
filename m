Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D145DD56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 16:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0M92213tz3c69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:23:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIZ9BuCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UIZ9BuCA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0M8F5YBMz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:23:09 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APDweNl006551
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 15:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=JT0cBDyOgu3/zYKjxetaxh3fVbGC/dCIVNBzVrm1f4g=;
 b=UIZ9BuCApgAsz944qqoUry8GpuuT0rEbvS0OzYPQAlF/sF67cdLcrBCsx6QHQ4GkPRuH
 RoereJv189SXx0IBJdLYmosdw/cbRp8LTrxZoo5t/QwDY8zRhDAW49eFGX7Bm1E8rGCw
 SPRTjoVQ4te+ClIRZHORBZhvA7bUXwrCt2ucuWyU3EzNxVYooX6Egc0npR7MdsDnFtM9
 /KEv2sbeKimbE2RhrZAIeZhy90KoJ0oH42kBp7W6eAFwfIbCQjg8Lp+ZMEGQQn55e2d7
 5cMFP8FTKMr0Zbv8+CiO93GrIuUAWEqqLHh64OM+3cwXlGPGyOYkrky4pjgX9PNQWd6b fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e5ebt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 15:23:07 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APFLmKD003129
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 15:23:06 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e5eb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:23:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APFHB2g009711;
 Thu, 25 Nov 2021 15:23:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3cernbtaac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:23:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1APFFn8h56688936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:15:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85DAF42045;
 Thu, 25 Nov 2021 15:23:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E449C4204B;
 Thu, 25 Nov 2021 15:23:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.191.168])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 15:23:01 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [5.16.0-rc2] Kernel warning while running sigfuz
 w/PPC_IRQ_SOFT_MASK_DEBUG
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <1637842187.e2kyh90mx9.astroid@bobo.none>
Date: Thu, 25 Nov 2021 20:53:00 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A891587-F731-444C-B5C8-2C39B57138C7@linux.vnet.ibm.com>
References: <F75A81A9-1756-4368-99C7-DD5B3A712530@linux.vnet.ibm.com>
 <1637842187.e2kyh90mx9.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P8GUhtb9djBMQjgOjtR-3pmedqPSNK2z
X-Proofpoint-ORIG-GUID: ksWb8qGn5zca4liUfEuyuM7QfHtOQz4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250083
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> [ 1032.913679] GPR00: c00000000000c6d8 c00000000c7e7e10 =
000000002fcdac67 0000000000000800=20
>> [ 1032.913679] GPR04: 0000000060d67006 800000000280f032 =
0000000045faa436 c0000001eb3d4c00=20
>> [ 1032.913679] GPR08: 800000000280f032 0000000000000001 =
0000000000000001 0000000060d67004=20
>> [ 1032.913679] GPR12: 0000000060d67006 c00000077fdf2300 =
0000000000000000 00007fff9da00000=20
>=20
> SRR0 =3D=3D r11, regs->nip =3D=3D r12
>=20
> I wonder if this is just that SRR0 does not implement the bottom 2 =
bits=20
> so the check fails when the signal context sets them. Hopefully the=20
> panic is just due to this warning 0x700 program check hitting at a bad
> time.
>=20
> We could always adjust the debug check but maybe something like this=20=

> would keep those bits clear which might be cleaner.
>=20

Thanks for the patch Nick.
The test runs to completion without any kernel warning/crash.

Thanks
-Sachin=
