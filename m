Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF83555E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 19:31:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YCrJ5sBGzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 03:31:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YCpC289qzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 03:29:38 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PHRLOV039205
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 13:29:35 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbnrbpqj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 13:29:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5PHTVpC017418
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:29:34 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2t9by6snpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:29:34 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PHTXhQ41943530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:29:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C3C6124053;
 Tue, 25 Jun 2019 17:29:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E1A124052;
 Tue, 25 Jun 2019 17:29:33 +0000 (GMT)
Received: from localhost (unknown [9.85.210.126])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 17:29:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Juliet Kim <julietk@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
In-Reply-To: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
References: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
Date: Tue, 25 Jun 2019 12:29:32 -0500
Message-ID: <87a7e5tvyb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=876 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250131
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
Cc: linuxppc-dev@lists.ozlabs.org, mmc@linux.vnet.ibm.com, mwb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Juliet Kim <julietk@linux.vnet.ibm.com> writes:
> The commit
> (=E2=80=9Cpowerpc/rtas: Fix a potential race between CPU-Offline & Migrat=
ion)
> attempted to fix a hang in Live Partition Mobility(LPM) by abandoning
> the LPM attempt if a race between LPM and concurrent CPU offline was
> detected.
>
> However, that fix failed to notify Hypervisor that the LPM attempted
> had been abandoned which results in a system hang.

It is surprising to me that leaving a migration unterminated would cause
Linux to hang. Can you explain more about how that happens?


> Fix this by sending a signal PHYP to cancel the migration, so that PHYP
> can stop waiting, and clean up the migration.

This is well-spotted and rtas_ibm_suspend_me() needs to signal
cancellation in several error paths. But I don't agree that this is one
of them: this race is going to be a temporary condition in any
production setting, and retrying would allow the migration to succeed.
