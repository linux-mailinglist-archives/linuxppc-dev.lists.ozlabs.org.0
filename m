Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAEF35FED2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 02:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLKpF2gVjz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 10:24:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5VXM7om;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=B5VXM7om; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLKnn2r8pz2yx3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 10:23:40 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13F03lHc164745; Wed, 14 Apr 2021 20:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6qfqmVkPQdx7uwNAjHox1Gv7FHxABhJUF569zzrwBgw=;
 b=B5VXM7om78HwdZ9cSPsgXgpQZyZH2wE58gKJZarkpTS0A1eaLdA/DOPU7ibe7bqTRGWS
 ma9621+JHRvsH7gR8DvIoYRGdC82Zp9Q3YmV2GLxAUUPexNeAD21xDEDFXh0wLhmoeAj
 Th+iZsbhQXfjlKoFK87qvvZ4vB51xEoUmsReIoKhIzPNEUXBK/B2KyAxil6De0FelJ0Q
 4Z7Ci2cHtjP9+qWbYJWziX03aGEO6bwnzLEI9ewTTOXzTaEnrCZ2OM7XvHfCoayBkrjy
 bHtZZfyMpVKSVet9XgX7PhL7do27tnJ+wVEN/3qWZlQpXFByisjfCMp9jOQOokVZyNiV zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x1pmppeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 20:23:30 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13F03l0j164674;
 Wed, 14 Apr 2021 20:23:29 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x1pmppdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 20:23:29 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13F0C0rk009182;
 Thu, 15 Apr 2021 00:23:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 37uhcn1kd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 00:23:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13F0NR9a26476820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 00:23:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E4B4C6057;
 Thu, 15 Apr 2021 00:23:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6245DC6059;
 Thu, 15 Apr 2021 00:23:27 +0000 (GMT)
Received: from localhost (unknown [9.163.8.142])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 00:23:27 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/5] powerpc/rtas: miscellaneous cleanups
In-Reply-To: <231da5db-efdd-0ddd-9ad8-4ddd2bc03ddf@csgroup.eu>
References: <20210408140630.205502-1-nathanl@linux.ibm.com>
 <231da5db-efdd-0ddd-9ad8-4ddd2bc03ddf@csgroup.eu>
Date: Wed, 14 Apr 2021 19:23:26 -0500
Message-ID: <87eefcfla9.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xPrvXRJD_YlIkeZg9Y0cL6nmj_msGyJL
X-Proofpoint-ORIG-GUID: GR9jynZ5pK_maA_gVlJ4C0GbprI5_R7Q
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_15:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=953 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140153
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 08/04/2021 =C3=A0 16:06, Nathan Lynch a =C3=A9crit=C2=A0:
>> This is a reroll of the series posted here:
>> https://lore.kernel.org/linuxppc-dev/20210114220004.1138993-1-nathanl@li=
nux.ibm.com/
>>=20
>> Originally this work was prompted by failures on radix MMU PowerVM
>> guests when passing buffers to RTAS that lay outside of its idea of
>> the RMA. In v1 I approached this as a problem to be solved in Linux,
>> but RTAS development has since decided to change their code so that
>> the RMA restriction does not apply with radix.
>>=20
>> So in v2 I retain the cleanups and discard the more significant change
>> which accommodated the misbehaving RTAS versions.
>
> Is there a link with https://github.com/linuxppc/issues/issues/252 ?
>

No, not really.
