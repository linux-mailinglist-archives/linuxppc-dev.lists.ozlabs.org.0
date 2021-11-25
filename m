Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D745D45C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 06:35:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J066449wKz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 16:35:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzhFlUhf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J065G4my8z2xsH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 16:34:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UzhFlUhf; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J065F0JGlz4xcb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 16:34:41 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J065F0Fvbz4xcM; Thu, 25 Nov 2021 16:34:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UzhFlUhf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J065D2Gzbz4xbs;
 Thu, 25 Nov 2021 16:34:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP4IG6i029602; 
 Thu, 25 Nov 2021 05:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=4c6/9XhIIRWaO/jlBK5EyXOD4x8oUVqpzRc+wJTO4mI=;
 b=UzhFlUhf8qHeHh3TAE7WVVM27lSjVx7DydnNNMr6Wj0lHIJRmRqc8Hhk/su+3s4EFAtq
 PS8k6oZQtooCZKbMGL5SoIVdE6x7LBQOYb3iOkOdeGeJYrLz9ycwYT7MOuuBEflYcJG8
 yfUXZiFt7OFVLV9P6gL77DDXExoTyd7gDOxnrXrzqxXAkx1PdAhHnkhzwbRBbvRDlfsr
 Oly6Hsobuh+k2Xu37+Ky2WG0LYQXY2w3C6ODqDyeI1onEebARZ7kpwSmqeNCx2rlT2Vh
 78In0RoRuvVQxzyerrhQxAFARa3dq1qO9VaGGy7ZvUqbbX79VOdXcZuRbZNDWZViYLl1 tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj3b911vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 05:34:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AP5XH9I007574;
 Thu, 25 Nov 2021 05:34:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj3b911vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 05:34:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AP5RODC021701;
 Thu, 25 Nov 2021 05:34:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3cer9k7bwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 05:34:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AP5RF1m36045304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 05:27:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A49534204B;
 Thu, 25 Nov 2021 05:34:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9202B4203F;
 Thu, 25 Nov 2021 05:34:26 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.44.92])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 25 Nov 2021 05:34:26 +0000 (GMT)
Date: Thu, 25 Nov 2021 11:04:23 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
Message-ID: <20211125053402.zyzpl3te5x3ryypx@in.ibm.com>
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
 <875ysiqxbd.fsf@mpe.ellerman.id.au>
 <20211124084539.issrrg2lxq3mp6mj@in.ibm.com>
 <CAOSf1CEv2kwRqctuwn1xkKTH_FmBLGx_FJefhs7FsTOSc72fdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CEv2kwRqctuwn1xkKTH_FmBLGx_FJefhs7FsTOSc72fdQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DIz9KGvYHRH5N1W3Osv0bDUN6bo1bPkh
X-Proofpoint-ORIG-GUID: _NCigeQDWWue8N4UyB-AAeN3ziJOi1st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_03,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250031
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-11-24 22:57:13 Wed, Oliver O'Halloran wrote:
> On Wed, Nov 24, 2021 at 7:45 PM Mahesh J Salgaonkar
> <mahesh@linux.ibm.com> wrote:
> >
> > No it doesn't. We will still do a presence check before the recovery
> > process starts. This patch moves the check after notifying the driver to
> > stop active I/O operations. If a presence check finds the device isn't
> > present, we will skip the EEH recovery. However, on a surprise hotplug,
> > the user will see the EEH messages on the console before it finds there
> > is nothing to recover.
> 
> Suppressing the spurious EEH messages was part of why I added that
> check in the first place. If you want to defer the presence check
> until later you should move the stack trace printing, etc to after
> we've confirmed there are still devices present. Considering the

That will help suppressing the spurious EEH messages.

> motivation for this patch is to avoid spurious warnings from the
> driver I don't think printing spurious EEH messages is much of an
> improvement.

Agree.

> 
> The other option would be returning an error from the pseries hotplug
> driver. IIRC that's what pnv_php / OPAL does if the PHB is fenced and
> we can't check the slot presence state.

Yeah. I can change rpaphp_get_sensor_state() to use
rtas_get_sensor_fast() variant which will return immediately with an
error on extended busy error. That way we don't need to move the slot
presence check at all. I did test that and it does fix the problem. But
I wasn't sure if that would have any implications on hotplug driver
behaviour. If pnv_php / OPAL does the same thing then this would be a
cleaner approach to fix this issue. Let me send out the patch with this
other option to fix the pseries hotplug driver instead.

Thanks,
-Mahesh.

-- 
Mahesh J Salgaonkar
