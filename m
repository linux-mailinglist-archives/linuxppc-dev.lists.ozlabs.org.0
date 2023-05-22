Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3570B674
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 09:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPprX3tNgz3f6l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 17:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2CqLrCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2CqLrCA;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPpqg4T8Bz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 17:24:47 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M6fZrM002159;
	Mon, 22 May 2023 07:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=QWCfiUU6i7bRLnCpHBU44p8sg8pJP+j/9vghbjX6vsI=;
 b=n2CqLrCAO0LcZO7eazo0hg4H4cU2pZnGz1l5fJ4LR3eNpUy3Hw/dGUg3hQieMnkOQ7QT
 uKjYZr0ORCCdVyN1I0gHEg0VKFKUZLZjNVlilZmwxbfXqwAw1MikkO+566kPHH5fln0F
 DfZCCPZT17tlF8FM9r+if2zX7ojaU1Eifmw+pK3q4xdw3ZxWCQ10O1Qh98IeqsmEaVBR
 9yiiC3ebENzt7qWPr5ZPyuuaK2FxSpETBro/MVLQq+EDcPM5aK7BM6bugAv3j1nZCUYP
 0JODvszMqmvw79CjW4N42YTKKIH2kqaEL0CDEX4M5rFRGw9037Qzz4XcDQbhY+VzXSz6 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qqgbq3s1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 07:24:21 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34M6rd1c009710;
	Mon, 22 May 2023 07:24:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qqgbq3s16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 07:24:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34M4duVD032081;
	Mon, 22 May 2023 07:24:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qppc10ppp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 07:24:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34M7OFK819137218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 May 2023 07:24:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84B8D20043;
	Mon, 22 May 2023 07:24:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EF1520040;
	Mon, 22 May 2023 07:24:13 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 22 May 2023 07:24:13 +0000 (GMT)
Date: Mon, 22 May 2023 12:54:12 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: Probing nvme disks fails on Upstream kernels on powerpc Maxconfig
Message-ID: <20230522072412.GA3902@linux.vnet.ibm.com>
References: <20230323095333.GI1005120@linux.vnet.ibm.com>
 <906d4d0e-b487-00a5-9399-7d1edc5e20a4@leemhuis.info>
 <87bkk2khl0.fsf@mpe.ellerman.id.au>
 <2a80cb20-0c9f-2d0c-e951-c4f005f3e4b3@ozlabs.ru>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2a80cb20-0c9f-2d0c-e951-c4f005f3e4b3@ozlabs.ru>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 13Z39uafd8HPXd7QhOiUouFbFLxN8SLs
X-Proofpoint-ORIG-GUID: a3HDUesWl0Wck6bFVLwW1molImew3S4r
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1011 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220059
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: sachinp@linux.vnet.ibm.com, Linux kernel regressions list <regressions@lists.linux.dev>, Gaurav Batra <gbatra@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Abdul Haleem <abdhalee@linux.vnet.ibm.com>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Alexey Kardashevskiy <aik@ozlabs.ru> [2023-04-13 22:09:22]:

> > > On 23.03.23 10:53, Srikar Dronamraju wrote:
> > > > 
> > > > I am unable to boot upstream kernels from v5.16 to the latest upstream
> > > > kernel on a maxconfig system. (Machine config details given below)
> > > > 
> > > > At boot, we see a series of messages like the below.
> > > > 
> > > > dracut-initqueue[13917]: Warning: dracut-initqueue: timeout, still waiting for following initqueue hooks:
> > > > dracut-initqueue[13917]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2f93dc0767-18aa-467f-afa7-5b4e9c13108a.sh: "if ! grep -q After=remote-fs-pre.target /run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
> > > > dracut-initqueue[13917]:     [ -e "/dev/disk/by-uuid/93dc0767-18aa-467f-afa7-5b4e9c13108a" ]
> > > > dracut-initqueue[13917]: fi"
> > > 
> > > Alexey, did you look into this? This is apparently caused by a commit of
> > > yours (see quoted part below) that Michael applied. Looks like it fell
> > > through the cracks from here, but maybe I'm missing something.
> > 
> > Unfortunately Alexey is not working at IBM any more, so he won't have
> > access to any hardware to debug/test this.
> > 
> > Srikar are you debugging this? If not we'll have to find someone else to
> > look at it.
> 
> Has this been fixed and I missed cc:? Anyway, without the full log, I still
> see it is a huge guest so chances are the guest could not map all RAM so
> instead it uses the biggest possible DDW with 2M pages. If that's the case,
> this might help it:
> 

Hi Alexey, Michael

Sorry for the late reply, but I didnt have access to this large system.
This weekend, I did get access and tested with the patch. However it didn't
help much, system is still stuck at dracut with similar message except the
trace.

However this patch
https://lore.kernel.org/all/20230418204401.13168-1-gbatra@linux.vnet.ibm.com/
from Gaurav Batra does solve this issue.

-- 
Thanks and Regards
Srikar Dronamraju

