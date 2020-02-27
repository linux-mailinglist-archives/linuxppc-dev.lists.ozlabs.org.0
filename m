Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DB1728D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 20:40:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T30Z53K1zDr6S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 06:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T2yk3rk1zDr31
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 06:38:22 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RJVEkM002679
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 14:38:19 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqbu86xk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 14:38:19 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <zohar@linux.ibm.com>;
 Thu, 27 Feb 2020 19:38:17 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 19:38:13 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01RJcBHG58917066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 19:38:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 586A5AE053;
 Thu, 27 Feb 2020 19:38:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E862FAE045;
 Thu, 27 Feb 2020 19:38:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.166.13])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 19:38:09 +0000 (GMT)
Subject: Re: [PATCH] ima: add a new CONFIG for loading arch-specific policies
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Nayna Jain
 <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-efi@vger.kernel.org,
 linux-s390@vger.kernel.org
Date: Thu, 27 Feb 2020 14:38:09 -0500
In-Reply-To: <1582749379.10443.246.camel@linux.ibm.com>
References: <1582744207-25969-1-git-send-email-nayna@linux.ibm.com>
 <94fe39a9-db9e-211d-d9b7-4cfe1a270e6f@linux.microsoft.com>
 <1582749379.10443.246.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022719-0012-0000-0000-0000038AEA57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022719-0013-0000-0000-000021C794C1
Message-Id: <1582832289.10443.298.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_06:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=942
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270136
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
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Philipp Rudo <prudo@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-02-26 at 15:36 -0500, Mimi Zohar wrote:
> On Wed, 2020-02-26 at 11:21 -0800, Lakshmi Ramasubramanian wrote:
> > Hi Nayna,
> > 
> > > +
> > > +config IMA_SECURE_AND_OR_TRUSTED_BOOT
> > > +	bool
> > > +	depends on IMA
> > > +	depends on IMA_ARCH_POLICY
> > > +	default n
> > > +	help
> > > +	   This option is selected by architectures to enable secure and/or
> > > +	   trusted boot based on IMA runtime policies.
> > > 
> > 
> > Why is the default for this new config "n"?
> > Is there any reason to not turn on this config if both IMA and 
> > IMA_ARCH_POLICY are set to y?
> 
> Good catch.  Having "IMA_SECURE_AND_OR_TRUSTED_BOOT" depend on
> "IMA_ARCH_POLICY" doesn't make sense.  "IMA_ARCH_POLICY" needs to be
> selected.

After discussing this some more with Nayna, the new Kconfig indicates
that the architecture defines the arch_ima_get_secureboot() and
arch_get_ima_policy() functions, but doesn't automatically enable
IMA_ARCH_POLICY.  The decision to enable IMA_ARCH_POLICY is left up to
whoever is building the kernel.  The patch, at least this aspect of
it, is correct.

Mimi

