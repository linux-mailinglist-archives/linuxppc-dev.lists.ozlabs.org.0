Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AC45C0F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzhGR3Vfdz304V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:11:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JNAX6QEB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JNAX6QEB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzhFj0Pbnz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:10:32 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AOBm0jq004725; 
 Wed, 24 Nov 2021 13:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=BdiExVAdatLHkjItbjJaPTR1gsgrwTgcXvTxI9FIeVw=;
 b=JNAX6QEBZT7OWffOxFgyqMErIsK+wjCURw01kDnntdIX6lUTplC3/+60pMdODRLBLD4n
 dU6RORYMM1YneOEpEYG/V20rznSJnEiZzvKAjtzJWEtUyOBP/Pm3r5jA/IcK6aAgBNNL
 Mw5raUTgitan3XVTV3g8cMBb6CvNt2ajXU6++iiOu2sIko0zgM4eYoZ6t0NfXWFTJvrL
 kp2C2EuT3+Y/UZupnF3zLNWkCuOWlXI7kNu6qbHnWH/ZiGmLkXckgYYDd+j3hzxQINwx
 ++GZGxZSBPlskPwiyAEbSQl66x+YbF9ihFskzpbXLMpN+gLqmmQ9LS/NZBRSdsdgPEG5 gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3chmu19q55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 13:10:23 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AOCxf1G003362;
 Wed, 24 Nov 2021 13:10:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3chmu19q4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 13:10:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AOD8dOD024202;
 Wed, 24 Nov 2021 13:10:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3cern9rhxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 13:10:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AODAErK18219516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 13:10:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25FA5A405B;
 Wed, 24 Nov 2021 13:10:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4B75A4054;
 Wed, 24 Nov 2021 13:10:10 +0000 (GMT)
Received: from sig-9-65-87-230.ibm.com (unknown [9.65.87.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Nov 2021 13:10:10 +0000 (GMT)
Message-ID: <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
From: Mimi Zohar <zohar@linux.ibm.com>
To: Philipp Rudo <prudo@redhat.com>
Date: Wed, 24 Nov 2021 08:10:10 -0500
In-Reply-To: <20211124120950.57c10a9f@rhtmp>
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
 <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
 <20211124120950.57c10a9f@rhtmp>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W1hmjShiQJ4RGVtO1-gItT9P1q_sYdp7
X-Proofpoint-ORIG-GUID: DsbinSytcni9CLx-5b8acxCYrTickBxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=862
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240073
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
 Nayna <nayna@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 buendgen@de.ibm.com, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote:
> Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely on all
> architectures using the same mechanism and thus reduce maintenance cost.
> On the way there he even makes some absolutely reasonable improvements
> for everybody.
> 
> Why is that so controversial? What is the real problem that should be
> discussed here?

Nothing is controversial with what Michal wants to do.  I've already
said, "As for adding KEXEC_SIG appended signature support on PowerPC
based on the s390 code, it sounds reasonable."

thanks,

Mimi

