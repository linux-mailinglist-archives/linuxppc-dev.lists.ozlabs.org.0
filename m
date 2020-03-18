Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2D189B83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 13:02:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j7vs3VPgzDqwv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j7sL4g0JzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 23:00:38 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IBY1EH112141
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:00:36 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu861pexg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:00:36 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <atrajeev@linux.vnet.ibm.com>;
 Wed, 18 Mar 2020 12:00:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 12:00:32 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IC0VKB459166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 12:00:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A1B942042;
 Wed, 18 Mar 2020 12:00:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B95304203F;
 Wed, 18 Mar 2020 12:00:29 +0000 (GMT)
Received: from [9.85.83.216] (unknown [9.85.83.216])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Mar 2020 12:00:29 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] powerpc/perf: Use SIER_USER_MASK while updating
 SPRN_SIER for EBB events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200313180642.GV22482@gate.crashing.org>
Date: Wed, 18 Mar 2020 17:30:27 +0530
Content-Transfer-Encoding: quoted-printable
References: <1584121747-6213-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200313180642.GV22482@gate.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20031812-0028-0000-0000-000003E6DED8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031812-0029-0000-0000-000024AC36A5
Message-Id: <6C6B069A-4664-4046-990F-6B3D16F107EA@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_05:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003180058
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13-Mar-2020, at 11:36 PM, Segher Boessenkool =
<segher@kernel.crashing.org> wrote:
>=20
> On Fri, Mar 13, 2020 at 01:49:07PM -0400, Athira Rajeev wrote:
>> Sampled instruction address register (SIER), is a PMU register,
>=20
> SIER stands for "Sampled Instruction Event Register", instead.  With =
that
> change, your patch is totally clear :-)
>=20

Hi Segher,

Thanks for reviewing. My bad. I am sending a V3 with the register name =
corrected in the commit message.

Athira=20

>=20
> Segher

