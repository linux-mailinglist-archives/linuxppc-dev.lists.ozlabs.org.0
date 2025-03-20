Return-Path: <linuxppc-dev+bounces-7235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484FA6A911
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 15:51:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJT6p4Wybz304x;
	Fri, 21 Mar 2025 01:51:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742482290;
	cv=none; b=WDfMH82TwnpWQxzNx3v28BWh+Svbeq5VtnFFoddToW0utp5olqK7CpWcMMu/vaZ277hSMCSeNVlQT/6wSIuTrlPuZix2MGitNUZQEV9oDYOVxxqrx5PDqH8iZxGa4mxXWFlmQEgEa1Pai1IubeDFZClqyQkw2gxrnVDJH/x0Lkw4TXO1Z0B6q5nRoIznuxhapMwmLjGL/gc7xH1SVs+EcJHp87w6AM6gEyri7hd72XEwkNA8H3yh4W4SBYp3f/To13xn8sUGcnjguqBOAqWc8PuY8CTGGMBtZVSHznVbY1pxSYvbpzDRqSbIQLAAo8ajP3EWg9kA24RQ2DeKNJPnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742482290; c=relaxed/relaxed;
	bh=4siztRv4WpexKlPE4A/kPFRipMeol9HmJlLcdcjIBG4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jWCfzsYq2cgDyqC0UeIA4L88lVcASrxPq22TzedcdDYX5m8W82mZ9I486xs6UlArul9oFPo5Oohg37M/zGRRfGw78B/DYy+G0W+aEFi4L3H+P0+n25/hLFvhwXNOgt9AU7850v/kuFSJ+eiXLMmPVnHDdAPSM/U2uGuX/0sd4v+6LBDdq64TyTrZgVL69kwdupzYSTXWu6SKQ2CRwWS7KrDJPuEKu9G+BOFfrQCCBgn2uxuvFOYs07ETs5/8BZT6QmzYbHmXvrD7X5JrDKgS4B3xXvHY2T5fsV2fgOjqlBF2NnLtORIWw6acoZGtxpoaFVRw6XL6YiPeMvDyjb7LRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rvZVC0H5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rvZVC0H5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJT6m2NwGz302c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 01:51:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KDP3cN030969
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 14:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4siztR
	v4WpexKlPE4A/kPFRipMeol9HmJlLcdcjIBG4=; b=rvZVC0H50J4y7htW5yTOlx
	c/yCbo9IBlLMV9gnfTWUNahzbs+YN0AS+X83v3K9UpBp8pn8KCjUE8mjusvmA6ZP
	Sibtzs37n/ggfmj4YHmQruqAG5Aor3xnOuzW+hhv0AlVUGBfInoSSIv5/WPsX1Ym
	tHOvb1Ag57hjOSF8xgckwXiwdRr14nJgr4+1N7rWmj9y6VfZHjJB8oPxDboBPG5S
	2QJl3XOhp9yzU9W8LLAr88QXCapcynbldyX24ai6c2OLVNm7RvYYJoNpUpNm5LB1
	dLz54gT9Qx3eu/GFepiSzHB+YUZ9/ixwIyBh31ZkSpgVVVxQsqF5rmysP2eEx2PA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gbd9k5xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 14:51:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEPQpQ032041
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 14:51:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvtrrk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 14:51:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52KEpIpE32899632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 14:51:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC38320049;
	Thu, 20 Mar 2025 14:51:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D25820040;
	Thu, 20 Mar 2025 14:51:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.254.132])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Mar 2025 14:51:13 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 0/9] Add support for configure and control of Hardware
 Trace Macro(HTM)
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <5411ccd9-6077-4f95-8b8b-92ab5d990d9d@linux.ibm.com>
Date: Thu, 20 Mar 2025 20:21:00 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Disha Goel <disgoel@linux.vnet.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Abhishek Dubey <adubey@linux.ibm.com>,
        skb99@linux.ibm.com, Shrikanth Hegde <sshegde@linux.ibm.com>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD8A575C-5B02-4300-8203-58DB44F52CB7@linux.ibm.com>
References: <20250314135541.1831-1-atrajeev@linux.ibm.com>
 <5411ccd9-6077-4f95-8b8b-92ab5d990d9d@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ZAucFaVDzhSz2_LZuOyQ_cJaJw4Ckwl
