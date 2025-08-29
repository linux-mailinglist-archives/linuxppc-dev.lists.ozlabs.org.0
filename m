Return-Path: <linuxppc-dev+bounces-11480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860FB3B619
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:38:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCs9W1cZcz2yrb;
	Fri, 29 Aug 2025 18:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756456703;
	cv=none; b=PgnDCFekJtV//rAFldKkOMFqLjOqoM/86VmCr9Nagi9EC1zmZ7AvVg61psBInDdYgwjMigF6Q6aQ1s2enqa+qnhSOW9Gq6rBXsYvV9XNqrtHfaNeCJ1RjHRC3uRx8wrPIwlc1iR4uAfOOviU6bh8RQCil03wEYdoIlm28h8DxdFF02iy2pA3ueikSM4jzCjDIFico6sx86SJfqhvvY96bcHdnouSdjbT3MnuOMzoTKuD/HdvPhRCt6slWAbpyQS5ld328p0jmZz9uksPRdWFEosa5sOjkI1y4QdGE2njo2tYnd5xPTJ3FyldH+Qw/BrUDLmTRGntbRsmuLCPWX8PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756456703; c=relaxed/relaxed;
	bh=7MW75NPB7Va5Ne0w2b0VAXU/DHhLIN+FRvAytfm78eU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXNfz+GfomuniUOXl19I1DkWYr/k2Bn7g+O/UyLBFGeo70p0Br4Hw/4qvGnuCd7yDHKIvFtkxwOYXoX+3uCSJXtr84pArdQIVE8e/EncP/yXWFAZMzDtFtmpejc8iRWzPQYm6nC3a4zWFvObaIwyLn+542X9b1cp4WGfOKttnSj/O034hR1j9kxrK8U2DBnvgb+wgyovH2x1AUJEHjAjPlVKaDki/Ihzqfw1o3vrx4UVCFRprsSNZJkqcV52iXv5KchW0NBtJlEGalcUMEnAQ4zqDpa3plocqgIkPrw6/ZARiqYZ0WSH1a4+98tbNKfc1/oMK4XKBvDfIIB7gNFOaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTeiaxqY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTeiaxqY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCs9V3GRLz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:38:22 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T62KHi015673;
	Fri, 29 Aug 2025 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7MW75N
	PB7Va5Ne0w2b0VAXU/DHhLIN+FRvAytfm78eU=; b=hTeiaxqYHWGRL1AFSylByD
	LffRgW/Jiw/c34BeWZFadQ8VsAjAm8U4ZcB8DJcvOdErxuhJc+N80XpckAHvpjou
	CalzZY9PPEBD+wMAf7SzAFQbLeK8wsW2JC7oHd/kAjbPtq9KjKifdKa6v/e8JFOA
	92PvT5Ql5NCwoc+ovV1rsTdEXAgwO/CB/xQZk9XfydlQ0sOj5eyF0N8sTbvOD/os
	nrNNGVkgAPxkWtby0DcCexNvojHGeEJvTpeP18hwo05x/WT4TThfmz4s3Lsm7lc+
	cKeE4ZG35q32Z3v3tSobyU3W6bJ19tu/g2oB0sXPRfFW4Tx7O15PrgXLZFwoDhpw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqe9ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:38:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8TAod020022;
	Fri, 29 Aug 2025 08:38:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqe9ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:38:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T6GAId020838;
	Fri, 29 Aug 2025 08:38:12 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrc11290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:38:12 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8cBtf33358118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:38:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8013958056;
	Fri, 29 Aug 2025 08:38:11 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65B1158052;
	Fri, 29 Aug 2025 08:38:09 +0000 (GMT)
Received: from [9.111.24.125] (unknown [9.111.24.125])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 08:38:09 +0000 (GMT)
Message-ID: <f1668882dbbba83b771f02c5b054dfaddccfe7a5.camel@linux.ibm.com>
Subject: Re: [PATCH 3/4] PCI/ERR: Amend documentation with DPC and AER
 specifics
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
        Jonathan Corbet
	 <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>,
        Ilpo Jarvinen	
 <ilpo.jarvinen@linux.intel.com>,
        Sathyanarayanan Kuppuswamy	
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linas Vepstas	
 <linasvepstas@gmail.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        Brian Norris
 <briannorris@chromium.org>
