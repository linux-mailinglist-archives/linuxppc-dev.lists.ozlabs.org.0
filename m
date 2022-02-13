Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64D4B3CFF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 19:54:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxc3527gtz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 05:54:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TehU/bd6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TehU/bd6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxc2L3R8bz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 05:53:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21DERCRA022928; 
 Sun, 13 Feb 2022 18:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=qaAeCPOZUy2ppj9eQ9LciX548NVsceilaYGuwL+jin8=;
 b=TehU/bd6f+foQE4i0zJu2tuVe1smpIp+zKNOoIyCcZ5Y5cHLPkDG0ny3xQd4qApNcak/
 37QNTv1LQCeL2qtf0su+i67T5c9TsuM0g+0u5tfo9wGnndGzNNPSrje8SVhysNA16unW
 49Fvxy9GblokmK9NoU3PTrp11UPUZvUIaJuKXVg1uMfp4F9azP1aJq3vbRyN0haRe/4a
 g9B3Omb0bFRu611bvzjCkxS7OiAQFAWrXc2Eol1JoKcThFyPZblm8fUh1TrK9lBbEWIE
 vFQ3mOfNUWIp/Uqbl6mWdRKnziavEgru9a8Dt845KdDC4pBqzZBtCF58Ly37Hd8eIkWD zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6ycq6krj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 18:53:25 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21DIrOlH024517;
 Sun, 13 Feb 2022 18:53:24 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6ycq6kr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 18:53:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21DIlQCA002034;
 Sun, 13 Feb 2022 18:53:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3e64h9f00g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 18:53:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21DIrHH218874852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Feb 2022 18:53:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262A211C04A;
 Sun, 13 Feb 2022 18:53:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E7D611C04C;
 Sun, 13 Feb 2022 18:53:13 +0000 (GMT)
Received: from sig-9-65-82-84.ibm.com (unknown [9.65.82.84])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 13 Feb 2022 18:53:13 +0000 (GMT)
Message-ID: <0278ab6a2891effd9b1eb8c0221769e332ec6082.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/6] KEXEC_SIG with appended signature
From: Mimi Zohar <zohar@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Sun, 13 Feb 2022 13:53:12 -0500
In-Reply-To: <cover.1641900831.git.msuchanek@suse.de>
References: <cover.1641900831.git.msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C6hLMjRWDkCM-Tl6EZHiGa_ffG0JsPsH
X-Proofpoint-GUID: QRUpvJ3TBHI6yR0Yy9QvEHXIPHskisIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-13_07,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=983 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202130126
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

On Tue, 2022-01-11 at 12:37 +0100, Michal Suchanek wrote:
> Hello,
> 
> This is a refresh of the KEXEC_SIG series.

> This adds KEXEC_SIG support on powerpc and deduplicates the code dealing
> with appended signatures in the kernel.
> 
> powerpc supports IMA_KEXEC but that's an exception rather than the norm.
> On the other hand, KEXEC_SIG is portable across platforms.

This Kconfig carries the IMA measurement list across kexec.  This has
nothing to do with appended signatures.

config IMA_KEXEC
        bool "Enable carrying the IMA measurement list across a soft
boot"
        depends on IMA && TCG_TPM && HAVE_IMA_KEXEC

In addition to powerpc, arm64 sets HAVE_IMA_KEXEC.

Even prior to the kexec appended signature support, like all other
files, the kexec kernel image signature could be stored in
security.ima.

> 
> For distributions to have uniform security features across platforms one
> option should be used on all platforms.

The kexec kernel image measurement will not be included in the BIOS
event log.  Even if the measurement is included in the IMA measurement
list, without the IMA_KEXEC Kconfig the measurement list will not be
carried across kexec.  For those not interested in "trusted boot" or
those who do not need it for compliance, the simplification should be
fine.

-- 
thanks,

Mimi

