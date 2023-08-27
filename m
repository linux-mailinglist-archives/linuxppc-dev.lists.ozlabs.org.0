Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF08789BBA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Aug 2023 09:18:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dL04pZ+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYQ5v4k7bz3c1q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Aug 2023 17:18:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dL04pZ+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYQ4y1GZqz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Aug 2023 17:17:53 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37R7CM6S010096;
	Sun, 27 Aug 2023 07:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8TqO2I3AYHpbTmw9MMc+lTvNPXkao7+JWLACLYAasSI=;
 b=dL04pZ+gigjokI5elKluKbZxJusJR+umSCQe5nHcf2UAbuOEgh0UOgw9k7Z8MC5tbfFF
 KFDtFF8Ieh2Zj7gucXUA5xeHlMfzRZqoH1rnbciJZ+U8bRL5r64Nw+qTBJbAxtzyDgaY
 KJQbonJg6D+REFSFDWSCbS0VGbqMW7mBNlzvwwkscEsTb2Vdju5Tk2AnwytOlQxEgq3L
 vSMJkrq36WrsgYO0wA5b+vFUJN4sfENq2mrXL97WU3FJdS/H7RmNwUAnv7eR9YcrXyLm
 FldVs8BYPVzUO/b5r/Et3XS0vZcdjMP3N3cG+hbSVe6CEVpWtRwK8UbeWFa3KW+aFakE bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr1860g3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Aug 2023 07:17:40 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37R78gc5031708;
	Sun, 27 Aug 2023 07:17:39 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr1860g3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Aug 2023 07:17:39 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37R4wijx009855;
	Sun, 27 Aug 2023 07:17:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqw7jskbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Aug 2023 07:17:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37R7HZuS21431002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Aug 2023 07:17:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5FD72004B;
	Sun, 27 Aug 2023 07:17:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B93B20040;
	Sun, 27 Aug 2023 07:17:33 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.39.84])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 27 Aug 2023 07:17:33 +0000 (GMT)
Date: Sun, 27 Aug 2023 12:47:30 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH 0/4] Introduce perf build subcommand
Message-ID: <mxcws2wtnrar2kiswwlkmdl2mqkbv3zvek3lx7qe7bpejea3aa@5ymqftm6zli7>
References: <20230825061125.24312-1-adityag@linux.ibm.com>
 <CAM9d7cgBJ1WHRuVcZ4FArm=pctbs-npLB2Q8PLZWmdfaK3dCzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAM9d7cgBJ1WHRuVcZ4FArm=pctbs-npLB2Q8PLZWmdfaK3dCzg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ViKBIEiWzXQV1JIEf0AMcWyNBAbyk9Ty
X-Proofpoint-GUID: 9oGYJTrenTiPkQf4oSMBOd86caJGkkv2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-27_04,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=844
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308270064
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

Hello,

On Fri, Aug 25, 2023 at 10:07:28AM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Thu, Aug 24, 2023 at 11:11 PM Aditya Gupta <adityag@linux.ibm.com> wrote:
> >
> > <...>
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
> > <...>
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
> 

Sure, the said confusion due to 'build' makes sense. I will discuss with athira
also and post a V2 with suggested change.

And, since a new subcommand is being introduced, where do I add a
documentation, such that it can be visible in a manpage etc, similar to
perf-version(1) ?

Thanks,
Aditya Gupta

