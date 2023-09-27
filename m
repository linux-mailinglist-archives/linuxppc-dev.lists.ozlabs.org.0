Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8407B0A16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 18:27:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGqdH9z9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwhpW3QYjz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 02:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGqdH9z9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwhnf47LDz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 02:26:29 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RG9R0U029999;
	Wed, 27 Sep 2023 16:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=lll8jEsZ/2uOvCtv+bjAVqxB3opWrfKxHma7QbwBcUg=;
 b=jGqdH9z9AeaDjz9jBSX1RyguHypUs75AWDFYu3Ps0TovxzIy9edK3KlBOzYfM0vHbvqu
 KkwSH8o/M4mv1m/leVuelZbwapVWTSCyUfH3631/NJFipmf9x936ejHC9CzJXD6qiktC
 jy/ozWv9Z5N/MmGvDJx0l2ouqhmEV7GNU4kcGAtu09vXXXoLy5RSBam7WMvvItNXJXi6
 G1Fxs1ylzjFzLqijnZ5vibbW5z30ULkjGlI073q74kDUjjL1UyXFQy+DNFd+Z3f09jxV
 8nyMXYaqYHkSwzotmnwsYaE9yIpwmuRLgFveINqTBc9MV2Bnsusacm2WB4Pwjh967cxG ag== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnh8vph3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 16:26:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38RF94cQ008456;
	Wed, 27 Sep 2023 16:26:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3taabsw8m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 16:26:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38RGQJmG53281028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 16:26:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A2365805F;
	Wed, 27 Sep 2023 16:26:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09F9D5805E;
	Wed, 27 Sep 2023 16:26:19 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.94.59])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Sep 2023 16:26:18 +0000 (GMT)
Message-ID: <2d9b580c1507aea010f2a4ab293b8d2e5529f5ad.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>
Date: Wed, 27 Sep 2023 11:26:18 -0500
In-Reply-To: <def46b96-b881-4806-bd0c-ca0b0462e72e@kernel.dk>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
	 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
	 <20230913185951.GA3643621@dev-arch.thelio-3990X>
	 <def46b96-b881-4806-bd0c-ca0b0462e72e@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 97BG5Te-AldZuCLITosbftCroGKdeiyY
X-Proofpoint-ORIG-GUID: 97BG5Te-AldZuCLITosbftCroGKdeiyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_10,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=724 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270136
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
Cc: nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-09-13 at 13:15 -0600, Jens Axboe wrote:
> On 9/13/23 12:59 PM, Nathan Chancellor wrote:
> > Hi Greg,
> > 
> > On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com
> >  wrote:
> > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > 
> > > Define operations for SED Opal to read/write keys
> > > from POWER LPAR Platform KeyStore(PLPKS). This allows
> > > non-volatile storage of SED Opal keys.
> > > 
> > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > 
> > After this change in -next as commit 9f2c7411ada9
> > ("powerpc/pseries:
> > PLPKS SED Opal keystore support"), I see the following crash when
> > booting some distribution configurations, such as OpenSUSE's [1]
> > (the
> > rootfs is available at [2] if necessary):
> 
> I'll drop the series for now - I didn't push out the main branch just
> yet as I don't publish the block next tree until at least at -rc2
> time,
> so it's just in a private branch for now.
> 

Agreed. I need to figure out:

1) best place to use plpks_is_available() to prevent a crash when PLPKS
is not present in pseries.

2) Resolve issues compiling with clang

3) declare plpks_init_var() as static

Greg

