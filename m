Return-Path: <linuxppc-dev+bounces-12582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BADBA1DF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 00:43:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXpdc2YTqz2xnM;
	Fri, 26 Sep 2025 08:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758840180;
	cv=none; b=ocuwhofTzUdY5fC6ZsvjcarX6usoXAChKD2pTAmQMYzLjJskygu8JLOPFV0SU6vs1H/If+HCzA94Tlu3MLd3oivQZyfbDNOGQx6J1iuwaHwiw34GxSri2uMklWHqwiopsmglG5UnPD0T0qcXVLEedi4p+NM7huRDbnXzFmWtgQsMTnKqsJtNq5IMd1B9T1wAHMFekARJnk3Iv2e5QBG8ggQclw4t64M1cDV/wDCjfcKvqYxuQJtgaEsbygJS6vtcWvD6D0RG/cwpUR8T+gh56/l9NZcJZMMcc3Yybke7z6i+GocSGE0yoLQptiWgWY7vJWN7TuJOzUSX+fR1SFFrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758840180; c=relaxed/relaxed;
	bh=nitDcQyKm4NkSdrvGfnoFJK+u+59qy52l/in9/PENFA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EFl+2dreF4a+j9k1Gv0eWeMAy8Xs0R/xpNDhv+10cLEf6F+YVaVQ1dia1pPD3514SrLddu9DYCPENvJkdM9/54exOCcnvwxQ57atMpJiQkJuCgldVdND1frv92bPBKHp91Fm9Now0LQiKUlzMT81ClYsd+miZJC9bzkCcxom/jwe1e1aAf5Fcxx3GB+cJW5avp7ZrRPizpCj+KWAZMcvq22XGm1THmuCnKCk4BbaVEw6I5khBwuQfOGz8dXvCreg5WTOTY0dZLCJNh4bopdbNrX1ukmD2tKcCA7vNIVJxnfcTdZBX70byCGyf874SbZ3MwVax9/lHZFx9YRJCMjhjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ObUaTjnV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ObUaTjnV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXpdb1Jxqz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 08:42:58 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIlku0029476;
	Thu, 25 Sep 2025 22:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nitDcQ
	yKm4NkSdrvGfnoFJK+u+59qy52l/in9/PENFA=; b=ObUaTjnVdITMiJdUsAaBva
	XLZ1KtMdmBp5Zgj5HF5l736Dw8UHyUhD3TisJilpRw75rsai+utMNLZI/A40Gk0J
	AIsS/G7spYLQbIO0kZU4MaW2iV/aPWyZoCKgkQVlo8X5W+I2HjCSV311JDj74M+7
	AE+XvFGRJ786VL4MUt+qd0wuYjp+Dm18KSH3XLhU+kGNoHZtITJdR1Vb2tgbx8f/
	XDfyMpdu8TFYY/5/2k68gzz9upb0rFrkfJbB08Avlo1kuaLpzUrF3wP4zuZtecc7
	wmN72T9Dnd4s9T4WOJSMaXD6jTl/524rYuOHseRoTIls1+pmarwlMs/vXc4BxfzA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49dbb3s2av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 22:42:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58PLea2s006442;
	Thu, 25 Sep 2025 22:42:43 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49dawph4a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 22:42:43 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58PMggep33227348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 22:42:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB06958059;
	Thu, 25 Sep 2025 22:42:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5E7158043;
	Thu, 25 Sep 2025 22:42:37 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.14.161])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Sep 2025 22:42:37 +0000 (GMT)
Message-ID: <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Date: Fri, 26 Sep 2025 08:42:35 +1000
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3NCBTYWx0ZWRfX5ysG32sTPFXd
 uf1R0BRsI0BKicwSpsBxEsSI2a3nnZJqMzF1o90w6Fz3y2zUhPJ2779DnKRJOVaK9VhKCmsSlHP
 /2MXq9DBNTVGPSPGGD9cbqJyAOkD0q7UeemycTSAdzGpVHSooWMOLLYPjP3KyU20YaYxH+bkEin
 MGJn3OOl4+vJti0slRv6mCHzTZ0n7nQaw9gF4Vg4N0KsY1Vd6Dwr0iLkqNCzKSRcTrk+q8Dol9Q
 qU4YSwx4Ahh4WWCTr1UhV4TK9Af+6BnwFIHzvgf7l8TqmRVWGOLGhqpqa+uiQSq8ueI4HKd5JZh
 VqBopl4TR4l8azCp1YGG5ilHhX/5mUQSAG+mGp/8c7m70OyuL/TydKQdeAYOkVykSxlq+rjcDlP
 DcEqcvCGhSw8iFb5/oSEczTL3v5p3Q==
X-Proofpoint-GUID: dpRrG9bUj2ZLNf81WWW-h6dqNNtNb9Wo
X-Authority-Analysis: v=2.4 cv=T/qBjvKQ c=1 sm=1 tr=0 ts=68d5c564 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=owR7qqmZskU0YpnQVroA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: dpRrG9bUj2ZLNf81WWW-h6dqNNtNb9Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250174
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew,

On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by serialis=
ing
> assignments, reassignments and clears of page table entries at each level=
 in
> order to ensure that anonymous mappings have at most one writable consume=
r,
> and likewise that file-backed mappings are not simultaneously also anonym=
ous
> mappings.
>=20
> In order to support this infrastructure, a number of helpers or stubs mus=
t be
> defined or updated for all powerpc platforms. Additionally, we separate
> set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrum=
ented
> mappings.
>=20
> On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_pag=
e()
> requires the address. We revert previous changes that removed the address
> parameter from various interfaces, and add it to some other interfaces,
> in order to allow this.
>=20
> Note that on 32 bit systems with CONFIG_KFENCE=3Dy, you need [0] to avoid
> possible failures in init code (this is a code patching/static keys issue=
,
> which was discovered by a user testing this series but isn't a bug in pag=
e
> table check).
>=20
> (This series was initially written by Rohan McLure, who has left IBM and
> is no longer working on powerpc.)

Is this likely to make it in in time for 6.18, or should I respin it post m=
erge
window?

Thanks,
Andrew

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

