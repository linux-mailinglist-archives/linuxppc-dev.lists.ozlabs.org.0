Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18EF65CD76
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn0vp1sHgz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 18:04:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LwCtENAZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ojaswin@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LwCtENAZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn0tp1Jxcz2yfg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 18:03:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3045Hm9r024034;
	Wed, 4 Jan 2023 07:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=H1BrDvs6kN3KtbbS1seP+rlW9mCRrL0JMdUsx+3hel4=;
 b=LwCtENAZSI8ffcZVJIoUpVTsQap8gnlXnsxOFwQLrdivPZwyumatik5BewmCGTMCXvGE
 PTeFJikFqp/ezp+F2RywjF+8m6CZJeOBvcI7/aBsdaLTwbQzYezUATNLrv7eQc+GBCrM
 9aGyA5vE9/D/dqGrYPpJZTSgX3rwfPWhpHOezEBEiv2fdfUS13ADWjpkAtUVSk7yrMx1
 lE0aNPNPCdDJGDh5a+cpgsqK49n5UoGTur866WBz3oVHtM2n7WTYkqSoLlqRVZyO/B53
 ihmYdii326S5xUBI/NahffGiM/HKQXPnOd5MKph+N1em3ZBwpl897Y3gDuZUzXZzoK0P yQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvhh516w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:03:24 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3046p93n008371;
	Wed, 4 Jan 2023 07:03:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mtcbfkjr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:03:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30473JAr19464520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 07:03:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E2F520049;
	Wed,  4 Jan 2023 07:03:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFA1220040;
	Wed,  4 Jan 2023 07:03:18 +0000 (GMT)
Received: from li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com (unknown [9.43.102.169])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Jan 2023 07:03:18 +0000 (GMT)
Date: Wed, 4 Jan 2023 12:33:07 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] powerpc: Fix a wrong version calculation issue in
 ld_version
Message-ID: <Y7Ukq/vCnk1q9rjY@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
References: <20230103095740.916038-1-ojaswin__39223.4750370093$1672743051$gmane$org@linux.ibm.com>
 <875ydneirh.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875ydneirh.fsf@igel.home>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kLUW1jCcLietCRZ_twUiiF88c8Y-jwly
X-Proofpoint-GUID: kLUW1jCcLietCRZ_twUiiF88c8Y-jwly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_04,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040054
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 03, 2023 at 04:32:18PM +0100, Andreas Schwab wrote:
> On Jan 03 2023, Ojaswin Mujoo wrote:
> 
> > If version is of the form x.y.z and length(z) == 8, then most probably
> > it is a date [yyyymmdd]. As an approximation, discard the dd and yyyy
> > parts and keep the mm part in the version.
> 
> I don't think any part of the date should be mixed into the computed
> version.  It just means that it's a snapshot from after the 2.37
> release, so it should be treated like 2.37 (no further releases has been
> made from this branch).
> 
I see, in that case I agree that we can strip out the date part and
treat it as x.y.0. 

I'll wait a bit to see if there are any other comments and then send out
a v2.

Thanks,
ojaswin
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
