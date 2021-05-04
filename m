Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED837328A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 00:45:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZZgK3q4mz30FX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 08:45:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mWI1xu45;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mWI1xu45; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZZfs3NbYz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 08:45:08 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144MXoBa184915; Tue, 4 May 2021 18:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FHS90ZiOBAArdLFFMK4n60ADRW/8VFKEmgGuWDWC860=;
 b=mWI1xu45qBTfkEadkVYPBqyyHFN34NlW9nxUvbtirFr9D/yHbXhVUUrrpGIIp0wntF+o
 ItVw6pYaDExpyEPo0OG7gz7jba2y9Pr0mRafzCWyTHKHwGq+EGixrUxMQ9va7tVpz4Fl
 TAIpfP5x/MnjCGoemEQrwlEAwdYXltQlF6AMf0h8Bl++PQbjKMlRN1WyE0pwB978Ob03
 1XJb4RPkoIy1jxMq2XgOMk12MtHTh5ExiF/JWCLM90BY2hr3jwlWb+mg2nwH3SURDUnU
 snoMt13gKzwqcW4gLYTPStsD1MXuEdRqyIxcDEQi4r8DT4bWjxS/VD5dTC+6eWqX0qd+ 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bearh8k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 18:45:02 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 144MY3f7188075;
 Tue, 4 May 2021 18:45:01 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bearh8jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 18:45:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144MblIh006030;
 Tue, 4 May 2021 22:45:01 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 38bedw894p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 22:45:01 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144Mj03T46137652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 22:45:00 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D9706E04C;
 Tue,  4 May 2021 22:45:00 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EF4F6E04E;
 Tue,  4 May 2021 22:45:00 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 22:44:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix crashes when toggling stf barrier
In-Reply-To: <20210504134250.890401-1-mpe@ellerman.id.au>
References: <20210504134250.890401-1-mpe@ellerman.id.au>
Date: Tue, 04 May 2021 17:44:59 -0500
Message-ID: <878s4uf79w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: byTQLb-KAwMh3ijAfnIwdsl3481CZYQr
X-Proofpoint-GUID: lKMFd__cZHIadN3SHnRtBIVCC5I5A43-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_15:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=851 lowpriorityscore=0
 adultscore=0 clxscore=1011 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040152
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
Cc: linuxppc-dev@lists.ozlabs.org, anton@samba.org, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> -void do_stf_barrier_fixups(enum stf_barrier_type types)
> +static int __do_stf_barrier_fixups(void *data)
>  {
> +	enum stf_barrier_type types = (enum stf_barrier_type)data;
> +
>  	do_stf_entry_barrier_fixups(types);
>  	do_stf_exit_barrier_fixups(types);
> +
> +	return 0;
> +}
> +
> +void do_stf_barrier_fixups(enum stf_barrier_type types)
> +{
> +	/*
> +	 * The call to the fallback entry flush, and the fallback/sync-ori exit
> +	 * flush can not be safely patched in/out while other CPUs are executing
> +	 * them. So call __do_stf_barrier_fixups() on one CPU while all other CPUs
> +	 * spin in the stop machine core with interrupts hard disabled.
> +	 */
> +	stop_machine_cpuslocked(__do_stf_barrier_fixups, (void *)types, NULL);

Would it be preferable to avoid the explicit casts:

	stop_machine_cpuslocked(__do_stf_barrier_fixups, &types, NULL);

...

static int __do_stf_barrier_fixups(void *data)
{
	enum stf_barrier_type *types = data;

 	do_stf_entry_barrier_fixups(*types);
 	do_stf_exit_barrier_fixups(*types);

?

post_mobility_fixup() does cpus_read_unlock() before calling
pseries_setup_security_mitigations(), I think that will need to be
changed?
