Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E38751BBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 10:37:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iob4iqU1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1nz165lkz3c5l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 18:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iob4iqU1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1ny660kfz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 18:36:14 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36D8ToPm029404;
	Thu, 13 Jul 2023 08:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=APmQqBY6fcIS99MvAhbTAOc76h4aFWX3grpGyaxAE5o=;
 b=Iob4iqU11hns7HUb90RT2By418UkVHU8jVjDAgeTojV4UxJ5cxjgyk6OTzLQgHK/wi/w
 0FABnXbk9GwuAgUR9zKKbOT2mypoz1l26vJwm6/NBIfDhva8DQAKDIsfb3dDcGVh+4wB
 /b8J9BOhJ0KaRpjF+rcyCbx6D1IOh4tK78vfXhuFYVf3sTtMiQWIsTS4XXkT15mkz/GZ
 D8TPOVpPO93Q/Jnszk/MofE2xSdSs2VvsBOjZIm37FGsU5tIHx16CACM3RKZ1g/QAQUb
 XIHl1wrK9ynHRvw/phTbiQMLlM7Z9jz37ixE5qI90Hl1EZEAW6K9FFzMoYvLfqbSmYHl jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rtdps896e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 08:36:00 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36D8MiuZ003814;
	Thu, 13 Jul 2023 08:35:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rtdps87qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 08:35:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36D3JRqA031327;
	Thu, 13 Jul 2023 08:35:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rpy2e35hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 08:35:25 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36D8ZLQd21562056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jul 2023 08:35:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B809A2004B;
	Thu, 13 Jul 2023 08:35:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C5F720043;
	Thu, 13 Jul 2023 08:35:19 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 13 Jul 2023 08:35:18 +0000 (GMT)
Date: Thu, 13 Jul 2023 14:05:16 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH 17/17] perf tests task_analyzer: skip tests if no
 libtraceevent support
Message-ID: <mtekq46r24mrdpngjswvuocthrgtlxazo5s4vqvyxpn3xaxo7x@7ttfgmuj7yut>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-18-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fUYTjPjL0c_R6F=RTOaRtbOvctVubvn6S1hxLYd5g1o3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUYTjPjL0c_R6F=RTOaRtbOvctVubvn6S1hxLYd5g1o3A@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cYBaHGx50uXoJRyQZ8COd2fhDCKENYr0
X-Proofpoint-GUID: 2fAvTLYhcomP3BeAs6pYbHn28w-6IWsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_04,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307130074
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Ian,

On Wed, Jul 12, 2023 at 06:16:28PM -0700, Ian Rogers wrote:
> On Tue, Jun 13, 2023 at 10:04 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > From: Aditya Gupta <adityag@linux.ibm.com>
> >
> > Test "perf script task-analyzer tests" fails in environment with missing
> > libtraceevent support, as perf record fails to create the perf.data
> > file, which further tests depend on.
> >
> > Instead, when perf is not compiled with libtraceevent support, skip those
> > tests instead of failing them, by checking the output of `perf
> > record --dry-run` to see if it prints the error "libtraceevent is
> > necessary for tracepoint support"
> >
> > ...
> >
> > +# check if perf is compiled with libtraceevent support
> > +skip_no_probe_record_support() {
> > +       perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
> 
> Fwiw, another way to detect build options used in other shell tests is:
> perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && return 2
> 
> Thanks,
> Ian
> 

Thanks for the review. That seems more straightforward way to check for
libtraceevent support. I will work on a patch for this, and test it.

Thanks,
Aditya G

