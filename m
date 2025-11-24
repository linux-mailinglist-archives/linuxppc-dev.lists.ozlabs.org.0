Return-Path: <linuxppc-dev+bounces-14467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B064C827C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 22:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFdmm2dBkz2xS2;
	Tue, 25 Nov 2025 08:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764018712;
	cv=none; b=bLKQ33eErkpM9HSBTiRMgOFM87Gjie9Gm5J99UV9GNrsTZ8qcT3o8gzCdAElpiw1B2wlQDe8TPZSVRNfxha9H7DTiETO19j0CBDVkVmvA4I/2AGBiIkCCrue3U35uA/nE7pVRPPRgXixFPXmUPpaRljl9AzJY/fIkHYFCvfcnvHp65r5jL5zXJMRnsa1A/8H2/x4qjOkT/qP0gFZWRpJGLC6ytit/SNVkRjOIyYlw2NpwrIYlxGEsuB6xOKWFPJy35/W1u8c+MO4uoSG6L9FjLRTbLAbcvJGWIJ3tgnMFEPETJQR8iI5KJ1qiVpmepSt1fHKlpLEkQLTNoKaI7N+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764018712; c=relaxed/relaxed;
	bh=ntEgB8/ELqnyLz8HcQJ96RCEp2qdgNzPswQeldNUe2Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE/KJuEm42FZlDnD/QI34uazhAOn2lmHj4vbhhqpVX/FjTQmteEG+C2kqBr419PTVB4g0Dp5FUSipkOCW0697XYXlSsGI9g9YgdSzpmcC4UVe+zYbIfVNHAGjTAfC7mXOnlTc1Pp5/ik3kVsubPkG3RbKUELy0ziwWNPFYFZUGf4k3qDOL65Xs1BzkoIo5Vg3px3bqCKgIRQJQA0Onv7bWbKufbVByczuu2XwsI9ovH9zmlQv6dCerkLAJ/IowEerfZO3JdDP1sjocnfXyFB6tFS0p4hEzltx9ug/O51LBYaZVPIGA/QrNatoKpaY05oUIKDKEqPYPAd+lLoDRd1IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fgY0Uu0N; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fgY0Uu0N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFdml0jKNz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 08:11:50 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AOE4EXX032168;
	Mon, 24 Nov 2025 21:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ntEgB8
	/ELqnyLz8HcQJ96RCEp2qdgNzPswQeldNUe2Y=; b=fgY0Uu0NlxHTnmUu2cjKo5
	fQL0wFCCmukvhIOifr73S+Yj7OB/ehTXW9wsAESJRLmWBDiNeDxRB6m9dyAUIbc6
	oLTVCKHu/a8HpyToeaQuNfkBWjq5AQvEYhqcvS9XxlOmGZlCLK6W1/daV2JY72FS
	cZhuQYYlLpo/DovMqzIGBW/3FE3C4Qw5mL2Pk3wna8blaGFYbkXcaMTv6NWizvAK
	5eUHRkRlhRe+mPrQWaNnq/zO+NgW9aj4cGXlueT9AhSrSc5c8GUaWnMIIcxXSXZd
	4QJWT725oOEbQuD1OEE6ZtbkWz6/QKnDVfQwfzabKx1pDzrDFFq8KqP70zviRc9Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4pht602-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 21:11:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AOHZUbi000851;
	Mon, 24 Nov 2025 21:11:41 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4akqvxr5rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 21:11:41 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AOLBdCG27984436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Nov 2025 21:11:39 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA1E358057;
	Mon, 24 Nov 2025 21:11:39 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA915805D;
	Mon, 24 Nov 2025 21:11:36 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.15.110])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Nov 2025 21:11:36 +0000 (GMT)
Message-ID: <8db091670e9aa2894a50cc703a47e0929075c46d.camel@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: Downgrade ocxl to Odd Fixes
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Frederic Barrat
	 <fbarrat@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Arnd
 Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Nov 2025 08:11:35 +1100
In-Reply-To: <c40ea685-39c2-41a1-95d7-435d4dfcc58e@kernel.org>
References: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
	 <c40ea685-39c2-41a1-95d7-435d4dfcc58e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAxNiBTYWx0ZWRfX1OaQIQIefBQ0
 XAU3EA91BvA8IMdvHXYDqUcLTCyYdSR71DTLgKC/IpDfcxUc5XEpguTIicc/scH1Tn4TogcUbTi
 tmpA0ZYjOdjQHuqODRF1rhvHH5BHpesUIcz4z/hwVIp0rFyb1RUTAl+lxChgqnrj9eC/lthzrxP
 YTfjkrXid/yzvdFxysE+6+6+55GBtkhgdxkMzQSKaHwrbNA8CGcXTM0q/4QxTRHOvy3YPxLVbRw
 6ImnD4L3fpSf/EGgGVt6tW8g1OJOWQ5CREtsk/FcGvlPr39h8wBXZ5G84ui1mNfhKri8NuALqdR
 yDeL2JSr/7Yk5fLbzd6L0RHwpnuCKw0s7fD8Eo+m21SR4yQnwUsQK9+nKoe4wSvBYK1Ap+7BfLP
 zD0F8I+hMfWIBxijONvYVLHNYpHeJQ==
X-Proofpoint-ORIG-GUID: 1eH43pbD-u8lY0Ur9GoBbFYwBHwz1qPw
X-Authority-Analysis: v=2.4 cv=CcYFJbrl c=1 sm=1 tr=0 ts=6924ca0e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=NEniLMnl1WrFn9dSTNoA:9
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: 1eH43pbD-u8lY0Ur9GoBbFYwBHwz1qPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511220016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-11-24 at 20:45 +0100, Christophe Leroy (CS GROUP) wrote:
> There one patch in patchwork at the time being, will you handle it ?
>=20
> "ocxl: Fix race leading to use-after-free in file operations"
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20251024010228.16=
67904-1-danisjiang@gmail.com/

Yes, I'm reviewing it currently.

Andrew

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

