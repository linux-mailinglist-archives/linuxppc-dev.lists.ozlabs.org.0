Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7261BD741
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:27:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bs7v65n4zDr3P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Brz21W3PzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 18:19:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T82AQq086670; Wed, 29 Apr 2020 04:19:33 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr7u0pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 04:19:33 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T8EnSZ024034;
 Wed, 29 Apr 2020 08:19:32 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 30mcu6k6kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 08:19:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03T8JVRl45285634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 08:19:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC309AC059;
 Wed, 29 Apr 2020 08:19:31 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4508AAC05F;
 Wed, 29 Apr 2020 08:19:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.76])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 08:19:29 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v6 0/4] powerpc/papr_scm: Add support for reporting
 nvdimm health
In-Reply-To: <20200420070711.223545-1-vaibhav@linux.ibm.com>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
Date: Wed, 29 Apr 2020 13:49:27 +0530
Message-ID: <87a72u1z74.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_02:2020-04-28,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004290062
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> The PAPR standard[1][3] provides mechanisms to query the health and
> performance stats of an NVDIMM via various hcalls as described in
> Ref[2].  Until now these stats were never available nor exposed to the
> user-space tools like 'ndctl'. This is partly due to PAPR platform not
> having support for ACPI and NFIT. Hence 'ndctl' is unable to query and
> report the dimm health status and a user had no way to determine the
> current health status of a NDVIMM.
>
> To overcome this limitation, this patch-set updates papr_scm kernel
> module to query and fetch nvdimm health stats using hcalls described
> in Ref[2].  This health and performance stats are then exposed to
> userspace via syfs and PAPR-nvDimm-Specific-Methods(PDSM) issued by
> libndctl.
>
> These changes coupled with proposed ndtcl changes located at Ref[4]
> should provide a way for the user to retrieve NVDIMM health status
> using ndtcl.
>
> Below is a sample output using proposed kernel + ndctl for PAPR NVDIMM
> in a emulation environment:
>
>  # ndctl list -DH
> [
>   {
>     "dev":"nmem0",
>     "health":{
>       "health_state":"fatal",
>       "shutdown_state":"dirty"
>     }
>   }
> ]
>
> Dimm health report output on a pseries guest lpar with vPMEM or HMS
> based nvdimms that are in perfectly healthy conditions:
>
>  # ndctl list -d nmem0 -H
> [
>   {
>     "dev":"nmem0",
>     "health":{
>       "health_state":"ok",
>       "shutdown_state":"clean"
>     }
>   }
> ]
>
> PAPR nvDimm-Specific-Methods(PDSM)
> ==================================
>
> PDSM requests are issued by vendor specific code in libndctl to
> execute certain operations or fetch information from NVDIMMS. PDSMs
> requests can be sent to papr_scm module via libndctl(userspace) and
> libnvdimm (kernel) using the ND_CMD_CALL ioctl command which can be
> handled in the dimm control function papr_scm_ndctl(). Current
> patchset proposes a single PDSM to retrieve NVDIMM health, defined in
> the newly introduced uapi header named 'papr_scm_pdsm.h'. Support for
> more PDSMs will be added in future.
>
> Structure of the patch-set
> ==========================
>
> The patchset starts with implementing support for fetching nvdimm health
> information from PHYP and partially exposing it to user-space via a nvdimm
> sysfs flag.
>
> Second & Third patches deal with implementing support for servicing PDSM
> commands in papr_scm module.
>
> Finally the Fourth patch implements support for servicing PDSM
> 'PAPR_SCM_PDSM_HEALTH' that returns the nvdimm health information to
> libndctl.

You can add to the series.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

-aneesh
