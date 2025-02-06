Return-Path: <linuxppc-dev+bounces-5916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59CA2B39C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 21:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypq871GMjz30LS;
	Fri,  7 Feb 2025 07:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738875223;
	cv=none; b=MgcRzthta/uWo9uFO/uRr4k1rQzO5VmLwMiFXwn1mouHwr5c2eLBytCx7XOYiofm64yUB6EwbOSyCM6Eti4wLwnpv6r43qcj5aAqB8kVvR2nTY14p1OroelKAJmbK+AlachVc3RkIUzySwudGn9pIkfRpeu0Tuu4idiPPLAlFOwVU1AQTudfwZBumD70EMCJN2cNdhWDSKzcJXD8l3i3ojKNty+5HnvP5HAPDviUtyN/skDHno8NsOASt/5v1JDa0ItrMV3A1+XM3pghH5tFlb1nnHSH/5F31G5M/W1Rt9A532RYVDqDZ1WKhpSEMy7kt0u3RZt5bTFTGxCNqArS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738875223; c=relaxed/relaxed;
	bh=a5AyfBCcRFbjUJMW1Kb8JSetTe9XGGsoXSBv6OWE+M8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=V5GstTIcSgDQYIkCxv3FWjxMpJlKIrj/1cOHBGT8VrsCAFtxCQHFyfiWda1+PQIVUCLqzd41K9lzKtwKeGJWChc8Y6362yPc3ZDZbsHcVt9e7nE3GI4NWQ8infg47IDgqIVUgggDAXXAIpxMuBsPMRPFCjT5tibGJczM1wxvvyAWmP0DznhQcafz7GqPHCcKsv/gp12UvqfsV8NZSAdmKXXvE6A6kOWRCk9lcYZ1mElb+JVPVSRfPREcRwTLsfAKXZHukreFlWj7L+HtMjhkgSunCQlFtKDFRj3fPExZbb+DHYh9imDvBFqbUhvnxdH/z7FFA3cqfu3E2QzMfx21tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxYhI4KL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxYhI4KL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypq861wrVz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 07:53:41 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516ESLxY020484;
	Thu, 6 Feb 2025 20:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a5AyfB
	CcRFbjUJMW1Kb8JSetTe9XGGsoXSBv6OWE+M8=; b=mxYhI4KLwotHN4HWuBoypX
	wigGkclCWx7sow8eJ7DOGCh3CGRSjbYiSxW7Ql/LL6PpIIIkeBWyk4n40qwgoniR
	Z5vYXdQ94HGudwqR/nqYRsI5opcf5ggNZv+zgwlCIPjLjSgrVURgRDwncMIGfZ1Q
	bcXXQwSlJbNOI3aP3i44NIKgmVi8sn5sSbD3dOuZ1B5Uv7BfzWUgO3prAMY47hC+
	jdALMdVy8xrMBqu//zldYedhKjB0T4iJMtPnkqa4seOOeJGLZCwe+3zbHHmPzLFA
	9HcVnQ5BY+Z0+Wt/VYr4FmE9jkwyGV8ZYjIl1Ra2NpVXpiM0plAMpUV4e7xuvUYg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mpw84rgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 20:53:33 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516KhWLJ016452;
	Thu, 6 Feb 2025 20:53:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mpw84rgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 20:53:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 516IuFKg006508;
	Thu, 6 Feb 2025 20:53:31 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekr5p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 20:53:31 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 516KrSA525363124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 20:53:28 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 618F958067;
	Thu,  6 Feb 2025 20:53:28 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A83E658052;
	Thu,  6 Feb 2025 20:53:27 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.90.73])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Feb 2025 20:53:27 +0000 (GMT)
Message-ID: <63d8d8a3b7b95ac0aef57b7dce083b38391c1ce8.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add papr-platform-dump
 character driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Thu, 06 Feb 2025 12:53:26 -0800
In-Reply-To: <Z6UTId3-o5HM69IY@kitsune.suse.cz>
References: <20250111003010.2147021-1-haren@linux.ibm.com>
	 <20250111003010.2147021-7-haren@linux.ibm.com>
	 <Z6N1pDdLbcFXg3bi@kitsune.suse.cz>
	 <d9341cf39ff817e7c1a47f0f793ac6e61dd1d2fc.camel@linux.ibm.com>
	 <Z6R-WEfBCBpMQpey@kitsune.suse.cz>
	 <9a1b6a0accb80b2824037f93ffb120a3aabd02a5.camel@linux.ibm.com>
	 <Z6TV8q-IsJ5XGOgN@kitsune.suse.cz>
	 <63702395ffbbb9362a7290dc87f5504969c1a67e.camel@linux.ibm.com>
	 <Z6UTId3-o5HM69IY@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6glMNZGs15X4pdUsEN773HH1-PQFWG_
