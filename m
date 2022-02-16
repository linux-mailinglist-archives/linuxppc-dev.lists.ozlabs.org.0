Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DD4B8869
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:05:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJ9R4CBfz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flFbjfQM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=flFbjfQM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJ8Q5kGkz3cNV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:04:54 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GC9lss011858; 
 Wed, 16 Feb 2022 13:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=HTeTP7s9CVxgPA/uFLEsh16EKzu/vOHVfs1RR/JoGIU=;
 b=flFbjfQMIGBjTd1tngp9Bb+OXMoUTEV7r89h9HfWKfk3Mwwa3ICuaO1PHaV8KgdHPBLj
 4C6ahX4FrwogrRI353CBZS2103X4JtPYJQ06QkA42yjEe/4pXNMj47D8BnEkNHZzhXU/
 P0l7nhuUcLxiNwI2t7j2wTef7Ut2j116LnIERIqwL69RG86K8z7GWbnZ7xrpfDgMhvvE
 qFFERXfOH/rlxJmCEoCjIOPHkJXn2YT92mfQyK/0r94AQLOBTLCGuCgzW2Ki6SJYvZd+
 o6SQbu9G470mf7nZ5rT+ipysC1CFuvf6CCZaWkPxzBi2VGTjBQpPVCKgO4W6kVy+Ddfw ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e90m89yts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:04:28 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GCNmsu031651;
 Wed, 16 Feb 2022 13:04:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e90m89ys9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:04:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GCwhg2023855;
 Wed, 16 Feb 2022 13:04:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha8rer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:04:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GD4Kaw22544866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 13:04:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA2B2AE05F;
 Wed, 16 Feb 2022 13:04:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25A2BAE04D;
 Wed, 16 Feb 2022 13:04:20 +0000 (GMT)
Received: from osiris (unknown [9.145.42.237])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Feb 2022 13:04:20 +0000 (GMT)
Date: Wed, 16 Feb 2022 14:04:18 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Message-ID: <Ygz2Upu+5NiEAsDT@osiris>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
 <6dc50f09-4d14-afa2-d2a1-34b72b880edf@csgroup.eu>
 <5c7b5334-6071-f131-a509-9a49ca3d628c@csgroup.eu>
 <1644941712.lqdstzo09z.naveen@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644941712.lqdstzo09z.naveen@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xPfWe2a9CZ_zddfnzSkHHE_CQIy1muU3
X-Proofpoint-GUID: WgAt7YbUyY2z7YRGFwu0IoOj3LTfHs3H
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_06,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160076
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
 Vasily Gorbik <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 09:55:52PM +0530, Naveen N. Rao wrote:
> > > > > > > I think this is wrong. We need to differentiate
> > > > > > > between ftrace_caller() and ftrace_regs_caller()
> > > > > > > here, and only return pt_regs if coming in through
> > > > > > > ftrace_regs_caller() (i.e., FL_SAVE_REGS is set).
> > > > > > 
> > > > > > Not sure I follow you.
> > > > > > 
> > > > > > This is based on 5740a7c71ab6 ("s390/ftrace: add
> > > > > > HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
> > > > > > 
> > > > > > It's all the point of HAVE_DYNAMIC_FTRACE_WITH_ARGS,
> > > > > > have the regs also with ftrace_caller().
> > > > > > 
> > > > > > Sure you only have the params, but that's the same on
> > > > > > s390, so what did I miss ?
> 
> Steven has explained the rationale for this in his other response:
> https://lore.kernel.org/all/20220215093849.556d5444@gandalf.local.home/

Thanks for this pointer, this clarifies a couple of things!

> > > > It looks like s390 is special since it apparently saves all
> > > > registers even for ftrace_caller:
> > > > https://lore.kernel.org/all/YbipdU5X4HNDWIni@osiris/
> > > 
> > > It is not what I understand from their code, see https://elixir.bootlin.com/linux/v5.17-rc3/source/arch/s390/kernel/mcount.S#L37
> > > 
> > > 
> > > They have a common macro called with argument 'allregs' which is set
> > > to 0 for ftrace_caller() and 1 for ftrace_regs_caller().
> > > When allregs == 1, the macro seems to save more.
> > > 
> > > But ok, I can do like x86, but I need a trick to know whether
> > > FL_SAVE_REGS is set or not, like they do with fregs->regs.cs
> > > Any idea what the condition can be for powerpc ?
> 
> We'll need to explicitly zero-out something in pt_regs in ftrace_caller().
> We can probably use regs->msr since we don't expect it to be zero when saved
> from ftrace_regs_caller().
> > 
> > Finally, it looks like this change is done  via commit 894979689d3a
> > ("s390/ftrace: provide separate ftrace_caller/ftrace_regs_caller
> > implementations") four hours the same day after the implementation of
> > arch_ftrace_get_regs()
> > 
> > They may have forgotten to change arch_ftrace_get_regs() which was added
> > in commit 5740a7c71ab6 ("s390/ftrace: add HAVE_DYNAMIC_FTRACE_WITH_ARGS
> > support") with the assumption that ftrace_caller and ftrace_regs_caller
> > where identical.
> 
> Indeed, good find!

Thank you for bringing this up!

So, the in both variants s390 provides nearly identical data. The only
difference is that for FL_SAVE_REGS the program status word mask is
missing; therefore it is not possible to figure out the condition code
or if interrupts were enabled/disabled.

Vasily, Sven, I think we have two options here:

- don't provide sane psw mask contents at all and say (again) that
  ptregs contents are identical

- provide (finally) a full psw mask contents using epsw, and indicate
  validity with a flags bit in pt_regs

I would vote for the second option, even though epsw is slow. But this
is about the third or fourth time this came up in different
contexts. So I'd guess we should go for the slow but complete
solution. Opinions?
