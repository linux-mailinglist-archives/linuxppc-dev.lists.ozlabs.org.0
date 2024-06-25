Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E213916696
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 13:49:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LfQ9I13T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7jmK0P9jz3d28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 21:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LfQ9I13T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7jlc0RT3z30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 21:48:43 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PBaHn4000691;
	Tue, 25 Jun 2024 11:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=W
	ICUOPn6G8vaIEnI5sjdZgE7qeNqV5Cn8Hfz1bsE0NU=; b=LfQ9I13T3l0ZpsRrX
	3Yf13itfYwyPr0MwnJK+JFnWz7iQ2C1HbZkNlMpGBoN9WmarIqrGPboQddClUyFE
	tpoJEg8ShxUB1V5VoBKO109UOKMVbp4e2V1rnH9aAWnTSHDGLIpuuLTvDdtbor6I
	akEtRToF5iROjzj9dxzKAjGFm5d8Y03Sm7yMit2JwwfOu8lKlnGcGFDFiXxb7E2q
	2kSbF+udQD3pscvaebgjxNXaKMsMR+bnAgnn9okjrbduGurKF3KlBb0+0/C5zSd4
	xuCOZZBXnXOqDExekPmHefJCc9KmbbyBTZ1WmfYao0zYDhAhW9X78kJDOomIvCYL
	4cXvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyw22016v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45PBmVj3017340;
	Tue, 25 Jun 2024 11:48:31 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyw22016r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45PAWAdv018093;
	Tue, 25 Jun 2024 11:48:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yx8xu6c73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45PBmP2M46465520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 11:48:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68B1B2004B;
	Tue, 25 Jun 2024 11:48:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA48420040;
	Tue, 25 Jun 2024 11:48:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.30.249])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jun 2024 11:48:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [V4 01/16] tools/perf: Move the data structures related to
 register type to header file
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZnpShR7zd9cVdxSj@google.com>
Date: Tue, 25 Jun 2024 16:24:58 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0AF30B3F-AD13-4398-AC0F-AA6B5425D4AA@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-2-atrajeev@linux.vnet.ibm.com>
 <ZnpShR7zd9cVdxSj@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wx4xQ1HC-ykBn5uzAbPblL6G-qjztymv
