Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BC7CC720
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 17:10:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hMqkApOT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8y8p230nz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 02:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hMqkApOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8y7t0XfLz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 02:09:45 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HF6KA9014746;
	Tue, 17 Oct 2023 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=CELIBWAtACA44GgHZOwEasXTaMzQaY5OG9TZK1RNwJs=;
 b=hMqkApOTVdZ7ElYS4pcs4xdWB5XB5bY5B0Sq+FRrPTLinVvQg8mFUfYeIp35DWOF7F98
 JVoQE8J7WbHPp2hGjBaObmHYqUHI373cSG+TIB0JtnuSkLGvQSYS3kaSQow/B2jl8o6C
 ANRjJrzYEk7g84BMh4zyiS5YMOZX7Ss/4ylDYYH68bDLdOK2RQNn2pPR5T7JgZ2IRzxX
 t8crfCBk6VpkhUZ4p+Wr+IU4HAIuDDriBbwz9M1D2xAu81vTkvv5qOSwlgNy+Ra7Z+KH
 FDSs7h1PEMN9Pc4Q/pK1R0C1QJnPOLe8e9DHrNqRvp3seOBXrCe4q5/HEvc6fY/ZrAri wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsvba0r5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 15:09:20 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39HF6X0p016382;
	Tue, 17 Oct 2023 15:09:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsvba0r3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 15:09:19 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39HEZYT0020486;
	Tue, 17 Oct 2023 15:09:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6an1nqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 15:09:18 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HF9HPL25756278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 15:09:17 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08F2258053;
	Tue, 17 Oct 2023 15:09:17 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AAEE58043;
	Tue, 17 Oct 2023 15:09:16 +0000 (GMT)
Received: from rhel-laptop.austin.ibm.com (unknown [9.41.250.135])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 15:09:16 +0000 (GMT)
Message-ID: <8fa5c9fdebd07f654c511d80d41a35817bdc3d4d.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 0/3] generic and PowerPC SED Opal keystore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: linux-block@vger.kernel.org, axboe@kernel.dk
Date: Tue, 17 Oct 2023 10:09:15 -0500
In-Reply-To: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
References: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mS2BKGS3T4TCgVFrctUDwG5PqvPCxyA4
X-Proofpoint-GUID: 5T_SDpJU_ppPqAKZnC-xj6MXGkBPW5-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=799 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310170128
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
Cc: nayna@linux.ibm.com, ndesaulniers@google.com, nathan@kernel.org, okozina@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Jens,

I've addressed all the comments/issues on v7 of the patchset and
haven't received any feedback on v8. Is there anything else that you'd
like to see before this can be included?

Thanks,
Greg

On Wed, 2023-10-04 at 15:19 -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. The reviews have
> covered all relevant areas including reviews by block and keyring
> developers as well as the SED Opal maintainer.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> PowerPC/pseries versions of key functions provide read/write access
> to SED Opal keys in the PLPKS keystore.
> 
> The SED block driver has been modified to read the SED Opal
> keystore to populate a key in the SED Opal keyring. Changes to the
> SED Opal key will be written to the SED Opal keystore.
> 
> 
> Changelog
> v8:     - rebased to 6.6-rc4
> 	- fixed issues using clang (thanks Nathan Chancellor and Nick
> 	  Desaulniers)
> 	- fixed crash if PLPKS is not present for pseries (thanks
> Michael
> 	  Ellerman)
> 
> v7:     - rebased to for-6.5/block
> 
> v6:     - squashed two commits (suggested by Andrew Donnellan)
> 
> v5:     - updated to reflect changes in PLPKS API
> 
> v4:
>         - scope reduced to cover just SED Opal keys
>         - base SED Opal keystore is now in SED block driver
>         - removed use of enum to indicate type
>         - refactored common code into common function that read and
>           write use
>         - removed cast to void
>         - added use of SED Opal keystore functions to SED block
> driver
> 
> v3:
>         - No code changes, but per reviewer requests, adding
> additional
>           mailing lists(keyring, EFI) for wider review.
> 
> v2:
>         - Include feedback from Gregory Joyce, Eric Richter and
>           Murilo Opsfelder Araujo.
>         - Include suggestions from Michael Ellerman.
>         - Moved a dependency from generic SED code to this patchset.
>           This patchset now builds of its own.
> 
> 
> 
> 
> Greg Joyce (3):
>   block:sed-opal: SED Opal keystore
>   block: sed-opal: keystore access for SED Opal keys
>   powerpc/pseries: PLPKS SED Opal keystore support
> 
>  arch/powerpc/platforms/pseries/Kconfig        |   6 +
>  arch/powerpc/platforms/pseries/Makefile       |   1 +
>  .../powerpc/platforms/pseries/plpks_sed_ops.c | 131
> ++++++++++++++++++
>  block/Kconfig                                 |   1 +
>  block/sed-opal.c                              |  18 ++-
>  include/linux/sed-opal-key.h                  |  26 ++++
>  6 files changed, 181 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
>  create mode 100644 include/linux/sed-opal-key.h
> 

