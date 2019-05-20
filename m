Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66622F98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 10:59:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tB84L1CzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 18:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456t8D6dnhzDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 18:57:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K8rTIH147075
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 04:57:46 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2skr2gb3px-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 04:57:45 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 20 May 2019 09:57:43 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 09:57:42 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4K8vfca57606158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 08:57:41 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1910011C058;
 Mon, 20 May 2019 08:57:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EAD311C04C;
 Mon, 20 May 2019 08:57:40 +0000 (GMT)
Received: from localhost (unknown [9.199.34.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 08:57:40 +0000 (GMT)
Date: Mon, 20 May 2019 14:27:38 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] powerpc/ftrace: Additionally nop out the
 preceding mflr with -mprofile-kernel
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
References: <cover.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <ee2a5457d98850f51bf96eb17389b375e6955bbf.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <1558144594.f92d1rcmes.astroid@bobo.none>
In-Reply-To: <1558144594.f92d1rcmes.astroid@bobo.none>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19052008-0012-0000-0000-0000031D825E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052008-0013-0000-0000-000021562DB8
Message-Id: <1558342515.q6rtkeahk8.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200065
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> Naveen N. Rao's on May 18, 2019 5:02 am:
>> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' to
>> enable function tracing and profiling. So far, with dynamic ftrace, we
>> used to only patch out the branch to _mcount(). However, Nick Piggin
>> points out that "mflr is executed by the branch unit that can only
>> execute one per cycle on POWER9 and shared with branches, so it would be
>> nice to avoid it where possible."
>>=20
>> We cannot simply nop out the mflr either. Michael Ellerman pointed out
>> that when enabling function tracing, there can be a race if tracing is
>> enabled when some thread was interrupted after executing a nop'ed out
>> mflr. In this case, the thread would execute the now-patched-in branch
>> to _mcount() without having executed the preceding mflr.
>>=20
>> To solve this, we now enable function tracing in 2 steps: patch in the
>> mflr instruction, use synchronize_rcu_tasks() to ensure all existing
>> threads make progress, and then patch in the branch to _mcount(). We
>> override ftrace_replace_code() with a powerpc64 variant for this
>> purpose.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
> Nice! Thanks for doing a real patch. You needn't add my SOB there: my
> hack was obviously garbage :) Suggested-by if anything, then for
> clarity of changelog you can write the motivation directly rather than
> quote me.

Thanks, I meant to call out the fact that I had added your SOB before
sending the patch, but missed doing so. Your patch was perfectly fine ;)

>=20
> I don't know the ftrace subsystem well, but the powerpc instructions
> and patching sequence appears to match what we agreed is the right way
> to go.
>=20
> As a suggestion, I would perhaps add most of information from the
> second and third paragraphs of the changelog into comments
> (and also explain that the lone mflr r0 is harmless).
>=20
> But otherwise it looks good
>=20
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks, I will incorporate those changes.


- Naveen

=

