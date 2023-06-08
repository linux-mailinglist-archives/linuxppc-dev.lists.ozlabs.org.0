Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B72728736
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 20:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcXnM1w7nz3fBs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 04:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGxOWhKq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGxOWhKq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcXmQ6jRLz3dw1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 04:29:10 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358Hk2HQ001398;
	Thu, 8 Jun 2023 18:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=iVL1UK1s3nj9G//sIoTKdRL7E54mZot0meikSd2hvBM=;
 b=NGxOWhKqy+InLGkSOMN9YzrYTKjiAxvYFuWufDWQ14iYnStYAUc3QPNUm8NOLjQ7H2ty
 g8T7IQUSyxsffjmGKP53k87fyRwAXaiSyWWZ3yJmDrHwO6y+AW/s7z6GRIXSyWp4F587
 JKOZd4feKWcK48mEh0pN7Cb62JrTj0ta1RYLjdvhGSiRAseDSEbXsjAo6qdpR7uqkvTW
 4gjLOaqnOIlHFPIIwSEjf2A4dcEXm13UZphtP8h47W9SzJLiztCbSXsG++FwHQs6TpIh
 6qLAE3vpBW6uU1RLwOxlH+LkybuhEkW+PlAKXh867lQy6FwEVawvIKkVH31mFJXvISRg ug== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3jtm33v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 18:28:53 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 358GrY0e008967;
	Thu, 8 Jun 2023 18:28:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r2a77fe87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 18:28:52 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358ISpgi34407158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Jun 2023 18:28:51 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C54F5805A;
	Thu,  8 Jun 2023 18:28:51 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C23E158052;
	Thu,  8 Jun 2023 18:28:50 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.61.30])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 Jun 2023 18:28:50 +0000 (GMT)
Message-ID: <afc0ff6d83ea72f94b8f9e95476fa987d8ff8f17.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 RESEND 0/3] sed-opal: keyrings, discovery, revert,
 key store
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Date: Thu, 08 Jun 2023 13:28:50 -0500
In-Reply-To: <e340332d-ef64-9fa9-b4d6-927a3c271730@kernel.dk>
References: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
	 <e340332d-ef64-9fa9-b4d6-927a3c271730@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LB_5UiyCs25L4UNrVlww0UIoK32-SzWK
X-Proofpoint-ORIG-GUID: LB_5UiyCs25L4UNrVlww0UIoK32-SzWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_13,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=925 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080159
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-06-05 at 15:14 -0600, Jens Axboe wrote:
> On 6/1/23 4:37PM, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > This patchset has gone through numerous rounds of review and
> > all comments/suggetions have been addressed. I believe that
> > this patchset is ready for inclusion.
> > 
> > TCG SED Opal is a specification from The Trusted Computing Group
> > that allows self encrypting storage devices (SED) to be locked at
> > power on and require an authentication key to unlock the drive.
> > 
> > The current SED Opal implementation in the block driver
> > requires that authentication keys be provided in an ioctl
> > so that they can be presented to the underlying SED
> > capable drive. Currently, the key is typically entered by
> > a user with an application like sedutil or sedcli. While
> > this process works, it does not lend itself to automation
> > like unlock by a udev rule.
> > 
> > The SED block driver has been extended so it can alternatively
> > obtain a key from a sed-opal kernel keyring. The SED ioctls
> > will indicate the source of the key, either directly in the
> > ioctl data or from the keyring.
> > 
> > Two new SED ioctls have also been added. These are:
> >   1) IOC_OPAL_REVERT_LSP to revert LSP state
> >   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> > 
> > change log v4:
> >         - rebase to 6.3-rc7
> > 	- replaced "255" magic number with U8_MAX
> 
> None of this applies for for-6.5/block, and I'm a little puzzled
> as to why you'd rebase to an old kernel rather than a 6.4-rc at
> least?
> 
> Please resend one that is current.

Rebase to for-6.5/block coming shortly.


