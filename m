Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9317DD7B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 11:26:38 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bZC01DJNzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 21:26:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bZ8f54sLzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 21:24:29 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029AKr92034322
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:24:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8n7103u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 06:24:27 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 029ALwGd037926
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:24:26 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8n7102u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 06:24:26 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 029ALSU8028225;
 Mon, 9 Mar 2020 10:24:25 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 2ym3869gmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 10:24:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029AOMp913500740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 10:24:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CC18BE051;
 Mon,  9 Mar 2020 10:24:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E512BE04F;
 Mon,  9 Mar 2020 10:24:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.204.201.20])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 10:24:19 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/8] powerpc/papr_scm: Provide support for fetching dimm
 health information
In-Reply-To: <20200220095805.197229-3-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
 <20200220095805.197229-3-vaibhav@linux.ibm.com>
Date: Mon, 09 Mar 2020 15:54:18 +0530
Message-ID: <87d09lzuzx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=809 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090074
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Implement support for fetching dimm health information via
> H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair of
> 64-bit big-endian integers which are then stored in 'struct
> papr_scm_priv' and subsequently exposed to userspace via dimm
> attribute 'papr_flags'.

Can you  add this as part of PATCH 1. While reviewing i had to go back
and forth between 1 and 2 to find different flags. IMHO it would be nice
to introduce new flags and users of the flag together. 
>
> 'papr_flags' sysfs attribute reports space separated string flags
> indicating various health state an nvdimm can be. These are:
>
> * "not_armed" 	: Indicating that nvdimm contents wont survive a power
>   		  cycle.
> * "save_fail" 	: Indicating that nvdimm contents couldn't be flushed
> 		  during last shutdown event.
> * "restore_fail": Indicating that nvdimm contents couldn't be restored
> 		  during dimm initialization.
> * "encrypted" 	: Dimm contents are encrypted.
> * "smart_notify": There is health event for the nvdimm.

Can you explain this more? This is suppose to be set when there is a
smart event? Currently you derive this based on

+/* Bit status indicators for smart event notification */
+#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
+					   PAPR_SCM_DIMM_HEALTH_FATAL | \
+					   PAPR_SCM_DIMM_HEALTH_UNHEALTHY | \
+


> * "scrubbed" 	: Indicating that contents of the nvdimm have been
>   		  scrubbed.
> * "locked"	: Indicating that nvdimm contents cant be modified
>   		  until next power cycle.
>
> [1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
> PAPR hcalls")
>


-aneesh
