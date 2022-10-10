Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8035F9DBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmH4Q73Gnz3dsN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:39:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lipqMK4/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lipqMK4/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmH3S51ncz3bhh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:38:12 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AAv9fh012323;
	Mon, 10 Oct 2022 11:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=dr6MZkLEoh7De6Bmemybv9K3SNG19brImsLFXJTfbos=;
 b=lipqMK4/boBAHN4TDncftRy6f+IuCn8rJqpYDfU1Xlf/pfcbrcWEfhXOAtVkKL0bJ14C
 oyvUukNm4zUQbS6s/GDq3MEX5jqTbMjBPQbTtSq3QbMHKyHQjN6EDwQYhdZoruDHATEg
 SDaQwInvYzaZK/nnvtI4/6Hrh0daWNcwDcOaSnofwJEvtbkhPkPIeS01M9ZB+QLO7YjP
 t/VDfoPYX2uol5jLZ5XJAoWpKX3clu8vuMGHxDgczUGr68xmx2Ha2tdI8PUU+xI+Btzi
 UU/YziO/X65o05VHief4ipV/28zK8r3T4A8oQGHPZgMJY44+sRN9/UN5apZXBsBrT5ec 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k6hj8gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:37:56 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29AAFQ7V020952;
	Mon, 10 Oct 2022 11:37:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k6hj8f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:37:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29ABbLAd009923;
	Mon, 10 Oct 2022 11:37:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3k30u9a05c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:37:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29ABbnP27996132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 11:37:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8E5A11C04A;
	Mon, 10 Oct 2022 11:37:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46D2E11C04C;
	Mon, 10 Oct 2022 11:37:48 +0000 (GMT)
Received: from localhost (unknown [9.43.23.98])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 11:37:48 +0000 (GMT)
Date: Mon, 10 Oct 2022 17:07:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 11/16] objtool: Add --mnop as an option to --mcount
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy <sv@linux.ibm.com>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
	<20221002104240.1316480-12-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-12-sv@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1665401725.d3dolquorh.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -H70vJzT512obIK1A6aY6opPudK67pRM
X-Proofpoint-GUID: MzPjmeL3yeYEcvqH2_LYpyU-ShlyUu1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_06,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100069
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, npiggin@gmail.com, jpoimboe@redhat.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
> Some architectures (powerpc) may not support ftrace locations being nop'e=
d
> out at build time. Introduce CONFIG_HAVE_OBJTOOL_NOP_MCOUNT for objtool, =
as
> a means for architectures to enable nop'ing of ftrace locations. Add --mn=
op
> as an option to objtool --mcount, to indicate support for the same.
>=20
> Also, make sure that --mnop can be passed as an option to objtool only wh=
en
> --mcount is passed.
>=20
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  Makefile                                |  4 +++-
>  arch/x86/Kconfig                        |  1 +
>  kernel/trace/Kconfig                    |  7 +++++++
>  scripts/Makefile.lib                    |  1 +
>  tools/objtool/builtin-check.c           | 14 ++++++++++++++
>  tools/objtool/check.c                   | 19 ++++++++++---------
>  tools/objtool/include/objtool/builtin.h |  1 +
>  7 files changed, 37 insertions(+), 10 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index a5e9d9388649..b2230ad14748 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -857,7 +857,9 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>    endif
>  endif
>  ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> -  CC_FLAGS_USING	+=3D -DCC_USING_NOP_MCOUNT
> +  ifdef CONFIG_HAVE_OBJTOOL_NOP_MCOUNT
> +    CC_FLAGS_USING	+=3D -DCC_USING_NOP_MCOUNT
> +  endif
>  endif
>  ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>    ifdef CONFIG_HAVE_C_RECORDMCOUNT
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index f9920f1341c8..2a79a05c4402 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -189,6 +189,7 @@ config X86
>  	select HAVE_CONTEXT_TRACKING_USER_OFFSTACK	if HAVE_CONTEXT_TRACKING_USE=
R
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
> +	select HAVE_OBJTOOL_NOP_MCOUNT		if HAVE_OBJTOOL_MCOUNT
>  	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 1052126bdca2..9c696cb24756 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -76,6 +76,13 @@ config HAVE_OBJTOOL_MCOUNT
>  	help
>  	  Arch supports objtool --mcount
>=20
> +config HAVE_OBJTOOL_NOP_MCOUNT
> +	bool
> +	help
> +	  Arch supports the objtool options --mcount with --mnop.
> +	  An architecture can select this if it wants to enable nop'ing
> +	  of ftrace locations.
> +
>  config HAVE_C_RECORDMCOUNT
>  	bool
>  	help
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fb6a99e78c4..ce14e3b8577f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -234,6 +234,7 @@ objtool_args =3D								\
>  	$(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=3Dnoinstr)		\
>  	$(if $(CONFIG_X86_KERNEL_IBT), --ibt)				\
>  	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)		\
> +	$(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 \

This still won't help: for instance, if CONFIG_FTRACE itself is=20
disabled. I think we should make this depend on=20
CONFIG_FTRACE_MCOUNT_USE_OBJTOOL. The below change works for me:

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 54d2d6451bdacc..fd3f55a1fdb7bb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -245,8 +245,8 @@ objtool_args =3D                                       =
                       \
        $(if $(CONFIG_HAVE_JUMP_LABEL_HACK), --hacks=3Djump_label)        \
        $(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=3Dnoinstr)              \
        $(if $(CONFIG_X86_KERNEL_IBT), --ibt)                           \
-       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)             \
-       $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 \
+        $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL),                       \
+             $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mcount --mnop, --mc=
ount)) \
        $(if $(CONFIG_UNWINDER_ORC), --orc)                             \
        $(if $(CONFIG_RETPOLINE), --retpoline)                          \
        $(if $(CONFIG_RETHUNK), --rethunk)                              \


- Naveen
