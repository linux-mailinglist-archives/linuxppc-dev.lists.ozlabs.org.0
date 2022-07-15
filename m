Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBA5762B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 15:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lksbx1cGdz3cds
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 23:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MYCiWYdq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MYCiWYdq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LksbC1w0bz3bpZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 23:27:02 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FDJGS1032711;
	Fri, 15 Jul 2022 13:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4stIaNutWDJ8lwB09kyhlbl5FKlvtViMM8hrPgSMzEY=;
 b=MYCiWYdqRUnqE2loxcUxzFeJxvN3aC2enaArf0TYOfP6Jv64ot9MP42nMBXGp/W9bbfm
 eUioVaCdluTWvgwOjYXC5JFnp/zgPO1r9uDW81jgIBYcMCiN0tcsuy4RWJbmbdZwos4o
 XbYRTRzZo5MRF+Kg62okKM0sddiWwrE+B2w/BFHYc5Rx8CL+G58FKBXX5l2vZIj42Udp
 jLattnODJeT9VziKATlfCFEXM8G0n08ci/kukC3uoLYWSvCF/9pPvX/WCxf1qCgqLLfj
 lyEAqgL7N+rX5ZLDbK8WIVoN4XZ+/BZG/KUsQtpksBYZB6vkDt/9nGWZgnj62FlwgXlJ Pg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb90vr4p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 13:27:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FDKiPj014399;
	Fri, 15 Jul 2022 13:26:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3h71a90f0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 13:26:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26FDR6iE32506292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Jul 2022 13:27:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F14542041;
	Fri, 15 Jul 2022 13:26:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C1FA4203F;
	Fri, 15 Jul 2022 13:26:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.10])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 15 Jul 2022 13:26:53 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: Kernel crash(block/null_blk) while running blktests (block/10)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220715124158.GA25618@test-zns>
Date: Fri, 15 Jul 2022 18:56:52 +0530
Message-Id: <FB56C15D-5E85-4EC4-AEDA-199884F6B30B@linux.ibm.com>
References: <CGME20220715123722epcas5p209d7ab2411e2ca5d63f5e2e42a83a665@epcas5p2.samsung.com>
 <9CCFA12F-603C-4C70-844F-83B5C9580BAB@linux.ibm.com>
 <20220715124158.GA25618@test-zns>
To: Kanchan Joshi <joshi.k@samsung.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w5GuckQdDVUVVjL9Mti_wQmaMQo8vxNq
X-Proofpoint-ORIG-GUID: w5GuckQdDVUVVjL9Mti_wQmaMQo8vxNq
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150057
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
Cc: linux-block@vger.kernel.org, vincent.fu@samsung.com, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Jul-2022, at 6:11 PM, Kanchan Joshi <joshi.k@samsung.com> wrote:
>=20
> On Fri, Jul 15, 2022 at 06:07:01PM +0530, Sachin Sant wrote:
>> While running blktests[*] (block/10) on a IBM Power server booted with
>> 5.19.0-rc6-next-20220714 following crash is seen:
> Ming has posted a fix , please see if this can be tried -
> https://lore.kernel.org/linux-block/20220715031916.151469-1-ming.lei@redh=
at.com/
>=20
Thanks for the pointer.=20
Yes the posted patch fixes the problem for me.

- Sachin

