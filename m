Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2709306B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 19:27:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hDFwU1yK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLwQS1sxKz3dBl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 03:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hDFwU1yK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLwPm1F0sz30Ty
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 03:27:07 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46DGRk5R012543;
	Sat, 13 Jul 2024 17:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=C
	SLDSdcY14vRIETpzgs7gw6TRPx3zqsfbJC50nghrqI=; b=hDFwU1yKiC8cGX7c/
	sXnLzDClrhKj4RpcvWxgoDn+lGXQ8ZBSoj4pRdgw+XIIgaiBzObXs2OsOocY2OjB
	q8nqS+aQgPH3DTZ7koWYoLM0ZEXjQAcUsO5dEHMCE3KUiOynGdffAu0hYiu2LrGt
	gH4w8+Yu8ox3o/nt9dwCCHgH7cMm8k6hpShp1QYkM//jvege30KWHI8pEkKBcMvZ
	/fZYK5tVmoMPdRTvpp4uCgrNGOT6VcJMYs3qWigseBeIOMxC6b/VZA1TxGiQQ1cs
	/YfZhhXTDECfL2Wpc+r+EvmXc8CuxLR1BsiTSLbL47+Q7za6m3XhTtT0RfwaKjD4
	NCUSw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gcqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 17:26:55 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46DHQtrI025847;
	Sat, 13 Jul 2024 17:26:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gcqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 17:26:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46DFARDC013906;
	Sat, 13 Jul 2024 17:21:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407gn1ck7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 17:21:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46DHLmCP19268070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 17:21:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80CDF20043;
	Sat, 13 Jul 2024 17:21:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC39E20040;
	Sat, 13 Jul 2024 17:21:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.49.134])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 13 Jul 2024 17:21:45 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V6 17/18] tools/perf: Update data_type_cmp and
 sort__typeoff_sort function to include var_name in comparison
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZpKVROoPC5KBTPAj@google.com>
Date: Sat, 13 Jul 2024 22:51:33 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <75010931-82A9-4640-8C55-2062A3726970@linux.vnet.ibm.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
 <20240707144419.92510-18-atrajeev@linux.vnet.ibm.com>
 <ZpGfYVc_ewcsQxWL@google.com>
 <6733E9A7-1118-46A5-8C17-DC22A9C47207@linux.vnet.ibm.com>
 <ZpKVROoPC5KBTPAj@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZkfD4AkCbdHAsR3WIBpz1_x5I9wBwy4T
