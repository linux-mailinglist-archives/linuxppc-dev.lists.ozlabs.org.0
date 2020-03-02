Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A01760E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 18:19:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WRhH3SqbzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 04:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WRfL503BzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 04:17:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022Gxc2O011729
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 12:17:28 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmwveh8g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 12:17:27 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Mon, 2 Mar 2020 17:17:25 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 17:17:21 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022HHK3l54722608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 17:17:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35E3A4051;
 Mon,  2 Mar 2020 17:17:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EC02A404D;
 Mon,  2 Mar 2020 17:17:20 +0000 (GMT)
Received: from localhost (unknown [9.199.48.41])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 17:17:20 +0000 (GMT)
Date: Mon, 02 Mar 2020 22:47:18 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: eh_frame confusion
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Segher Boessenkool
 <segher@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <20200302124442.GI22482@gate.crashing.org>
In-Reply-To: <20200302124442.GI22482@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20030217-0012-0000-0000-0000038C5B92
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030217-0013-0000-0000-000021C90F71
Message-Id: <1583169014.zvau4om8mi.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_06:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=879
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020115
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool wrote:
> On Mon, Mar 02, 2020 at 11:56:05AM +0100, Rasmus Villemoes wrote:
>> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
>> to gcc-8 all object files now end up having .eh_frame section.
>=20
> Since GCC 8, we enable -fasynchronous-unwind-tables by default for
> PowerPC.  See https://gcc.gnu.org/r259298 .
>=20
>> For
>> vmlinux, that's not a problem, because they all get discarded in
>> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
>> modules, which doesn't seem to be useful - given that everything worked
>> just fine with gcc-7, and I don't see anything in the module loader that
>> handles .eh_frame.
>=20
> It is useful for debugging.  Not many people debug the kernel like this,
> of course.

I'm trying to understand if we need that. Other architectures seems to=20
pass -fasynchronous-unwind-tables only for the vdso, but disable it for=20
the kernel build. I suppose we can do the same.

If using -fno-asynchronous-unwind-tables, would crash/perf have=20
problems?

- Naveen