Date: Fri, 29 Aug 2025 10:38:08 +0200
In-Reply-To: <42726e2fd197959d6228d25552504353ffb53545.1756451884.git.lukas@wunner.de>
References: <cover.1756451884.git.lukas@wunner.de>
	 <42726e2fd197959d6228d25552504353ffb53545.1756451884.git.lukas@wunner.de>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX2mfC+/5JgXSm
 tvXfxo0aw0TeGMtdRcZgeaFj7bbtYMM8AnlgJKcNdvfG7m4eds11aZWQrAv+du2NMr4KdTZd/gL
 SMGC+2fer/EUZ7vuwkIHU/x3EPuat9hbZzIkr7WeZ9wg2SENkqLS0kDdKLFCWyCtePLCJpNGEpy
 K2oxw9JkZ36uoCnlnRwnt8rJUTBWlYgqNd81vmr7rnzNjoaw72APK0FDcmT/ArqD+G4Adt5yubq
 jMD9OjkVSHEqYEjGJds3iSbPNNFWmpTRBcvxwbpUtPdY+6Vx3gC3G7U6WN9SPn8YZXI/IkLzu7u
 VCkmG2Qi6m3Pgblk54FGJkbm8toBEZcYzf9D+N1DogCuG3fsvh8dGTkJxzMzzVtAOn1VVvsggQ4
 FFknujpQ
X-Proofpoint-ORIG-GUID: BBnMbQ55CD2lrHR8MPX4YkQVGPcy3I2g
X-Proofpoint-GUID: WBzPLu_GpKVU_nK-p2KzqhCxmIi19MC8
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b166f5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KkUFHGsvljIy0fMCjwwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-08-29 at 09:25 +0200, Lukas Wunner wrote:
> Amend the documentation on PCI error recovery with specifics about
> Downstream Port Containment and Advanced Error Reporting:
>=20
> * Explain that with DPC, devices are inaccessible upon an error (similar
>   to EEH on powerpc) and do not become accessible until the link is
>   re-enabled.
>=20
> * Explain that with AER, although devices may already be accessible in th=
e
>   ->error_detected() callback, accesses should be deferred to the
>   ->mmio_enabled() callback for compatibility with EEH on powerpc.
>=20
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  Documentation/PCI/pci-error-recovery.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI=
/pci-error-recovery.rst
> index d5c661baa87f..c88c304b2103 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -122,6 +122,10 @@ A PCI bus error is detected by the PCI hardware.  On=
 powerpc, the slot
>  is isolated, in that all I/O is blocked: all reads return 0xffffffff,
>  all writes are ignored.
> =20
> +Similarly, on platforms supporting Downstream Port Containment
> +(PCIe r7.0 sec 6.2.11), the link to the sub-hierarchy with the
> +faulting device is disabled. Any device in the sub-hierarchy
> +becomes inaccessible.
> =20
>  STEP 1: Notification
>  --------------------
> @@ -204,6 +208,23 @@ link reset was performed by the HW. If the platform =
can't just re-enable IOs
>  without a slot reset or a link reset, it will not call this callback, an=
d
>  instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot R=
eset)
> =20
> +.. note::
> +
> +   On platforms supporting Advanced Error Reporting (PCIe r7.0 sec 6.2),
> +   the faulting device may already be accessible in STEP 1 (Notification=
).
> +   Drivers should nevertheless defer accesses to STEP 2 (MMIO Enabled)
> +   to be compatible with EEH on powerpc.

I'm biased of course but I'd prefer either "with error recovery support
on powerpc and s390" or simply "with systems where devices are
inaccessible until MMIO is re-enabled explicitly or a reset occurs.".

