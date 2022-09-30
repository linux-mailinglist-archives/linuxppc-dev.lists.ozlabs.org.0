Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B416E5F09E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 13:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf77M18Mrz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 21:20:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBo5TJVN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBo5TJVN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf76j0wnWz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 21:19:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UB3rgk024496;
	Fri, 30 Sep 2022 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Eop4GWIL5Ur8UXdHEOvM66wr9/qvCtga3lQOp6migII=;
 b=OBo5TJVNWSp50+KMbme381X7WzNtmCoYblPgqx1F9fQPSxSKo2jQWBiO8pD0Iq6HRi2n
 7vmx7FWdsHXgpGDnpu1rLjB/jso5zEKb0KfRLtK1AEr0N6K6Km3m86ShgLGnq4QA/luu
 Y9hcEr/pkSVIG+GX/Ogg4juSv0FGWdKnWXQ4OMIwFAtlDGzwz2QqeRW6zOrNbbKdxhpX
 UxFRUwWO5CsaMUnbptN7SvQyDGp486bXkQZfRuQ3L3uPEx6uE8UxNAjd4+NqYwlj4lSH
 /e/CsKily6mNjvs8W9zvF6uyNMm+PtQGCcPLKt1WUIFQZV1xsdDt8eEW2J6bdNEiHAV2 nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwy8jrkkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:25 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UB4C3L027217;
	Fri, 30 Sep 2022 11:19:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwy8jrkjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UB5oKj002429;
	Fri, 30 Sep 2022 11:19:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3juapunnqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28UBJKxP66453818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Sep 2022 11:19:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A8544203F;
	Fri, 30 Sep 2022 11:19:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7ED742042;
	Fri, 30 Sep 2022 11:19:19 +0000 (GMT)
Received: from localhost (unknown [9.43.5.151])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 30 Sep 2022 11:19:19 +0000 (GMT)
Date: Fri, 30 Sep 2022 15:39:53 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] scripts/faddr2line: Fix regression in name resolution on
 ppc64le
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Srikar Dronamraju
	<srikar@linux.vnet.ibm.com>
References: <20220927075211.897152-1-srikar@linux.vnet.ibm.com>
	<YzLcPZYTWXfrU+K4@quatroqueijos.cascardo.eti.br>
In-Reply-To: <YzLcPZYTWXfrU+K4@quatroqueijos.cascardo.eti.br>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1664532445.32klbp0ljq.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BLBe54vgZJL6yXf3vSYFMt9ys6rmmWUd
X-Proofpoint-GUID: 16NZPExF-_LPigaldjwDhBCrqImTkMBj
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=782 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300070
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thadeu Lima de Souza Cascardo wrote:
> On Tue, Sep 27, 2022 at 01:22:11PM +0530, Srikar Dronamraju wrote:
>> Commit 1d1a0e7c5100 ("scripts/faddr2line: Fix overlapping text section f=
ailures")
>> can cause scripts/faddr2line to fail on ppc64le machines on few
>> distributions, while working on other distributions. The failure can be
>> attributed to difference in readelf output on various distributions.
>>=20
>> $ ./scripts/faddr2line vmlinux find_busiest_group+0x00
>> no match for find_busiest_group+0x00
>>=20
>> Expected output was:
>> $ ./scripts/faddr2line vmlinux find_busiest_group+0x00
>> find_busiest_group+0x00/0x3d0:
>> find_busiest_group at kernel/sched/fair.c:9595
>>=20
>> On ppc64le, readelf adds localentry tag before the symbol name on few
>> distributions and adds the localentry tag after the symbol name on few
>> other distributions. This problem has been discussed in the reference
>> URL given below. This problem can be overcome by filtering out
>> localentry tags in readelf output. Similar fixes are already present in
>> kernel by way of commits:
>>=20
>> 1fd6cee127e2 ("libbpf: Fix VERSIONED_SYM_COUNT number parsing")
>> aa915931ac3e ("libbpf: Fix readelf output parsing for Fedora")
>>=20
>> Fixes: 1d1a0e7c5100 ("scripts/faddr2line: Fix overlapping text section f=
ailures")
>> Reference: https://lore.kernel.org/bpf/20191211160133.GB4580@calabresa/
>> Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
>> Cc: Jiri Olsa <jolsa@kernel.org>
>> Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>=20
> Reviewed-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>=20
> The other instances of readelf --wide on faddr2line use --section-headers=
 and
> should not required the same mangling.

There's one usage of readelf with --file-header in faddr2line which also=20
doesn't need this. The extra information being printed is from st_other=20
and is very specific to the symbol table.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

