Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155225E75E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 10:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYlsX6Xy4z3cCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 18:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m/fZE1TN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m/fZE1TN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYlrm4zvqz3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 18:37:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N7J1iJ030549;
	Fri, 23 Sep 2022 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=eZeb+SjIPVSolz4qOPfNjRK0rakhm5sN1Z+2WFdzg/k=;
 b=m/fZE1TNrZxhocFQM5bWaNml2tE4IVjujBWYWaSijDFllRGskQol3GLOibbhBWodTE9J
 DFfEW9NT10c+6YS7/zMS8FPDZVK4X40HDj8+gO3XjKI6McuUN+GgBQd3ndcyFvg8+NC1
 dwnUnq6l7rJta0yR+9Vq2XfdkA71bV5qKr5iBTeCLjkM+PG/p08x1rtQAWXIfFXu81Ol
 F6aVcpNWEP6Zr3msg0FMKLheq+nUUUzc3/v5RNajsSms2763+1ywoVJV7dklWVEC2v3A
 CFYUg4mdX9Cf+z308HWf/v/Dz8gik5WlDv/fsXfk7pjDGb10V+ZNNOM1/a3EAWxZ3wbL kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3js66mncm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 08:37:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28N6SfFd025169;
	Fri, 23 Sep 2022 08:37:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3js66mncks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 08:37:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28N8aGxW016419;
	Fri, 23 Sep 2022 08:37:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04dal.us.ibm.com with ESMTP id 3jn5vafw62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 08:37:20 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28N8bJm57996014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 08:37:20 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F117058052;
	Fri, 23 Sep 2022 08:37:17 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBB5658056;
	Fri, 23 Sep 2022 08:37:16 +0000 (GMT)
Received: from sig-9-77-146-251.ibm.com (unknown [9.77.146.251])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Sep 2022 08:37:16 +0000 (GMT)
Message-ID: <2ffe42ed1188ce2f37b110ffc381d61099b99151.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Move vas_migration_handler early
 during migration
From: Haren Myneni <haren@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Date: Fri, 23 Sep 2022 01:37:06 -0700
In-Reply-To: <87czbnr4fy.fsf@linux.ibm.com>
References: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
	 <87czbnr4fy.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zG7MvoFlsaiR3DEgx8mXH6c2VKZT0LU-
X-Proofpoint-ORIG-GUID: VGC4kpbc1do4dEpJoYevya852EGoup3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=984 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209230054
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-22 at 07:14 -0500, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > When the migration is initiated, the hypervisor changes VAS
> > mappings as part of pre-migration event. Then the OS gets the
> > migration event which closes all VAS windows before the migration
> > starts. NX generates continuous faults until windows are closed
> > and the user space can not differentiate these NX faults coming
> > from the actual migration. So to reduce this time window, close
> > VAS windows first in pseries_migrate_partition().
> 
> I'm concerned that this is only narrowing a window of time where
> undesirable faults occur, and that it may not be sufficient for all
> configurations. Migrations can be in progress for minutes or hours,
> while the time that we wait for the VASI state transition is usually
> seconds or minutes. So I worry that this works around a problem in
> limited cases but doesn't cover them all.
> 
> Maybe I don't understand the problem well enough. How does user space
> respond to the NX faults?

The user space resend the request to NX whenever the request is
returned with NX fault. So the process should be same even for faults
caused by the pre-migration.

Whereas the paste will be returned with failure when the window is
closed (unmap the paste address) and it can be considered as NX busy.
Up to the user space whether to send the request again after some delay
or fall back to SW compression and send the request again later.

For the migration, pre-migration event is notified to the hypervisor
and then OS will receive the migration event (SUSPEND) - So this patch
close windows early before VASI so that removing NX fault handling
during the time taken for VASI state transistion. 

Thanks
Haren

