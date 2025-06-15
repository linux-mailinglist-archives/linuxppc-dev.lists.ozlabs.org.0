Return-Path: <linuxppc-dev+bounces-9380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9735ADA0A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 04:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKclp1qsrz30LS;
	Sun, 15 Jun 2025 12:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749955158;
	cv=none; b=mTmRMV0tz0elbToyYZ+/40GXi6xw8qFnqXa9cLIm5wmAwS1JK7HCr4h7aEUCsVsDb/plFuf57xCsQZ7JXjnFRB9/8c4bTJ1IS6u/JXj8E5Rxdzex+Uiuyj163K9ri7J9TR7oUB4Xihvj8w2SrY5VXmi0LH8onz9Tl9OTSYyFrnGBxhfCDSHKW+r/n3VxdM5vDqTJSq3nqalpWzD9IDXTEYMY++hUfPbqA1C7a/LxQWBZajCsruaK835M0pnIMwGUl+HzbzzvCoD1lwHJvncLExerwcXD9SccKW73CeccNjPVk0BY0RpLix0OrE7zPiOcYDZN3CruB2mMd5NkVxORjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749955158; c=relaxed/relaxed;
	bh=xn5Pf2G64BIovUmwEZqU8z1Mh1VF8g3gqO5F7kS5mTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=giMFbNq4/VkDeQ13q1DAq9eXemJjKXP5N3D9aPZpteI+vi0JYhanH2GzqNEqfiL9vZWqQcysTQFEV1TTTBmCtSb3fxvkIUtYIIkxZ4l37MKRbSw16iauvzXriwDLV4lpZGUkax6MOhBBJ13mcbjMdi9xeG583kn6kdnjgMzGTpNsDxA0SNR9RIJqWQfCppn53JCQgm7NXRmulJshCsRZ7lr+wvVeJC348EI+VdH2Vnw1Z6IMhbIfXP4dtzn2/YITc6xPePYt2vBKNMQajb1Cm8sxh2GKjsSjmGB+mUJqgRPrwRxsyTgDQABuGtrXV9iWErobA03DIecatOiqBdc21w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ElUTZLEW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ElUTZLEW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKcln2K03z30DL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 12:39:17 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EMt0xL004380;
	Sun, 15 Jun 2025 02:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xn5Pf2
	G64BIovUmwEZqU8z1Mh1VF8g3gqO5F7kS5mTA=; b=ElUTZLEWtpKCWZKF00caqo
	nn/NsXGu8ml3nUjyBICo1bDC5sCYac6XdQcNpVnznHDRiVKa94tjKrEAvjJBE6vr
	U9NPEr6ymcHieGkojBgiocHoD0tx+Kr5a3JCWIqZ43nWaZ/t9qdBOxxdFPv0QBK9
	4U/F6cHJ2FLkIEpmYB6WtMQHCVVXb/pgVNH2+mJmP4ZnD/7puwFIA4wb/zPAnEMM
	YpuUFtn6GCD6nRdGv2Q60Vvzbdi/7GMbmczH3Y2i+so1lzIJq+xs/g7dJZddMZPE
	mPkAtE8Z1wcpdLp3YAqzvgZW6jsgMTEhpA4da/kxGz2Eb3srvEgcuqJ8wB6Qe1Yw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790kt3mgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2ZMbd026652;
	Sun, 15 Jun 2025 02:39:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790kt3mga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0Xm8C003347;
	Sun, 15 Jun 2025 02:39:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ym8vd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2cxE728508832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:38:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 918A220043;
	Sun, 15 Jun 2025 02:38:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05B3F20040;
	Sun, 15 Jun 2025 02:38:54 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:38:53 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] powerpc: dts: mpc8315erdb: Add GPIO controller node
Date: Sun, 15 Jun 2025 08:08:51 +0530
Message-ID: <174995502359.107804.1137450582974510913.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
References: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cniiiqhj4mwFnyLsrpGowyFQM-tEpHrQ
X-Proofpoint-ORIG-GUID: ZQUdp5UmXJMz3okRr7OK_96hiUO6MrLF
X-Authority-Analysis: v=2.4 cv=KaDSsRYD c=1 sm=1 tr=0 ts=684e3246 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=TY4axy8dlGjP7ovxBMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfX8KorUkWSmOu/ DScb/NiktPshZtzW5RuFnM9tMtjSLyxuhu8EtQKNMbwEzxhYqcrYyyFCT7M0ky4rvr93P9C/Xln S0dKrjKzYtBzNKmGhcJLm2K1YJoyE2zUB0aCjyxWkY/QGEXAH+i6HST7q1DW9JO00+WtBT33Mhi
 ZRW/Ql4b4+fvPcEnZLg6nl7SQ5QFGOEQ1/43u1BcCztxfkKL8kTIW1a1Z7FeYu0YCZ4AqiHrTQj 2LDQVkjXkyIYw4DTBGjvJIdrgGuNYhxyaXifRFdBGP0QIwvay5HBkKpjZJOMFVWo39S9a+EmSM/ 76IVDECQiW9eMNGyFHaUKW9P4QHvAzvILbaN/dogA55epbjmlQO+o4iCngMRgZbKHVEQE7UokJm
 DR0jWF33bx1VWmA1NtFqD5Ab5LajS3UqCZ6TB1uMHLf389/vqEDaNfzQaHuxyH2l4MRpK/ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=698 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 11 Jun 2025 21:01:01 +0200, J. Neuschäfer wrote:
> The MPC8315E SoC and variants have a GPIO controller at IMMR + 0xc00.
> This node was previously missing from the device tree.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc: dts: mpc8315erdb: Add GPIO controller node
      https://git.kernel.org/powerpc/c/e75cb6010838f61b9d63e921d1763a8ab177e38e

Thanks

