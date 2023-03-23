Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CA6C729D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:52:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjJx42vXRz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 08:52:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YjGFBeDU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YjGFBeDU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjJw70GSjz3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 08:52:06 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLW3bM025477;
	Thu, 23 Mar 2023 21:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PjFeBO5a8NgjVi0hamlYgvtmMCtvdU0G5ONnEB5Vl0U=;
 b=YjGFBeDUfXsX7LL0q0YqVtSQ2Hr9uCKwmD8ci7W4AkuutjnaBCDp9c8jNXcw5/r5zqLG
 7JQ3vqrZdylbazgYfytWa8sDZXtdmLrvQcVK6HMWWw2qk3rAAoUp3vKLrnkXDbQD0D4p
 2EduoQ0eq+YDfD02F7KCFncO6Jg7MpOXyNgGyIGguJ5GQZMAW+PAbH+MMxfwdRqR9vCW
 ftKOyvzha1H1gIh6q0LhpWPLLY347BTit66isTOu0hICVPmXZ8xVa9YhoQSXFDKsBKRo
 nY6ItIKdg95xjM1OI1/Mepx00ELx2009LwhF4QQGJoUUDL/2CECBkmSwxTVsqPY9jfl3 Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxs1rfrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 21:51:43 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NLoCeu016695;
	Thu, 23 Mar 2023 21:51:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxs1rfqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 21:51:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLL6tW014154;
	Thu, 23 Mar 2023 21:51:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3pgxksr0k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 21:51:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NLpbTo22807262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 21:51:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9D9920043;
	Thu, 23 Mar 2023 21:51:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 397BF2004D;
	Thu, 23 Mar 2023 21:51:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 21:51:37 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 064DE600A5;
	Fri, 24 Mar 2023 08:51:32 +1100 (AEDT)
Message-ID: <ee39474effb15c0a82e8ae115caf77fe8a1d1d33.camel@linux.ibm.com>
Subject: Re: perf tools power9 JSON files build breakage on ubuntu 18.04
 cross build
From: Benjamin Gray <bgray@linux.ibm.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo
 <acme@kernel.org>
Date: Fri, 24 Mar 2023 08:51:31 +1100
In-Reply-To: <CAP-5=fX-0giZxATOVXO5PmCD6yfhoGMb4_vMcWAQLnSq=+DMhQ@mail.gmail.com>
References: <ZBxP77deq7ikTxwG@kernel.org>
	 <CAP-5=fX-0giZxATOVXO5PmCD6yfhoGMb4_vMcWAQLnSq=+DMhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GV87z2IIGbFcpkx1J0ZXZv9IFIJZyW4p
X-Proofpoint-GUID: DW58xbobw5jycRQXmITClSHj_mYuGpa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_13,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303230156
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
Cc: Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-23 at 08:50 -0700, Ian Rogers wrote:
> On Thu, Mar 23, 2023 at 6:11=E2=80=AFAM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >=20
> > Exception processing pmu-events/arch/powerpc/power9/other.json
> > Traceback (most recent call last):
> > =C2=A0 File "pmu-events/jevents.py", line 997, in <module>
> > =C2=A0=C2=A0=C2=A0 main()
> > =C2=A0 File "pmu-events/jevents.py", line 979, in main
> > =C2=A0=C2=A0=C2=A0 ftw(arch_path, [], preprocess_one_file)
> > =C2=A0 File "pmu-events/jevents.py", line 935, in ftw
> > =C2=A0=C2=A0=C2=A0 ftw(item.path, parents + [item.name], action)
> > =C2=A0 File "pmu-events/jevents.py", line 933, in ftw
> > =C2=A0=C2=A0=C2=A0 action(parents, item)
> > =C2=A0 File "pmu-events/jevents.py", line 514, in preprocess_one_file
> > =C2=A0=C2=A0=C2=A0 for event in read_json_events(item.path, topic):
> > =C2=A0 File "pmu-events/jevents.py", line 388, in read_json_events
> > =C2=A0=C2=A0=C2=A0 events =3D json.load(open(path), object_hook=3DJsonE=
vent)
> > =C2=A0 File "/usr/lib/python3.6/json/__init__.py", line 296, in load
> > =C2=A0=C2=A0=C2=A0 return loads(fp.read(),
> > =C2=A0 File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> > =C2=A0=C2=A0=C2=A0 return codecs.ascii_decode(input, self.errors)[0]
> > UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in
> > position 55090: ordinal not in range(128)
> > =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /tmp/build/perf/tests/expr.o
> > pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-
> > events/pmu-events.c' failed
> > make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
> > make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-
> > events.c'
> > Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-
> > events/pmu-events-in.o' failed
> > make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> >=20
> >=20
> > Now jevents is an opt-out feature so I'm noticing these problems.
> >=20
> > A similar fix for s390 was accepted today:
>=20
> The JEVENTS_ARCH=3Dall make option builds the s390 files even on x86.
> I'm confused as to why that's been working before these fixes.

This is the non-breaking space in the file (UTF8 C2 A0). Telling Python
to decode with UTF8 would work (note it's breaking with the 'ascii'
codec). Setting the environment variable LC_CTYPE=3D"C.UTF-8" sets the
default, or the script can specify explicitly.

But I also doubt the NBS was intentional in the first place.
