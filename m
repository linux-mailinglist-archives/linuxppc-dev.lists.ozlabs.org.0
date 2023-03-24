Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F06C7636
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjS9J652Cz3fCh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 14:19:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JchxvEyd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JchxvEyd;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjS8L33DSz3chd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 14:18:09 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O1dvEn016924;
	Fri, 24 Mar 2023 03:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=BNbeD3ySaTQDwCEDcLt5eGh9bouiy1EAvy296wcI/hQ=;
 b=JchxvEydFK8o3Hh414Y1ok7FUfexcwJnCqjA7RUohRBsM7wi8LvfL5mcHTcE7UNniAOE
 qYqd5CQIQO3TSON11VHf/RiIzznQUkmgoa26poZ5sREJCMpLHpA9+ZQy6ZIYCCBJ+YsJ
 PynNgIz8y7qcm4NrJoeOjf9bp0RoZ0V1zvZwg/lkqgW3zKbk+Pz71AjO5UNUYVolYDTJ
 ahhuzD2TKXxcp6DrHnGmhiP0OOhMikjx4bYJ0lmn2ZTPe4TI6mj/ECDLzrmRfUAieHCu
 SbYx8FT3yFdZnTNx3Jiut7L3oIZAPU+BD5miU12/n3vR+/FVqtPQgxG6UkPXPVb8i5Lh dA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxtbx10a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 03:17:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLLPZ9025320;
	Fri, 24 Mar 2023 03:17:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pgxkrr96s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 03:17:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32O3Hoco29754022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 03:17:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 283CA20043;
	Fri, 24 Mar 2023 03:17:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16A7920040;
	Fri, 24 Mar 2023 03:17:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.5])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Mar 2023 03:17:48 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [next-20230322] Kernel WARN at kernel/workqueue.c:3182
 (rcutorture)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <ae015179-03b5-4e4b-86dd-cbab75230c7f@paulmck-laptop>
Date: Fri, 24 Mar 2023 08:47:38 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <23F7ADE0-0B96-4257-8910-6B678E0F0C7A@linux.ibm.com>
References: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
 <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
 <233B28DA-70DD-4AD8-9C72-1FFCA6EFE56D@linux.ibm.com>
 <ae015179-03b5-4e4b-86dd-cbab75230c7f@paulmck-laptop>
To: "Paul E. McKenney" <paulmck@kernel.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OoTAlPW90XYFrUCV3SZOFYP3mlusXGsr
X-Proofpoint-GUID: OoTAlPW90XYFrUCV3SZOFYP3mlusXGsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_15,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240025
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
Cc: Zqiang <qiang1.zhang@intel.com>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>> Hello, Sachin, and it looks like you hit something that Zqiang and I
>>> have been tracking down.  I am guessing that you were using modprobe
>>> and rmmod to make this happen, and that this happened at rmmod time.
>>> 
>> Yes, the LTP test script rcu_torture.sh relies on modprobe to load/unload
>> the rcutorture module.
>> 
>>> Whatever the reproducer, does the following patch help?
>> 
>> Thank you for the patch. Yes, with this patch applied, the test completes
>> successfully without the reported warning.
> 
> Very good, thank you!  May we have your Tested-by?

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin

