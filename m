Return-Path: <linuxppc-dev+bounces-1602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE2986BFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 07:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDhpq32pVz2y71;
	Thu, 26 Sep 2024 15:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727328243;
	cv=none; b=TN1lrvxHIydjfdBCLYSx6kaXDdQ2Mov/0GMex1ljro4L7ol1AONqAPiTqI1R3lA8KN7qaE5ifCvslv4xvwa8Nhg5argxhUgsJu7WXUftlHvMYQKkXjPMfEMiuNw6n/7B/dfmlFkziWWXxGwCw6Iztzgf6XDu/bOuxQGnMwddJmRuHL040cdGzZae3NNphuvz73w3HbceaF1Kq/aWSHWs2P55bvyJX5fSQKemnaxLkVZbUKmzyYLJ2D6zI4Bytd4I7NjJimdv2ek+OwQgDgFd/jhoGt7bdqifu489JLMC1y6Wid+7A1OyZ7qeWwW8UgbC6W+1XIoqCCJFBpwMpeKhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727328243; c=relaxed/relaxed;
	bh=7DorH646rEbOAMl9jNYhRSv2I7SNoOVSt8xABaxCUWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=aQbkwQVLWWbt/jUARTORjJ73v1G6sReYBvWr2SL3rUcNYQG2vPolVpwIHjDytqFpx81cKD3oukc7PpJKOSWNopbn4N2NQqwoVcvLuZ8JE3hSocMxKf0GhmvQJC/KSM92rZI+1A+6vY6R9dtWufJARnM2vFGl65aEjlnEV8ugLo+MsikcJ6VBvxMXAIVLIkimTjoNhDBvxu5X0IFSvfc2dHjPTXOaVRhbRxja34RHwI74ZMUg2ynZSmG2JCxKA7PWgvywxqShgeTQgLY7tvJtOJMzyRlzdIGZELchcinTNkYSzzjCT1Hov/DBK1Pu7XmZiGO9Fcu6Pi+XpLxs6w+dnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y9Gt7jjb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y9Gt7jjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDhpp2sGfz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 15:24:01 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PMgGab017093;
	Thu, 26 Sep 2024 05:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	7DorH646rEbOAMl9jNYhRSv2I7SNoOVSt8xABaxCUWU=; b=Y9Gt7jjb3fkCCKUn
	hQ26bPdGQk6jxXnCpJ5iCFEyrYHLY0Uqyrlw/6MO2iWsSztmQ0esVSoBMkUwwG1d
	QdzdD9vl14qSf+NPSgubNtTu3tV6aZhKf1IA9p3eIPEP3gU2nZ0e/JbEa+YS47jR
	VEb7eM2KvAc/nBqV1Klc79ndc1nkMuvReiC5rV0YKjYhESOu20uGFRDpffex/Cy4
	rmT/4vL2hqGw6hI6lHJ3G9cNjkNbiVXED8hbBTcEBMb/S4lHW2IJ/QyodjgU6eZC
	QXlppaEwYUiTO693gqurNEf/qPmSW7exl2D31SbDf2K6e3kO/rnflvfAjOaNMXfx
	KXbLNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41sntwm6p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 05:23:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48Q5NtTj003909;
	Thu, 26 Sep 2024 05:23:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41sntwm6nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 05:23:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q3vDwI008701;
	Thu, 26 Sep 2024 05:23:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41t8v1dj37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 05:23:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48Q5NoFM20644278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Sep 2024 05:23:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39C5E20043;
	Thu, 26 Sep 2024 05:23:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 640F320040;
	Thu, 26 Sep 2024 05:23:46 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.209.36])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 26 Sep 2024 05:23:46 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Thu, 26 Sep 2024 10:53:45 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Jordan Niethe
 <jniethe5@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, sbhat@linux.ibm.com,
        kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com,
        npiggin@gmail.com, David.Laight@aculab.com, kvm-ppc@vger.kernel.org,
        sachinp@linux.ibm.com, kconsul@linux.vnet.ibm.com
Subject: Re: [PATCH v5 00/11] KVM: PPC: Nested APIv2 guest support
In-Reply-To: <ZvRIG1LHwqa5_kgP@kitsune.suse.cz>
References: <20230914030600.16993-1-jniethe5@gmail.com>
 <ZvRIG1LHwqa5_kgP@kitsune.suse.cz>
Date: Thu, 26 Sep 2024 10:53:45 +0530
Message-ID: <874j636l9a.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ikh_DBkdvnHpXsKlmsGdy9lwXO2QQfYN
X-Proofpoint-GUID: Flv9va43B6Jy4B5E0lT03z78XQ4EWgfz
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-25_16,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260029

Hi Michal,

Michal Such=C3=A1nek <msuchanek@suse.de> writes:

<snip>

> Hello,
>
> are there any machines on which this is supposed to work?
>
> On a 9105-22A with ML1050_fw1050.20 (78) and

On 9105-22A you need atleast:
Firmware level: FW1060.10

> Linux 6.11.0-lp155.4.gce149d2-default I get:
Kernel version is fine. ATM anything >=3D6.10 is good

>
> [   29.228161] kvm-hv: nestedv2 get capabilities hcall failed, falling ba=
ck to nestedv1 (rc=3D-2)
> [   29.228168] kvm-hv: Parent hypervisor does not support nesting (rc=3D-=
2)
>
If you are still getting this error after switching to FW1060.10 than
you need to enable KVM mode for the LPAR following instructions here:

https://www.ibm.com/docs/en/linux-on-systems?topic=3Dservers-kvm-in-powervm=
-lpar#kvm_in_powervm_lpar__title__9

TLDR; Just need to enable 'KVM Mode' in the LPAR configuration from HMC.

> Can the hardware requirements be clarified?
Further clarified at
https://www.ibm.com/docs/en/linux-on-systems?topic=3Dservers-kvm-in-powervm=
-lpar

There is a qemu model based on tcg, that was merged in v9.0.0 some time bac=
k via
https://lore.kernel.org/all/20240308111940.1617660-1-harshpb@linux.ibm.com/

If you want to try this, then following can be helpful in setting up the
environment:
https://github.com/iamjpn/kvm-powervm-test


> Thanks
>
> Michal
>
<snip>

--=20
Cheers
~ Vaibhav

