Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031584AD9B7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 14:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtNyl4yY1z3bSx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 00:24:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aTGP0ADJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aTGP0ADJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtNxz59QHz301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 00:23:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218AFQnH025080; 
 Tue, 8 Feb 2022 13:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=NFuth8SxiHwdmFbcPnyaVO1InzUXePr0k67t1UmkMEM=;
 b=aTGP0ADJI14AB+qhFWvzuFyeodxrfD04gp+4dgtNwMe3Ej750mbD3v/IAso6I+smpNGl
 Z+yPqXzrR0LANby6wvEt1gpSbI9fh2Ad9nwXiN5fE/IZHCaqeXdzj8DVRaJe6FxT9fRl
 SkfTGtnmc4n4GSko6UKV1Nu+ezFryKAECMmLIAFgTVZyt9ArIRICQvnEhySu7xqGLNFQ
 zBlWoFIafCXCsuQrte/rR05pXWdSOu+3yscjiqazNTUNHBq2hPsVhEhhjXd3SPPdyBxi
 NEIkNAnYmaZoVH30ZoXZf3AMZwBv/V1Sg+FMekt1/8WlTNLEmUA1u7nUmTdSds5BxKcR vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22trhw5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 13:23:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218BvqJw023388;
 Tue, 8 Feb 2022 13:23:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22trhw53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 13:23:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218DDqXW007058;
 Tue, 8 Feb 2022 13:23:32 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3e1gvb7tre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 13:23:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218DNVwO11338066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 13:23:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F9E3112062;
 Tue,  8 Feb 2022 13:23:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61763112061;
 Tue,  8 Feb 2022 13:23:30 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.65.233.120]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Feb 2022 13:23:30 +0000 (GMT)
Date: Tue, 8 Feb 2022 07:23:28 -0600
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: ppc64le: `NOHZ tick-stop error: Non-RCU local softirq work is
 pending, handler #20!!!` when turning off SMT
Message-ID: <YgJu0DZ6rz4kq9JR@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <0baca95b-771f-2217-1098-2d0eee568ea7@molgen.mpg.de>
 <20220208131703.GA538566@lothringen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208131703.GA538566@lothringen>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IchAwxR61oGk0GZE9eikQPycGdF7avgf
X-Proofpoint-GUID: rLUYCc53TXB1MU5eT9jJpepkvxp_L9gc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=720
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080082
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 08, 2022 at 02:17:03PM +0100, Frederic Weisbecker wrote:
> On Tue, Feb 08, 2022 at 08:32:37AM +0100, Paul Menzel wrote:
> > once warned about a NOHZ tick-stop error, when I executed `sudo
> > /usr/sbin/ppc64_cpu --smt=off` (so that KVM would work).
> 
> I see, so I assume this sets some CPUs offline, right?

ppc64_cpu --smt=off sets all but the first CPU per core offline.

PC
