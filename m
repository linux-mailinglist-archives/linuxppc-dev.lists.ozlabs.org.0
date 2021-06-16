Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B131A3A9845
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 12:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4hwF32jgz3byn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 20:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E8R7gVXJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E8R7gVXJ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4hvk0vGrz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 20:56:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GAlEC3034749; Wed, 16 Jun 2021 06:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=80KjtjTCJSGCl+N545fzlhHnYfVsW8UWSAcxhsaSRJ0=;
 b=E8R7gVXJz6Glv55HFAbiE4K+zDLuCrutJjqHexG7JbLyYymbCdL6IGFm17J5FHxR9Cna
 HyjLNwIvVPon1YfQL2VjSC31PXXY8RoVL2UVN3JMvRslXF65LGrWNTzp/k4Eh6+RC/Nm
 I9UfWua1SXWhRGr97SRfdk7orOzwhdnpaP2BdxPRIKYtQbwKS1Fg2NjnSvOtUS1LpiU7
 NnKt8BkWpXe4QmHlrekAyrKlnHVJ6BcdPEHoXknfw2nILlp8c2mIuFRPd508kAV8P3HC
 MbTTcyTaeWzAeVoThUPWwGt8G8JVEnUVud4N9aG6Tc8GN9j8aEsVVYAy104cR9SELWAH AA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397fuv05ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 06:55:10 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GAl5qt017422;
 Wed, 16 Jun 2021 10:55:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 394mj8t1a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 10:55:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GAt4Et35324226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 10:55:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3195A405B;
 Wed, 16 Jun 2021 10:55:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 887DFA4065;
 Wed, 16 Jun 2021 10:55:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.207.60])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Jun 2021 10:55:02 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 0/4] Add perf interface to expose nvdimm
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20210614052326.285710-1-kjain@linux.ibm.com>
Date: Wed, 16 Jun 2021 16:25:00 +0530
Message-Id: <B216F74B-8542-4363-8A82-1E392D9C5929@linux.ibm.com>
References: <20210614052326.285710-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N3X1kf_xO5sUaZH9i8ADFlbD9voIdr47
X-Proofpoint-GUID: N3X1kf_xO5sUaZH9i8ADFlbD9voIdr47
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106160060
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
Cc: nvdimm@lists.linux.dev, santosh@fossix.org, maddy@linux.vnet.ibm.com,
 ira.weiny@intel.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, aneesh.kumar@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Jun-2021, at 10:53 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Patchset adds performance stats reporting support for nvdimm.
> Added interface includes support for pmu register/unregister
> functions. A structure is added called nvdimm_pmu to be used for
> adding arch/platform specific data such as supported events, cpumask
> pmu event functions like event_init/add/read/del.
> User could use the standard perf tool to access perf
> events exposed via pmu.
>=20
> Added implementation to expose IBM pseries platform nmem*
> device performance stats using this interface.
> ...
>=20
> Patch1:
>        Introduces the nvdimm_pmu structure
> Patch2:
> 	Adds common interface to add arch/platform specific data
> 	includes supported events, pmu event functions. It also
> 	adds code for cpu hotplug support.
> Patch3:
>        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>        nmem* pmu. It fills in the nvdimm_pmu structure with event attrs
>        cpumask andevent functions and then registers the pmu by adding
>        callbacks to register_nvdimm_pmu.
> Patch4:
>        Sysfs documentation patch

Tested with the following scenarios:
1. Check dmesg for nmem PMU registered messages.
2. Listed nmem events using 'perf list and perf list nmem'
3. Ran 'perf stat' with single event, grouping events, events from same pmu,
   different pmu and invalid events
4. Read from sysfs files, Writing in to sysfs files
5. While running nmem events with perf stat, offline cpu from the nmem?/cpu=
mask

While running the above functionality worked as expected, no error messages=
 seen
in dmesg.

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

>=20
> Changelog
> ---
> PATCH v1 -> PATCH v2
> - Fix hotplug code by adding pmu migration call
>  incase current designated cpu got offline. As
>  pointed by Peter Zijlstra.
>=20
> - Removed the retun -1 part from cpu hotplug offline
>  function.
>=20
> - Link to the previous patchset : https://lkml.org/lkml/2021/6/8/500
> ---
> Kajol Jain (4):
>  drivers/nvdimm: Add nvdimm pmu structure
>  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>  powerpc/papr_scm: Add perf interface support
>  powerpc/papr_scm: Document papr_scm sysfs event format entries
>=20
> Documentation/ABI/testing/sysfs-bus-papr-pmem |  31 ++
> arch/powerpc/include/asm/device.h             |   5 +
> arch/powerpc/platforms/pseries/papr_scm.c     | 365 ++++++++++++++++++
> drivers/nvdimm/Makefile                       |   1 +
> drivers/nvdimm/nd_perf.c                      | 230 +++++++++++
> include/linux/nd.h                            |  46 +++
> 6 files changed, 678 insertions(+)
> create mode 100644 drivers/nvdimm/nd_perf.c
>=20
Thanks and Regards,
R.Nageswara Sastry

>=20

