Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B573798B95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 19:49:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T21hhDVq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj3Xj2NS3z3cHc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 03:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T21hhDVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj3Wn4bzyz3c28
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 03:49:09 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388HgJpH025233;
	Fri, 8 Sep 2023 17:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=NqVDnPEb9BBDfHTA/G+QTrU2XtPf8U+UzqqbikN08hE=;
 b=T21hhDVqzzto30b7vhn3Z+rQeI/c/f7V+eB+KTR9pibvbpr0dVqo1J0o4uxoO3SUdv0h
 RS8lBGumMGRd8yJQNytlDbMn3V1ByzxdJA7hz+4zAZqvZpt1yRZ2o5JLl+uSN2GCryK+
 OzoDMcUQq1PrnXwDniqR/YGQGbWCkwEIdlZJ3xqpZ+HfxWTzWWcUCtkEFWxIVxk5i6G7
 no9tRFyx/Ra5nIf/HPTqN/yLYO9v/P3n++Iyx05XjYq5l+43KAD1K7zbj7IGrzgzMVqM
 vn+95OcHz/fWGf7Q/0+J2lqXiay05cKjeBRR6PCFoj4pDLfrm2Wr2KjS7kZmhTXxUEYo ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t088ar595-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 17:49:01 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388HgeYd027445;
	Fri, 8 Sep 2023 17:49:00 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t088ar589-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 17:49:00 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388FsJaE026750;
	Fri, 8 Sep 2023 17:48:59 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgcp5k9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 17:48:59 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388HmwMB4391612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 17:48:58 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCAA758063;
	Fri,  8 Sep 2023 17:48:57 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9A1F58053;
	Fri,  8 Sep 2023 17:48:57 +0000 (GMT)
Received: from localhost (unknown [9.61.104.229])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 17:48:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
In-Reply-To: <20230907171907.GC8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230906120855.28331-1-msuchanek@suse.de>
 <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230907160134.GZ8826@kitsune.suse.cz>
 <878r9ivsbn.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230907171907.GC8826@kitsune.suse.cz>
Date: Fri, 08 Sep 2023 12:48:57 -0500
Message-ID: <875y4kwo6u.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yKxoe6Izy7vtLu8FLimWh6uWi3LnyTS5
X-Proofpoint-ORIG-GUID: F82kr152tz_j57BnonTgTPLgQxKpYMjj
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxlogscore=693
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080160
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> > There are about 3 known use cases that absolutely need access by other
>> > means than sys_rtas to work with lockdown, and about other 3 that would
>> > work either way.
>> 
>> How do you figure that? I count 11 librtas APIs that use work areas (and
>> therefore /dev/mem) that are definitely broken under lockdown. Maybe a
>> couple of them are unused.
>
> I am referring to this list of known uses:
>
> https://github.com/ibm-power-utilities/librtas/issues/29
>
> rtas_get_vpd is used by lsvpd (through libvpd and librtas)
> rtas_platform_dump and rtas_get_indices is used by ppc64-diag
> rtas_cfg_connector is used by powerpc-utils and is planned to be
> replaced by in-kernel solution
>
> That covers the complex cases.
>
> rtas_set_sysparm is used by ppc64-diag and powerpc-utils
> rtas_set_dynamic_indicator, rtas_get_dynamic_sensor are used by
> ppc64-diag (related to rtas_get_indices)
> rtas_errinjct + open/close are used by powerpc-utils
>
> That's the simple cases.

None of these would work "either way" with lockdown. They all use work
area buffer arguments and must move away from sys_rtas and /dev/mem. The
librtas issue you refer to makes that clear.


>> > That's not so staggering that it could not be implemented in the kernel
>> > from the start.
>> > How long it will take for the known userspace users to catch up is
>> > anotehr questio but again it's something that can be addressed.
>> >
>> > Making it possible to turn off sys_rtas will make it easier to uncover
>> > the not yet known cases.
>> 
>> This is also true of making the configuration more granular than on or
>> off. You would be free to disallow all calls if desired.
>> 
>> > What people want to support depends a lot on what is converted, and also
>> > the situation of the distribution in question. Fast-rollong
>> > distributions may want only the new interface quite soon, and so may
>> > distributions that are starting development of new release.
>> >
>> > All this makes sense only if there is a plan to discontinue sys_rtas
>> > entirely. For the simple calls that don't need data buffers it's still
>> > usable.
>> 
>> I don't understand. How would it remain usable for the simple calls if
>> it can be completely disabled?
>
> Either the goal is to completely remove sys_rtas, and then an option for
> disabling it is helpful for uncovering unexpected problems. Or thre
> isn't a goal of sys_rtas removal, and then there is no point in having
> an option to disable it, and it can be used for calls that don't need
> buffers indefinitely.

I don't agree that those are the only two options, but removal of
sys_rtas is not going to be a goal of this series. The goal is to
provide alternative ABIs that are compatible with lockdown.
