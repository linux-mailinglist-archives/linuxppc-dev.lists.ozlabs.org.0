Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1DC69F22F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:50:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMBH663j2z3cJY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:50:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MiZDBDfk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MiZDBDfk;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMBG70q54z2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:49:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M99ZFW034158;
	Wed, 22 Feb 2023 09:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=7THA7fgQPcuOQl5J8UxHvs99n3N1+C8jrau/mPrc9ss=;
 b=MiZDBDfkvIXqOD7aANqfG75gjd1Q7LVabc3Z51Uzs9iTA+D4tZnLd77OzZiqS4XbKlHm
 +Nn/ttUO60lfaJtTHBcF9FBxRlU80lfy0WD3R5R3NvDvKSbbzrNeMvk0Zx6qqOkfOcf2
 dg7daOo3WRmVVHP2HkyP1gQ+B1Nw2U8Kx0P5EmW8Mbozt77NjTgGNgSIf5qJ5BY2sWF8
 dIwXroy6vQ8fEgxwduQiZqnYieR7qLKDSgMyRS40rorcq6qFsfKTzXS9dopnmqbJARPF
 AEwwQ0wuyi+eY8a+m48+TrB3sRTPY3cZ6ljVtk7CcEOGr4+J0hR7FidL9GGcZgA6yvo3 fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwd5sdmga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:49:43 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M9QJMT012579;
	Wed, 22 Feb 2023 09:49:43 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwd5sdmfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:49:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LCtVAb014278;
	Wed, 22 Feb 2023 09:49:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ntpa63whh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:49:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M9nc1240698168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 09:49:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC12020040;
	Wed, 22 Feb 2023 09:49:38 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 575732004B;
	Wed, 22 Feb 2023 09:49:35 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 09:49:34 +0000 (GMT)
Date: Wed, 22 Feb 2023 15:19:31 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Message-ID: <Y/XlK8G7seIrcNGZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <Y/XgrU9RhuaGCLHp@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <b20a6e0e-f421-6b83-dbec-c0177e60db16@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b20a6e0e-f421-6b83-dbec-c0177e60db16@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GNooz-r5EO1MU_XnfjkqZg0gTUfM4I0g
X-Proofpoint-ORIG-GUID: u98-ngY8FXQXLHi9-bTTRqMvXhoUOKS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=980 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220083
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 22, 2023 at 09:44:54AM +0000, Christophe Leroy wrote:
> 
> 
> Le 22/02/2023 à 10:30, Kautuk Consul a écrit :
> > Again, could some IBM/non-IBM employees do basic sanity kernel load
> > testing on PPC64 UP and SMP systems for this patch?
> > would deeply appreciate it! :-)
> 
> And can 'non-IBM' 'non employees' do something ? :)
Anyone can help! :-)
> 
> > 
> > Thanks again!
> > 
> 
> Did you try on QEMU ?
I am a new IBM employee so I don't have any setup with cross-compiler
and rootfs, etc. with me at the moment.
Thats why I requested this from the mailing list.
