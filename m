Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B380665D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 05:46:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i8OmzH9v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlPxZ6CW2z3dDy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 15:46:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i8OmzH9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlPwh1NPYz3cC7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 15:45:39 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B64WRd1020138;
	Wed, 6 Dec 2023 04:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qqlMFbVMEBOqrmlEy17TXkVI4mDHBCVA+NdyavBDlXs=;
 b=i8OmzH9vPpBOGT6duo5lFAurz3Ep+gsk2MJFsO0L/A3DUrr9j1SNwXi1BU/uGhQr3C32
 4vMPr1HsRcJ63TVNwCE9LamXgId6gI6sXSRyfG1Z/pafazE+W2NxIpuVWJmQL4RsaxsK
 JlvQEZVeCY+NJWeRWMOC1pCJRPMuZE7RMI3tfP6VM0AAzW8eyWZHrYtnzq97++jbWp9N
 wcVxQW7S+hvguto2s2C7O55EJjBrCdDPXacXUmiE/Uu5wol+RnHb8rLvoPmSP3JkCziI
 LKzmO1HjujymwWUmbzGn6R0pTQxaIUtoztCHwfb8KUOnG3W0DcS8j24ayoiZWOcYMNMh tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3utj1409w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 04:45:24 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B64aYgi028548;
	Wed, 6 Dec 2023 04:45:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3utj1409vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 04:45:23 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B64BALW003571;
	Wed, 6 Dec 2023 04:45:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3utav4a55g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 04:45:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B64jJ0J44434164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Dec 2023 04:45:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF5CD20043;
	Wed,  6 Dec 2023 04:45:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECD2820040;
	Wed,  6 Dec 2023 04:45:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.34.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  6 Dec 2023 04:45:17 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZW+bIGC3r2dcTQUO@kernel.org>
Date: Wed, 6 Dec 2023 10:15:06 +0530
Message-Id: <46112CD2-2033-4885-863B-CF0F61672E65@linux.vnet.ibm.com>
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com> <ZW+bIGC3r2dcTQUO@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9pvEVE32w4ixlIjUuw3hrHosO4WK2ibK
X-Proofpoint-ORIG-GUID: 8FIcnvllgia7kSyM4tWJu6VAgN9WIsYJ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_02,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312060037
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Dec-2023, at 3:20=E2=80=AFAM, Arnaldo Carvalho de Melo <acme@kernel=
.org> wrote:
>=20
> Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
>> On 23/11/2023 16:02, Athira Rajeev wrote:
>>> --- a/tools/perf/Makefile.perf
>>> @@ -1134,6 +1152,7 @@ bpf-skel-clean:
>>> $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
>>>=20
>>> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)=
-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-core=
sight-targets-clean
>>> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
>>> $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archiv=
e $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>>> $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -dele=
te -o -name '\.*.d' -delete
>>> $(Q)$(RM) $(OUTPUT).config-detected
>=20
> While merging perf-tools-next with torvalds/master I noticed that maybe
> we better have the above added line as:
>=20
> +   $(call QUIET_CLEAN, tests) $(Q)$(MAKE) -f $(srctree)/tools/perf/tests=
/Makefile.tests clean
>=20
> No?
>=20
> Anyway I'm merging as-is, but it just hit my eye while merging,
>=20
> - Arnaldo
Hi Arnaldo

As Ian pointed we removed Makefile.tests as part of :
https://lore.kernel.org/lkml/20231129213428.2227448-1-irogers@google.com/

Thanks
Athira=
