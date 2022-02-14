Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A04B5450
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 16:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy7875yV0z3cST
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 02:15:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BznSzzJ2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BznSzzJ2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy77Q67Wlz3bVL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 02:14:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EDFlvj014687; 
 Mon, 14 Feb 2022 15:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=6sD8BzCyjuq8LCfIv1zk1PN9nTd2MaU0XBDJ9HGyBrE=;
 b=BznSzzJ2BasyoZSoItTgynGRNc0feoovW1dlcAt1H+UNPm9Vmck/gEOzste2edBM9caj
 FsGCG0dTYWtQFglw9xhEzmKopcyzSg/E2gTzQtIhnbh7HcB5sjIPAxiBmF8y/H3xfMOH
 GQlYzpm3Aqh+OevXz4dFyMUTwdKdjNjQ444mpCyVspj69FgLKJ4gN1UhL6v00sWvGmC3
 qOi5ziOUV56xfnEaibR9n9fYdPUT7lTqq1OPZwdTti9e24KomFFS8YyKJqmoNC/i/WSc
 9+0aGfX9d2yS5KKotpJNapq+xdODN0lMT00YvX5e3Kdm2piiWqH2vbRwKWZkAiMmji+W Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7920va1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:14:29 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EDvRcQ012345;
 Mon, 14 Feb 2022 15:14:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7920va0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:14:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EFBo1A021822;
 Mon, 14 Feb 2022 15:14:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9pnt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:14:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21EFELvU46072118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:14:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E47F4AE05A;
 Mon, 14 Feb 2022 15:14:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BB13AE051;
 Mon, 14 Feb 2022 15:14:17 +0000 (GMT)
Received: from sig-9-65-94-151.ibm.com (unknown [9.65.94.151])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 15:14:17 +0000 (GMT)
Message-ID: <a8d717a44e5e919676e9b1e197cac781db46da87.camel@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Mon, 14 Feb 2022 10:14:16 -0500
In-Reply-To: <cff97dbe262919ff709a5ad2c4af6a702cc72a95.camel@linux.ibm.com>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
 <cff97dbe262919ff709a5ad2c4af6a702cc72a95.camel@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gO2ZIV3Usw3Tgd2HCrO0mBZWS_cSA-56
X-Proofpoint-ORIG-GUID: NQhKeMr7RyxvD6QE6nKp5GVfB55dEdNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=930 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140093
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Sun, 2022-02-13 at 21:59 -0500, Mimi Zohar wrote:

> 
> On Tue, 2022-01-11 at 12:37 +0100, Michal Suchanek wrote:
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index dea74d7717c0..1cde9b6c5987 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -560,6 +560,22 @@ config KEXEC_FILE
> >  config ARCH_HAS_KEXEC_PURGATORY
> >         def_bool KEXEC_FILE
> >  
> > +config KEXEC_SIG
> > +       bool "Verify kernel signature during kexec_file_load() syscall"
> > +       depends on KEXEC_FILE && MODULE_SIG_FORMAT
> > +       help
> > +         This option makes kernel signature verification mandatory for
> > +         the kexec_file_load() syscall.
> 
> When KEXEC_SIG is enabled on other architectures, IMA does not define a
> kexec 'appraise' policy rule.  Refer to the policy rules in
> security/ima/ima_efi.c.  Similarly the kexec 'appraise' policy rule in
> arch/powerpc/kernel/ima_policy.c should not be defined.

The discussion shouldn't only be about IMA vs. KEXEC_SIG kernel image
signature verification.  Let's try and reframe the problem a bit.

1. Unify and simply the existing kexec signature verification so
verifying the KEXEC kernel image signature works irrespective of
signature type - PE, appended signature.

solution: enable KEXEC_SIG  (This patch set, with the above powerpc IMA
policy changes.)

2. Measure and include the kexec kernel image in a log for attestation,
if desired.

solution: enable IMA_ARCH_POLICY 
- Powerpc: requires trusted boot to be enabled.
- EFI:   requires  secure boot to be enabled.  The IMA efi policy
doesn't differentiate between secure and trusted boot.

3. Carry the kexec kernel image measurement across kexec, if desired
and supported on the architecture.

solution: enable IMA_KEXEC

Comparison: 
- Are there any differences between IMA vs. KEXEC_SIG measuring the
kexec kernel image?

One of the main differences is "what" is included in the measurement
list differs.  In both cases, the 'd-ng' field of the IMA measurement
list template (e.g. ima-ng, ima-sig, ima-modsig) is the full file hash
including the appended signature.  With IMA and the 'ima-modsig'
template, an additional hash without the appended signature is defined,
as well as including the appended signature in the 'sig' field.

Including the file hash and appended signature in the measurement list
allows an attestation server, for example, to verify the appended
signature without having to know the file hash without the signature.

Other differences are already included in the Kconfig KEXEC_SIG "Notes"
section.

-- 
thanks,

Mimi

