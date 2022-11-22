Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27226633372
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 03:40:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGT5J028Sz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 13:40:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oH7NZ4oc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oH7NZ4oc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGT4J0MBQz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 13:39:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM13PT5021510
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ClJcO/6WuwzroOpKrRX6LWCXxKzwLyLOOuDDsrdw5rU=;
 b=oH7NZ4ocgVpVHOGc1txtdmt7ugagDNCHXq/N9FZZNbZCwwxo/53AElPMqffSTWwtRQIg
 LsAmCs+N4P+XygtqMB9hc1by14Ap4jPXtf4Uydk1TOdbCjRmgl7uKSG+vR6raQI+ZsLf
 qpPGxUtaet/ZgVt0OQyMmxA+8zxAtYk3bEcmy3HKx/DBM8CrOpMGw3dUBEuRofoul1sb
 KAREXkpHmKKeTph8/ObV//qXBZakt2vvDQpW5Q8Aq1Xk1Dun9mUR1992bcbFGMtr8FwX
 aJghqOCA638Mk++TO6OZ4I0CpcxP+H2+PFN7Y6xRaBPD2O5wFXWpjb1Q9CVjjeLddibX Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hg2nuud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:39:41 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM22ujp005807
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:39:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hg2nuu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 02:39:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM2YjUu013134;
	Tue, 22 Nov 2022 02:39:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3kxps8ufgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 02:39:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM2daTT28442952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 02:39:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EB4F42042;
	Tue, 22 Nov 2022 02:39:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD4BB42041;
	Tue, 22 Nov 2022 02:39:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 02:39:35 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3F6B6600F3;
	Tue, 22 Nov 2022 13:39:32 +1100 (AEDT)
Message-ID: <75044c47f1fa65ed1b9338022b653df0b80b8a3c.camel@linux.ibm.com>
Subject: Re: [PATCH 02/13] powerpc/rtasd: use correct OF API for event scan
 rate
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 13:39:32 +1100
In-Reply-To: <20221118150751.469393-3-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-3-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B73ZTdUCydePF607gJiL7IpC-trrEeg_
X-Proofpoint-ORIG-GUID: WkWldH4bQ1ffCzBkduYMS0WhcQRQs5xI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220015
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> rtas_token() should be used only for properties that are RTAS
> function
> tokens. "rtas-event-scan-rate" does not contain a function token, but
> it
> has the same size/format as token properties so reading it with
> rtas_token() happens to work.
>=20
> Convert to of_property_read_u32().
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Did a quick grep for the other OF device tree properties listed in R1-
7.2.6-3 of PAPR to see if we make the same mistake elsewhere, and the
only other one is rtas-error-log-max which I see you clean up later in
the series.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/kernel/rtasd.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/rtasd.c
> b/arch/powerpc/kernel/rtasd.c
> index 5270b450bbde..cc56ac6ba4b0 100644
> --- a/arch/powerpc/kernel/rtasd.c
> +++ b/arch/powerpc/kernel/rtasd.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/kernel.h>
> +#include <linux/of.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/proc_fs.h>
> =C2=A0#include <linux/init.h>
> @@ -499,6 +500,8 @@ EXPORT_SYMBOL_GPL(rtas_cancel_event_scan);
> =C2=A0
> =C2=A0static int __init rtas_event_scan_init(void)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!machine_is(pseries) =
&& !machine_is(chrp))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0
> @@ -509,8 +512,8 @@ static int __init rtas_event_scan_init(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rtas_event_scan_rate =3D rtas_=
token("rtas-event-scan-rate");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rtas_event_scan_rate =3D=
=3D RTAS_UNKNOWN_SERVICE) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D of_property_read_u32(r=
tas.dev, "rtas-event-scan-rate",
> &rtas_event_scan_rate);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0printk(KERN_ERR "rtasd: no rtas-event-scan-rate on
> system\n");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