X-Proofpoint-ORIG-GUID: JwmN6Qul-YFYonxRwifTiBMGpHnaCfmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_06,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250084
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
Cc: Ian Rogers <irogers@google.com>, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25 Jun 2024, at 10:45=E2=80=AFAM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> Hello,
>=20
> On Fri, Jun 14, 2024 at 10:56:16PM +0530, Athira Rajeev wrote:
>> Data type profiling uses instruction tracking by checking each
>> instruction and updating the register type state in some data
>> structures. This is useful to find the data type in cases when the
>> register state gets transferred from one reg to another. Example, in
>> x86, "mov" instruction and in powerpc, "mr" instruction. Currently =
these
>> structures are defined in annotate-data.c and instruction tracking is
>> implemented only for x86. Move these data structures to
>> "annotate-data.h" header file so that other arch implementations can =
use
>> it in arch specific files as well.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/annotate-data.c | 53 +------------------------------
>> tools/perf/util/annotate-data.h | 55 =
+++++++++++++++++++++++++++++++++
>> 2 files changed, 56 insertions(+), 52 deletions(-)
>>=20
>> diff --git a/tools/perf/util/annotate-data.c =
b/tools/perf/util/annotate-data.c
>> index 965da6c0b542..a4c7f98a75e3 100644
>> --- a/tools/perf/util/annotate-data.c
>> +++ b/tools/perf/util/annotate-data.c
>> @@ -31,15 +31,6 @@
>>=20
>> static void delete_var_types(struct die_var_type *var_types);
>>=20
>> -enum type_state_kind {
>> - TSR_KIND_INVALID =3D 0,
>> - TSR_KIND_TYPE,
>> - TSR_KIND_PERCPU_BASE,
>> - TSR_KIND_CONST,
>> - TSR_KIND_POINTER,
>> - TSR_KIND_CANARY,
>> -};
>> -
>> #define pr_debug_dtp(fmt, ...) \
>> do { \
>> if (debug_type_profile) \
>> @@ -140,49 +131,7 @@ static void pr_debug_location(Dwarf_Die *die, =
u64 pc, int reg)
>> }
>> }
>>=20
>> -/*
>> - * Type information in a register, valid when @ok is true.
>> - * The @caller_saved registers are invalidated after a function =
call.
>> - */
>> -struct type_state_reg {
>> - Dwarf_Die type;
>> - u32 imm_value;
>> - bool ok;
>> - bool caller_saved;
>> - u8 kind;
>> -};
>> -
>> -/* Type information in a stack location, dynamically allocated */
>> -struct type_state_stack {
>> - struct list_head list;
>> - Dwarf_Die type;
>> - int offset;
>> - int size;
>> - bool compound;
>> - u8 kind;
>> -};
>> -
>> -/* FIXME: This should be arch-dependent */
>> -#define TYPE_STATE_MAX_REGS  16
>> -
>> -/*
>> - * State table to maintain type info in each register and stack =
location.
>> - * It'll be updated when new variable is allocated or type info is =
moved
>> - * to a new location (register or stack).  As it'd be used with the
>> - * shortest path of basic blocks, it only maintains a single table.
>> - */
>> -struct type_state {
>> - /* state of general purpose registers */
>> - struct type_state_reg regs[TYPE_STATE_MAX_REGS];
>> - /* state of stack location */
>> - struct list_head stack_vars;
>> - /* return value register */
>> - int ret_reg;
>> - /* stack pointer register */
>> - int stack_reg;
>> -};
>> -
>> -static bool has_reg_type(struct type_state *state, int reg)
>> +bool has_reg_type(struct type_state *state, int reg)
>> {
>> return (unsigned)reg < ARRAY_SIZE(state->regs);
>> }
>> diff --git a/tools/perf/util/annotate-data.h =
b/tools/perf/util/annotate-data.h
>> index 0a57d9f5ee78..ef235b1b15e1 100644
>> --- a/tools/perf/util/annotate-data.h
>> +++ b/tools/perf/util/annotate-data.h
>> @@ -6,6 +6,9 @@
>> #include <linux/compiler.h>
>> #include <linux/rbtree.h>
>> #include <linux/types.h>
>> +#include "dwarf-aux.h"
>> +#include "annotate.h"
>> +#include "debuginfo.h"
>>=20
>> struct annotated_op_loc;
>> struct debuginfo;
>> @@ -15,6 +18,15 @@ struct hist_entry;
>> struct map_symbol;
>> struct thread;
>>=20
>> +enum type_state_kind {
>> + TSR_KIND_INVALID =3D 0,
>> + TSR_KIND_TYPE,
>> + TSR_KIND_PERCPU_BASE,
>> + TSR_KIND_CONST,
>> + TSR_KIND_POINTER,
>> + TSR_KIND_CANARY,
>> +};
>> +
>> /**
>> * struct annotated_member - Type of member field
>> * @node: List entry in the parent list
>> @@ -142,6 +154,48 @@ struct annotated_data_stat {
>> };
>> extern struct annotated_data_stat ann_data_stat;
>>=20
>> +/*
>> + * Type information in a register, valid when @ok is true.
>> + * The @caller_saved registers are invalidated after a function =
call.
>> + */
>> +struct type_state_reg {
>> + Dwarf_Die type;
>> + u32 imm_value;
>> + bool ok;
>> + bool caller_saved;
>> + u8 kind;
>> +};
>> +
>> +/* Type information in a stack location, dynamically allocated */
>> +struct type_state_stack {
>> + struct list_head list;
>> + Dwarf_Die type;
>> + int offset;
>> + int size;
>> + bool compound;
>> + u8 kind;
>> +};
>> +
>> +/* FIXME: This should be arch-dependent */
>> +#define TYPE_STATE_MAX_REGS  32
>=20
> Can you please define this for powerpc separately?  I think x86 should
> remain in 16.
>=20
> Thanks,
> Namhyung

Sure, I will have this change in V5
>=20
>> +
>> +/*
>> + * State table to maintain type info in each register and stack =
location.
>> + * It'll be updated when new variable is allocated or type info is =
moved
>> + * to a new location (register or stack).  As it'd be used with the
>> + * shortest path of basic blocks, it only maintains a single table.
>> + */
>> +struct type_state {
>> + /* state of general purpose registers */
>> + struct type_state_reg regs[TYPE_STATE_MAX_REGS];
>> + /* state of stack location */
>> + struct list_head stack_vars;
>> + /* return value register */
>> + int ret_reg;
>> + /* stack pointer register */
>> + int stack_reg;
>> +};
>> +
>> #ifdef HAVE_DWARF_SUPPORT
>>=20
>> /* Returns data type at the location (ip, reg, offset) */
>> @@ -160,6 +214,7 @@ void global_var_type__tree_delete(struct rb_root =
*root);
>>=20
>> int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel =
*evsel);
>>=20
>> +bool has_reg_type(struct type_state *state, int reg);
>> #else /* HAVE_DWARF_SUPPORT */
>>=20
>> static inline struct annotated_data_type *
>> --=20
>> 2.43.0


