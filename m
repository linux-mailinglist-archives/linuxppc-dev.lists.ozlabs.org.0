Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE64B3CA8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 18:51:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxZfy3Ljbz3bVd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:51:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CYAeo3so;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CYAeo3so; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxZfD2pm7z2x9D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 04:51:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21DEvUKg032201; 
 Sun, 13 Feb 2022 17:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ljGnu5uOYQaHl1nPo2n2pEFc0He+WiMjy0EB3bb4xVY=;
 b=CYAeo3soE6RuStkIaHmKMpNiai5cihSKV2bk3EVB+NYbRnDfew2ymWWXc204VTaFIHP5
 kofuTuaqbxmTTFucnK/su1TFMXWXkxERF6JcpmBCsm5d+76cVn7ZjuNM+zwYJ7XXq67E
 GnPERhytl/LMYAJLK6L37O4rXgKGWCcNca70huxJxH8BVyVmoEoURN4z0RH+wpEKXNSM
 syZTBzKMgA9JV1R/hmN5KV+KuOVSv1WQI0+mHivArh1+7cwsfMaLC5AfV74RWltOyEQH
 kyTHhsEm24UMi59Q9uXSLnm47Gp2gEwdJNt6v2vu3tcSUKYmvrciW/IXzlLbAPk92fUN zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7475t1x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 17:50:45 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21DHoi2i029058;
 Sun, 13 Feb 2022 17:50:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7475t1wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 17:50:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21DHlebI015751;
 Sun, 13 Feb 2022 17:50:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3e64h9et2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 17:50:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21DHoaW147317488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Feb 2022 17:50:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D00B4C04E;
 Sun, 13 Feb 2022 17:50:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D52074C044;
 Sun, 13 Feb 2022 17:50:31 +0000 (GMT)
Received: from sig-9-65-82-84.ibm.com (unknown [9.65.82.84])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 13 Feb 2022 17:50:31 +0000 (GMT)
Message-ID: <b49cb41873655f4fc1269faab5729111d55ce9da.camel@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Date: Sun, 13 Feb 2022 12:50:31 -0500
In-Reply-To: <20220209120154.GC3113@kunlun.suse.cz>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
 <b56fe3a2-b145-9d4e-acf2-4991204b3102@molgen.mpg.de>
 <20220209120154.GC3113@kunlun.suse.cz>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fz9cM9T58h_IIyXjwjjaFhI_FECO2xCo
X-Proofpoint-ORIG-GUID: Pc1fQeK8JagJOLRcr98_--QyPz-FtBn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-13_07,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202130120
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-crypto@vger.kernel.org,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Wed, 2022-02-09 at 13:01 +0100, Michal Suchánek wrote:
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index dea74d7717c0..1cde9b6c5987 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -560,6 +560,22 @@ config KEXEC_FILE
> > >   config ARCH_HAS_KEXEC_PURGATORY
> > >     def_bool KEXEC_FILE
> > > +config KEXEC_SIG
> > > +   bool "Verify kernel signature during kexec_file_load() syscall"
> > > +   depends on KEXEC_FILE && MODULE_SIG_FORMAT
> > > +   help
> > > +     This option makes kernel signature verification mandatory for
> > > +     the kexec_file_load() syscall.
> > > +
> > > +     In addition to that option, you need to enable signature
> > > +     verification for the corresponding kernel image type being
> > > +     loaded in order for this to work.
> > > +
> > > +     Note: on powerpc IMA_ARCH_POLICY also implements kexec'ed kernel
> > > +     verification. In addition IMA adds kernel hashes to the measurement
> > > +     list, extends IMA PCR in the TPM, and implements kernel image
> > > +     blacklist by hash.
> > 
> > So, what is the takeaway for the user? IMA_ARCH_POLICY is preferred? What is
> > the disadvantage, and two implementations(?) needed then? More overhead?
> 
> IMA_KEXEC does more than KEXEC_SIG. The overhead is probably not big
> unless you are trying to really minimize the kernel code size.
> 
> Arguably the simpler implementation hass less potential for bugs, too.
> Both in code and in user configuration required to enable the feature.
> 
> Interestingly IMA_ARCH_POLICY depends on KEXEC_SIG rather than
> IMA_KEXEC. Just mind-boggling.

FYI, a soft boot doesn't clear the TPM PCRs.  To be able to verify the
IMA measurement list after a kexec against a TPM quote, requires
carrying the measurement list across kexec.

The "IMA_KEXEC" config enables carrying the IMA measurement list across
kexec.  It has nothing to do with verifying the appended signature. 
That is based on kernel module appended signature code.

> 
> The main problem with IMA_KEXEC from my point of view is it is not portable.
> To record the measurements TPM support is requireed which is not available on
> all platforms.

Measuring the kexec kernel image and extending the TPM with the
measurement is required for trusted boot.  Boot loaders extend the
TPM's BIOS measurements. Similarly, IMA does not require a TPM, but if
one is available the kexec kernel image measurement is extended into
the IMA measurement list.  Otherwise, IMA goes into "TPM by-pass" mode.

> It does not support PE so it cannot be used on platforms
> that use PE kernel signature format.

True.  However, a kernel image with an appended signature may be
kexec'ed, regardless of the architecture.  Because some boot loaders
don't support appended signatures, from my point of view does not make
IMA kexec support not portable.

-- 
thanks,

Mimi

