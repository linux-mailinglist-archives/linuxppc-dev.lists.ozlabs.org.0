Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B45962A0511
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 13:12:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN1Qk0Xq6zDqv5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 23:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nMNv1s5p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN1NR2MPpzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 23:10:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UC3AYM138000
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 08:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=7j7mNcEcFfcnYrURu+7ZFSSusgZI4VtmGdh7rYTrGIA=;
 b=nMNv1s5puBW+rRrLf857eb8aK3NvhZ/9mhbwcgvDArRcWYlAZnl4Mvi/4V56BPL+4QFi
 6ACwlVyayF/ZmuBcxJp7IJWNidUxlTmGY0zU7woyNrw964kdwG6h7B9GFGRx7Su1aRJ6
 CN9AKCc4R4wZ7N+URL4npJlUaBjYPMWIWUQAlhB8RclrcrM9EM/rWxv71Ox9Eo6auokP
 6hpjQ0NlbFiSrc44I9PmqVHsQRHFmjwQ4WY8DPEHBfa1wk40LkhjXyYA33/yjvjD4gE0
 9Mq/S1PBtI1ArYKKJm7zg64uVKIXOAS5U+WZ+mHaEtu/Ew28t3dsMdN+s4cnKIatR6l3 hw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fydj11jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 08:10:27 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09UC8CnV000920
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:10:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 34e1gpgpf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:10:26 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09UCAPV744630302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 12:10:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DB11AC05B;
 Fri, 30 Oct 2020 12:10:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 409EAAC05E;
 Fri, 30 Oct 2020 12:10:25 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 12:10:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/29] powerpc/rtas: prevent suspend-related sys_rtas use
 on LE
In-Reply-To: <f7386a11-61b7-4ed5-65d4-e702755be16c@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-3-nathanl@linux.ibm.com>
 <f7386a11-61b7-4ed5-65d4-e702755be16c@linux.ibm.com>
Date: Fri, 30 Oct 2020 07:10:24 -0500
Message-ID: <87r1pfkj7z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_04:2020-10-30,
 2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=1 mlxlogscore=981
 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300093
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 30/10/20 12:17 pm, Nathan Lynch wrote:
>> While drmgr has had work in some areas to make its RTAS syscall
>> interactions endian-neutral, its code for performing partition
>> migration via the syscall has never worked on LE. While it is able to
>> complete ibm,suspend-me successfully, it crashes when attempting the
>> subsequent ibm,update-nodes call.
>> 
>> drmgr is the only known (or plausible) user of these ibm,suspend-me,
>> ibm,update-nodes, and ibm,update-properties, so allow them only in
>> big-endian configurations.
>
> And there's a zero chance that drmgr will ever be fixed on LE?

It's always used the sysfs interface on LE, and the only way to provoke
it to attempt the syscalls is by doing something like this before
running the migration:

# echo 0 > /tmp/fake_api_version
# mount -o bind,ro /tmp/fake_api_version /sys/kernel/mobility/api_version

So I'm not aware of any circumstance that would actually motivate
someone to make it work on LE. I'd say it's more likely that drmgr will
drop its support for using the syscall altogether.
