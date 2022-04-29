Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B065154A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 21:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqjN76hb3z3bcl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 05:33:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ha+HeItJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ha+HeItJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqjMP3cBtz2xnR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 05:33:20 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23THBoiH013291;
 Fri, 29 Apr 2022 19:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vDWU27AKQEo+oH1UUdtPi7S1oftQMcr2YMRcrvYvg6Y=;
 b=Ha+HeItJqD/hLvxIfUIm85LpIh46wsIxbzYkIoMiJxamVDtjZVGw0TVKrjMmYyREqPD5
 +sgAKWm32g2m3OxTx/OmNp77x96xojUEJwOzF2L/vAQDTkrzPd+PNhmYb+sM9B4ZtVn3
 E9SsCiyieZCx5Bz8YADOlP+jHc89QLxz8ZlaYilwLC7sjZuZIodoQSB+pZqbLvox7Qt4
 F1YuO8SJrj9y/Vp7ut4c5z+kx/+FcKYeLtZTtrZ381oRb/rdgt7cZc/dyGCilYu9jsmB
 dOgyjkYyHOMSAcHEXWn27maYbfgSxNv9zU0aRdhH7cj2k3WK9AVhJawO409x/wKtA/AW SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fr27h871g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 19:33:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23TJDOQV028169;
 Fri, 29 Apr 2022 19:33:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fr27h8715-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 19:33:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23TJX0wP022750;
 Fri, 29 Apr 2022 19:33:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3fm9391j12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 19:33:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23TJXCnj26476904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 19:33:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1021342045;
 Fri, 29 Apr 2022 19:33:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A2F642041;
 Fri, 29 Apr 2022 19:33:03 +0000 (GMT)
Received: from localhost (unknown [9.43.18.217])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 19:33:03 +0000 (GMT)
Date: Sat, 30 Apr 2022 01:03:01 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] ftrace: recordmcount: Handle sections with no
 non-weak symbols
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
 <126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220428184212.18fbf438@gandalf.local.home>
 <1651252324.js9790ngjg.naveen@linux.ibm.com>
 <20220429135916.47c3e623@gandalf.local.home>
In-Reply-To: <20220429135916.47c3e623@gandalf.local.home>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1651257788.xtscezsfky.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5IRCrmEecLVBqTwYK1etJSIMvr9ZJZ8s
X-Proofpoint-GUID: c1YO3hElOo7wYmNNZFeFbyj3webXVoOo
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_09,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=299
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290103
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Fri, 29 Apr 2022 23:09:19 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> If I'm understanding your suggestion right:
>> - we now create a new section in each object file: __mcount_loc_weak,=20
>>   and capture such relocations using weak symbols there.
>=20
> Yes, but it would be putting the same information it puts into __mcount_l=
oc
> but also add it here too. That is, it will duplicate the data.
>=20
>> - we then ask the linker to put these separately between, say,=20
>>   __start_mcount_loc_weak and __stop_mcount_loc_weak
>=20
> Yes, but it will also go in the location between __start_mcount_loc and
> __stop_mcount_loc.
>=20
>> - on ftrace init, we go through entries in this range, but discard those=
=20
>>   that belong to functions that also have an entry between=20
>>   __start_mcount_loc and __stop_mcount loc.
>=20
> But we should be able to know if it was overridden or not, by seeing if
> there's another function that was called. Or at least, we can validate th=
em
> to make sure that they are correct.
>=20
>>=20
>> The primary issue I see here is that the mcount locations within the new=
=20
>> weak section will end up being offsets from a different function in=20
>> vmlinux, since the linker does not create a symbol for the weak=20
>> functions that were over-ridden.
>=20
> The point of this section is to know which functions in __mcount_loc may
> have been overridden, as they would be found in the __mcount_loc_weak
> section. And then we can do something "special" to them.

I'm not sure I follow that. How are you intending to figure out which=20
functions were overridden by looking at entries in the __mcount_loc_weak=20
section?

In the final vmlinux image, we only get offsets into .text for all=20
mcount locations, but no symbol information. The only hint is the fact=20
that a single kallsym symbol has multiple mcount locations within it.=20
Even then, the symbol with duplicate mcount entries won't be the=20
function that was overridden.

We could do a kallsyms_lookup() on each entry and consult the=20
__mcount_loc_weak section to identify duplicates, but that looks to be=20
very expensive.

Did you have a different approach in mind?

>=20
>>=20
>> As an example, in the issue described in this patch set, if powerpc=20
>> starts over-riding kexec_arch_apply_relocations(), then the current weak=
=20
>> implementation in kexec_file.o gets carried over to the final vmlinux,=20
>> but the instructions will instead appear under the previous function in=
=20
>> kexec_file.o: crash_prepare_elf64_headers(). This function may or may=20
>> not be traced to begin with, so we won't be able to figure out if this=20
>> is valid or not.
>=20
> If it was overridden, then there would be two entries for function that
> overrides the weak function in the __mcount_loc section, right? One for t=
he
> new function, and one that was overridden.

In the final vmlinux, we will have two entries: one pointing at the=20
correct function, while the other will point to some other function=20
name. So, at least from kallsym perspective, duplicate mcount entries=20
won't be for the function that was overridden, but some arbitrary=20
function that came before the weak function in the object file.

> Of course this could be more
> complex if the new function had been marked notrace.
>=20
> I was thinking of doing this just so that we know what functions are weak
> and perhaps need extra processing.
>=20
> Another issue with weak functions and ftrace just came up here:
>=20
>   https://lore.kernel.org/all/20220428095803.66c17c32@gandalf.local.home/

I noticed this just yesterday:

  # cat available_filter_functions | sort | uniq -d | wc -l
  430

I'm fairly certain that some of those are due to weak functions -- I=20
just wasn't sure if all of those were.

I suppose this will now also be a problem with ftrace_location(), given=20
that it was recently changed to look at an entire function for mcount=20
locations?


Thanks,
Naveen
