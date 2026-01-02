Return-Path: <linuxppc-dev+bounces-15165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43046CEF169
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 18:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djWLH5sj3z2xrC;
	Sat, 03 Jan 2026 04:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767375911;
	cv=none; b=Ft/kvh7MVkdec6yrrheuxfFfzy1DpQhVPwt6ibdJEMQ9rCxzjWz71ZAquPkF66y+sAiB9McQY9TDkh9UTIK+CaPhFs2q8CihyzsldFybncyU7T2R9mwt5Zk+l8o9P18l/SUrshPSTfXr3UJjMGtTgTdrdHB4e5Bq/qAtGHcvx6h1YGQd2fGwb9NX7+Jg/bNt8H9xW/H7q+2z3LBalp/cA/oiXujheQvuzCxsZTmlbXpJm588zngZPhtPCNd7NXaBUSx9BfXB+Xh3pCBqAvDdEac8u38NxLNYo1zKbZ71/A1mNuBugMh3fs71lGLmOBwO29qrYAYOEWaM2LXW5Ay9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767375911; c=relaxed/relaxed;
	bh=RLUuW3Xjlgq2AT19N7Qrzgvx6jTGMiuzfMf7ZF7kCr8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NTLESHwPSqUnMh8Ena9BkZwdqXByjC4ZJI5T5EusyG1nngKaFVR4XsU/wzsCfMNwpnPkMlH1gviV5nXpLkXMlnLPgYupL6ZGoblmr8Tn9eS4zGzBMFzByy+lWKEgLScT/LAxjtBGfO64DInk0ibtOnSEhgb0eMB7eBahaAJnkDNbZpAbT6q1g/aPBjxT91Uev/ZatJaogxn1sutHtM+flQQuszAJKVWHBsJUOeDwDJfloMfbowIno7e8csCOTCvZiG4A1OS8mxWF+TlIyKBxRqobAwU10iY72LEV/UYV8O5z11aUL4xFb+0bF4T3hUVEBCjdUDPb8xZqXU7X0g4tlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJqrttQF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJqrttQF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djWLG49Vgz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 04:45:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6021qr0G003338;
	Fri, 2 Jan 2026 17:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RLUuW3
	Xjlgq2AT19N7Qrzgvx6jTGMiuzfMf7ZF7kCr8=; b=kJqrttQFUojv2bA4yUif6b
	6HuTllCX7XK1zKEyhQBH0Oqm46qxU/HY62HrcU72vapU02ssGoABXLHJU2tu716E
	TPCQNFJn2rQWydVx9edqpeutXrMus29oZNZcVUM2R7wMX+l18DGCSYrIQcaxoSsq
	DSpEisQduJq73D1dCcwcqTNvQGznXKSpl9AWorGRCm06bGxF4Mmjm9yy7zMxZ1Vm
	d640mGkqL43y1uJ+YuVGK5+/PRxuTtwHWTgP+4qYY4ZqnpqNDvuYyWDSwAKIwJFp
	u0jsUrLvkoN/3ZM1ITnOdRE01GWVfTLhu5eXoHYKFOoZ5h5TxYRZa49CyoLf8fcw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba4vk5k2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:44:54 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 602HirXo003974;
	Fri, 2 Jan 2026 17:44:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba4vk5k2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:44:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 602DvIWQ012872;
	Fri, 2 Jan 2026 17:44:53 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4basst7prc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:44:53 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 602HipA529360848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 17:44:52 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AA1E5804E;
	Fri,  2 Jan 2026 17:44:51 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C3AC5803F;
	Fri,  2 Jan 2026 17:44:50 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.43.105])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 17:44:49 +0000 (GMT)
Message-ID: <14a30e37e0cf8ef373b63d3b905ec1a7d807118a.camel@linux.ibm.com>
Subject: Re: [PATCH v2 5/6] keys/trusted_keys: establish PKWM as a trusted
 source
From: Mimi Zohar <zohar@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
In-Reply-To: <20251217172505.112398-6-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
	 <20251217172505.112398-6-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jan 2026 12:44:49 -0500
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
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=I7tohdgg c=1 sm=1 tr=0 ts=69580416 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=LEbNV_o2VyxDoalp7FMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: B3emfeEsb8I62feC1zoVMNTcE146lshB
X-Proofpoint-GUID: MhOxxVhALtRabsOZqS86eNFA28Ui1ANz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE1NCBTYWx0ZWRfX7f3+cqAcVd0Y
 gICNQO3/0JHFDOhjQg53qOk7DCqIanoi3Y85OdptQy334MIZsoxEdDdK+rwTmwrrsEpsouKuU1q
 v1uRs7AdEDm4Lv9EF+eFfo+yG6r5pArGlCv165u/c3wdWnayRmdsOE7B1EfbQe63d56b9Pr/g4R
 dZafOdYelLU2lYim4ye0nROav3JKbDAsvwYOlf31Mt+zItTD90ZQIAG7LxHSpPlGTRhvRpaWmJ2
 D04SZDefi+rp7iUJ1RXtUV6ANo6oSR1fvpu2zBT5GNM/1z75QQNIa6BacQ6EY3ZubbM93F1OvHi
 7XR5MZQFs5fJj99rS6S/JLHlESiG47pQLCRbf9U1TxHWvwqWDcbQsUkc4SPn+BcZtfXiizEvXoa
 g1nXQQoLSFkFUtkeKuBjjR7C4YosVq5cnzOX4CNPhnIy3sgaUmP/YSmwDiGsOHMmLS9NYt3b3zm
 8lkWSONPT9ZZQWeIuhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601020154
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
> The wrapping key does not exist by default and is generated by the
> hypervisor as a part of PKWM initialization. This key is then persisted b=
y
> the hypervisor and is used to wrap trusted keys. These are variable lengt=
h
> symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) a=
re
> generated using the kernel RNG. PKWM can be used as a trust source throug=
h
> the following example keyctl command

-> commands:

>=20
> keyctl add trusted my_trusted_key "new 32" @u
>=20
> Use the wrap_flags command option to set the secure boot requirement for
> the wrapping request through the following keyctl commands
>=20
> case1: no secure boot requirement. (default)
> keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
> 	      OR
> 	      keyctl add trusted my_trusted_key "new 32 wrap_flags=3D0x00" @u
>=20
> case2: secure boot required to in either audit or enforce mode. set bit 0
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=3D0x01=
" @u
>=20
> case3: secure boot required to be in enforce mode. set bit 1
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=3D0x02=
" @u
>=20
> NOTE:
> -> Setting the secure boot requirement is NOT a must.
> -> Only either of the secure boot requirement options should be set. Not
> both.
> -> All the other bits are requied to be not set.

-> required

> -> Set the kernel parameter trusted.source=3Dpkwm to choose PKWM as the
> backend for trusted keys implementation.
> -> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.
>=20
> Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
> KeyStore, as a new trust source for trusted keys.
>=20
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>

Thanks, Srish.  Other than fixing the typo and other suggestion above,
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

