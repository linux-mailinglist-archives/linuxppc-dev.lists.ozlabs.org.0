Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588C588F9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 17:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lybmp079gz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 01:46:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hu6+/pil;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hu6+/pil;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lybm35yXzz2xVt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 01:45:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273Ek7xs014156;
	Wed, 3 Aug 2022 15:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=GrhgNkXy9Vfs11JQtPyk91zeffHKSJ6dYKP3uyUWsCA=;
 b=hu6+/pil35px81haZf2/MQZuQmzQBEKcH71pDeyl2M/iCcKwGSbOiguUEAMrU7L2tvcx
 hHw1RcMH0IDPspjMKN9UujuSST+DvStLklrSDj1AnRgVtqqV+QSm0wIa52Tz4PMrf7SH
 woHwNWFYyGn2kr+U6Y6T4iHrJH0AOaphNtZTtOni1vggZcUUug8Uxe3yr2sDfINzWMav
 B/yfbGWzhNSvbYil1qfcxMZH7PudmOdRzSXyLK/vUe86VZXEn7PClBj7AFkqAnzVVCNy
 gs57l3RSLdZ+Q1OYgREt9ico8DVxLNdCBQ5bfEYCdW+cAlnYWkMpkUr13DlMXA7rwqll BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqsr0wt0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 15:45:14 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 273FeKVN029367;
	Wed, 3 Aug 2022 15:45:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqsr0wsxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 15:45:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 273FZodu022401;
	Wed, 3 Aug 2022 15:45:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3hmv98w45b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 15:45:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 273FgrON28442926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Aug 2022 15:42:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ACDCA4060;
	Wed,  3 Aug 2022 15:45:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9BE5A405C;
	Wed,  3 Aug 2022 15:45:08 +0000 (GMT)
Received: from localhost (unknown [9.43.94.156])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  3 Aug 2022 15:45:08 +0000 (GMT)
Date: Wed, 03 Aug 2022 21:15:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/ppc-opcode: Fix PPC_RAW_TW()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman
	<mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: 	<eca9251f1e1f82c4c46ec6380ddb28356ab3fdfe.1659527244.git.christophe.leroy@csgroup.eu>
In-Reply-To: 	<eca9251f1e1f82c4c46ec6380ddb28356ab3fdfe.1659527244.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1659541432.y9rey7qhxm.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ijKNSpjW8z-QTTXwOl7R4MbyMdscKlHI
X-Proofpoint-ORIG-GUID: jtGXpCJ08l8x186Yh2o2Q8nxISKmJS-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030070
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> PPC_RAW_TW() is erroneously defined with base code 0x7f000008
> instead of 0x7c000008.
>=20
> That's invisible because its only user is PPC_RAW_TRAP() which is
> 0x7fe00008, but fix it anyway to avoid any risk of future bug.
>=20
> Reported-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> Fixes: d00d762daf12 ("powerpc/ppc-opcode: Define and use PPC_RAW_TRAP() a=
nd PPC_RAW_TW()")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks.
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index d9703c5fd713..c6d724104ed1 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -571,7 +571,7 @@
> =20
>  #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
>  #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
> -#define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a)=
 | ___PPC_RB(b))
> +#define PPC_RAW_TW(t0, a, b)		(0x7c000008 | ___PPC_RS(t0) | ___PPC_RA(a)=
 | ___PPC_RB(b))
>  #define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
>  #define PPC_RAW_SETB(t, bfa)		(0x7c000100 | ___PPC_RT(t) | ___PPC_RA((bf=
a) << 2))
> =20
> --=20
> 2.36.1
>=20
>=20