X-Proofpoint-GUID: NXDc1dseNCeY5ZQYdzBXnyxfW_M6sek_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407130131
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13 Jul 2024, at 8:25=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Sat, Jul 13, 2024 at 11:52:30AM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 13 Jul 2024, at 2:55=E2=80=AFAM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>>>=20
>>> On Sun, Jul 07, 2024 at 08:14:18PM +0530, Athira Rajeev wrote:
>>>> Currently data_type_cmp() only compares size and type name.
>>>> But in cases where the type name of two data type entries
>>>> is same, but var_name is different, the comparison can't =
distinguish
>>>> two different types.
>>>>=20
>>>> Consider there is a "long unsigned int" with var_name as "X" and =
there
>>>> is global variable "long unsigned int". Currently since
>>>> data_type_cmp uses only type_name for comparison ( "long unsigned =
int"),
>>>> it won't distinguish these as separate entries. Update the
>>>=20
>>> I'm still not sure if it's ok.  It intentionally merges different
>>> instances of the same type together as it's a data 'type' profile.
>>>=20
>>>=20
>>>> functions "data_type_cmp" as well as "sort__typeoff_sort" to
>>>> compare variable names after type name if it exists.
>>>>=20
>>>> Also updated "hist_entry__typeoff_snprintf" to print var_name if
>>>> it is set. With the changes,
>>>>=20
>>>>    11.42%  long unsigned int  long unsigned int +0 =
(current_stack_pointer)
>>>>    4.68%  struct paca_struct  struct paca_struct +2312 (__current)
>>>>    4.57%  struct paca_struct  struct paca_struct +2354 =
(irq_soft_mask)
>>>>    2.69%  struct paca_struct  struct paca_struct +2808 (canary)
>>>>    2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
>>>>    2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
>>>>    1.43%  long unsigned int  long unsigned int +0 (no field)
>>>=20
>>> It seems like an output of `perf report -s type,typeoff`.  But I'm
>>> curious how it'd work with -s type only?  I guess it'd have two =
separate
>>> entries for 'long unsigned int'.  Ideally we can have a single entry
>>> with two different fields.
>>>=20
>>> For example, `perf report -s type,typeoff -H`:
>>>=20
>>> 12.85%     long unsigned int
>>>    11.42%     long unsigned int +0 (current_stack_pointer)
>>>     1.43%     long unsigned int +0 (no field)
>>> ...
>>>=20
>>=20
>> Hi Namhyung,
>>=20
>> Thanks for the comments.
>>=20
>> While printing, the check for field is done only in =
=E2=80=9Csort__typeoff_sort=E2=80=9D.
>> To summarise,
>> 1. While adding the data type in rb node, if the entry has different =
field, new entry will be added. So we will have different entries in rb =
node if field differs.
>> 2. While using sort key to display, for =E2=80=9Ctypeoff=E2=80=9D, we =
use sort__typeoff_sort . For =E2=80=9Ctype=E2=80=9D, we use =
=E2=80=9Csort__type_sort=E2=80=9D
>> 3. In =E2=80=9Csort__type_sort=E2=80=9D type_name is used. Hence =
result will have only single entry
>> 4. In =E2=80=9Csort__typeoff_sort=E2=80=9D we added check for =
=E2=80=9Cvar_name=E2=80=9D too in this patch. So result will have two =
entries if field differs
>=20
> I see.
>=20
>>=20
>> Example:
>>=20
>> Using -H option,
>>=20
>> ./perf report -s type,typeoff -H
>>=20
>>    17.65%     struct paca_struct
>>        4.68%     struct paca_struct +2312 (__current)
>>        4.57%     struct paca_struct +2354 (irq_soft_mask)
>>        2.69%     struct paca_struct +2808 (canary)
>>        2.68%     struct paca_struct +8 (paca_index)
>>        2.24%     struct paca_struct +48 (data_offset)
>>        0.55%     struct paca_struct +2816 =
(mmiowb_state.nesting_count)
>>        0.18%     struct paca_struct +2818 =
(mmiowb_state.mmiowb_pending)
>>        0.03%     struct paca_struct +2352 (hsrr_valid)
>>        0.02%     struct paca_struct +2356 (irq_work_pending)
>>        0.00%     struct paca_struct +0 (lppaca_ptr)
>>    12.85%     long unsigned int
>>       11.42%     long unsigned int +0 (current_stack_pointer)
>>        1.43%     long unsigned int +0 (no field)
>>=20
>> As you mentioned, we have single entry with two different fields:
>>=20
>> 12.85%     long unsigned int
>>       11.42%     long unsigned int +0 (current_stack_pointer)
>>        1.43%     long unsigned int +0 (no field)
>>=20
>> With perf report -s type:
>>=20
>>    17.65%  struct paca_struct
>>    12.85%  long unsigned int
>>     1.69%  struct task_struct
>>     1.51%  struct rq
>>     1.49%  struct pt_regs
>>     1.41%  struct vm_fault
>>     1.20%  struct inode
>>     1.15%  struct file
>>     1.08%  struct sd_lb_stats
>>     0.90%  struct security_hook_list
>>     0.86%  struct seq_file
>>     0.79%  struct cfs_rq
>>     0.78%  struct irq_desc
>>     0.72%  long long unsigned int
>>=20
>>=20
>> Where as with perf report -s typeoff:
>>=20
>>    11.42%  long unsigned int +0 (current_stack_pointer)
>>     4.68%  struct paca_struct +2312 (__current)
>>     4.57%  struct paca_struct +2354 (irq_soft_mask)
>>     2.69%  struct paca_struct +2808 (canary)
>>     2.68%  struct paca_struct +8 (paca_index)
>>     2.24%  struct paca_struct +48 (data_offset)
>>     1.43%  long unsigned int +0 (no field)
>>=20
>>=20
>> Namhyung,
>>=20
>> If the above shared result for =E2=80=9Ctype=E2=80=9D and =
=E2=80=9Ctypeoff=E2=80=9D looks good and other changes are fine, I will =
post V7 with change for sort cmp to use cmp_null.
>> Please share your response.
>=20
> Great, it looks all good.  Please send v7.
>=20
> But I think it's a bit late to add this to the upcoming window.

Ok Namhyung.
I have posted V7 with suggested changes. Please review the changes. If =
it is not possible to pick in upcoming window, if it all looks good, =
please pick it for the next possible window.

Thanks for checking and sharing your comments,
Athira

>=20
> Thanks,
> Namhyung
>=20
>>=20
>> Thanks
>> Athira
>>=20
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/util/annotate-data.c | 24 ++++++++++++++++++++++--
>>>> tools/perf/util/sort.c          | 23 +++++++++++++++++++++--
>>>> 2 files changed, 43 insertions(+), 4 deletions(-)
>>>>=20
>>>> diff --git a/tools/perf/util/annotate-data.c =
b/tools/perf/util/annotate-data.c
>>>> index 8d05f3dbddf6..759c6a22e719 100644
>>>> --- a/tools/perf/util/annotate-data.c
>>>> +++ b/tools/perf/util/annotate-data.c
>>>> @@ -167,7 +167,7 @@ static void exit_type_state(struct type_state =
*state)
>>>> }
>>>>=20
>>>> /*
>>>> - * Compare type name and size to maintain them in a tree.
>>>> + * Compare type name, var_name  and size to maintain them in a =
tree.
>>>> * I'm not sure if DWARF would have information of a single type in =
many
>>>> * different places (compilation units).  If not, it could compare =
the
>>>> * offset of the type entry in the .debug_info section.
>>>> @@ -176,12 +176,32 @@ static int data_type_cmp(const void *_key, =
const struct rb_node *node)
>>>> {
>>>> const struct annotated_data_type *key =3D _key;
>>>> struct annotated_data_type *type;
>>>> + int64_t ret =3D 0;
>>>>=20
>>>> type =3D rb_entry(node, struct annotated_data_type, node);
>>>>=20
>>>> if (key->self.size !=3D type->self.size)
>>>> return key->self.size - type->self.size;
>>>> - return strcmp(key->self.type_name, type->self.type_name);
>>>> +
>>>> + ret =3D strcmp(key->self.type_name, type->self.type_name);
>>>> + if (ret) {
>>>> + return ret;
>>>> + }
>>>=20
>>> No need for the parentheses.
>> Sure, will fix it
>>=20
>>>=20
>>>> +
>>>> + /*
>>>> +  * Compare var_name if it exists for key and type.
>>>> +  * If both nodes doesn't have var_name, but one of
>>>> +  * them has, return non-zero. This is to indicate nodes
>>>> +  * are not the same if one has var_name, but other doesn't.
>>>> +  */
>>>> + if (key->self.var_name && type->self.var_name) {
>>>> + ret =3D strcmp(key->self.var_name, type->self.var_name);
>>>> + if (ret)
>>>> + return ret;
>>>> + } else if (key->self.var_name || type->self.var_name)
>>>> + return 1;
>>>=20
>>> I think you need to compare the order properly like in cmp_null() in
>>> util/sort.c.  Please see below.
>>>=20
>>>> +
>>>> + return ret;
>>>> }
>>>>=20
>>>> static bool data_type_less(struct rb_node *node_a, const struct =
rb_node *node_b)
>>>> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
>>>> index cd39ea972193..c6d885060ee7 100644
>>>> --- a/tools/perf/util/sort.c
>>>> +++ b/tools/perf/util/sort.c
>>>> @@ -2267,9 +2267,25 @@ sort__typeoff_sort(struct hist_entry *left, =
struct hist_entry *right)
>>>> right_type =3D right->mem_type;
>>>> }
>>>>=20
>>>> + /*
>>>> +  * Compare type_name first. Next, ompare var_name if it exists
>>>> +  * for left and right hist_entry. If both entries doesn't have
>>>> +  * var_name, but one of them has, return non-zero. This is to
>>>> +  * indicate entries are not the same if one has var_name, but the
>>>> +  * other doesn't.
>>>> +  * If type_name and var_name is same, use mem_type_off field.
>>>> +  */
>>>> ret =3D strcmp(left_type->self.type_name, =
right_type->self.type_name);
>>>> if (ret)
>>>> return ret;
>>>> +
>>>> + if (left_type->self.var_name && right_type->self.var_name) {
>>>> + ret =3D strcmp(left_type->self.var_name, =
right_type->self.var_name);
>>>> + if (ret)
>>>> + return ret;
>>>> + } else if (right_type->self.var_name || left_type->self.var_name)
>>>> + return 1;
>>>=20
>>> } else if (!left_type->self.var_name !=3D =
!right_type->self.var_name)
>>> return cmp_null(left_type->self.var_name, =
right_type->self.var_name);
>>>=20
>>> Thanks,
>>> Namhyung
>>>=20
>> Sure, will fix this
>>=20
>> Thanks
>> Athira
>>=20
>>=20
>>>> +
>>>> return left->mem_type_off - right->mem_type_off;
>>>> }
>>>>=20
>>>> @@ -2305,9 +2321,12 @@ static int =
hist_entry__typeoff_snprintf(struct hist_entry *he, char *bf,
>>>> char buf[4096];
>>>>=20
>>>> buf[0] =3D '\0';
>>>> - if (list_empty(&he_type->self.children))
>>>> + if (list_empty(&he_type->self.children)) {
>>>> snprintf(buf, sizeof(buf), "no field");
>>>> - else
>>>> + if (he_type->self.var_name)
>>>> + strcpy(buf, he_type->self.var_name);
>>>> +
>>>> + } else
>>>> fill_member_name(buf, sizeof(buf), &he_type->self,
>>>> he->mem_type_off, true);
>>>> buf[4095] =3D '\0';
>>>> --=20
>>>> 2.43.0


