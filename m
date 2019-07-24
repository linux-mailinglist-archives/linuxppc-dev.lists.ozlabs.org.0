Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD672C12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 12:07:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45trcz5MTBzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 20:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45trYb20ctzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 20:04:51 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O9wjsY145219
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 06:04:48 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2txj7mynwa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 06:04:48 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 24 Jul 2019 11:04:46 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 11:04:44 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6OA4hYS57213100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 10:04:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAAD711C04A;
 Wed, 24 Jul 2019 10:04:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5279D11C050;
 Wed, 24 Jul 2019 10:04:42 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.139])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 10:04:42 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 0/4] powerpc/papr_scm: Workaround for failure of drc
 bind after kexec
In-Reply-To: <20190723161357.26718-1-vaibhav@linux.ibm.com>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
Date: Wed, 24 Jul 2019 15:34:40 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19072410-0016-0000-0000-00000295A531
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072410-0017-0000-0000-000032F39947
Message-Id: <8736ivn3yf.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=768 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240109
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Presently an error is returned in response to hcall H_SCM_BIND_MEM when a
> new kernel boots on lpar via kexec. This prevents papr_scm from registering
> drc memory regions with nvdimm. The error reported is of the form below:
>
> "papr_scm ibm,persistent-memory:ibm,pmemory@44100002: bind err: -68"
>
> On investigation it was revealed that phyp returns this error as previous
> kernel did not completely release bindings for drc scm-memory blocks and
> hence phyp rejected request for re-binding these block to lpar with error
> H_OVERLAP. Also support for a new H_SCM_UNBIND_ALL is recently added which
> is better suited for releasing all the bound scm-memory block from an lpar.
>
> So leveraging new hcall H_SCM_UNBIND_ALL, we can workaround H_OVERLAP issue
> during kexec by forcing an unbind of all drm scm-memory blocks and issuing
> H_SCM_BIND_MEM to re-bind the drc scm-memory blocks to lpar. This sequence
> will also be needed when a new kernel boot on lpar after previous kernel
> panicked and it never got an opportunity to call H_SCM_UNBIND_MEM/ALL.
>
> Hence this patch-set implements following changes to papr_scm module:
>
> * Update hvcall.h to include opcodes for new hcall H_SCM_UNBIND_ALL.
>
> * Update it to use H_SCM_UNBIND_ALL instead of H_SCM_UNBIND_MEM
>
> * In case hcall H_SCM_BIND_MEM fails with error H_OVERLAP, force
>   H_SCM_UNBIND_ALL and retry the bind operation again.
>

You can add for the series.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

