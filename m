Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A864B701A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 17:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JymjG0BjFz3cX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:28:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOclZRJg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sOclZRJg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JymhX27CHz3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 03:27:24 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FGDE1F001119; 
 Tue, 15 Feb 2022 16:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=yuJ33/IS3C8JmgqYKYRI7WGKiRlXun9JPd2/bJ+93WA=;
 b=sOclZRJgd7NDzOsSb2uU840Kwry0jw4kCuTeWrNB5Rja9fkxfT64FGzeYCwe0RhJ5AKS
 ySmme8nLWrCxoVaavRnmZAvyrkH8BIIZ6QPr1vpF2KN3t2zKCJSCI0Gv5pJI5AqlzSvK
 boUuO9Ep8Od6htYVlFtEPAyi8Na79tE1k3svbEFDZHhtDlp+u11ovagr5coTOOOlnZkf
 HUDthA4wkeZ81x3TRFhzVEs4yjLhgJF0QgDkkfD8e4z7cDUYVNenb4dEidard4jMOURK
 hBEEmRQqhJ70xhwsRbPSQ/f5cbVAL1H+0Ji493n4Rk2io31tvRP3NnOjyGJB2LhFMOGf xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8d9fvjff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:27:07 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FGDTLm009902;
 Tue, 15 Feb 2022 16:27:06 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8d9fvje5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:27:06 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FGC1EO007679;
 Tue, 15 Feb 2022 16:27:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3e64h9qrkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:27:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FGR1Tv24510740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 16:27:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61D3EAE045;
 Tue, 15 Feb 2022 16:27:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB164AE053;
 Tue, 15 Feb 2022 16:27:00 +0000 (GMT)
Received: from localhost (unknown [9.43.98.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 16:27:00 +0000 (GMT)
Date: Tue, 15 Feb 2022 21:56:59 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
 <20220215093849.556d5444@gandalf.local.home>
In-Reply-To: <20220215093849.556d5444@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644942378.byz0qymic3.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jrSZjNs8gbiYltKWnkGMOceFtwUtrkOd
X-Proofpoint-GUID: BBeV6KJeqsMu-XQ3oul3qIPY_5o_K6oZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1011 mlxlogscore=782
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150095
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Tue, 15 Feb 2022 19:06:48 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> As I understand it, the reason ftrace_get_regs() was introduced was to=20
>> be able to only return the pt_regs, if _all_ registers were saved into=20
>> it, which we don't do when coming in through ftrace_caller(). See the=20
>> x86 implementation (commit 02a474ca266a47 ("ftrace/x86: Allow for=20
>> arguments to be passed in to ftrace_regs by default"), which returns=20
>> pt_regs conditionally.
>=20
> I can give you the history of ftrace_caller and ftrace_regs_caller.
>=20
> ftrace_caller saved just enough as was denoted for gcc mcount trampolines=
.
> The new fentry which happens at the start of the function, whereas mcount
> happens after the stack frame is set up, may change the rules on some
> architectures.
>=20
> As for ftrace_regs_caller, that was created for kprobes. As the majority =
of
> kprobes were added at the start of the function, it made sense to hook in=
to
> ftrace as the ftrace trampoline call is much faster than taking a
> breakpoint interrupt. But to keep compatibility with breakpoint
> interrupts, we needed to fill in all the registers, and make it act just
> like a breakpoint interrupt.
>=20
> I've been wanting to record function parameters, and because the ftrace
> trampoline must at a minimum save the function parameters before calling
> the ftrace callbacks, all the information for those parameters were being
> saved but were never exposed to the ftrace callbacks. I created the the
> DYNAMIC_FTRACE_WITH_ARGS to expose them. I first just used pt_regs with
> just the parameters filled in, but that was criticized as it could be
> confusing where the non filled in pt_regs might be used and thinking they
> are legitimate. So I created ftrace_regs that would give you just the
> function arguments (if DYNAMIC_FTRACE_WITH_ARGS is defined), or it will
> give you a full pt_regs, if the caller came from the ftrace_regs_caller. =
If
> not, it will give you a NULL pointer.
>=20
> The first user to use the args was live kernel patching, as they only nee=
d
> that and the return pointer.

Thanks, that helps.

- Naveen