X-Proofpoint-GUID: 2ZAucFaVDzhSz2_LZuOyQ_cJaJw4Ckwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503200090
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 20 Mar 2025, at 6:43=E2=80=AFPM, Venkat Rao Bagalkote =
<venkat88@linux.ibm.com> wrote:
>=20
> On 14/03/25 7:25 pm, Athira Rajeev wrote:
>> H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export
>> data from Hardware Trace Macro (HTM) function. The debugfs interface
>> to export the HTM function data in a partition currently supports =
only
>> dumping of HTM data in an lpar. Patchset add support for =
configuration
>> and control of HTM function via debugfs interface.
>>=20
>> With the patchset, after loading htmdump module,
>> below files are present:
>>=20
>> ls /sys/kernel/debug/powerpc/htmdump/
>>   coreindexonchip  htmcaps  htmconfigure  htmflags  htminfo  htmsetup
>>   htmstart  htmstatus  htmtype  nodalchipindex  nodeindex  trace
>>=20
>> - nodeindex, nodalchipindex, coreindexonchip specifies which
>>   partition to configure the HTM for.
>> - htmtype: specifies the type of HTM. Supported target is
>>   hardwareTarget.
>> - trace: is to read the HTM data.
>> - htmconfigure: Configure/Deconfigure the HTM. Writing 1 to
>>   the file will configure the trace, writing 0 to the file
>>   will do deconfigure.
>> - htmstart: start/Stop the HTM. Writing 1 to the file will
>>   start the tracing, writing 0 to the file will stop the tracing.
>> - htmstatus: get the status of HTM. This is needed to understand
>>   the HTM state after each operation.
>> - htmsetup: set the HTM buffer size. Size of HTM buffer is in
>>   power of 2.
>> - htminfo: provides the system processor configuration details.
>>   This is needed to understand the appropriate values for nodeindex,
>>   nodalchipindex, coreindexonchip.
>> - htmcaps : provides the HTM capabilities like minimum/maximum buffer
>>   size, what kind of tracing the HTM supports etc.
>> - htmflags : allows to pass flags to hcall. Currently supports
>>   controlling the wrapping of HTM buffer.
>>=20
>> Example usage:
>> To collect HTM traces for a partition represented by nodeindex as
>> zero, nodalchipindex as 1 and coreindexonchip as 12.
>>=20
>>   # cd /sys/kernel/debug/powerpc/htmdump/
>>   # echo 2 > htmtype
>>   # echo 0 > nodeindex
>>   # echo 1 > nodalchipindex
>>   # echo 12 > coreindexonchip
>>   # echo 1 > htmflags     # to set noWrap for HTM buffers
>>   # echo 1 > htmconfigure # Configure the HTM
>>   # echo 1 > htmstart     # Start the HTM
>>   # echo 0 > htmstart     # Stop the HTM
>>   # echo 0 > htmconfigure # Deconfigure the HTM
>>   # cat htmstatus         # Dump the status of HTM entries as data
>>=20
>> Athira Rajeev (9):
>>   powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other =
htm
>>     operations
>>   powerpc/pseries/htmdump: Add htm configure support to htmdump =
module
>>   powerpc/pseries/htmdump: Add htm start support to htmdump module
>>   powerpc/pseries/htmdump: Add htm status support to htmdump module
>>   powerpc/pseries/htmdump: Add htm info support to htmdump module
>>   powerpc/pseries/htmdump: Add htm setup support to htmdump module
>>   powerpc/pseries/htmdump: Add htm flags support to htmdump module
>>   powerpc/pseries/htmdump: Add htm capabilities support to htmdump
>>     module
>>   powerpc/pseries/htmdump: Add documentation for H_HTM debugfs =
interface
>>=20
>>  Documentation/arch/powerpc/htm.rst        | 104 ++++++
>>  arch/powerpc/include/asm/plpar_wrappers.h |  20 +-
>>  arch/powerpc/platforms/pseries/htmdump.c  | 370 =
+++++++++++++++++++++-
>>  3 files changed, 475 insertions(+), 19 deletions(-)
>>  create mode 100644 Documentation/arch/powerpc/htm.rst
>>=20
> Hello Athira,
>=20
> I tried to apply this patch set on powerpc-next repo, but pacth 007 =
failed. Please refer the failure below.
>=20
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> --------------------------
> Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all: a
> Applying: powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate =
other htm operations
> Applying: powerpc/pseries/htmdump: Add htm configure support to =
htmdump module
> Applying: powerpc/pseries/htmdump: Add htm start support to htmdump =
module
> Applying: powerpc/pseries/htmdump: Add htm status support to htmdump =
module
> Applying: powerpc/pseries/htmdump: Add htm info support to htmdump =
module
> Applying: powerpc/pseries/htmdump: Add htm setup support to htmdump =
module
> Applying: powerpc/pseries/htmdump: Add htm flags support to htmdump =
module
> error: patch failed: arch/powerpc/platforms/pseries/htmdump.c:180
> error: arch/powerpc/platforms/pseries/htmdump.c: patch does not apply
> Patch failed at 0007 powerpc/pseries/htmdump: Add htm flags support to =
htmdump module
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am =
--abort=E2=80=9D.
Hi Venkat

Thanks for checking the patch series. I will be posting a V2 with =
changes soon to address above issue.

Thanks
Athira
>=20
>=20
> Regards,
>=20
> Venkat.



