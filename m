Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEFF5E62E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 14:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYFbC3D3Nz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 22:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Djw/J0RT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Djw/J0RT;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYFZQ6RZLz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 22:53:18 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MCkSBx031015;
	Thu, 22 Sep 2022 12:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EMMrbPpnVu2KIeviMqn2ADJFSOeRHY+vjNS+Z/uUL4g=;
 b=Djw/J0RTUtlMq8mAjXvAx3MVmmMLny0h0S+g1V6verBy6VY/jiwayzQonrNN0TwTI0Ti
 9hWxFgbBZq3u/vDW/K8cnnEz8a4JNoA1Rarcp2LWzAPfg7q57+9LpGiwuZZJvl9SVL4Z
 HC6p9z/6L+H2JNOfaWWWTZQCkE8SW9n/JhjGoOKVnT58R1H5HwOwVaxfyCOLDrMNUYSF
 ugEHOqGyMhMILexidplyEXvzvQVUBAWdPG/bL7NRhE0ggfNjnKC8HWOdWY1QXJ9i4i8P
 VjUO75V3nP7Ty3vSEnsP8vAgeOZZlNN4HiZwq5X61jFvj7zJYLT40HbYGkky12Kt0d0f RA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrptcaghj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 12:53:13 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28MCq1vE031346;
	Thu, 22 Sep 2022 12:53:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghmyv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 12:53:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28MCr91F30081364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 12:53:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE7CA4051;
	Thu, 22 Sep 2022 12:53:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5597CA404D;
	Thu, 22 Sep 2022 12:53:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.115.178])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 12:53:08 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [powerpc] Kernel crash with THP tests (next-20220920)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <YyuhD+7N022PgRA+@monkey>
Date: Thu, 22 Sep 2022 18:23:04 +0530
Message-Id: <5B4296E1-922B-4B01-A16D-CB427761FD2E@linux.ibm.com>
References: <C2C8DA4F-F00F-43E9-ACD8-2A8BACA55893@linux.ibm.com>
 <YyuhD+7N022PgRA+@monkey>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: egoh55Pn-Vyx9HaWGHlKKX99qDCQ2z8X
X-Proofpoint-ORIG-GUID: egoh55Pn-Vyx9HaWGHlKKX99qDCQ2z8X
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_08,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220083
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22-Sep-2022, at 5:11 AM, Mike Kravetz <mike.kravetz@oracle.com> wrote:
>=20
> On 09/21/22 12:00, Sachin Sant wrote:
>> While running transparent huge page tests [1] against 6.0.0-rc6-next-202=
20920
>> following crash is seen on IBM Power server.
>=20
> Thanks Sachin,
>=20
> Naoya reported this, with my analysis here:
> https://lore.kernel.org/linux-mm/YyqCS6+OXAgoqI8T@monkey/
>=20

Thanks Mike for the pointer.

> An updated version of the patch was posted here,
> https://lore.kernel.org/linux-mm/20220921202702.106069-1-mike.kravetz@ora=
cle.com/
>=20
This updated patch works for me. The test runs to completion without any
issues.

- Sachin=
