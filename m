Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4F790BBD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 13:55:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sqtJVB9i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RdqvX3PlKz3bcS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 21:55:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sqtJVB9i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rdqtg2rddz2xLN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Sep 2023 21:54:18 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 383Bo8oM032397;
	Sun, 3 Sep 2023 11:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=U60Ko/vDXCR/KHZtcvfK5O0nVYP5xS42HAqoAERab60=;
 b=sqtJVB9iQHMW9toUroB6MONHtBCiFLO3IATD/BSaCKDS2yIFg+szKMfMdWqifjpospXm
 EBwu+ucLxSIPDrBVNrFPTL8lyhL9x3JGyvngParBH8R9By1Y2MmZKPJ0cVUE0fbG+qKH
 fpZuF0tvOPXd4+H8kkMcxBfT/edZq3rTz5CUu9S67E53zYmTFAd7sGt9IQc/gA3ikDYA
 RN9jUhavkCTCudm0fe8UghyqMV5m3Tl+WUvLwZXVs2CVcdutHZKqwskdZeWW/V9RnvIU
 r0+fkTVU1/Bil1Va0roVzOJHqwSZRoyCyZiiUVylFY6x+Wvt2AvQsMp0fwbJCmA3nqGj vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3svsm6r195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Sep 2023 11:54:12 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 383BqDpA005301;
	Sun, 3 Sep 2023 11:54:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3svsm6r192-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Sep 2023 11:54:11 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3838uMOu012217;
	Sun, 3 Sep 2023 11:54:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkjajg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Sep 2023 11:54:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 383Bs8ed25428572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 3 Sep 2023 11:54:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 325C62004D;
	Sun,  3 Sep 2023 11:54:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC9BD20043;
	Sun,  3 Sep 2023 11:54:05 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.15.154])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  3 Sep 2023 11:54:05 +0000 (GMT)
Date: Sun, 3 Sep 2023 17:23:52 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH 0/4] Introduce perf build subcommand
Message-ID: <u754ryppddl3rqhadhchgily7yb5idjuhriqzohjwfkzooeqoa@qxumwwhym555>
References: <20230825061125.24312-1-adityag@linux.ibm.com>
 <CAM9d7cgBJ1WHRuVcZ4FArm=pctbs-npLB2Q8PLZWmdfaK3dCzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAM9d7cgBJ1WHRuVcZ4FArm=pctbs-npLB2Q8PLZWmdfaK3dCzg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jJpuN0uaI3HwO4G2-V_jT3OKlATsphXv
X-Proofpoint-GUID: -xXfUdUzqs38kRD5dK9wCWdOmJcQGI-Q
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-03_09,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=643 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309030108
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Namhyung,

On Fri, Aug 25, 2023 at 10:07:28AM -0700, Namhyung Kim wrote:
> On Thu, Aug 24, 2023 at 11:11 PM Aditya Gupta <adityag@linux.ibm.com> wrote:
> >
> > The Problem
> > ===========
> >
> > Currently the presence of a feature is checked with a combination of
> > perf version --build-options and greps, such as:
> >
> >     perf version --build-options | grep " on .* HAVE_FEATURE"
> >
> > Proposed solution
> > =================
> >
> > As suggested by contributors in:
> > https://lore.kernel.org/linux-perf-users/ZMPWk5K63tadmDlU@kernel.org/
> >
> > Introduce a subcommand "perf build --has", with which
> > scripts can test for presence of a feature, such as:
> >
> >     perf build --has HAVE_FEATURE
> >
> > The usage of "perf version --build-options | grep" has been replaced in two
> > tests, with "perf build --has" command
> 
> I'm not sure 'perf build' is a good name, it sounds like it needs to build
> something.  Maybe 'perf check --feature XXX' ?
> 
> Then we can extend the perf check command to *check* system
> settings like perf_event_paranoid, kptr_restrict, nmi_watchdog
> and so on, and possibly provides some advice or even change
> the values easily.
> 
> What do you think?

Thanks for the suggestion, we agree with it.
I have sent the updated patch series, but it's again from V1 since the subcommand changed.

Patch series: https://lore.kernel.org/linux-perf-users/20230903114721.190733-1-adityag@linux.ibm.com

Thanks,
Aditya Gupta

