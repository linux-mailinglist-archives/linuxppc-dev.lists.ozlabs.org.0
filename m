Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92045763C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 19:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwlJ24h9gz3c8p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 05:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XB2Q09tq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XB2Q09tq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwlHD10Zwz2xsS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 05:16:39 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJHmSHL013479; 
 Fri, 19 Nov 2021 18:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=trw3FmzT3Fsd1BqtNUtuEJTUHC/BqJdeM0IUp0uvMdU=;
 b=XB2Q09tqPqZo1XZosVd2jrMPK+FqJsGiDHvojWJPNFTOB7UWUYfjVzCelbTxM7y21JHx
 nfp9uFZoQLbGlVYKGWVm3ZdKAnJnhuRRAQxUhiJGqbddPxfezuWGmSl3EbEdZTfvUR1a
 QtNV/4+d09FGJ4GRfWLiW3g/VwVdNQtuVCW4tB3EE+I8aegd6QeQGR2iCghfx/Tes7Gu
 OG86dGsexYsbXlJlIm29ekw7ztc86dMlWkBwr+9419Xf8I0KDWhvgXPbyDKXUfIDawT9
 PUS3AjHeUSCLPTYrd3ozm5EI3epnnoXIAityVwzDkmmJElJW2vV6acYbRwErVPRsQQnd YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cegnaghej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 18:16:31 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJIFXUw000309;
 Fri, 19 Nov 2021 18:16:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cegnaghdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 18:16:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJI67Dj014078;
 Fri, 19 Nov 2021 18:16:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ca50b3en3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 18:16:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJIGNIf32506144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 18:16:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84A0A11C050;
 Fri, 19 Nov 2021 18:16:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354F311C054;
 Fri, 19 Nov 2021 18:16:21 +0000 (GMT)
Received: from sig-9-65-86-194.ibm.com (unknown [9.65.86.194])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 18:16:21 +0000 (GMT)
Message-ID: <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Nayna
 <nayna@linux.vnet.ibm.com>
Date: Fri, 19 Nov 2021 13:16:20 -0500
In-Reply-To: <20211119111823.GC34414@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
 <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
 <20211119111823.GC34414@kunlun.suse.cz>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ud_BxINaktJxwpgZ0mp85T7m5PSxQJAV
X-Proofpoint-GUID: _yxv3h6mYki0om6N6_HArTYQLcjn3315
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_14,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190098
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 buendgen@de.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2021-11-19 at 12:18 +0100, Michal Suchánek wrote:
> Maybe I was not clear enough. If you happen to focus on an architecture
> that supports IMA fully it's great.
> 
> My point of view is maintaining multiple architectures. Both end users
> and people conecerend with security are rarely familiar with
> architecture specifics. Portability of documentation and debugging
> instructions across architectures is a concern.
> 
> IMA has large number of options with varying availablitily across
> architectures for no apparent reason. The situation is complex and hard
> to grasp.

IMA measures, verifies, and audits the integrity of files based on a
system wide policy.  The known "good" integrity value may be stored in
the security.ima xattr or more recently as an appended signature.

With both IMA kexec appraise and measurement policy rules, not only is
the kernel image signature verified and the file hash included in the
IMA measurement list, but the signature used to verify the integrity of
the kexec kernel image is also included in the IMA measurement list
(ima_template=ima-sig).

Even without PECOFF support in IMA, IMA kexec measurement policy rules
can be defined to supplement the KEXEC_SIG signature verfication.

> 
> In comparison the *_SIG options are widely available. The missing
> support for KEXEC_SIG on POWER is trivial to add by cut&paste from s390.
> With that all the documentation that exists already is also trivially
> applicable to POWER. Any additional code cleanup is a bonus but not
> really needed to enable the kexec lockdown on POWER.

Before lockdown was upstreamed, Matthew made sure that IMA signature
verification could co-exist.   Refer to commit 29d3c1c8dfe7 ("kexec:
Allow kexec_file() with appropriate IMA policy when locked down").   If
there is a problem with the downstream kexec lockdown patches, they
should be fixed.

The kexec kselftest might provide some insight into how the different
signature verification methods and lockdown co-exist.

As for adding KEXEC_SIG appended signature support on PowerPC based on
the s390 code, it sounds reasonable.

thanks,

Mimi

