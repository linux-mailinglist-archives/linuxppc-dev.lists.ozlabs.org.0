Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C8584C7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 09:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvJnV2L9Kz3bXn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 17:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HPzshkYH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HPzshkYH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvJlc5dG2z3000
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 17:18:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26T7BpVn014380;
	Fri, 29 Jul 2022 07:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=KaCtiYW+5W8q1OQqhq5tIxVNKreM0CxkMs4FF9pjkDY=;
 b=HPzshkYHbh1yoMoJUpmTemQVu/r1YI3MGyHnLFyMnpbMimoO1ZYdo7lxTTa1XdZvFyx4
 xkfmqtCGeQpTNcfh7j2tu1SOSxQs0RtePlYbFrCk7z+vD9TpPniBZsbd9ppEACl+7c+2
 4Z9JsFRJc3dnrPXg6/WjS2tdzTlrMF4G/zBshG9ALjbKUsaRzKY7OspfznmoeyOilNvr
 WXd7Tbua/bh+R/Vy1TIbE1U8az5GdoMLIiy5DWF03pgkNotx9eaZDr0qNNGXSek9xa8Z
 pWOEuY7M35GYs2eLi6NgpMyRz2ztSHlJIso4N/+h5qFZsILGmR0XAzhQJRbo2DO0GTdD 6Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmaxrg79c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jul 2022 07:18:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26T6pQ01030906;
	Fri, 29 Jul 2022 07:18:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hg96wq9fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jul 2022 07:18:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26T7Ic7W32833922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Jul 2022 07:18:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2236A4053;
	Fri, 29 Jul 2022 07:18:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93E0CA4040;
	Fri, 29 Jul 2022 07:18:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.46.37])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 29 Jul 2022 07:18:22 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [linux-next] Build failure drivers/cxl/cxl_pmem (powerpc)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87sfmkbfyg.fsf@mpe.ellerman.id.au>
Date: Fri, 29 Jul 2022 12:48:21 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A60A5549-F8E0-4227-8AD1-3DEC165F4648@linux.ibm.com>
References: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
 <87sfmkbfyg.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UCJU-wmyzXeAMQMrNMUcaEBjmFNLnMMv
X-Proofpoint-ORIG-GUID: UCJU-wmyzXeAMQMrNMUcaEBjmFNLnMMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290028
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
Cc: Dan Williams <dan.j.williams@intel.com>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-cxl@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> =46rom 8ca5b098b6ff1048953be748dbffc987996e2605 Mon Sep 17 00:00:00 =
2001
> From: Michael Ellerman <mpe@ellerman.id.au>
> Date: Fri, 29 Jul 2022 16:13:55 +1000
> Subject: [PATCH] powerpc/mm: Export memory_add_physaddr_to_nid() for =
modules
>=20
> The cxl_pmem module wants to call memory_add_physaddr_to_nid(), so
> export the symbol.
>=20
> Fixes: 04ad63f086d1 ("cxl/region: Introduce cxl_pmem_region objects")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Thanks Michael.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> arch/powerpc/mm/mem.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 7b0d286bf9ba..01772e79fd93 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -55,6 +55,7 @@ int memory_add_physaddr_to_nid(u64 start)
> {
> 	return hot_add_scn_to_nid(start);
> }
> +EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
> #endif
>=20
> int __weak create_section_mapping(unsigned long start, unsigned long =
end,
> --=20
> 2.35.3
>=20

