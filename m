Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1273589EDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 17:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzCfP3lmRz3bYs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 01:42:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d0Xm1l9f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d0Xm1l9f;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzCcs657Kz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 01:41:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 274FK09h029543;
	Thu, 4 Aug 2022 15:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=0dfLlUaaH/pDFo9lOjtq6szzQph2V5ujfWQe5XtnjVs=;
 b=d0Xm1l9fpQSt1Zssq/lGghHCy3jaBjP5L4r71FfyhHQp/hZJ04HZl7x0SdN+9/k2trQ1
 74/Y7iLXJaFUd3KrgOl/XSsFZ72vMDenh0kasaFf8gmJcwUWQpu6YzGkyz1oZ1bfFh/0
 4JEVhwtaM2moGwp0bq1x8Gg9oRzlxeCc7fVokep7Ham8N0hTWZhhi6qA31iezqoeQe4Z
 jJc5XJFPv3lE775Niz1bdy91QsuDsRyVs5Axsb9d7Tp38AXtNf0hIfVT9LpILnV+Jgl0
 nbiGMMYv2xZbfEuu4Q/xiGxFhZHkyDey/YFHdRQVoArfRQWEAfrf33/sNJj85UzbmS0o Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrgnh8rc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 15:41:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 274FKoSZ031759;
	Thu, 4 Aug 2022 15:41:03 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrgnh8rbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 15:41:03 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 274FLeHA025061;
	Thu, 4 Aug 2022 15:41:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma04dal.us.ibm.com with ESMTP id 3hmv99y6ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 15:41:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 274Ff1iS1639048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Aug 2022 15:41:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BD18B2066;
	Thu,  4 Aug 2022 15:41:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D75D8B2065;
	Thu,  4 Aug 2022 15:41:00 +0000 (GMT)
Received: from sig-9-65-198-113.ibm.com (unknown [9.65.198.113])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  4 Aug 2022 15:41:00 +0000 (GMT)
Message-ID: <af674b14a965588aa687472c9c8c74e7e471df88.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] lib: generic accessor functions for arch keystore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
        Nayna
	 <nayna@linux.vnet.ibm.com>
Date: Thu, 04 Aug 2022 10:41:00 -0500
In-Reply-To: <20220801202401.GZ17705@kitsune.suse.cz>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
	 <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
	 <20220801134018.GY17705@kitsune.suse.cz>
	 <61ebf904-8ce1-eeac-888a-4040711e7903@linux.vnet.ibm.com>
	 <20220801202401.GZ17705@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6z-4g4SIpHIRfw7-g8Yx6urDN094nZ8k
X-Proofpoint-ORIG-GUID: 7RhcMJWmEmt182qWqmrmYrQnpKGiju50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=998 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040067
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
Cc: axboe@kernel.dk, Christophe Leroy <christophe.leroy@c-s.fr>, nayna@linux.ibm.com, Nick Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-01 at 22:24 +0200, Michal Suchánek wrote:
> > > > +
> > > > +int __weak arch_read_variable(enum arch_variable_type type,
> > > > char *varname,
> > > > +			      void *varbuf, u_int *varlen)
> > > > +{
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +int __weak arch_write_variable(enum arch_variable_type type,
> > > > char *varname,
> > > > +			       void *varbuf, u_int varlen)
> > > > +{
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > > -- 
> > > Doesn't EFI already have some variables?
> > > 
> > > And even powernv?
> > > 
> > > Shouldn't this generalize the already existing variables?
> > > 
> > > Or move to powerpc and at least generalize the powerpc ones?
> > 
> > Yes, EFI and PowerNV do have variables, but I am not exactly clear
> > about
> > your reference to them in this context. What do you mean by
> > generalize
> > already existing variables ?
> > 
> > This interface is actually generalizing calls to access platform
> > specific
> > keystores. It is explained in cover letter that this patch is
> > defining
> > generic interface and these are default implementations which needs
> > to be
> > overridden by arch specific versions.  For PowerVM PLPAR Platform
> > KeyStore,
> > the arch specific version is implemented in Patch 2.
> For powervm, not powernv.
> 
> If it's not generic enough to cover even powerpc-specific keystores
> does
> such generalization even need to exist?

I believe that the interface is generic enough to cover most if not all
keystores. However, we're just implementing a PowerVM version since
that is our mandate. 

> > Access to EFI variables should be implemented by EFI arch specific
> > interface
> > and PowerNV will have to do the same if it needs to.
> 
> If such generic interface is desirable it should cover the existing
> architectures I think. Otherwise how can you tell if it's usable
> there?

Are you suggesting that we implement architecture specific
implementations for every architecture supported by Linux? I'm afraid
that we don't have the time (or skills) to do that. The intent is to
provide the "weak" versions of the interface functions so that they can
be overridden as folks have the time or inclination to provide them for
other architectures.

-Greg


