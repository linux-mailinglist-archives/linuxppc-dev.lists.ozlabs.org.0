Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC3361B2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 10:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM8620TmMz3bsL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 18:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=cF7nXLe1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=cF7nXLe1; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM85Z0NNhz303f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 18:10:09 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G89lxu134768;
 Fri, 16 Apr 2021 08:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=TnjrNqXGwzrmLLe3F50P/kR2nYY4gyJkqThCBP01mmg=;
 b=cF7nXLe1SDiiik8nJ3mwtWOKSrLB63xl+MisOQqDXbLoK9mN3dFrh7Dcn4d5T2j/ILy9
 KOc1Mj68iwObAwEfn2Nc0jr/IK9wtbFkI54KOVuPfgZH1uEQf17Yi+KGKI1Y+j856Psl
 oAPDFB8YIip2owg8GMJ+vJ+3ZaUvVCQmsU8CNcYlrHrq34eWzdPfWROFrILzv4UVUP/B
 Vw9upcZHdGNzbEge7o0X3+MzgBdHq4T4uPaFlzTPrSL72Qw40G8LG/hCUNjnAAJeBzr2
 S79vGN6cSfA1IvSnL1wl1LpkXtX5Ke9lTqeWqfh1bb1U4yLS8PgJlhdQYa30bIzMKSio YA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37u1hbrda6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 08:09:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G80gTT002449;
 Fri, 16 Apr 2021 08:09:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 37unkttprp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 08:09:52 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13G89oV9006168;
 Fri, 16 Apr 2021 08:09:50 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 16 Apr 2021 01:09:50 -0700
Date: Fri, 16 Apr 2021 11:09:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Message-ID: <20210416080941.GO6048@kadam>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <f82a9fe2-3254-3f25-616c-10e56103bdc6@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f82a9fe2-3254-3f25-616c-10e56103bdc6@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160060
X-Proofpoint-GUID: 6HXQ_LEuwfVp63QXRqzWQcS2rPDaKaDw
X-Proofpoint-ORIG-GUID: 6HXQ_LEuwfVp63QXRqzWQcS2rPDaKaDw
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160061
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 robh@kernel.org, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bauerman@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 09:00:12AM +0200, Christophe Leroy wrote:
> 
> 
> Le 16/04/2021 à 08:44, Daniel Axtens a écrit :
> > Hi Lakshmi,
> > 
> > > On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
> > > 
> > > Sorry - missed copying device-tree and powerpc mailing lists.
> > > 
> > > > There are a few "goto out;" statements before the local variable "fdt"
> > > > is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> > > > elf64_load(). This will result in an uninitialized "fdt" being passed
> > > > to kvfree() in this function if there is an error before the call to
> > > > of_kexec_alloc_and_setup_fdt().
> > > > 
> > > > Initialize the local variable "fdt" to NULL.
> > > > 
> > I'm a huge fan of initialising local variables! But I'm struggling to
> > find the code path that will lead to an uninit fdt being returned...
> > 
> > The out label reads in part:
> > 
> > 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> > 	return ret ? ERR_PTR(ret) : fdt;
> > 
> > As far as I can tell, any time we get a non-zero ret, we're going to
> > return an error pointer rather than the uninitialised value...
> 
> I don't think GCC is smart enough to detect that.
> 

We disabled uninitialized variable checking for GCC.

But actually is something that has been on my mind recently.  Smatch is
supposed to parse this correctly but there is a bug that affects powerpc
and I don't know how to debug it.  The kbuild bot is doing cross
platform compiles but I don't have one set up on myself.  Could someone
with Smatch installed test something for me?

Or if you don't have Smatch installed then you should definitely install
it.  :P
https://www.spinics.net/lists/smatch/msg00568.html

Apply the patch from below and edit the path to point to the correct
directory.  Then run kchecker and email me the output?

~/path/to/smatch_scripts/kchecker arch/powerpc/kernel/hw_breakpoint.c

regads,
dan carpenter

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 8fc7a14e4d71..f2dfba54e14d 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -167,13 +167,19 @@ static bool can_co_exist(struct breakpoint *b, struct perf_event *bp)
 	return !(alternate_infra_bp(b, bp) && bp_addr_range_overlap(b->bp, bp));
 }
 
+#include "/home/XXX/path/to/smatch/check_debug.h"
 static int task_bps_add(struct perf_event *bp)
 {
 	struct breakpoint *tmp;
 
 	tmp = alloc_breakpoint(bp);
-	if (IS_ERR(tmp))
+	__smatch_about(tmp);
+	__smatch_debug_on();
+	if (IS_ERR(tmp)) {
+		__smatch_debug_off();
+		__smatch_about(tmp);
 		return PTR_ERR(tmp);
+	}
 
 	list_add(&tmp->list, &task_bps);
 	return 0;
