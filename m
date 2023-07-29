Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A8767CDC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 09:41:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MCw5e/8X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCbzc1H4Xz3dDR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MCw5e/8X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCbxm1914z3dFl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 17:39:55 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T7bW0Z017595;
	Sat, 29 Jul 2023 07:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2VfDGxCbb83n8VauqKQzoJjykpZeZRnflE5GwH/NBIs=;
 b=MCw5e/8XpaVEEARzwiYzNvOHVWPLaW8XnWOGPY+7hQLs32KVpHeWH0gwldojEPA3Eg01
 rPb1krXhKFnXthkGoA++9E/KBJaC9vN6bz5rfcHdsxf3eXLsIe4HYO1WPSr3rl90WLhI
 o8bKedgMtSgO8So/M4gvKWYaxhkiyv4m0iVTSbRCATKiaPuEQT37b4CwWiSf6UcDq1xI
 5SFqX25jPyQ69tTJ/GUMct0OHohiK+4un/X4I7iN2ZlOQkyoFaJUttEXkhA1XVgjqINX
 Rm2uwqag963nqaIc5ZlD0QgPdI9eBSKGuCMLB4SveVIHvezyYwztUHBy0W6QuOGl9ukO pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4w371hbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:39:51 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36T7cKaU022852;
	Sat, 29 Jul 2023 07:39:51 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4w371h8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:39:51 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36T5DQxs002381;
	Sat, 29 Jul 2023 07:39:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txkvmp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:39:49 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36T7dkfs28770998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 07:39:46 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BF5F2004D;
	Sat, 29 Jul 2023 07:39:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7F4A20043;
	Sat, 29 Jul 2023 07:39:42 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.39.127])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 29 Jul 2023 07:39:42 +0000 (GMT)
Date: Sat, 29 Jul 2023 13:09:37 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
Message-ID: <3gmwq3qbe3lpcpvzwfaliyipoe7qrmqbbwd4fhsv7dj6q3kwpo@4g226sr4pm62>
References: <20230725061649.34937-1-adityag@linux.ibm.com>
 <ZMPWk5K63tadmDlU@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMPWk5K63tadmDlU@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NK3UGcF_Ck9HkJYSzCM1FNV7-vZZh2DI
X-Proofpoint-ORIG-GUID: fRVJp-x3uciIRgJT9hqlmjRrAUrJN6QW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290068
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 11:54:11AM -0300, Arnaldo Carvalho de Melo wrote:
> Em Tue, Jul 25, 2023 at 11:46:49AM +0530, Aditya Gupta escreveu:
> > Currently we depend on output of 'perf record -e "sched:sched_switch"', to
> > check whether perf was built with libtraceevent support.
> > 
> > Instead, a more straightforward approach can be to check the build options,
> > using 'perf version --build-options', to check for libtraceevent support.
> > 
> > [...]
> > 
> > diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
> > index 0095abbe20ca..a28d784987b4 100755
> > --- a/tools/perf/tests/shell/test_task_analyzer.sh
> > +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> > @@ -52,7 +52,7 @@ find_str_or_fail() {
> >  
> >  # check if perf is compiled with libtraceevent support
> >  skip_no_probe_record_support() {
> > -	perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
> > +	perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && return 2
> >  	return 0
> 
> I'll apply this, but please consider adding a:
> 
> 	perf build --has libtraceevent
> 
> subcommand to have that query made more compact and to avoid the two
> extra grep.

Okay. As you suggested in another reply, I found the code in builtin-version.c,
we can have a "perf build --has" option which can use the `IS_BUILTIN` macro
also used by "perf version --build-options". It can support all other feature
flags too.

You can implement it or I can work on a patch for that ?

It should require adding another 'struct option' to 'version_options', and
check for the flag in 'cmd_version()'. Will have to look how to get the string
passed after '--has'.

> 
> BTW, I'll change that to:
> 
> [acme@quaco perf-tools-next]$ perf version --build-options | grep " on .* HAVE_LIBTRACEEVENT"
>          libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
> [acme@quaco perf-tools-next]$
> 
> replacing "on" with OFF, so that we have just one grep.

Okay.

Thanks,
- Aditya G

