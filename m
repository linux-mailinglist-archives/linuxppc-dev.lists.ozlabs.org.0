Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453A638207
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 02:13:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJH1F1kqmz3f30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 12:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GTdS2Z1O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GTdS2Z1O;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJH0D1CVHz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 12:12:27 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP13KXT021883;
	Fri, 25 Nov 2022 01:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=e9chM5FrGD7nP6/6cm/S4NrCjVSjiBCAog9k15Or9Z0=;
 b=GTdS2Z1Ohq7SlrJde5697nWxWCJ85n+AizOrT5Ur6NOhw0fIqXg13WD2JxQNszGpnejp
 OnYbBujCu6U0IjXx8Wjqw0Xfk3SLUNoIPMWDRdUKq+dos1ntesBCbYLItyZ/BG00xy0M
 EF7rNY4JtY5XcFZQybYYLY2QBQKUM8GH+wVO/h/AylhD5C9aFxntc+jOoj2yBRrXwVI+
 xoG2Jq+h+Kbvhk4Hx+P10sJvbbqg2gCWCrtvif2f7ogvCHt19LHtJyP5XHFPDjtSw3Bh
 tgaTLIthCOJU964xwn+CXsAnAjS9FkjOA+erF/wlm/pIvcciSmrYkZ/WSh8Z5L7GGzVo kA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2jhhhgwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 01:12:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP14xTO016179;
	Fri, 25 Nov 2022 01:12:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kxps90v8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 01:12:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP162bi49676760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 01:06:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50284A4258;
	Fri, 25 Nov 2022 01:12:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5C90A4256;
	Fri, 25 Nov 2022 01:12:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 01:12:19 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 011116005B;
	Fri, 25 Nov 2022 12:12:13 +1100 (AEDT)
Message-ID: <f39abd96da993ff8a9ebdba4cdf7a69a3b033d11.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/7] selftests/powerpc: Use mfspr/mtspr macros
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 12:12:13 +1100
In-Reply-To: <20221122231103.15829-2-bgray@linux.ibm.com>
References: <20221122231103.15829-1-bgray@linux.ibm.com>
	 <20221122231103.15829-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NGxLesm3CjhWXHvO01Js5G-ptI2KsiVP
X-Proofpoint-ORIG-GUID: NGxLesm3CjhWXHvO01Js5G-ptI2KsiVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=998 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211250006
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-23 at 10:10 +1100, Benjamin Gray wrote:
> No need to write inline asm for mtspr/mfspr, we have macros for this
> in reg.h
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Good cleanup.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0tools/testing/selftests/powerpc/dscr/dscr.h=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17 +++++----------
> --
> =C2=A0.../selftests/powerpc/ptrace/ptrace-hwbreak.c=C2=A0=C2=A0 |=C2=A0 6=
 ++----
> =C2=A0tools/testing/selftests/powerpc/ptrace/ptrace.h |=C2=A0 5 +----
> =C2=A0.../selftests/powerpc/security/flush_utils.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> =C2=A04 files changed, 10 insertions(+), 21 deletions(-)
>=20
> diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h
> b/tools/testing/selftests/powerpc/dscr/dscr.h
> index 13e9b9e28e2c..b703714e7d98 100644
> --- a/tools/testing/selftests/powerpc/dscr/dscr.h
> +++ b/tools/testing/selftests/powerpc/dscr/dscr.h
> @@ -23,6 +23,7 @@
> =C2=A0#include <sys/stat.h>
> =C2=A0#include <sys/wait.h>
> =C2=A0
> +#include "reg.h"
> =C2=A0#include "utils.h"
> =C2=A0
> =C2=A0#define THREADS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0/* Max threads */
> @@ -41,31 +42,23 @@
> =C2=A0/* Prilvilege state DSCR access */
> =C2=A0inline unsigned long get_dscr(void)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long ret;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mfspr %0,%1" : "=
=3Dr" (ret) : "i"
> (SPRN_DSCR_PRIV));
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mfspr(SPRN_DSCR_PRIV);
> =C2=A0}
> =C2=A0
> =C2=A0inline void set_dscr(unsigned long val)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mtspr %1,%0" : :=
 "r" (val), "i"
> (SPRN_DSCR_PRIV));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DSCR_PRIV, val);
> =C2=A0}
> =C2=A0
> =C2=A0/* Problem state DSCR access */
> =C2=A0inline unsigned long get_dscr_usr(void)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long ret;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mfspr %0,%1" : "=
=3Dr" (ret) : "i" (SPRN_DSCR));
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mfspr(SPRN_DSCR);
> =C2=A0}
> =C2=A0
> =C2=A0inline void set_dscr_usr(unsigned long val)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mtspr %1,%0" : :=
 "r" (val), "i" (SPRN_DSCR));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DSCR, val);
> =C2=A0}
> =C2=A0
> =C2=A0/* Default DSCR access */
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> index a0635a3819aa..1345e9b9af0f 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <sys/syscall.h>
> =C2=A0#include <linux/limits.h>
> =C2=A0#include "ptrace.h"
> +#include "reg.h"
> =C2=A0
> =C2=A0#define SPRN_PVR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x11F
> =C2=A0#define PVR_8xx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00500000
> @@ -620,10 +621,7 @@ static int ptrace_hwbreak(void)
> =C2=A0
> =C2=A0int main(int argc, char **argv, char **envp)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int pvr =3D 0;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm __volatile__ ("mfspr %0,%1=
" : "=3Dr"(pvr) : "i"(SPRN_PVR));
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pvr =3D=3D PVR_8xx)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0is_8xx =3D true;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0is_8xx =3D mfspr(SPRN_PVR) =3D=
=3D PVR_8xx;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return test_harness(ptrac=
e_hwbreak, "ptrace-hwbreak");
> =C2=A0}
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace.h
> b/tools/testing/selftests/powerpc/ptrace/ptrace.h
> index 4e0233c0f2b3..04788e5fc504 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace.h
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace.h
> @@ -745,10 +745,7 @@ int show_tm_spr(pid_t child, struct tm_spr_regs
> *out)
> =C2=A0/* Analyse TEXASR after TM failure */
> =C2=A0inline unsigned long get_tfiar(void)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long ret;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mfspr %0,%1" : "=
=3Dr" (ret) : "i" (SPRN_TFIAR));
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mfspr(SPRN_TFIAR);
> =C2=A0}
> =C2=A0
> =C2=A0void analyse_texasr(unsigned long texasr)
> diff --git a/tools/testing/selftests/powerpc/security/flush_utils.c
> b/tools/testing/selftests/powerpc/security/flush_utils.c
> index 4d95965cb751..9c5c00e04f63 100644
> --- a/tools/testing/selftests/powerpc/security/flush_utils.c
> +++ b/tools/testing/selftests/powerpc/security/flush_utils.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <string.h>
> =C2=A0#include <stdio.h>
> =C2=A0#include <sys/utsname.h>
> +#include "reg.h"
> =C2=A0#include "utils.h"
> =C2=A0#include "flush_utils.h"
> =C2=A0
> @@ -79,5 +80,5 @@ void set_dscr(unsigned long val)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0init =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile("mtspr %1,%0" : :=
 "r" (val), "i" (SPRN_DSCR));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DSCR, val);
> =C2=A0}
>=20
> base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
