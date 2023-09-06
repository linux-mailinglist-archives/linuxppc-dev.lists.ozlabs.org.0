Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 483ED7943DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 21:37:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhTktRSR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rgt251ZpYz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 05:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhTktRSR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rgt192Jzgz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 05:37:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386JVAro026950;
	Wed, 6 Sep 2023 19:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SyTl1cd9RQwc4FXY8pI1fm82ZbIREqf6gvte7gI/zHw=;
 b=AhTktRSRQwjcSAC4wUtknlhCDnTfkGz9m/qJ8QeAIy9z3/GC5aPj1QNJsgJ8C69GXG3w
 Zl31L+KY9EFFQBpMO76j8IPs+pJ5JESjc5bps6furj+RuJU4MW9ulkEvzMqPlgdzsqG8
 wZP5sESAVg6TCz31HPMBopLr5QLMTXlQuNqt0g596Wl8Hobq0AZJ1jlZVrzmse7Fi5w1
 fKxVcXKLmEeEGe9nr9cVGXZyd5DFtYssbVe4WbxGkKAwrjHneERGKpWsiYM4cnP9ehv8
 VuZzfmJ5OsKfgqtlJZfy+Io7bYsDWOuVwdzeDISPAmi89rYF2KVjRs4X9PT7GR7RnxJI og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxynegfg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 19:36:52 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 386JV9rL026796;
	Wed, 6 Sep 2023 19:35:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxynegefv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 19:35:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 386INL5u012217;
	Wed, 6 Sep 2023 19:35:00 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkk5kp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 19:35:00 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 386JYxAC3277474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Sep 2023 19:34:59 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B20CD58055;
	Wed,  6 Sep 2023 19:34:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D0FC58043;
	Wed,  6 Sep 2023 19:34:59 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Sep 2023 19:34:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
In-Reply-To: <20230906120855.28331-1-msuchanek@suse.de>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230906120855.28331-1-msuchanek@suse.de>
Date: Wed, 06 Sep 2023 14:34:59 -0500
Message-ID: <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XOY8608rJQUMqCbedJamGJU80drX8Qq6
X-Proofpoint-ORIG-GUID: kt5PCspyRM1M4KJrQPU0SMTRQOhtsoJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=584 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060169
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek <msuchanek@suse.de> writes:

> Additional patch suggestion to go with the rtas devices:
>
> -----------------------------------------------------------------------
>
> With most important rtas functions available through different
> interfaces the sys_rtas interface can be disabled completely.
>
> Do not remove it for now to make it possible to run older versions of
> userspace tools that don't support other interfaces.

Thanks. I hope making sys_rtas on/off-configurable will make sense
eventually, and I expect this series to get us closer to that. But to me
it seems too early and too coarse. A kernel built with RTAS_SYSCALL=n is
not something I'd want to support or run in production soon. It would
break too many known use cases, and likely some unknown ones as well.

It could be more useful in the near term to construct a configurable
list of RTAS functions that sys_rtas is allowed to expose.

Something like:

if PPC_RTAS

config RTAS_SYSCALL_ALLOWS_SET_INDICATOR
	bool "sys_rtas allows calling set-indicator"
        default y

config RTAS_SYSCALL_ALLOWS_GET_SENSOR_STATE
	bool "sys_rtas allows calling get-sensor-state"
        default y

config RTAS_SYSCALL_ALLOWS_GET_VPD
	bool "sys_rtas allows calling ibm,get-vpd"
        default y

... etc etc

endif

Distro kernels could configure their allowed set of calls according to
the capabilities of the user space components they ship, with the
expectation that they will be able to shrink that set as user space
adopts the preferred ABIs over time.

That's just a sketch of an idea though, and I'm not sure it needs to be
part of this series.
