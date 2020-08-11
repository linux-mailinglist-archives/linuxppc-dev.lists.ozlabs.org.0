Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AB241CBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 16:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQwjN4zNqzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 00:50:00 +1000 (AEST)
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
 header.s=pp1 header.b=qG4zxCMs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQwdD3SBfzDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 00:46:24 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07BEW3Pf138437; Tue, 11 Aug 2020 10:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+9ytfHHMAvtm/Y7t1czG0ueL/U8qEVqDD9YorHRhwAg=;
 b=qG4zxCMs3moribRVAgwfsVceOQgzOpRMMl+ibgLyKrIt8iBgahBLzozogmF+lDqYf9Qz
 r5AW9tPdG/8OB6T8h3q2w3Kbr0kcovwgOT2ef6Sv63e+4ZN6RmEh7WD+AKWstMvGajIH
 UsoBTVyVCAUtSt7W2G2IqK+A8VJuNm95mtxF7y8NuIDolunCwKzL4LWKB6mDVjreF8TW
 I0guYZ/sS3S8qC/xG2aYLLbHMTlF79EMhTLj0gdmnlWmGCBNLGPO3osEUzV6dAvVYgQ0
 lqDxH1M9jPZO0ndjnWtrj4fW7lBFGIzwzLnDqqzi361V01V9d9fgAERD7YRLN/hhysZO Pg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32usu5eqt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 10:46:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07BEdEe1021968;
 Tue, 11 Aug 2020 14:46:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 32skp98sj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 14:46:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07BEk9W547907244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Aug 2020 14:46:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B9C1124054;
 Tue, 11 Aug 2020 14:46:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C307124052;
 Tue, 11 Aug 2020 14:46:09 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Aug 2020 14:46:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
In-Reply-To: <87r1sd9z0d.fsf@mpe.ellerman.id.au>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au> <87mu37ylzu.fsf@linux.ibm.com>
 <159712434106.7191.15165087672426328577@sif>
 <87r1sd9z0d.fsf@mpe.ellerman.id.au>
Date: Tue, 11 Aug 2020 09:46:08 -0500
Message-ID: <87ft8tz1e7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_13:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008110098
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Michael Roth <mdroth@linux.vnet.ibm.com> writes:
>> Quoting Nathan Lynch (2020-08-07 02:05:09)
> ...
>>> wait_for_cpu_stopped() should be able to accommodate a time-based
>>> warning if necessary, but speaking as a likely recipient of any bug
>>> reports that would arise here, I'm not convinced of the need and I
>>> don't know what a good value would be. It's relatively easy to sample
>>> the stack of a task that's apparently failing to make progress, plus I
>>> probably would use 'perf probe' or similar to report the inputs and
>>> outputs for the RTAS call.
>>
>> I think if we make the timeout sufficiently high like 2 minutes or so
>> it wouldn't hurt and if we did seem them it would probably point to an
>> actual bug. But I don't have a strong feeling either way.
>
> I think we should print a warning after 2 minutes.
>
> It's true that there are fairly easy mechanisms to work out where the
> thread is stuck, but customers are unlikely to use them. They're just
> going to report that it's stuck with no further info, and probably
> reboot the machine before we get a chance to get any further info.
>
> Whereas if the kernel prints a warning with a stack trace we at least
> have that to go on in an initial bug report.
>
>>> I'm happy to make this a proper submission after I can clean it up and
>>> retest it, or Michael R. is welcome to appropriate it, assuming it's
>>> acceptable.
>>> 
>>
>> I've given it a shot with this patch and it seems to be holding up in
>> testing. If we don't think the ~2 minutes warning message is needed I
>> can clean it up to post:
>>
>> https://github.com/mdroth/linux/commit/354b8c97bf0dc1146e36aa72273f5b33fe90d09e
>>
>> I'd likely break the refactoring patches out to a separate patch under
>> Nathan's name since it fixes a separate bug potentially.
>
> While I like Nathan's refactoring, we probably want to do the minimal
> fix first to ease backporting.
>
> Then do the refactoring on top of that.

Fair enough, thanks.