X-Proofpoint-ORIG-GUID: uHNfLrAPTiUUDcCOpP01hFjIHUgUWATU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=976 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060162
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 2025-02-06 at 20:53 +0100, Michal Suchánek wrote:
> On Thu, Feb 06, 2025 at 10:34:42AM -0800, Haren Myneni wrote:
> > On Thu, 2025-02-06 at 16:32 +0100, Michal Suchánek wrote:
> > > On Thu, Feb 06, 2025 at 07:28:14AM -0800, Haren Myneni wrote:
> > > > On Thu, 2025-02-06 at 10:18 +0100, Michal Suchánek wrote:
> > > > > On Wed, Feb 05, 2025 at 11:51:19PM -0800, Haren Myneni wrote:
> > > > > > On Wed, 2025-02-05 at 15:28 +0100, Michal Suchánek wrote:
> > > > > > > > +
> > > > > > > > +	if (params->status !=
> > > > > > > > RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > > > +		pr_warn("Platform dump is not complete,
> > > > > > > > but
> > > > > > > > requested "
> > > > > > > > +			"to invalidate dump for
> > > > > > > > ID(%llu)\n",
> > > > > > > > +			dump_tag);
> > > > > > > 
> > > > > > > Not sure if something should be done here or if relying
> > > > > > > on
> > > > > > > translation
> > > > > > > of the error from the RTAS call is advisable.
> > > > > > 
> > > > > > This check just diplays message in case if the user
> > > > > > initiated
> > > > > > to
> > > > > > invalidate the dump without saving it completely. Then
> > > > > > invalidates
> > > > > > the
> > > > > > dump with RTAS call and retuns the RTAS return value. 
> > > > > > 
> > > > > > As mentioned above, platform-dump is available only on non-
> > > > > > HMC
> > > > > > based
> > > > > > systems. So invoke the collection of dump by BMC based
> > > > > > interface,
> > > > > > not
> > > > > > widely used. I can remove this check if preferred.
> > > > > 
> > > > > From the previous discussion it sounds like trying to
> > > > > invalidate
> > > > > the
> > > > > dump without first reading it in full is an error.
> > > > 
> > > > Thanks for your suggestions.
> > > > 
> > > > Yes, it was doing as part of read() calls. But explicit ioctl
> > > > to
> > > > invalidate here. I was thinking like user space removing FD
> > > > without
> > > > reading or writing operation.
> > > 
> > > And is it possible to invalidate the dump without reading it
> > > fully
> > > first?
> > > 
> > > If not then there is no point trying to do the call that is known
> > > to
> > > fail anyway.
> > 
> > Generally not possible if uses librtas API rtas_platform_dump()
> > which
> > reads the dump completely and then the application calls this API
> > explicitly to invalidate the dump (with buffer NULL - as doing in
> > the
> > current implementation). The current use case is extract_platdump
> > command (ppc64-diag package)
> > 
> > extract_platdump() {   /* we are not chamging this implementation
> > */
> >  
> > status = rtas_platform_dump() - initial call
> > while !dump_complete {
> > 	status = rtas_platform_dump()
> > 	if (status < 0) failure
> > 	if (status == 0) dump_complete = 1
> > }
> > 
> > status = rtas_platform_dump() -  to invalidate dump by passing
> > buffer =
> > NULL
> > 
> > We should not expect using any command other than extract_platdump
> > since the use case of collecting platform dump is narrow and is
> > only on
> > non-hmc based systems.
> > 
> > Hence added warning message if the dump is not completely read and
> > invalidate the dump like removing file by mistake.
> > 
> > But I like your suggestion of returning an error (-EPERM) if not
> > saved
> > the dump completely.
> 
> I think EPERM is not correct in this case. It's not a problem of
> permission but of incorrect state.
> 
> There are some errors around that like EBUSY or EINPROGRESS.

Thanks for your suggestions - will use EINPROGRESS. 

> 
> Thanks
> 
> Micahl


