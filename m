Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B335E8698
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 02:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ8b32g9nz3dqD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 10:11:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gKqygJXg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gKqygJXg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZ8ZH6wdKz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 10:11:19 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NNcROg024480;
	Sat, 24 Sep 2022 00:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=lhkjEb4dNQUosSgYES4yvJmzNx23JbI/J0Z0KsbHw7w=;
 b=gKqygJXg/Exbgi1azQ8aFHBb4E/Y79ihWLVdUbasDeinFwMBaYWOU0JBZsvIOpaIgDwN
 lusHtnQVIx0F40ljDQ8tNneS479yJUxFbkiIkHMVuWegbpxh4wWCqbaIY9gvREuOkye7
 +vOTySKBxWvB9LW3+DXRosP1xZG+OADgURNaGJ9ECOilgh2kSPgE+scuRe/5ooesuYW+
 LL02PPAVtejx8gSLrLjkjEKEZicLG4Swfoq/h1h2AZwIUlmmbGLe/V6+MJk576dG+PJj
 1Y7qdqVnsiqpRnA/0NufBaJJJJqq86KritpKa3rVTv8nHNVkOSAOiEX256kGx4lP/lO2 Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jsjtsnxh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Sep 2022 00:11:11 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28O05mTX001454;
	Sat, 24 Sep 2022 00:11:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jsjtsnxgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Sep 2022 00:11:10 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28O06TDV016205;
	Sat, 24 Sep 2022 00:11:09 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03wdc.us.ibm.com with ESMTP id 3jn5va30hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Sep 2022 00:11:09 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28O0B76844368380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Sep 2022 00:11:07 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA4F558062;
	Sat, 24 Sep 2022 00:11:06 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DFE358061;
	Sat, 24 Sep 2022 00:11:06 +0000 (GMT)
Received: from localhost (unknown [9.211.104.104])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Sep 2022 00:11:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Move vas_migration_handler early
 during migration
In-Reply-To: <2ffe42ed1188ce2f37b110ffc381d61099b99151.camel@linux.ibm.com>
References: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
 <87czbnr4fy.fsf@linux.ibm.com>
 <2ffe42ed1188ce2f37b110ffc381d61099b99151.camel@linux.ibm.com>
Date: Fri, 23 Sep 2022 19:11:06 -0500
Message-ID: <8735chr5r9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HIm73EZfgpYnLVvqvmmLoxPawRjvEwTx
X-Proofpoint-GUID: sDy7L3HFl9_yMx3ZFlRIHgjuaEqqSGtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_10,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=757 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230155
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> On Thu, 2022-09-22 at 07:14 -0500, Nathan Lynch wrote:
>> Haren Myneni <haren@linux.ibm.com> writes:
>> > When the migration is initiated, the hypervisor changes VAS
>> > mappings as part of pre-migration event. Then the OS gets the
>> > migration event which closes all VAS windows before the migration
>> > starts. NX generates continuous faults until windows are closed
>> > and the user space can not differentiate these NX faults coming
>> > from the actual migration. So to reduce this time window, close
>> > VAS windows first in pseries_migrate_partition().
>> 
>> I'm concerned that this is only narrowing a window of time where
>> undesirable faults occur, and that it may not be sufficient for all
>> configurations. Migrations can be in progress for minutes or hours,
>> while the time that we wait for the VASI state transition is usually
>> seconds or minutes. So I worry that this works around a problem in
>> limited cases but doesn't cover them all.
>> 
>> Maybe I don't understand the problem well enough. How does user space
>> respond to the NX faults?
>
> The user space resend the request to NX whenever the request is
> returned with NX fault. So the process should be same even for faults
> caused by the pre-migration.
>
> Whereas the paste will be returned with failure when the window is
> closed (unmap the paste address) and it can be considered as NX busy.
> Up to the user space whether to send the request again after some delay
> or fall back to SW compression and send the request again later.
>
> For the migration, pre-migration event is notified to the hypervisor
> and then OS will receive the migration event (SUSPEND) - So this patch
> close windows early before VASI so that removing NX fault handling
> during the time taken for VASI state transistion.

OK, so we can consider this a quality of implementation improvement that
allows better behavior and less wasted retries for NX clients in a
migration scenario, but there's not a correctness issue, really. With
that clarified, I've confirmed that the slightly altered control flow
and error handling in pseries_migrate_partition() look correct after
your change.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
