Return-Path: <linuxppc-dev+bounces-633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBA961DA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 06:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wts3w5MZyz2xvH;
	Wed, 28 Aug 2024 14:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724819612;
	cv=none; b=iH2tBQ1+5Tyc+Yk1k1K3rHxfCyIXIJS6JTdOt7RceV/yZRFs48zPpMP7guvBL797j3h1YqcGvbhO4LLIqnWB47WgKNxaD2sqEg8OXSv4JxpyYbR3UeYIsswoZSVgNXF6UOj5Gg3Q+nD7Aaz3bMRwFDr0oSUG8jKRedvvpLtwNUKdkF9j40bIwns4hDSzYERo+sVtd6HGgcvvlRDc2XLDGtTIyD730EGMtR8AAOZqvItlrz0ObTNwulLS2+rq8KZzzQh1xFWp1Yj86GIyN6nYf+Oym77jZWUc08Wb7YvAubHHyeW468YN4hWum31IZyRqHqKFQpukckFI5BNd3AQ21g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724819612; c=relaxed/relaxed;
	bh=IFl+Vz26L0y0C7EQgmrvodKjpcFPDh2OiUaIKuQmjpE=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=MUK341tY3+ttZ49/U3YE9tztLLNNmU25FJkah0tOw3Zi5VlnucNJiXwtFtxGYC96j3vecf5V4A6nW2qIymTJDm33t5L9GjgvWxVGAnDvDDRUN3+5Xp4iBBvpDHTHdpSguSYdH15I3T3KDlT95lwOUnRqWk+sh0kYnCcJX0RbmQWg0fyAfJMEj21wrnICS5bu+7neSDx7I3s8v5bhi/d6e3pNDiWZ+EAw1Q27Zxn3QUuLjwr9/tRlismuwxuni0dmJjG90bsFBWhn/AawSTY+GVBWeanICBxZ3EmU4rFQMsnYnHN/qBJ7b/WoecXd5+IUAZRkEk1Nzo5lgCmkXyeLdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKnQ/csp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKnQ/csp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wts3w28SPz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 14:33:31 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM3XNM027392;
	Wed, 28 Aug 2024 04:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=IFl+Vz26L0y0C7EQgmrvodKjpcF
	PDh2OiUaIKuQmjpE=; b=iKnQ/cspYz21xYnZ5QDh9w5zvJHTKjnJ2rHCLjOflfb
	j5tso33C0VRQ1+mhozTGRJerv0GBV+uCrnAotoOOd6qPdRa99seGOhdoMgXSJvmi
	axs0OCOinPfUEbZVeJ67Sy35xh/HUDJlc7517LOY3jZ9mHN90ebEXBfQK9yxmrez
	OqIlVVDh1GnZRffHGKBgesmD8S8DBgbPXID2XBXJDEX6/RygYpdJElw+gtW0/dbr
	8ZYhvu2B75+gqq9eS09CMTq8B0b+BREChIpl+ImOOqWooCn85r6/7IJWIfgwx3Zm
	Fn0pblhhJGKmvx/5ZK1Tc39fs1CC9ZcQPgoD19hSOoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8qs017-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 04:33:19 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47S4XJpB030232;
	Wed, 28 Aug 2024 04:33:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8qs014-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 04:33:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S0QVpJ030991;
	Wed, 28 Aug 2024 04:33:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417t80x0rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 04:33:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47S4XCYJ54919490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 04:33:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0626520043;
	Wed, 28 Aug 2024 04:33:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6187D20040;
	Wed, 28 Aug 2024 04:33:11 +0000 (GMT)
Received: from localhost (unknown [9.43.2.34])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 04:33:11 +0000 (GMT)
Date: Wed, 28 Aug 2024 10:03:09 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
        Geetika Moolchandani <geetika@linux.ibm.com>,
        Vaishnavi Bhat <vaish123@in.ibm.com>,
        Jijo Varghese <vargjijo@in.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/qspinlock: Fix deadlock in MCS queue
Message-ID: <ydj7mzamqvcd56a6culzelmlmrjbhx7zumcilxcms62vf7qhqg@a76xrftxbndd>
References: <20240826081251.744325-1-nysal@linux.ibm.com>
 <871q29fgn2.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q29fgn2.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nuiwPHtG0V4FTjmO_lEyqeyq18DMaix2
X-Proofpoint-ORIG-GUID: 2GdTbzcklVE9fQFYV0puRnWFalRlDbAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_02,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=445 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280029

On Wed, Aug 28, 2024 at 01:52:33PM GMT, Michael Ellerman wrote:
> "Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> > If an interrupt occurs in queued_spin_lock_slowpath() after we increment
> > qnodesp->count and before node->lock is initialized, another CPU might
> > see stale lock values in get_tail_qnode(). If the stale lock value happens
> > to match the lock on that CPU, then we write to the "next" pointer of
> > the wrong qnode. This causes a deadlock as the former CPU, once it becomes
> > the head of the MCS queue, will spin indefinitely until it's "next" pointer
> > is set by its successor in the queue. This results in lockups similar to
> > the following.
> ...
> >
> > Thanks to Saket Kumar Bhaskar for help with recreating the issue
> >
> > Fixes: 84990b169557 ("powerpc/qspinlock: add mcs queueing for contended waiters")
> > Cc: stable@vger.kernel.org # v6.2+
> > Reported-by: Geetika Moolchandani <geetika@linux.ibm.com>
> > Reported-by: Vaishnavi Bhat <vaish123@in.ibm.com>
> > Reported-by: Jijo Varghese <vargjijo@in.ibm.com>
>  
> Do we have links for any of these reports?

They are all internal reports on LTC bugzilla. I don't see one that is public.

> 
> cheers

Regards
--Nysal

